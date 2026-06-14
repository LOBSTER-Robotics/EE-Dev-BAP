-- DAC AC Test — final PCB (with summing-amplifier output stage)
-- Sine sweep 20 kHz → 1 MHz, amplitude ≈ 0.2 V peak at ADC input.
--
-- Output stage modification:
--   The op-amp now acts as a summing amplifier: DAC current + VREF bias.
--   Output range shifted from (0 V → −VREF) to (VREF/2 → 0 V).
--   This halves the effective gain, so amplitude scaling is doubled (×10 >> 6)
--   compared to the original design (×5 >> 6) to recover ±0.195 V at ADC.
--
-- Frequency:
--   f_out = phase_inc × 50 MHz / 65 536
--   phase_inc = 26   → ≈ 20 kHz
--   phase_inc = 1311 → ≈  1 MHz
--   Sweep: phase_inc increments by 1 every C_STEP_CYCLES clocks (1 ms default).
--   Total sweep ≈ 1.3 s then restarts.
--
-- Amplitude:
--   LUT centred, scaled by ×10 >> 6 (÷ 6.4):
--   ±32 767 × 3 / 64 = ±1 536 codes.
--   At ADC input (halved by summing stage):
--   ±5 120 / 65 536 × 5 V / 2 ≈ ±0.195 V peak.
--
-- Sine centred at DAC midscale (0x8000 → VREF/4 after summing stage).
--
-- LEDs (active low):
--   LED0: heartbeat ~1.5 Hz
--   LED1: SPI active
--   LED2: running
--   LED3: at maximum frequency (1 MHz)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_dac_ac_test is
    port (
        clk      : in    std_logic;          -- 50 MHz external oscillator
        rst_n    : in    std_logic;
        sdi      : out   std_logic_vector(0 downto 0);
        cs_n     : out   std_logic;
        high_imp : inout std_logic;
        led      : out   std_logic_vector(3 downto 0)
    );
end entity top_dac_ac_test;

architecture rtl of top_dac_ac_test is

    -- Sweep parameters
    constant C_PHASE_MIN   : positive := 26;       -- ≈ 20 kHz
    constant C_PHASE_MAX   : positive := 1311;     -- ≈  1 MHz
    constant C_STEP_CYCLES : positive := 50_000;   -- 1 ms per step at 50 MHz

    -- 256-entry sine LUT: 0x0000 = 0°, 0x8000 = midscale, 0xFFFF = peak
    type lut_t is array (0 to 255) of unsigned(15 downto 0);
    constant C_LUT : lut_t := (
        x"8000", x"8324", x"8647", x"896A", x"8C8B", x"8FAB", x"92C7", x"95E0",
        x"98F8", x"9C0B", x"9F19", x"A223", x"A527", x"A826", x"AB1F", x"AE10",
        x"B0FB", x"B3DE", x"B6B9", x"B98C", x"BC56", x"BF17", x"C1CD", x"C47A",
        x"C71C", x"C9B3", x"CC3F", x"CEBF", x"D133", x"D39A", x"D5F4", x"D842",
        x"DA82", x"DCB4", x"DED7", x"E0E6", x"E2E5", x"E4D5", x"E6B4", x"E882",
        x"EA3F", x"EBE9", x"ED82", x"EF07", x"F078", x"F1D5", x"F31E", x"F452",
        x"F571", x"F67B", x"F76F", x"F84D", x"F916", x"F9C9", x"FA67", x"FAEE",
        x"FB5F", x"FBBA", x"FBFD", x"FC2A", x"FC40", x"FC3E", x"FC25", x"FBEE",
        x"FBA0", x"FB3A", x"FABE", x"FA2A", x"F97F", x"F8BB", x"F7E1", x"F6EF",
        x"F5E6", x"F4C6", x"F38F", x"F241", x"F0DD", x"EF62", x"EDD0", x"EC27",
        x"EA69", x"E894", x"E6AA", x"E4A9", x"E293", x"E067", x"DE27", x"DBD2",
        x"D968", x"D6EA", x"D458", x"D1B2", x"CEF8", x"CC2B", x"C94A", x"C657",
        x"C351", x"C038", x"BD0F", x"B9D4", x"B689", x"B32C", x"AFC1", x"AC45",
        x"A8BC", x"A524", x"A17F", x"9DCE", x"9A12", x"964B", x"927A", x"8E9E",
        x"8AB9", x"86CB", x"82D5", x"7ED5", x"7ACF", x"76C3", x"72B1", x"6E9B",
        x"6A80", x"6661", x"623F", x"5E1A", x"59F3", x"55CB", x"51A2", x"4D79",
        x"4950", x"4528", x"4101", x"3CDD", x"38BB", x"349E", x"3084", x"2C70",
        x"2860", x"2456", x"2052", x"1C56", x"1860", x"1474", x"1090", x"0CB6",
        x"08E5", x"051F", x"0163", x"FDB2", x"FA0C", x"F672", x"F2E4", x"EF61",
        x"EBEB", x"E882", x"E526", x"E1D7", x"DE96", x"DB63", x"D83E", x"D527",
        x"D21F", x"CF26", x"CC3C", x"C960", x"C695", x"C3D8", x"C12D", x"BE90",
        x"BC04", x"B98A", x"B721", x"B4CA", x"B285", x"B052", x"AE32", x"AC25",
        x"AA2A", x"A842", x"A66D", x"A4AB", x"A2FC", x"A161", x"9FD9", x"9E65",
        x"9D04", x"9BB7", x"9A7D", x"9957", x"9845", x"9746", x"965B", x"9583",
        x"94BE", x"940E", x"9371", x"92E7", x"9271", x"920F", x"91C1", x"9186",
        x"915E", x"914A", x"9149", x"915C", x"9181", x"91BA", x"9205", x"9264",
        x"92D5", x"935A", x"93F1", x"949A", x"9556", x"9624", x"9704", x"97F6",
        x"98F9", x"9A0D", x"9B32", x"9C67", x"9DAD", x"9F03", x"A068", x"A1DC",
        x"A360", x"A4F2", x"A692", x"A840", x"A9FB", x"ABC2", x"AD96", x"AF75",
        x"B160", x"B355", x"B554", x"B75C", x"B96D", x"BB85", x"BDA5", x"BFCA",
        x"C1F5", x"C425", x"C659", x"C891", x"CACC", x"CD09", x"CF48", x"D188",
        x"D3C9", x"D60A", x"D84A", x"DA89", x"DCC6", x"DF00", x"E136", x"E368"
    );

    -- Phase accumulator and sweep
    signal s_phase     : unsigned(15 downto 0) := (others => '0');
    signal s_phase_inc : unsigned(15 downto 0) := to_unsigned(C_PHASE_MIN, 16);
    signal s_step_cnt  : natural range 0 to C_STEP_CYCLES - 1 := 0;

    -- LUT output and amplitude scaling
    signal s_lut_val  : unsigned(15 downto 0);
    signal s_lut_cent : signed(16 downto 0);   -- centred: −32 768 to +32 767
    signal s_scaled   : signed(23 downto 0);   -- × 10 intermediate
    signal s_dac_data : std_logic_vector(15 downto 0);

    signal s_rst       : std_logic;
    signal s_cs_n      : std_logic;
    signal s_read_en   : std_logic_vector(0 downto 0);
    signal s_heartbeat : unsigned(24 downto 0) := (others => '0');

begin

    s_rst <= not rst_n;
    cs_n  <= s_cs_n;

    -- Heartbeat
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

    led(0) <= not s_heartbeat(24);
    led(1) <= s_cs_n;
    led(2) <= s_rst;
    led(3) <= '1' when s_phase_inc = C_PHASE_MAX else '0';

    -- Phase accumulator + frequency sweep
    process (clk)
    begin
        if rising_edge(clk) then
            if s_rst = '1' then
                s_phase     <= (others => '0');
                s_phase_inc <= to_unsigned(C_PHASE_MIN, 16);
                s_step_cnt  <= 0;
            else
                s_phase <= s_phase + s_phase_inc;

                if s_step_cnt = C_STEP_CYCLES - 1 then
                    s_step_cnt <= 0;
                    if s_phase_inc = C_PHASE_MAX then
                        s_phase_inc <= to_unsigned(C_PHASE_MIN, 16);
                    else
                        s_phase_inc <= s_phase_inc + 1;
                    end if;
                else
                    s_step_cnt <= s_step_cnt + 1;
                end if;
            end if;
        end if;
    end process;

    -- LUT lookup on top 8 bits of phase
    s_lut_val <= C_LUT(to_integer(s_phase(15 downto 8)));

    -- Amplitude scaling:
    -- Centre LUT output, multiply by 10, shift right 6 (÷ 64).
    -- ±32 767 × 10 / 64 = ±5 120 codes.
    -- After summing-amplifier halving: ±5 120 / 65 536 × 5 V / 2 ≈ ±0.195 V.
    s_lut_cent <= signed('0' & s_lut_val) - to_signed(32768, 17);
    s_scaled   <= resize(s_lut_cent, 24) * to_signed(3, 4);
    s_dac_data <= std_logic_vector(
                      to_unsigned(
                          to_integer(s_scaled(23 downto 6)) + 32768, 16));

    -- SPI master
    u_spi : entity work.spi_master_dac_ext
        generic map (
            Num_Channels    => 1,
            DONE_WAIT_CYCLS => 6
        )
        port map (
            clk           => clk,
            rst           => s_rst,
            data_in       => s_dac_data,
            fifo_empty(0) => '0',
            read_en       => s_read_en,
            sdi           => sdi,
            cs_n          => s_cs_n,
            high_imp      => high_imp
        );

end architecture rtl;