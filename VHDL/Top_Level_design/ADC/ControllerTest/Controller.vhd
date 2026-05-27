library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package Controller_pkg is

    function clog2(n : positive) return positive;

end package Controller_pkg;


package body Controller_pkg is

    function clog2(n : positive) return positive is
        variable v_result : natural := 0;
        variable v_value  : natural := n - 1;
    begin

        while v_value > 0 loop
            v_result := v_result + 1;
            v_value  := v_value / 2;
        end loop;

        if v_result = 0 then
            return 1;
        else
            return v_result;
        end if;

    end function;

end package body Controller_pkg;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Controller_pkg.all;

entity Controller is
    generic (
        G_NUM_CHANNELS           : positive := 16;
        G_ADC_WIDTH              : positive := 24;
        G_BYTE_WIDTH             : positive := 8;
        G_LARGE_FIFO_COUNT_WIDTH : positive := 16;

        -- Initial mux-fill latency. The split FIFO mux has two registered
        -- stages, so the first selected sample must be allowed to propagate
        -- through the mux before it is captured. After this first wait, the
        -- next channels are selected early while the current sample bytes are
        -- being written, so there is no per-sample wait state.
        G_MUX_WAIT_CYCLES        : positive := 3
    );
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_enable : in std_logic;
        i_small_fifo_empty : in std_logic_vector(G_NUM_CHANNELS-1 downto 0);
        o_fifo_sel : out unsigned(clog2(G_NUM_CHANNELS)-1 downto 0);
        o_small_fifo_rd_en : out std_logic_vector(G_NUM_CHANNELS-1 downto 0);
        i_fifo_dout : in std_logic_vector(G_ADC_WIDTH-1 downto 0);
        i_large_fifo_full : in std_logic;
        i_large_fifo_almost_full : in std_logic;
        o_large_fifo_wr_en : out std_logic;
        o_large_fifo_din : out std_logic_vector(G_BYTE_WIDTH-1 downto 0);
        o_busy : out std_logic;
        o_frame_done : out std_logic
    );
end entity Controller;

architecture rtl of Controller is

    constant C_CHANNEL_SEL_WIDTH : positive := clog2(G_NUM_CHANNELS);

    constant C_BYTES_PER_SAMPLE : positive := G_ADC_WIDTH / G_BYTE_WIDTH;

    constant C_FRAME_BYTES : positive := G_NUM_CHANNELS * C_BYTES_PER_SAMPLE;

    subtype t_sample is std_logic_vector(G_ADC_WIDTH-1 downto 0);
    subtype t_byte   is std_logic_vector(G_BYTE_WIDTH-1 downto 0);

    type t_state is (
        S_IDLE,
        S_PRIME_FIRST,
        S_WAIT_FIRST,
        S_WRITE_BYTE,
        S_FRAME_DONE
    );

    ---------------------------------------------------------------------------
    -- Registers
    ---------------------------------------------------------------------------

    signal r_state : t_state := S_IDLE;

    signal r_channel : integer range 0 to G_NUM_CHANNELS-1 := 0;

    signal r_byte : integer range 0 to C_BYTES_PER_SAMPLE-1 := 0;

    signal r_curr_sample : t_sample := (others => '0');

    signal r_wait_count : integer range 0 to G_MUX_WAIT_CYCLES-1 := 0;

    signal r_next_state       : t_state;
    signal r_next_channel     : integer range 0 to G_NUM_CHANNELS-1;
    signal r_next_byte        : integer range 0 to C_BYTES_PER_SAMPLE-1;
    signal r_next_curr_sample : t_sample;
    signal r_next_wait_count  : integer range 0 to G_MUX_WAIT_CYCLES-1;

    signal s_fifo_sel         : unsigned(C_CHANNEL_SEL_WIDTH-1 downto 0);
    signal s_small_fifo_rd_en : std_logic_vector(G_NUM_CHANNELS-1 downto 0);
    signal s_large_fifo_wr_en : std_logic;
    signal s_large_fifo_din   : t_byte;


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
    o_fifo_sel         <= s_fifo_sel;
    o_small_fifo_rd_en <= s_small_fifo_rd_en;
    o_large_fifo_wr_en <= s_large_fifo_wr_en;
    o_large_fifo_din   <= s_large_fifo_din;

    o_busy <= '1' when r_state /= S_IDLE and r_state /= S_FRAME_DONE else '0';

    o_frame_done <= '1' when r_state = S_FRAME_DONE else '0';

    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                r_state       <= S_IDLE;
                r_channel     <= 0;
                r_byte        <= 0;
                r_curr_sample <= (others => '0');
                r_wait_count  <= 0;
            else
                r_state       <= r_next_state;
                r_channel     <= r_next_channel;
                r_byte        <= r_next_byte;
                r_curr_sample <= r_next_curr_sample;
                r_wait_count  <= r_next_wait_count;
            end if;
        end if;
    end process;

    process(
        r_state,
        r_channel,
        r_byte,
        r_curr_sample,
        r_wait_count,
        i_enable,
        i_small_fifo_empty,
        i_large_fifo_almost_full,
        i_fifo_dout
    )
        variable v_fifo_sel_int : integer range 0 to G_NUM_CHANNELS - 1;
    begin
        r_next_state       <= r_state;
        r_next_channel     <= r_channel;
        r_next_byte        <= r_byte;
        r_next_curr_sample <= r_curr_sample;
        r_next_wait_count  <= r_wait_count;

        s_small_fifo_rd_en <= (others => '0');
        s_large_fifo_wr_en <= '0';
        s_large_fifo_din   <= (others => '0');

        v_fifo_sel_int := r_channel;

        case r_state is
            when S_IDLE =>
                r_next_channel    <= 0;
                r_next_byte       <= 0;
                r_next_wait_count <= 0;

                if i_enable = '1' then
                    if all_small_fifos_ready(i_small_fifo_empty) then
                        if i_large_fifo_almost_full = '0' then
                            r_next_state <= S_PRIME_FIRST;
                        end if;
                    end if;
                end if;

            when S_PRIME_FIRST =>
                -- Select and read channel 0. This is the only time the FSM has
                -- to fill the mux pipeline from empty.
                v_fifo_sel_int := 0;
                s_small_fifo_rd_en(0) <= '1';
                r_next_wait_count <= 0;
                r_next_state      <= S_WAIT_FIRST;

            when S_WAIT_FIRST =>
                -- Wait only for the first selected sample. On the final wait
                -- cycle, capture channel 0 at the coming clock edge and already
                -- select/read channel 1 so the pipeline is filled for the next
                -- sample while channel 0 is being written.
                v_fifo_sel_int := 0;

                if r_wait_count = G_MUX_WAIT_CYCLES - 1 then
                    r_next_curr_sample <= i_fifo_dout;
                    r_next_channel     <= 0;
                    r_next_byte        <= 0;
                    r_next_wait_count  <= 0;
                    r_next_state       <= S_WRITE_BYTE;

                    if G_NUM_CHANNELS > 1 then
                        v_fifo_sel_int := 1;
                        s_small_fifo_rd_en(1) <= '1';
                    end if;
                else
                    r_next_wait_count <= r_wait_count + 1;
                end if;

            when S_WRITE_BYTE =>
                s_large_fifo_wr_en <= '1';
                s_large_fifo_din   <= get_sample_byte(r_curr_sample, r_byte);

                -- Normally keep the mux pointed one channel ahead. This allows
                -- the next sample to propagate through the registered mux while
                -- the current sample bytes are being written.
                if r_channel < G_NUM_CHANNELS - 1 then
                    v_fifo_sel_int := r_channel + 1;
                else
                    v_fifo_sel_int := r_channel;
                end if;

                if r_byte = C_BYTES_PER_SAMPLE - 1 then
                    r_next_byte <= 0;

                    if r_channel = G_NUM_CHANNELS - 1 then
                        r_next_state <= S_FRAME_DONE;
                    else
                        -- The next sample has already been selected long enough,
                        -- so capture it directly. No wait state is used here.
                        r_next_curr_sample <= i_fifo_dout;
                        r_next_channel     <= r_channel + 1;
                        r_next_state       <= S_WRITE_BYTE;

                        -- During the last byte of channel N, already select and
                        -- read channel N+2. Changing the select here does not
                        -- disturb the channel N+1 value being captured at the
                        -- clock edge, because the mux output is registered.
                        if r_channel < G_NUM_CHANNELS - 2 then
                            v_fifo_sel_int := r_channel + 2;
                            s_small_fifo_rd_en(r_channel + 2) <= '1';
                        end if;
                    end if;
                else
                    r_next_byte <= r_byte + 1;
                end if;

            when S_FRAME_DONE =>
                r_next_state <= S_IDLE;

            when others =>
                r_next_state <= S_IDLE;
        end case;

        s_fifo_sel <= to_unsigned(v_fifo_sel_int, C_CHANNEL_SEL_WIDTH);

    end process;

end architecture rtl;
