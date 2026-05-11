architecture rtl of Controller is

    ---------------------------------------------------------------------------
    -- Constants
    ---------------------------------------------------------------------------

    constant C_CHANNEL_SEL_WIDTH : positive := clog2(G_NUM_CHANNELS);

    constant C_BYTES_PER_SAMPLE : positive := G_ADC_WIDTH / G_BYTE_WIDTH;

    constant C_FRAME_BYTES : positive := G_NUM_CHANNELS * C_BYTES_PER_SAMPLE;

    ---------------------------------------------------------------------------
    -- Types
    ---------------------------------------------------------------------------

    subtype t_sample is std_logic_vector(G_ADC_WIDTH-1 downto 0);
    subtype t_byte   is std_logic_vector(G_BYTE_WIDTH-1 downto 0);

    type t_state is (
        S_IDLE,
        S_PREFETCH_FIRST,
        S_CAPTURE_FIRST,
        S_WRITE_BYTE,
        S_FRAME_DONE
    );

    ---------------------------------------------------------------------------
    -- Registers
    ---------------------------------------------------------------------------

    signal r_state : t_state := S_IDLE;

    -- Current channel being written into the large FIFO.
    signal r_channel : integer range 0 to G_NUM_CHANNELS-1 := 0;

    -- Current byte of the current 24-bit sample.
    signal r_byte : integer range 0 to C_BYTES_PER_SAMPLE-1 := 0;

    -- Sample currently being split into bytes.
    signal r_curr_sample : t_sample := (others => '0');

    -- Next sample prefetched from the next small FIFO.
    signal r_next_sample : t_sample := (others => '0');

    ---------------------------------------------------------------------------
    -- Internal output signals
    ---------------------------------------------------------------------------

    signal s_fifo_sel         : unsigned(C_CHANNEL_SEL_WIDTH-1 downto 0);
    signal s_small_fifo_rd_en : std_logic_vector(G_NUM_CHANNELS-1 downto 0);
    signal s_large_fifo_wr_en : std_logic;
    signal s_large_fifo_din   : t_byte;

    ---------------------------------------------------------------------------
    -- Function: all_small_fifos_ready
    ---------------------------------------------------------------------------

    function all_small_fifos_ready(
        empty_vec : std_logic_vector
    ) return boolean is
    begin

        for i in empty_vec'range loop
            if empty_vec(i) = '1' then
                return false;
            end if;
        end loop;

        return true;

    end function;

    ---------------------------------------------------------------------------
    -- Function: get_sample_byte
    --
    -- Sends MSB first.
    --
    -- For a 24-bit sample:
    --   byte_index = 0 gives sample(23 downto 16)
    --   byte_index = 1 gives sample(15 downto 8)
    --   byte_index = 2 gives sample(7 downto 0)
    ---------------------------------------------------------------------------

    function get_sample_byte(
        sample     : t_sample;
        byte_index : natural
    ) return t_byte is
        variable v_byte       : t_byte := (others => '0');
        variable sample_index : integer;
    begin

        for bit_index in 0 to G_BYTE_WIDTH - 1 loop

            sample_index :=
                G_ADC_WIDTH - 1
                - integer(byte_index * G_BYTE_WIDTH)
                - bit_index;

            v_byte(G_BYTE_WIDTH - 1 - bit_index) := sample(sample_index);

        end loop;

        return v_byte;

    end function;

begin

    ---------------------------------------------------------------------------
    -- Assertions
    ---------------------------------------------------------------------------

    assert (G_ADC_WIDTH mod G_BYTE_WIDTH = 0)
        report "G_ADC_WIDTH must be an exact multiple of G_BYTE_WIDTH"
        severity failure;

    assert (G_BYTE_WIDTH = 8)
        report "This design is intended for an 8-bit large FIFO"
        severity warning;

    assert (C_BYTES_PER_SAMPLE >= 2)
        report "Read-ahead controller requires at least 2 bytes per sample"
        severity failure;

    assert (C_FRAME_BYTES < 2**G_LARGE_FIFO_COUNT_WIDTH)
        report "G_LARGE_FIFO_COUNT_WIDTH may be too small for C_FRAME_BYTES"
        severity warning;

    ---------------------------------------------------------------------------
    -- Output assignments
    ---------------------------------------------------------------------------

    o_fifo_sel         <= s_fifo_sel;
    o_small_fifo_rd_en <= s_small_fifo_rd_en;
    o_large_fifo_wr_en <= s_large_fifo_wr_en;
    o_large_fifo_din   <= s_large_fifo_din;

    o_busy <= '1' when r_state /= S_IDLE and r_state /= S_FRAME_DONE else '0';

    o_frame_done <= '1' when r_state = S_FRAME_DONE else '0';

    ---------------------------------------------------------------------------
    -- Moore-style output logic
    --
    -- Outputs depend only on the current state and registered values.
    ---------------------------------------------------------------------------

    process(r_state, r_channel, r_byte, r_curr_sample)
        variable v_fifo_sel_int : integer range 0 to G_NUM_CHANNELS-1;
    begin

        s_small_fifo_rd_en <= (others => '0');
        s_large_fifo_wr_en <= '0';
        s_large_fifo_din   <= (others => '0');

        v_fifo_sel_int := r_channel;

        case r_state is

            -------------------------------------------------------------------
            -- Read FIFO 0 first.
            -- Its output will be valid in S_CAPTURE_FIRST.
            -------------------------------------------------------------------
            when S_PREFETCH_FIRST =>

                v_fifo_sel_int := 0;
                s_small_fifo_rd_en(0) <= '1';

            -------------------------------------------------------------------
            -- Keep mux selecting FIFO 0 while its output becomes valid.
            -------------------------------------------------------------------
            when S_CAPTURE_FIRST =>

                v_fifo_sel_int := 0;

            -------------------------------------------------------------------
            -- Write one byte per clock.
            --
            -- During byte 0 of channel N:
            --   - write byte 0 of channel N
            --   - read FIFO N+1
            --
            -- During byte 1 of channel N:
            --   - write byte 1 of channel N
            --   - keep mux on FIFO N+1 so its q can be captured
            --
            -- During byte 2 of channel N:
            --   - write byte 2 of channel N
            --   - next sample is already stored in r_next_sample
            -------------------------------------------------------------------
            when S_WRITE_BYTE =>

                s_large_fifo_wr_en <= '1';
                s_large_fifo_din   <= get_sample_byte(r_curr_sample, r_byte);

                if r_channel < G_NUM_CHANNELS - 1 then

                    if r_byte = 0 then

                        v_fifo_sel_int := r_channel + 1;
                        s_small_fifo_rd_en(r_channel + 1) <= '1';

                    elsif r_byte = 1 then

                        v_fifo_sel_int := r_channel + 1;

                    else

                        v_fifo_sel_int := r_channel;

                    end if;

                else

                    v_fifo_sel_int := r_channel;

                end if;

            when others =>

                null;

        end case;

        s_fifo_sel <= to_unsigned(v_fifo_sel_int, C_CHANNEL_SEL_WIDTH);

    end process;

    ---------------------------------------------------------------------------
    -- Main FSM
    ---------------------------------------------------------------------------

    process(i_clk)
        variable v_next_sample : t_sample;
    begin

        if i_clk'event and i_clk = '1' then

            if i_rst = '1' then

                r_state       <= S_IDLE;
                r_channel     <= 0;
                r_byte        <= 0;
                r_curr_sample <= (others => '0');
                r_next_sample <= (others => '0');

            else

                v_next_sample := r_next_sample;

                case r_state is

                    -----------------------------------------------------------
                    -- Wait until:
                    --   1. Packer is enabled
                    --   2. All small FIFOs contain at least one sample
                    --   3. Large FIFO has enough space for a full frame
                    -----------------------------------------------------------
                    when S_IDLE =>

                        r_channel <= 0;
                        r_byte    <= 0;

                        if i_enable = '1' then

                            if all_small_fifos_ready(i_small_fifo_empty) then

                                if i_large_fifo_almost_full = '0' then

                                    r_state <= S_PREFETCH_FIRST;

                                end if;

                            end if;

                        end if;

                    -----------------------------------------------------------
                    -- Assert read enable for FIFO 0.
                    -----------------------------------------------------------
                    when S_PREFETCH_FIRST =>

                        r_state <= S_CAPTURE_FIRST;

                    -----------------------------------------------------------
                    -- Capture FIFO 0 output after normal FIFO read latency.
                    -----------------------------------------------------------
                    when S_CAPTURE_FIRST =>

                        r_curr_sample <= i_fifo_dout;
                        r_channel     <= 0;
                        r_byte        <= 0;
                        r_state       <= S_WRITE_BYTE;

                    -----------------------------------------------------------
                    -- Write current sample byte-by-byte.
                    -- At the same time, prefetch the next channel sample.
                    -----------------------------------------------------------
                    when S_WRITE_BYTE =>

                        -------------------------------------------------------
                        -- Capture next FIFO output.
                        --
                        -- The next FIFO was read when r_byte = 0.
                        -- With normal FIFO latency, its q is valid while
                        -- r_byte = 1.
                        -------------------------------------------------------
                        if r_channel < G_NUM_CHANNELS - 1 then

                            if r_byte = 1 then

                                v_next_sample := i_fifo_dout;
                                r_next_sample <= i_fifo_dout;

                            end if;

                        end if;

                        -------------------------------------------------------
                        -- Move byte/channel counters.
                        -------------------------------------------------------
                        if r_byte = C_BYTES_PER_SAMPLE - 1 then

                            r_byte <= 0;

                            if r_channel = G_NUM_CHANNELS - 1 then

                                r_state <= S_FRAME_DONE;

                            else

                                r_channel     <= r_channel + 1;
                                r_curr_sample <= v_next_sample;
                                r_state       <= S_WRITE_BYTE;

                            end if;

                        else

                            r_byte  <= r_byte + 1;
                            r_state <= S_WRITE_BYTE;

                        end if;

                    -----------------------------------------------------------
                    -- One-clock frame done pulse.
                    -----------------------------------------------------------
                    when S_FRAME_DONE =>

                        r_state <= S_IDLE;

                end case;

            end if;

        end if;

    end process;

end architecture rtl;