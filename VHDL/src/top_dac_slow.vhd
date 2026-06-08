-- DAC slow-clock ramp test — Cyclone 10 LP
--
-- Divides 50 MHz → 500 kHz SPI clock (no changes to spi_master_dac).
-- Sends a 16-bit sawtooth ramp to the DAC.
--
-- Sample rate: 500 kHz / 25 cycles = 20 kSps
-- Ramp step  : 3277 per transfer  → ~1 kHz sawtooth (20 steps/period)
-- DAC output : ±10 V sawtooth at ~1 kHz
--
-- Pin assignments: same as top_dac_baseline (same QSF / Pin Planner).
-- Top-level entity: top_dac_slow

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dac_slow is
    port (
        clk     : in  std_logic;                    -- 50 MHz on-board oscillator (E1)
        rst_n   : in  std_logic;                    -- Active-low push button (E15)

        spi_clk : out std_logic;                    -- J10 pin 39 (P1)  → EVM J8 pin 1
        sdi     : out std_logic_vector(0 downto 0); -- J10 pin 3  (L15) → EVM J8 pin 3
        cs_n    : out std_logic;                    -- J10 pin 1  (L13) → EVM J8 pin 5

        led     : out std_logic_vector(3 downto 0)  -- active low
    );
end entity top_dac_slow;

architecture rtl of top_dac_slow is

    -- 50 MHz / 100 = 500 kHz  (toggle every 50 cycles = half-period)
    constant C_DIV    : integer := 50;
    signal s_div_cnt  : integer range 0 to C_DIV-1 := 0;
    signal s_clk_500k : std_logic := '0';

    signal s_rst      : std_logic;
    signal s_cs_n     : std_logic;
    signal s_read_en  : std_logic_vector(0 downto 0);

    -- Step sequencer: 0x0000 → 0x4000 → 0x8000 → 0xC000 → 0xFFFF → repeat
    type t_seq is array (0 to 4) of unsigned(15 downto 0);
    constant C_SEQ : t_seq := (
        to_unsigned(16#0000#, 16),
        to_unsigned(16#4000#, 16),
        to_unsigned(16#8000#, 16),
        to_unsigned(16#C000#, 16),
        to_unsigned(16#FFFF#, 16)
    );
    signal s_seq_idx : integer range 0 to 4 := 0;
    signal s_ramp    : unsigned(15 downto 0) := (others => '0');

    -- Heartbeat: 50 MHz / 2^25 ≈ 1.5 Hz blink
    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    --------------------------------------------------------------------
    -- Clock divider: 50 MHz → 500 kHz
    -- s_clk_500k is a fabric clock (acceptable for test only).
    --------------------------------------------------------------------
    p_div : process (clk)
    begin
        if rising_edge(clk) then
            if s_div_cnt = C_DIV - 1 then
                s_div_cnt  <= 0;
                s_clk_500k <= not s_clk_500k;
            else
                s_div_cnt <= s_div_cnt + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Heartbeat (50 MHz domain)
    --------------------------------------------------------------------
    p_hb : process (clk)
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
    -- Step sequencer (500 kHz domain)
    -- Advances to the next fixed value each time the SPI master reads
    --------------------------------------------------------------------
    p_ramp : process (s_clk_500k)
    begin
        if rising_edge(s_clk_500k) then
            if s_rst = '1' then
                s_seq_idx <= 0;
                s_ramp    <= C_SEQ(0);
            elsif s_read_en(0) = '1' then
                if s_seq_idx = 4 then
                    s_seq_idx <= 0;
                else
                    s_seq_idx <= s_seq_idx + 1;
                end if;
                s_ramp <= C_SEQ(s_seq_idx);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- LEDs (active low)
    -- LED0: heartbeat ~1.5 Hz   LED1: SPI active   LED2: running
    --------------------------------------------------------------------
    led(0) <= not s_heartbeat(24);
    led(1) <= s_cs_n;
    led(2) <= s_rst;
    led(3) <= '1';

    --------------------------------------------------------------------
    -- SPI master running at 500 kHz
    --------------------------------------------------------------------
    u_spi : entity work.spi_master_dac
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 6
        )
        port map (
            clk           => s_clk_500k,
            rst           => s_rst,
            data_in       => x"5555",
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            spi_clk       => spi_clk
        );

end architecture rtl;
