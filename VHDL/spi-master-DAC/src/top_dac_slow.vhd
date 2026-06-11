-- DAC baseline validation top-level — Cyclone 10 LP (slow-clock edition).
--
-- Clock:   50 MHz on-board oscillator (E1)
-- Reset:   Active-low push button (E15)
-- Button:  Active-low push button — assign second key pin in .qsf
--          Each press advances DAC output one step down the ramp.
--
-- SPI outputs:
--   spi_clk  J10 pin 39 (P1)  → EVM J8 pin 1 (SCLK)
--   sdi      J10 pin 3  (L15) → EVM J8 pin 3 (SDI)
--   cs_n     J10 pin 1  (L13) → EVM J8 pin 5 (CS)
--
-- SCLK frequency: 50 MHz / (2 × C_DIV_HALF=50) = 500 kHz
--
-- LEDs (active low):
--   LED0: heartbeat ~1.5 Hz
--   LED1: SPI active — lit while CS is low
--   LED2: running   — lit when not in reset
--   LED3: button held (debounced)
--
-- Ramp (press to advance, wraps after step 9):
--   step 0 : 0xFFFF  65535   full scale
--   step 1 : 0xE38D  58253
--   step 2 : 0xC71C  50972
--   step 3 : 0xAAAA  43690   2/3 FS
--   step 4 : 0x8E38  36408
--   step 5 : 0x71C7  29127
--   step 6 : 0x5555  21845   1/3 FS
--   step 7 : 0x38E3  14563
--   step 8 : 0x1C72   7282
--   step 9 : 0x0000      0   zero

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dac_slow is
    port (
        clk     : in  std_logic;
        rst_n   : in  std_logic;
        btn     : in  std_logic;                    -- active low, assign pin in .qsf

        spi_clk : out std_logic;
        sdi     : out std_logic_vector(0 downto 0);
        cs_n    : out std_logic;

        led     : out std_logic_vector(3 downto 0)  -- active low
    );
end entity top_dac_slow;

architecture rtl of top_dac_slow is

    signal s_rst      : std_logic;
    signal s_cs_n     : std_logic;
    signal s_read_en  : std_logic_vector(0 downto 0);
    signal s_dac_data : std_logic_vector(15 downto 0);

    -- Fabric clock divider: 50 MHz → 500 kHz
    constant C_DIV_HALF : integer := 50;
    signal s_div_cnt   : integer range 0 to C_DIV_HALF - 1 := 0;
    signal s_clk_slow  : std_logic := '0';

    -- Heartbeat: bit 24 toggles at 50 MHz / 2^25 ≈ 1.5 Hz
    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

    -- Descending ramp table: 10 evenly-spaced levels, FFFF → 0000.
    type t_ramp is array (0 to 9) of std_logic_vector(15 downto 0);
    constant RAMP : t_ramp := (
        0 => x"FFFF",  -- 65535   full scale
        1 => x"E38D",  -- 58253
        2 => x"C71C",  -- 50972
        3 => x"AAAA",  -- 43690   2/3 FS
        4 => x"8E38",  -- 36408
        5 => x"71C7",  -- 29127
        6 => x"5555",  -- 21845   1/3 FS
        7 => x"38E3",  -- 14563
        8 => x"1C72",  --  7282
        9 => x"0000"   --     0   zero
    );
    signal s_ramp_idx : integer range 0 to 9 := 0;

    -- Button debounce: 20 ms stable window @ 50 MHz = 1 000 000 cycles.
    constant DEBOUNCE_CYCLES : integer := 1_000_000;
    signal s_btn_sync  : std_logic_vector(1 downto 0) := (others => '1');
    signal s_btn_db    : std_logic := '1';
    signal s_btn_prev  : std_logic := '1';
    signal s_btn_cnt   : integer range 0 to DEBOUNCE_CYCLES - 1 := 0;
    signal s_btn_press : std_logic;

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    --------------------------------------------------------------------
    -- Clock divider: 50 MHz → 500 kHz
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if s_div_cnt = C_DIV_HALF - 1 then
                s_div_cnt  <= 0;
                s_clk_slow <= not s_clk_slow;
            else
                s_div_cnt <= s_div_cnt + 1;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Heartbeat counter (50 MHz)
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
    led(0) <= not s_heartbeat(24);
    led(1) <= s_cs_n;
    led(2) <= s_rst;
    led(3) <= s_btn_db;

    --------------------------------------------------------------------
    -- Button debounce + edge detect (50 MHz domain)
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if s_rst = '1' then
                s_btn_sync <= (others => '1');
                s_btn_db   <= '1';
                s_btn_prev <= '1';
                s_btn_cnt  <= 0;
            else
                s_btn_sync <= s_btn_sync(0) & btn;

                if s_btn_sync(1) /= s_btn_db then
                    if s_btn_cnt = DEBOUNCE_CYCLES - 1 then
                        s_btn_db  <= s_btn_sync(1);
                        s_btn_cnt <= 0;
                    else
                        s_btn_cnt <= s_btn_cnt + 1;
                    end if;
                else
                    s_btn_cnt <= 0;
                end if;

                s_btn_prev <= s_btn_db;
            end if;
        end if;
    end process;

    s_btn_press <= s_btn_prev and not s_btn_db;

    --------------------------------------------------------------------
    -- Ramp index: advance one step on each button press (50 MHz domain)
    --------------------------------------------------------------------
    process (clk)
    begin
        if rising_edge(clk) then
            if s_rst = '1' then
                s_ramp_idx <= 0;
            elsif s_btn_press = '1' then
                if s_ramp_idx = 9 then
                    s_ramp_idx <= 0;
                else
                    s_ramp_idx <= s_ramp_idx + 1;
                end if;
            end if;
        end if;
    end process;

    s_dac_data <= RAMP(s_ramp_idx);

    --------------------------------------------------------------------
    -- SPI master — driven by 500 kHz fabric clock.
    --------------------------------------------------------------------
    u_spi : entity work.spi_master_dac
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 6
        )
        port map (
            clk           => s_clk_slow,
            rst           => s_rst,
            data_in       => x"5555",
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            spi_clk       => spi_clk
        );

end architecture rtl;