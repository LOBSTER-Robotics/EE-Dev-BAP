-- Sine wave generator using a phase accumulator and a 256-entry LUT.
--
-- The LUT is precomputed by scripts/gen_sine_lut.py — run it once after
-- any change to LUT parameters (bit width, number of entries, amplitude).
--
-- Encoding:
--   value(i) = round(32767.5 * (1 + sin(2π * i / 256)))
--   → unsigned 16-bit, midpoint at 0x8000 (32768), no DC offset
--
-- Phase accumulator:
--   16-bit, advances by G_PHASE_INC every clock cycle when i_en = '1'.
--   Top 8 bits select the LUT entry (0–255).
--
-- Output frequency:
--   f_out = G_PHASE_INC * f_clk / 2^16
--   Default: 262 * 50 MHz / 65536 ≈ 200 kHz
--
-- o_valid mirrors i_en (sample is valid every enabled clock cycle).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sine_wave_gen is
    generic (
        G_PHASE_INC : positive := 262   -- 262 × 50 MHz / 65536 ≈ 200 kHz
    );
    port (
        i_clk   : in  std_logic;
        i_rst   : in  std_logic;
        i_en    : in  std_logic;
        o_data  : out std_logic_vector(15 downto 0);
        o_valid : out std_logic
    );
end entity sine_wave_gen;

architecture rtl of sine_wave_gen is

    type t_lut is array (0 to 255) of std_logic_vector(15 downto 0);

    constant C_LUT : t_lut := (
        -- <<LUT_START>>
        -- i = 0
        x"8000", x"8324", x"8647", x"896A", x"8C8B", x"8FAB", x"92C7", x"95E1",
        -- i = 8
        x"98F8", x"9C0B", x"9F19", x"A223", x"A527", x"A826", x"AB1F", x"AE10",
        -- i = 16
        x"B0FB", x"B3DE", x"B6B9", x"B98C", x"BC56", x"BF17", x"C1CD", x"C47A",
        -- i = 24
        x"C71C", x"C9B3", x"CC3F", x"CEBF", x"D133", x"D39A", x"D5F5", x"D842",
        -- i = 32
        x"DA82", x"DCB3", x"DED7", x"E0EB", x"E2F1", x"E4E8", x"E6CF", x"E8A6",
        -- i = 40
        x"EA6D", x"EC23", x"EDC9", x"EF5E", x"F0E2", x"F254", x"F3B5", x"F504",
        -- i = 48
        x"F641", x"F76B", x"F884", x"F989", x"FA7C", x"FB5C", x"FC29", x"FCE3",
        -- i = 56
        x"FD89", x"FE1D", x"FE9C", x"FF09", x"FF61", x"FFA6", x"FFD8", x"FFF5",
        -- i = 64
        x"FFFF", x"FFF5", x"FFD8", x"FFA6", x"FF61", x"FF09", x"FE9C", x"FE1D",
        -- i = 72
        x"FD89", x"FCE3", x"FC29", x"FB5C", x"FA7C", x"F989", x"F884", x"F76B",
        -- i = 80
        x"F641", x"F504", x"F3B5", x"F254", x"F0E2", x"EF5E", x"EDC9", x"EC23",
        -- i = 88
        x"EA6D", x"E8A6", x"E6CF", x"E4E8", x"E2F1", x"E0EB", x"DED7", x"DCB3",
        -- i = 96
        x"DA82", x"D842", x"D5F5", x"D39A", x"D133", x"CEBF", x"CC3F", x"C9B3",
        -- i = 104
        x"C71C", x"C47A", x"C1CD", x"BF17", x"BC56", x"B98C", x"B6B9", x"B3DE",
        -- i = 112
        x"B0FB", x"AE10", x"AB1F", x"A826", x"A527", x"A223", x"9F19", x"9C0B",
        -- i = 120
        x"98F8", x"95E1", x"92C7", x"8FAB", x"8C8B", x"896A", x"8647", x"8324",
        -- i = 128
        x"8000", x"7CDB", x"79B8", x"7695", x"7374", x"7054", x"6D38", x"6A1E",
        -- i = 136
        x"6707", x"63F4", x"60E6", x"5DDC", x"5AD8", x"57D9", x"54E0", x"51EF",
        -- i = 144
        x"4F04", x"4C21", x"4946", x"4673", x"43A9", x"40E8", x"3E32", x"3B85",
        -- i = 152
        x"38E3", x"364C", x"33C0", x"3140", x"2ECC", x"2C65", x"2A0A", x"27BD",
        -- i = 160
        x"257D", x"234C", x"2128", x"1F14", x"1D0E", x"1B17", x"1930", x"1759",
        -- i = 168
        x"1592", x"13DC", x"1236", x"10A1", x"0F1D", x"0DAB", x"0C4A", x"0AFB",
        -- i = 176
        x"09BE", x"0894", x"077B", x"0676", x"0583", x"04A3", x"03D6", x"031C",
        -- i = 184
        x"0276", x"01E2", x"0163", x"00F6", x"009E", x"0059", x"0027", x"000A",
        -- i = 192
        x"0000", x"000A", x"0027", x"0059", x"009E", x"00F6", x"0163", x"01E2",
        -- i = 200
        x"0276", x"031C", x"03D6", x"04A3", x"0583", x"0676", x"077B", x"0894",
        -- i = 208
        x"09BE", x"0AFB", x"0C4A", x"0DAB", x"0F1D", x"10A1", x"1236", x"13DC",
        -- i = 216
        x"1592", x"1759", x"1930", x"1B17", x"1D0E", x"1F14", x"2128", x"234C",
        -- i = 224
        x"257D", x"27BD", x"2A0A", x"2C65", x"2ECC", x"3140", x"33C0", x"364C",
        -- i = 232
        x"38E3", x"3B85", x"3E32", x"40E8", x"43A9", x"4673", x"4946", x"4C21",
        -- i = 240
        x"4F04", x"51EF", x"54E0", x"57D9", x"5AD8", x"5DDC", x"60E6", x"63F4",
        -- i = 248
        x"6707", x"6A1E", x"6D38", x"7054", x"7374", x"7695", x"79B8", x"7CDB"
        -- <<LUT_END>>
    );

    signal s_phase : unsigned(15 downto 0) := (others => '0');

begin

    o_data  <= C_LUT(to_integer(s_phase(15 downto 8)));
    o_valid <= i_en;

    p_acc : process (i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                s_phase <= (others => '0');
            elsif i_en = '1' then
                s_phase <= s_phase + to_unsigned(G_PHASE_INC, 16);
            end if;
        end if;
    end process;

end architecture rtl;
