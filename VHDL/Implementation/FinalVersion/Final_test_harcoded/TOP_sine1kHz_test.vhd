-- DAC 1 kHz sine test — final PCB (with summing-amplifier output stage)
-- Near-maximum amplitude sine at 1 kHz.
--
-- Frequency:
--   20-bit phase accumulator for fine resolution at low frequencies.
--   f_out = phase_inc × 50 MHz / 2^20
--   phase_inc = 21 → 50e6 × 21 / 1 048 576 ≈ 1 001 Hz ≈ 1 kHz
--
-- Amplitude:
--   SR_required = 2π × 1 kHz × 1.172 V = 0.00736 V/µs ≪ 0.8 V/µs  ✓
--   LUT centred, scaled by ×60 >> 6 (÷ 64/60 ≈ 0.9375):
--   ±32 767 × 60 / 64 = ±30 720 codes at DAC.
--   Op-amp output: ±30 720 / 65 536 × 5 V = ±2.344 V peak.
--   After summing-amplifier halving: ±1.172 V at ADC.
--   Headroom: 1.25 V max − 1.172 V = 0.078 V each side. ✓
--
-- LEDs (active low):
--   LED0: heartbeat ~1.5 Hz
--   LED1: SPI active
--   LED2: running
--   LED3: unused

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_1khz_test is
    port (
        clk      : in    std_logic;          -- 50 MHz external oscillator
        rst_n    : in    std_logic;
        sdi      : out   std_logic_vector(0 downto 0);
        cs_n     : out   std_logic;
        high_imp : inout std_logic;
        led      : out   std_logic_vector(3 downto 0)
    );
end entity top_1khz_test;

architecture rtl of top_1khz_test is

    -- phase_inc = 21 → f = 21 × 50 MHz / 2^20 = 1 001 Hz ≈ 1 kHz
    constant C_PHASE_INC : unsigned(19 downto 0) := to_unsigned(300, 20);

    -- 16-bit source LUT and derived 15-bit active LUT
    type lut_t is array (0 to 255) of unsigned(15 downto 0);

        constant C_LUT : lut_t := (
        x"8000", x"8324", x"8648", x"896A", x"8C8C", x"8FAB", x"92C8", x"95E2",
        x"98F9", x"9C0B", x"9F1A", x"A223", x"A528", x"A826", x"AB1F", x"AE11",
        x"B0FB", x"B3DF", x"B6BA", x"B98C", x"BC56", x"BF17", x"C1CE", x"C47A",
        x"C71C", x"C9B4", x"CC3F", x"CEBF", x"D133", x"D39B", x"D5F5", x"D842",
        x"DA82", x"DCB3", x"DED7", x"E0EB", x"E2F1", x"E4E8", x"E6CF", x"E8A6",
        x"EA6D", x"EC23", x"EDC9", x"EF5E", x"F0E2", x"F254", x"F3B5", x"F504",
        x"F641", x"F76B", x"F884", x"F989", x"FA7C", x"FB5C", x"FC29", x"FCE3",
        x"FD89", x"FE1D", x"FE9C", x"FF09", x"FF61", x"FFA6", x"FFD8", x"FFF5",
        x"FFFF", x"FFF5", x"FFD8", x"FFA6", x"FF61", x"FF09", x"FE9C", x"FE1D",
        x"FD89", x"FCE3", x"FC29", x"FB5C", x"FA7C", x"F989", x"F884", x"F76B",
        x"F641", x"F504", x"F3B5", x"F254", x"F0E2", x"EF5E", x"EDC9", x"EC23",
        x"EA6D", x"E8A6", x"E6CF", x"E4E8", x"E2F1", x"E0EB", x"DED7", x"DCB3",
        x"DA82", x"D842", x"D5F5", x"D39B", x"D133", x"CEBF", x"CC3F", x"C9B4",
        x"C71C", x"C47A", x"C1CE", x"BF17", x"BC56", x"B98C", x"B6BA", x"B3DF",
        x"B0FB", x"AE11", x"AB1F", x"A826", x"A528", x"A223", x"9F1A", x"9C0B",
        x"98F9", x"95E2", x"92C8", x"8FAB", x"8C8C", x"896A", x"8648", x"8324",
        x"8000", x"7CDC", x"79B8", x"7696", x"7374", x"7055", x"6D38", x"6A1E",
        x"6707", x"63F5", x"60E6", x"5DDD", x"5AD8", x"57DA", x"54E1", x"51EF",
        x"4F05", x"4C21", x"4946", x"4674", x"43AA", x"40E9", x"3E32", x"3B86",
        x"38E4", x"364C", x"33C1", x"3141", x"2ECD", x"2C65", x"2A0B", x"27BE",
        x"257E", x"234D", x"2129", x"1F15", x"1D0F", x"1B18", x"1931", x"175A",
        x"1593", x"13DD", x"1237", x"10A2", x"0F1E", x"0DAC", x"0C4B", x"0AFC",
        x"09BF", x"0895", x"077C", x"0677", x"0584", x"04A4", x"03D7", x"031D",
        x"0277", x"01E3", x"0164", x"00F7", x"009F", x"005A", x"0028", x"000B",
        x"0001", x"000B", x"0028", x"005A", x"009F", x"00F7", x"0164", x"01E3",
        x"0277", x"031D", x"03D7", x"04A4", x"0584", x"0677", x"077C", x"0895",
        x"09BF", x"0AFC", x"0C4B", x"0DAC", x"0F1E", x"10A2", x"1237", x"13DD",
        x"1593", x"175A", x"1931", x"1B18", x"1D0F", x"1F15", x"2129", x"234D",
        x"257E", x"27BE", x"2A0B", x"2C65", x"2ECD", x"3141", x"33C1", x"364C",
        x"38E4", x"3B86", x"3E32", x"40E9", x"43AA", x"4674", x"4946", x"4C21",
        x"4F05", x"51EF", x"54E1", x"57DA", x"5AD8", x"5DDD", x"60E6", x"63F5",
        x"6707", x"6A1E", x"6D38", x"7055", x"7374", x"7696", x"79B8", x"7CDC"
    );

    -- 20-bit phase accumulator
    signal s_phase    : unsigned(19 downto 0) := (others => '0');

    -- Registered DAC word, updated when SPI requests the next sample
    signal s_dac_data : std_logic_vector(15 downto 0);

    signal s_cs_n      : std_logic;
    signal s_read_en   : std_logic_vector(0 downto 0);
    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

begin

    cs_n  <= s_cs_n;

    -- Capture the next LUT-derived sample after SPI raises read_en.
    -- The LUT values stay unsigned; scaling is done with integer math.
    process (clk)
    variable v_code   : integer;
    variable v_scaled : integer;
    begin
        if falling_edge(clk) then
            -- Kept your original reset polarity:
            -- rst_n = '1' resets, rst_n = '0' runs.
            if rst_n = '1' then
                s_dac_data  <= x"8000";
                s_heartbeat <= (others => '0');
                s_phase     <= (others => '0');
            else
                -- Phase must advance every 50 MHz clock for:
                -- f_out = phase_inc * 50 MHz / 2^20
                s_phase <= s_phase + C_PHASE_INC;

                -- Only update DAC word when SPI asks for a new sample
                if s_read_en(0) = '1' then
                    v_code   := to_integer(C_LUT(to_integer(s_phase(19 downto 12))));
                    v_scaled := ((v_code - 32768) * 60) / 64;

                    s_dac_data <= std_logic_vector(
                                      to_unsigned(v_scaled + 32768, 16)
                                  );

                    s_heartbeat <= s_heartbeat + 1;
                end if;
            end if;
        end if;
    end process;

    led(0) <= not s_heartbeat(24);
    led(1) <= s_cs_n;
    led(2) <= rst_n;
    led(3) <= '1';


    u_spi : entity work.spi_master_dac_ext
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 5
        )
        port map (
            clk           => clk,
            rst           => rst_n,
            data_in       => s_dac_data,
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            high_imp      => high_imp
        );

end architecture rtl;