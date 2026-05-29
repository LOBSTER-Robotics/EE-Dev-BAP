-- DAC baseline validation top-level.
--
-- Clock:
--   On-board 100 MHz LVDS oscillator (P3/P4) → EHXPLLL PLL → 50 MHz.
--   No external clock input needed.
--   PLL settings: CLKI_DIV=1, CLKFB_DIV=5, CLKOP_DIV=10
--   FVCO = 100 × 5 / 1 = 500 MHz  (in-range: 400–800 MHz)
--   FCLKOP = 500 / 10 = 50 MHz
--
-- Reset:
--   Active-high. Design stays in reset until PLL is locked.
--   Connect rst_btn to a push button (e.g. K19, Bank 2, LVCMOS25).
--
-- SPI outputs (X4 expansion connector, Bank 0/1, LVCMOS33):
--   spi_clk → X4 pin 3 (A12, IO0)  → DAC8811 CLK
--   sdi(0)  → X4 pin 4 (A13, IO1)  → DAC8811 SDI
--   cs_n    → X4 pin 5 (B13, IO2)  → DAC8811 CS
--   GND     → X4 pin 2             → DAC8811 GND reference
--
-- Chain:
--   sine_wave_gen (262 × 50 MHz / 65536 ≈ 200 kHz)
--     → FIFOsm (ECP5 block-RAM FIFO, depth 32, single clock)
--       → spi_master_dac (spi_clk = 50 MHz = DAC8811 max)
--         → DAC8811

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ECP5 primitives
library ECP5U;
use ECP5U.components.all;

entity top_dac_baseline is
    port (
        -- 100 MHz LVDS oscillator (on-board, P3/P4)
        clk_p   : in  std_logic;
        clk_n   : in  std_logic;

        -- Push-button reset (active-high, Bank 2 LVCMOS25)
        rst_btn : in  std_logic;

        -- DAC8811 SPI bus (X4 pins 3-5, Bank 0/1 LVCMOS33)
        spi_clk : out std_logic;
        sdi     : out std_logic_vector(0 downto 0);
        cs_n    : out std_logic
    );
end entity top_dac_baseline;

architecture rtl of top_dac_baseline is

    --------------------------------------------------------------------
    -- Clock / reset signals
    --------------------------------------------------------------------
    signal s_clk_100  : std_logic;   -- raw 100 MHz from LVDS buffer
    signal s_clk_50   : std_logic;   -- 50 MHz PLL output
    signal s_pll_lock : std_logic;
    signal s_rst      : std_logic;   -- internal reset: button OR PLL unlocked

    --------------------------------------------------------------------
    -- FIFO / sine generator interconnect
    --------------------------------------------------------------------
    signal s_sine_data         : std_logic_vector(15 downto 0);
    signal s_sine_valid        : std_logic;
    signal s_fifo_wr_en        : std_logic;

    signal s_fifo_q            : std_logic_vector(15 downto 0);
    signal s_fifo_empty        : std_logic;
    signal s_fifo_full         : std_logic;
    signal s_fifo_almost_empty : std_logic;
    signal s_fifo_almost_full  : std_logic;

    signal s_read_en : std_logic_vector(0 downto 0);

begin

    --------------------------------------------------------------------
    -- LVDS input buffer: differential 100 MHz → single-ended
    --------------------------------------------------------------------
    u_clk_ibuf : ILVDS
        port map (
            A  => clk_p,
            AN => clk_n,
            Z  => s_clk_100
        );

    --------------------------------------------------------------------
    -- PLL: 100 MHz → 50 MHz
    -- FVCO = 100 × CLKFB_DIV / CLKI_DIV = 100 × 5 / 1 = 500 MHz
    -- FCLKOP = FVCO / CLKOP_DIV = 500 / 10 = 50 MHz
    --------------------------------------------------------------------
    u_pll : EHXPLLL
        generic map (
            PLLRST_ENA       => "DISABLED",
            INTFB_WAKE       => "DISABLED",
            STDBY_ENABLE     => "DISABLED",
            DPHASE_SOURCE    => "DISABLED",
            OUTDIVIDER_MUXA  => "DIVA",
            OUTDIVIDER_MUXB  => "DIVB",
            CLKOP_ENABLE     => "ENABLED",
            CLKOS_ENABLE     => "DISABLED",
            CLKOS2_ENABLE    => "DISABLED",
            CLKOS3_ENABLE    => "DISABLED",
            CLKOP_DIV        => 10,
            CLKOP_CPHASE     => 4,   -- 180° phase: half-period = clean 50 MHz
            CLKFB_DIV        => 5,
            CLKI_DIV         => 1,
            FEEDBK_PATH      => "CLKOP"
        )
        port map (
            CLKI        => s_clk_100,
            CLKFB       => s_clk_50,
            CLKOP       => s_clk_50,
            CLKOS       => open,
            CLKOS2      => open,
            CLKOS3      => open,
            LOCK        => s_pll_lock,
            INTLOCK     => open,
            RST         => '0',
            STDBY       => '0',
            PHASESEL1   => '0',
            PHASESEL0   => '0',
            PHASEDIR    => '0',
            PHASESTEP   => '0',
            PHASELOADREG => '0',
            PLLWAKESYNC => '0',
            ENCLKOP     => '0',
            ENCLKOS     => '0',
            ENCLKOS2    => '0',
            ENCLKOS3    => '0',
            REFCLK      => open,
            CLKINTFB    => open
        );

    -- Hold reset until button released AND PLL has locked
    s_rst <= rst_btn or (not s_pll_lock);

    --------------------------------------------------------------------
    -- Sine wave generator (~200 kHz at 50 MHz clock)
    --------------------------------------------------------------------
    u_sine_gen : entity work.sine_wave_gen
        generic map (G_PHASE_INC => 262)
        port map (
            i_clk   => s_clk_50,
            i_rst   => s_rst,
            i_en    => '1',
            o_data  => s_sine_data,
            o_valid => s_sine_valid
        );

    s_fifo_wr_en <= s_sine_valid and (not s_fifo_almost_full);

    --------------------------------------------------------------------
    -- FIFOsm — ECP5 block-RAM FIFO, single clock, depth 32
    --------------------------------------------------------------------
    u_fifo : entity work.FIFOsm
        port map (
            Data        => s_sine_data,
            Clock       => s_clk_50,
            WrEn        => s_fifo_wr_en,
            RdEn        => s_read_en(0),
            Reset       => s_rst,
            Q           => s_fifo_q,
            Empty       => s_fifo_empty,
            Full        => s_fifo_full,
            AlmostEmpty => s_fifo_almost_empty,
            AlmostFull  => s_fifo_almost_full
        );

    --------------------------------------------------------------------
    -- SPI master (spi_clk = s_clk_50 = 50 MHz = DAC8811 rated max)
    --------------------------------------------------------------------
    u_spi : entity work.spi_master_dac
        generic map (Num_Channels => 1)
        port map (
            clk           => s_clk_50,
            rst           => s_rst,
            data_in       => s_fifo_q,
            fifo_empty(0) => s_fifo_empty,
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => cs_n,
            spi_clk       => spi_clk
        );

end architecture rtl;
