library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-------------------------------------------------------------------------------
-- Package: helper function for calculating FIFO select width
-------------------------------------------------------------------------------

package adc_fifo_frame_packer_pkg is

    function clog2(n : positive) return positive;

end package adc_fifo_frame_packer_pkg;


package body adc_fifo_frame_packer_pkg is

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

end package body adc_fifo_frame_packer_pkg;


-------------------------------------------------------------------------------
-- Entity: adc_fifo_frame_packer
--
-- Description:
--   Reads one 24-bit sample from each small FIFO in fixed order:
--
--       FIFO 0, FIFO 1, FIFO 2, ..., FIFO G_NUM_CHANNELS-1
--
--   Each 24-bit sample is split into 8-bit bytes and written into a larger
--   8-bit FIFO.
--
--   No channel ID is inserted.
--
--   For 16 channels and 24-bit samples:
--
--       16 samples x 3 bytes = 48 bytes per frame
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.adc_fifo_frame_packer_pkg.all;


entity adc_fifo_frame_packer is
    generic (
        G_NUM_CHANNELS           : positive := 16;
        G_ADC_WIDTH              : positive := 24;
        G_BYTE_WIDTH             : positive := 8;
        G_LARGE_FIFO_COUNT_WIDTH : positive := 16
    );
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;

        -- Enables the frame packer
        i_enable : in std_logic;

        -----------------------------------------------------------------------
        -- Small FIFO interface
        -----------------------------------------------------------------------

        -- Empty signal from each small FIFO.
        -- '1' = FIFO empty
        -- '0' = FIFO has at least one sample
        i_small_fifo_empty : in std_logic_vector(G_NUM_CHANNELS-1 downto 0);

        -- Selects which small FIFO output should be connected to i_fifo_dout.
        --
        -- Example:
        --   o_fifo_sel = 0 selects FIFO 0
        --   o_fifo_sel = 1 selects FIFO 1
        --   ...
        --   o_fifo_sel = 15 selects FIFO 15
        o_fifo_sel : out unsigned(clog2(G_NUM_CHANNELS)-1 downto 0);

        -- Read enable for each small FIFO.
        -- Only one bit is asserted at a time.
        o_small_fifo_rd_en : out std_logic_vector(G_NUM_CHANNELS-1 downto 0);

        -- Data output from the currently selected small FIFO.
        --
        -- This signal should come from an external mux controlled by o_fifo_sel.
        i_fifo_dout : in std_logic_vector(G_ADC_WIDTH-1 downto 0);

        -----------------------------------------------------------------------
        -- Large 8-bit FIFO interface
        -----------------------------------------------------------------------

        -- Large FIFO full flag.
        -- '1' = cannot write
        -- '0' = can write
        i_large_fifo_full : in std_logic;

        -- Number of free byte locations in the large FIFO.
        -- The packer starts a frame only when this is large enough to hold
        -- one complete frame.
        i_large_fifo_free_count : in unsigned(G_LARGE_FIFO_COUNT_WIDTH-1 downto 0);

        -- Write enable to large FIFO.
        o_large_fifo_wr_en : out std_logic;

        -- Byte written into large FIFO.
        o_large_fifo_din : out std_logic_vector(G_BYTE_WIDTH-1 downto 0);

        -----------------------------------------------------------------------
        -- Status/debug
        -----------------------------------------------------------------------

        -- High while a frame is being packed.
        o_busy : out std_logic;

        -- Pulses high for one clock when a full frame has been written.
        o_frame_done : out std_logic
    );
end entity adc_fifo_frame_packer;


architecture rtl of adc_fifo_frame_packer is

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
        S_SELECT_FIFO,
        S_READ_FIFO,
        S_WAIT_DOUT,
        S_WRITE_BYTE,
        S_NEXT_CHANNEL
    );

    ---------------------------------------------------------------------------
    -- Registers
    ---------------------------------------------------------------------------

    signal r_state : t_state := S_IDLE;

    signal r_channel : integer range 0 to G_NUM_CHANNELS-1 := 0;
    signal r_byte    : integer range 0 to C_BYTES_PER_SAMPLE-1 := 0;

    signal r_sample : t_sample := (others => '0');

    signal r_frame_done : std_logic := '0';

    ---------------------------------------------------------------------------
    -- Internal output signals
    ---------------------------------------------------------------------------

    signal s_fifo_sel            : unsigned(C_CHANNEL_SEL_WIDTH-1 downto 0);
    signal s_small_fifo_rd_en    : std_logic_vector(G_NUM_CHANNELS-1 downto 0);
    signal s_large_fifo_wr_en    : std_logic;
    signal s_large_fifo_din      : t_byte;

    ---------------------------------------------------------------------------
    -- Function: all_small_fifos_ready
    --
    -- Returns true only when every small FIFO contains at least one sample.
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
    -- Splits the stored ADC sample into bytes.
    --
    -- Sends MSB first.
    --
    -- For a 24-bit sample:
    --
    --   r_byte = 0 gives sample(23 downto 16)
    --   r_byte = 1 gives sample(15 downto 8)
    --   r_byte = 2 gives sample(7 downto 0)
    ---------------------------------------------------------------------------

    function get_sample_byte(
        sample     : t_sample;
        byte_index : natural
    ) return t_byte is
        variable v_byte  : t_byte;
        variable v_upper : integer;
        variable v_lower : integer;
    begin

        v_upper := G_ADC_WIDTH - 1 - integer(byte_index * G_BYTE_WIDTH);
        v_lower := v_upper - G_BYTE_WIDTH + 1;

        v_byte := sample(v_upper downto v_lower);

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

    assert (C_FRAME_BYTES < 2**G_LARGE_FIFO_COUNT_WIDTH)
        report "G_LARGE_FIFO_COUNT_WIDTH may be too small for C_FRAME_BYTES"
        severity warning;

    ---------------------------------------------------------------------------
    -- Output assignments
    ---------------------------------------------------------------------------

    o_fifo_sel            <= s_fifo_sel;
    o_small_fifo_rd_en    <= s_small_fifo_rd_en;
    o_large_fifo_wr_en    <= s_large_fifo_wr_en;
    o_large_fifo_din      <= s_large_fifo_din;
    o_frame_done          <= r_frame_done;

    o_busy <= '1' when r_state /= S_IDLE else '0';

    ---------------------------------------------------------------------------
    -- FIFO select output
    ---------------------------------------------------------------------------

    s_fifo_sel <= to_unsigned(r_channel, C_CHANNEL_SEL_WIDTH);

    ---------------------------------------------------------------------------
    -- Combinational output control
    ---------------------------------------------------------------------------

    process(all)
    begin

        s_small_fifo_rd_en <= (others => '0');
        s_large_fifo_wr_en <= '0';
        s_large_fifo_din   <= (others => '0');

        case r_state is

            -------------------------------------------------------------------
            -- Assert read enable for the currently selected small FIFO.
            -------------------------------------------------------------------
            when S_READ_FIFO =>

                s_small_fifo_rd_en(r_channel) <= '1';

            -------------------------------------------------------------------
            -- Write one byte of the current 24-bit sample into the large FIFO.
            -------------------------------------------------------------------
            when S_WRITE_BYTE =>

                s_large_fifo_din <= get_sample_byte(r_sample, r_byte);

                if i_large_fifo_full = '0' then
                    s_large_fifo_wr_en <= '1';
                end if;

            when others =>

                null;

        end case;

    end process;

    ---------------------------------------------------------------------------
    -- Main state machine
    ---------------------------------------------------------------------------

    process(i_clk)
    begin

        if rising_edge(i_clk) then

            if i_rst = '1' then

                r_state      <= S_IDLE;
                r_channel    <= 0;
                r_byte       <= 0;
                r_sample     <= (others => '0');
                r_frame_done <= '0';

            else

                r_frame_done <= '0';

                case r_state is

                    -----------------------------------------------------------
                    -- Wait until:
                    --
                    --   1. Packer is enabled
                    --   2. All small FIFOs contain at least one sample
                    --   3. Large FIFO has enough space for one full frame
                    -----------------------------------------------------------
                    when S_IDLE =>

                        r_channel <= 0;
                        r_byte    <= 0;

                        if i_enable = '1' then

                            if all_small_fifos_ready(i_small_fifo_empty) and
                               i_large_fifo_free_count >= to_unsigned(C_FRAME_BYTES, G_LARGE_FIFO_COUNT_WIDTH) then

                                r_state <= S_SELECT_FIFO;

                            end if;

                        end if;

                    -----------------------------------------------------------
                    -- Allow external FIFO output mux to select the correct FIFO.
                    -----------------------------------------------------------
                    when S_SELECT_FIFO =>

                        r_state <= S_READ_FIFO;

                    -----------------------------------------------------------
                    -- Pulse read enable for selected small FIFO.
                    -----------------------------------------------------------
                    when S_READ_FIFO =>

                        r_state <= S_WAIT_DOUT;

                    -----------------------------------------------------------
                    -- Wait for selected FIFO output data to become valid.
                    --
                    -- This assumes the small FIFO has 1 clock of read latency.
                    -----------------------------------------------------------
                    when S_WAIT_DOUT =>

                        r_sample <= i_fifo_dout;
                        r_byte   <= 0;
                        r_state  <= S_WRITE_BYTE;

                    -----------------------------------------------------------
                    -- Write stored sample into the large FIFO, byte by byte.
                    -----------------------------------------------------------
                    when S_WRITE_BYTE =>

                        if i_large_fifo_full = '0' then

                            if r_byte = C_BYTES_PER_SAMPLE - 1 then
                                r_state <= S_NEXT_CHANNEL;
                            else
                                r_byte <= r_byte + 1;
                            end if;

                        end if;

                    -----------------------------------------------------------
                    -- Move to next small FIFO.
                    -- After the final FIFO, the frame is complete.
                    -----------------------------------------------------------
                    when S_NEXT_CHANNEL =>

                        if r_channel = G_NUM_CHANNELS - 1 then

                            r_frame_done <= '1';
                            r_state      <= S_IDLE;

                        else

                            r_channel <= r_channel + 1;
                            r_state   <= S_SELECT_FIFO;

                        end if;

                end case;

            end if;

        end if;

    end process;

end architecture rtl;