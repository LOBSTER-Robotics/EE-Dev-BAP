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
    constant C_PHASE_INC : unsigned(19 downto 0) := to_unsigned(21, 20);

    -- 16-bit source LUT and derived 15-bit active LUT
    type lut16_t is array (0 to 255) of unsigned(15 downto 0);

    constant C_LUT_16 : lut16_t := (
        X"0000", X"0405", X"0809", X"0C0C", X"100B", X"1406", X"17FC", X"1BEC",
        X"1FD5", X"23B6", X"278E", X"2B5B", X"2F1E", X"32D5", X"3680", X"3A1C",
        X"3DAA", X"4128", X"4495", X"47F2", X"4B3C", X"4E73", X"5196", X"54A5",
        X"579F", X"5A82", X"5D4E", X"6003", X"629F", X"6523", X"678D", X"69DD",
        X"6C12", X"6E2C", X"702A", X"720C", X"73D0", X"7578", X"7702", X"786E",
        X"79BB", X"7AEA", X"7BFA", X"7CEA", X"7DBB", X"7E6C", X"7EFD", X"7F6E",
        X"7FBE", X"7FEF", X"7FFF", X"7FEF", X"7FBE", X"7F6E", X"7EFD", X"7E6C",
        X"7DBB", X"7CEA", X"7BFA", X"7AEA", X"79BB", X"786E", X"7702", X"7578",
        X"73D0", X"720C", X"702A", X"6E2C", X"6C12", X"69DD", X"678D", X"6523",
        X"629F", X"6003", X"5D4E", X"5A82", X"579F", X"54A5", X"5196", X"4E73",
        X"4B3C", X"47F2", X"4495", X"4128", X"3DAA", X"3A1C", X"3680", X"32D5",
        X"2F1E", X"2B5B", X"278E", X"23B6", X"1FD5", X"1BEC", X"17FC", X"1406",
        X"100B", X"0C0C", X"0809", X"0405", X"0000", X"FBFB", X"F7F7", X"F3F4",
        X"EFF5", X"EBFA", X"E804", X"E414", X"E02B", X"DC4A", X"D872", X"D4A5",
        X"D0E2", X"CD2B", X"C980", X"C5E4", X"C256", X"BED8", X"BB6B", X"B80E",
        X"B4C4", X"B18D", X"AE6A", X"AB5B", X"A861", X"A57E", X"A2B2", X"9FFD",
        X"9D61", X"9ADD", X"9873", X"9623", X"93EE", X"91D4", X"8FD6", X"8DF4",
        X"8C30", X"8A88", X"88FE", X"8792", X"8645", X"8516", X"8406", X"8316",
        X"8245", X"8194", X"8103", X"8092", X"8042", X"8011", X"8001", X"8011",
        X"8042", X"8092", X"8103", X"8194", X"8245", X"8316", X"8406", X"8516",
        X"8645", X"8792", X"88FE", X"8A88", X"8C30", X"8DF4", X"8FD6", X"91D4",
        X"93EE", X"9623", X"9873", X"9ADD", X"9D61", X"9FFD", X"A2B2", X"A57E",
        X"A861", X"AB5B", X"AE6A", X"B18D", X"B4C4", X"B80E", X"BB6B", X"BED8",
        X"C256", X"C5E4", X"C980", X"CD2B", X"D0E2", X"D4A5", X"D872", X"DC4A",
        X"E02B", X"E414", X"E804", X"EBFA", X"EFF5", X"F3F4", X"F7F7", X"FBFB"
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
        variable v_lut_val   : unsigned(14 downto 0);
        variable v_lut_val16 : unsigned(15 downto 0);
        variable v_code      : integer;
        variable v_scaled    : integer;
    begin
        if falling_edge(clk) then
            if rst_n = '1' then
                s_dac_data <= (others => '0');
                s_heartbeat <= (others => '0');
                s_phase     <= (others => '0');
            elsif s_read_en(0) = '1' then
                v_lut_val   := C_LUT_16(to_integer(s_phase(19 downto 12)));
                v_lut_val16 := resize(shift_left(v_lut_val, 1), 16);
                v_code      := to_integer(v_lut_val16);
                v_scaled    := ((v_code - 32768) * 60) / 64;
                s_phase     <= s_phase + C_PHASE_INC;
                s_heartbeat <= s_heartbeat + 1;

                s_dac_data <= std_logic_vector(
                                  to_unsigned(
                                      v_scaled + 32768,
                                      16
                                  )
                              );
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