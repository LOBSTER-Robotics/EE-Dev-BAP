-- DAC baseline validation top-level — Cyclone 10 LP edition.
--
-- Clock:   50 MHz on-board oscillator (PIN_E1)
-- Reset:   Active-low push button PB0/S3 (PIN_E15)
--
-- SPI outputs → J10 GPIO header → DAC8811 EVM J8:
--   spi_clk  J10 pin 1 (PIN_L13) → EVM J8 pin 1 (SCLK)
--   sdi[0]   J10 pin 2 (PIN_L16) → EVM J8 pin 3 (SDI)
--   cs_n     J10 pin 3 (PIN_L15) → EVM J8 pin 5 (CS)
--   GND      J10 pin 12          → EVM J8 pin 2/4/6 (GND)
--
-- LEDs (active low, Bank 2, 2.5V):
--   LED0 (L14): heartbeat — blinks ~1.5 Hz, confirms FPGA is running
--   LED1 (K15): SPI active — lit while CS is low (transfer in progress)
--   LED2 (J14): running   — lit when not in reset
--   LED3 (J13): unused    — always off

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dac_baseline is
    port (
        clk     : in  std_logic;
        rst_n   : in  std_logic;

        spi_clk : out std_logic;
        sdi     : out std_logic_vector(0 downto 0);
        cs_n    : out std_logic;

        led     : out std_logic_vector(3 downto 0)  -- active low
    );
end entity top_dac_baseline;

architecture rtl of top_dac_baseline is

    signal s_rst        : std_logic;
    signal s_sine_data  : std_logic_vector(15 downto 0);
    signal s_read_en    : std_logic_vector(0 downto 0);
    signal s_cs_n       : std_logic;

    -- Heartbeat: 25-bit counter, bit 24 toggles at 50MHz/2^25 ≈ 1.5 Hz
    signal s_heartbeat  : unsigned(24 downto 0) := (others => '0');

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    --------------------------------------------------------------------
    -- Heartbeat counter
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if s_rst = '1' then
                s_heartbeat <= (others => '0');
            else
                s_heartbeat <= s_heartbeat + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- LED assignments (active low: '0' = ON, '1' = OFF)
    --------------------------------------------------------------------
    led(0) <= not s_heartbeat(24);  -- blinks ~1.5 Hz
    led(1) <= s_cs_n;               -- ON when CS low (SPI transferring)
    led(2) <= s_rst;                -- ON when not in reset
    led(3) <= '1';                  -- always off

    --------------------------------------------------------------------
    -- Sine wave generator (~200 kHz at 50 MHz clock)
    --------------------------------------------------------------------
    u_sine_gen : entity work.sine_wave_gen
        generic map (G_PHASE_INC => 262)
        port map (
            i_clk   => clk,
            i_rst   => s_rst,
            i_en    => '1',
            o_data  => s_sine_data,
            o_valid => open
        );

    --------------------------------------------------------------------
    -- SPI master
    --------------------------------------------------------------------
    u_spi : entity work.spi_master_dac
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 6
        )
        port map (
            clk           => clk,
            rst           => s_rst,
            data_in       => s_sine_data,
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            spi_clk       => spi_clk
        );

end architecture rtl;
