-- DAC baseline validation top-level — Cyclone 10 LP edition.
-- byte_generator → FIFO → SPI master → DAC8811.
--
-- Clock:   50 MHz on-board oscillator (PIN_E1)
-- External Clock 50 Mhz external clock on the DCD board (J10 pin 1 (PIN_L13))
-- Reset:   Active-low push button PB0/KEY0 (PIN_E15)
--
-- SPI outputs → J10 GPIO header → DAC8811 EVM J8:
--   sdi[0]   J10 pin 2 (PIN_L16) 
--   cs_n     J10 pin 3 (PIN_L15) 
--   GND      J10 pin 12          
--
-- byte_generator writes 1500 sequential values (0x0000 → 0x05DB) into
-- the FIFO on each burst, then immediately restarts (enable tied high).
-- SPI master reads from FIFO at 2 MSps → repeating sawtooth at DAC output.
-- Sawtooth frequency ≈ 2 MSps / 1500 ≈ 1.33 kHz.
--
-- LEDs (active low):
--   LED0 (L14): heartbeat ~1.5 Hz
--   LED1 (K15): SPI active — lit while CS is low
--   LED2 (J14): running   — lit when not in reset
--   LED3 (J13): FIFO almost-full warning

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dac_baseline is
    port (
        sysclk  : in  std_logic;
        extClk  : in  std_logic;
        rst_n   : in  std_logic;
        sdi     : out std_logic_vector(0 downto 0);
        cs_n    : out std_logic;
        led     : out std_logic_vector(3 downto 0)
    );
end entity top_dac_baseline;

architecture rtl of top_dac_baseline is

    signal s_rst  : std_logic;
    signal s_cs_n : std_logic;

    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

    -- byte_generator outputs
    signal s_bg_data  : std_logic_vector(15 downto 0);
    signal s_bg_wr_en : std_logic;

    -- FIFO signals
    signal s_fifo_empty : std_logic;
    signal s_fifo_full  : std_logic;
    signal s_fifo_ae    : std_logic;
    signal s_fifo_af    : std_logic;
    signal s_fifo_q     : std_logic_vector(15 downto 0);

    -- SPI master handshake
    signal s_read_en : std_logic_vector(0 downto 0);

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    --------------------------------------------------------------------
    -- Heartbeat
    --------------------------------------------------------------------
    process (sysclk)
    begin
        if rising_edge(sysclk) then
            if s_rst = '1' then
                s_heartbeat <= (others => '0');
            else
                s_heartbeat <= s_heartbeat + 1;
            end if;
        end if;
    end process;

    led(0) <= not s_heartbeat(24);
    led(1) <= s_cs_n;
    led(2) <= s_rst;
    led(3) <= s_fifo_af;  -- almost-full: rate mismatch warning

    --------------------------------------------------------------------
    -- Byte generator
    -- enable tied to '1': restarts immediately after each burst,
    -- producing a continuous repeating sawtooth (0 → 1499 → 0 → ...).
    --------------------------------------------------------------------
    u_byte_generator : entity work.byte_generator
        port map (
            clk           => sysclk,
            rst           => s_rst,
            enable        => '1',
            fifo_full     => s_fifo_full,
            Data          => s_bg_data,
            fifo_write_en => s_bg_wr_en
        );

    --------------------------------------------------------------------
    -- FIFO (256 × 16-bit, single clock)
    --------------------------------------------------------------------
    u_fifo : entity work.fifo
        port map (
            clock        => sysclk,
            data         => s_bg_data,
            wrreq        => s_bg_wr_en,
            rdreq        => s_read_en(0),
            empty        => s_fifo_empty,
            full         => s_fifo_full,
            almost_empty => s_fifo_ae,
            almost_full  => s_fifo_af,
            q            => s_fifo_q
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
            clk           => extClk,
            rst           => s_rst,
            data_in       => s_fifo_q,
            fifo_empty(0) => s_fifo_empty,
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n
        );

end architecture rtl;