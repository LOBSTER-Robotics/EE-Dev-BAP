-- Full-path simulation testbench:
--
--   sine_wave_gen  →  fifo_dac_behav  →  spi_master_dac  →  (SPI bus)
--
-- The spi_master_dac drives the FIFO read side directly:
--   - it monitors fifo_empty and asserts read_en when data is available
--   - data_in is wired straight to the FIFO Q output
-- So no external feed process is needed; the SPI master is self-sufficient.
--
-- Everything runs from one 50 MHz clock.
-- spi_clk = clk (temporary pass-through in the current RTL).
--
-- Expected waveform (verify in Surfer):
--   cs_n    : pulses low for each 16-bit transfer
--   spi_clk : 100 MHz system clock (pass-through, temporary)
--   sdi(0)  : MSB-first serial data matching the sine LUT

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_path is
end entity tb_full_path;

architecture sim of tb_full_path is

    constant C_CLK_PERIOD : time     := 20 ns;   -- 50 MHz
    constant C_N_CH       : positive := 1;

    --------------------------------------------------------------------
    -- Clock / reset
    --------------------------------------------------------------------

    signal s_clk : std_logic := '0';
    signal s_rst : std_logic := '1';

    --------------------------------------------------------------------
    -- Sine generator
    --------------------------------------------------------------------

    signal s_sine_data  : std_logic_vector(15 downto 0);
    signal s_sine_valid : std_logic;

    --------------------------------------------------------------------
    -- FIFO control / status
    --------------------------------------------------------------------

    -- read_en comes from the SPI master (std_logic_vector, 1 bit per channel)
    signal s_read_en : std_logic_vector(C_N_CH-1 downto 0);

    signal s_fifo_q            : std_logic_vector(15 downto 0);
    signal s_fifo_empty        : std_logic;
    signal s_fifo_full         : std_logic;
    signal s_fifo_almost_empty : std_logic;
    signal s_fifo_almost_full  : std_logic;
    signal s_fifo_wr_en        : std_logic;

    --------------------------------------------------------------------
    -- SPI bus outputs (connect to DAC8811 in hardware)
    --------------------------------------------------------------------

    signal s_sdi     : std_logic_vector(C_N_CH-1 downto 0);
    signal s_cs_n    : std_logic;
    signal s_spi_clk : std_logic;

    --------------------------------------------------------------------
    -- Helper
    --------------------------------------------------------------------

    procedure wait_clks (
        signal   clk : in std_logic;
        constant n   : in natural
    ) is
    begin
        for i in 1 to n loop
            wait until rising_edge(clk);
        end loop;
    end procedure;

begin

    --------------------------------------------------------------------
    -- Clock
    --------------------------------------------------------------------

    s_clk <= not s_clk after C_CLK_PERIOD / 2;

    --------------------------------------------------------------------
    -- DUT 1: Sine wave generator
    -- G_PHASE_INC = 262  →  262 × 50 MHz / 65536 ≈ 200 kHz
    --------------------------------------------------------------------

    u_sine_gen : entity work.sine_wave_gen
        generic map (G_PHASE_INC => 262)
        port map (
            i_clk   => s_clk,
            i_rst   => s_rst,
            i_en    => '1',
            o_data  => s_sine_data,
            o_valid => s_sine_valid
        );

    -- Throttle writes when FIFO is almost full
    s_fifo_wr_en <= s_sine_valid and (not s_fifo_almost_full);

    --------------------------------------------------------------------
    -- DUT 2: Behavioral FIFO
    -- WrClock and RdClock both tied to s_clk (single-domain simulation).
    -- read_en(0) drives RdEn; fifo_empty driven by FIFO Empty output.
    --------------------------------------------------------------------

    u_fifo : entity work.fifo_dac_behav
        generic map (
            G_DEPTH        => 32,   -- matches FIFOsm used in synthesis
            G_WIDTH        => 16,
            G_ALMOST_EMPTY => 2,
            G_ALMOST_FULL  => 30
        )
        port map (
            Data        => s_sine_data,
            WrClock     => s_clk,
            RdClock     => s_clk,
            WrEn        => s_fifo_wr_en,
            RdEn        => s_read_en(0),      -- driven by SPI master
            Reset       => s_rst,
            RPReset     => s_rst,
            Q           => s_fifo_q,
            Empty       => s_fifo_empty,
            Full        => s_fifo_full,
            AlmostEmpty => s_fifo_almost_empty,
            AlmostFull  => s_fifo_almost_full
        );

    --------------------------------------------------------------------
    -- DUT 3: SPI master (final RTL from vhdl/feature/spi-master-dac)
    --
    -- fifo_empty : SPI master polls this; asserts read_en when '0'
    -- read_en    : SPI master drives this; wired to FIFO RdEn above
    -- data_in    : FIFO Q output (valid 1 cycle after read_en pulse)
    -- spi_clk    : pass-through of clk (temporary in current RTL)
    --------------------------------------------------------------------

    u_spi : entity work.spi_master_dac
        generic map (Num_Channels => C_N_CH)
        port map (
            clk        => s_clk,
            rst        => s_rst,

            -- Channel 0 data from FIFO
            -- data_in(k*16+15 downto k*16) = channel k, so for k=0: bits 15:0
            data_in    => s_fifo_q,

            -- fifo_empty is a vector; bit k = '0' means channel k has data
            fifo_empty(0) => s_fifo_empty,

            read_en    => s_read_en,

            sdi        => s_sdi,
            cs_n       => s_cs_n,
            spi_clk    => s_spi_clk
        );

    --------------------------------------------------------------------
    -- Stimulus / simulation control
    --------------------------------------------------------------------

    p_stim : process
    begin
        report "tb_full_path: reset asserted";

        s_rst <= '1';
        wait_clks(s_clk, 10);

        s_rst <= '0';
        report "tb_full_path: reset released";
        report "  sine_wave_gen filling FIFO, spi_master_dac draining it";

        -- Run long enough to see many SPI transfers.
        -- Each transfer: READ(1) + SETUP(1) + TRANSFER(16) + DONE(1) = 19 cycles.
        -- 10 µs = 1000 cycles → ~50 complete transfers visible in Surfer.
        wait for 10 us;

        report "tb_full_path: simulation complete" severity failure;
    end process;

end architecture sim;
