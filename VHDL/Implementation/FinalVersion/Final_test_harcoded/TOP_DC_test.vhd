-- DC Test 
-- Ramp from 0x0000 to 0xFFFF at 2 MSps.
--
-- Output: full-scale sawtooth
-- Sample rate = 100 kSps (DONE_WAIT_CYCLS = 481). Change generic to adjust:
-- 2 MSps: 6 | 500 kSps: 81 | 100 kSps: 481 | 10 kSps: 4981 | 1 kSps: 49981

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dc_test is
    port (
        clk      : in    std_logic;
        extClk   : in    std_logic;
        rst_n    : in    std_logic;
        sdi      : out   std_logic_vector(0 downto 0);
        cs_n     : out   std_logic;
        high_imp : inout std_logic;
        led      : out   std_logic_vector(3 downto 0)
    );
end entity top_dc_test;

architecture rtl of top_dc_test is

    signal s_rst      : std_logic;
    signal s_cs_n     : std_logic;
    signal s_read_en  : std_logic_vector(0 downto 0);
    signal s_ramp     : unsigned(15 downto 0) := (others => '0');
    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    process (clk)
    begin
        if rising_edge(clk) then
            if s_rst = '1' then
                s_heartbeat <= (others => '0');
                s_ramp      <= (others => '0');
            else
                s_heartbeat <= s_heartbeat + 1;
                s_ramp      <= s_ramp + 1;   -- increments at 50 MHz
            end if;                           -- DAC captures every 25 cycles
        end if;
    end process;

    led(0) <= not s_heartbeat(24);  -- heartbeat ~1.5 Hz
    led(1) <= s_cs_n;               -- SPI active
    led(2) <= s_rst;                -- running
    led(3) <= '1';

    u_spi : entity work.spi_master_dac_ext
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 481
        )
        port map (
            clk           => extClk,
            rst           => s_rst,
            data_in       => std_logic_vector(s_ramp),
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            high_imp      => high_imp
        );

end architecture rtl;