------------------------------------------------------------------------
-- Ethernet CRC32 Generator (Byte Wide)
-- IEEE 802.3
-- Polynomial: 0xEDB88320 (reflected)
-- 8 bits per clock
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crc32_8bit is
port (
    clk      : in  std_logic;
    reset    : in  std_logic;

    crc_en   : in  std_logic;

    data_in  : in  std_logic_vector(7 downto 0);

    crc_out  : out std_logic_vector(31 downto 0)
);
end entity;

architecture rtl of crc32_8bit is

signal crc_reg  : std_logic_vector(31 downto 0)
    := (others => '1');

signal crc_next : std_logic_vector(31 downto 0);

begin

------------------------------------------------------------------------
-- Final Ethernet CRC inversion
------------------------------------------------------------------------
crc_out <= not crc_reg;

------------------------------------------------------------------------
-- Parallel CRC Logic
------------------------------------------------------------------------

crc_next(0)  <= crc_reg(24) xor crc_reg(30) xor data_in(0) xor data_in(6);
crc_next(1)  <= crc_reg(24) xor crc_reg(25) xor crc_reg(30) xor crc_reg(31) xor data_in(0) xor data_in(1) xor data_in(6) xor data_in(7);
crc_next(2)  <= crc_reg(24) xor crc_reg(25) xor crc_reg(26) xor crc_reg(30) xor crc_reg(31) xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(6) xor data_in(7);
crc_next(3)  <= crc_reg(25) xor crc_reg(26) xor crc_reg(27) xor crc_reg(31) xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(7);
crc_next(4)  <= crc_reg(24) xor crc_reg(26) xor crc_reg(27) xor crc_reg(28) xor crc_reg(30) xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(6);
crc_next(5)  <= crc_reg(24) xor crc_reg(25) xor crc_reg(27) xor crc_reg(28) xor crc_reg(29) xor crc_reg(30) xor crc_reg(31)
                xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(7);

crc_next(6)  <= crc_reg(25) xor crc_reg(26) xor crc_reg(28) xor crc_reg(29) xor crc_reg(30) xor crc_reg(31)
                xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(7);

crc_next(7)  <= crc_reg(24) xor crc_reg(26) xor crc_reg(27) xor crc_reg(29) xor crc_reg(31)
                xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(7);

crc_next(8)  <= crc_reg(0) xor crc_reg(24) xor crc_reg(25) xor crc_reg(27) xor crc_reg(28)
                xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4);

crc_next(9)  <= crc_reg(1) xor crc_reg(25) xor crc_reg(26) xor crc_reg(28) xor crc_reg(29)
                xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5);

crc_next(10) <= crc_reg(2) xor crc_reg(24) xor crc_reg(26) xor crc_reg(27) xor crc_reg(29)
                xor data_in(0) xor data_in(2) xor data_in(3) xor data_in(5);

crc_next(11) <= crc_reg(3) xor crc_reg(24) xor crc_reg(25) xor crc_reg(27) xor crc_reg(28)
                xor data_in(0) xor data_in(1) xor data_in(3) xor data_in(4);

crc_next(12) <= crc_reg(4) xor crc_reg(24) xor crc_reg(25) xor crc_reg(26) xor crc_reg(28) xor crc_reg(29) xor crc_reg(30)
                xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(4) xor data_in(5) xor data_in(6);

crc_next(13) <= crc_reg(5) xor crc_reg(25) xor crc_reg(26) xor crc_reg(27) xor crc_reg(29) xor crc_reg(30) xor crc_reg(31)
                xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(6) xor data_in(7);

crc_next(14) <= crc_reg(6) xor crc_reg(26) xor crc_reg(27) xor crc_reg(28) xor crc_reg(30) xor crc_reg(31)
                xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(6) xor data_in(7);

crc_next(15) <= crc_reg(7) xor crc_reg(27) xor crc_reg(28) xor crc_reg(29) xor crc_reg(31)
                xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(7);

crc_next(16) <= crc_reg(8) xor crc_reg(24) xor crc_reg(28) xor crc_reg(29)
                xor data_in(0) xor data_in(4) xor data_in(5);

crc_next(17) <= crc_reg(9) xor crc_reg(25) xor crc_reg(29) xor crc_reg(30)
                xor data_in(1) xor data_in(5) xor data_in(6);

crc_next(18) <= crc_reg(10) xor crc_reg(26) xor crc_reg(30) xor crc_reg(31)
                xor data_in(2) xor data_in(6) xor data_in(7);

crc_next(19) <= crc_reg(11) xor crc_reg(27) xor crc_reg(31)
                xor data_in(3) xor data_in(7);

crc_next(20) <= crc_reg(12) xor crc_reg(28) xor data_in(4);

crc_next(21) <= crc_reg(13) xor crc_reg(29) xor data_in(5);

crc_next(22) <= crc_reg(14) xor crc_reg(24) xor data_in(0);

crc_next(23) <= crc_reg(15) xor crc_reg(24) xor crc_reg(25)
                xor data_in(0) xor data_in(1);

crc_next(24) <= crc_reg(16) xor crc_reg(25) xor crc_reg(26)
                xor data_in(1) xor data_in(2);

crc_next(25) <= crc_reg(17) xor crc_reg(26) xor crc_reg(27)
                xor data_in(2) xor data_in(3);

crc_next(26) <= crc_reg(18) xor crc_reg(24) xor crc_reg(27) xor crc_reg(28)
                xor data_in(0) xor data_in(3) xor data_in(4);

crc_next(27) <= crc_reg(19) xor crc_reg(25) xor crc_reg(28) xor crc_reg(29)
                xor data_in(1) xor data_in(4) xor data_in(5);

crc_next(28) <= crc_reg(20) xor crc_reg(26) xor crc_reg(29) xor crc_reg(30)
                xor data_in(2) xor data_in(5) xor data_in(6);

crc_next(29) <= crc_reg(21) xor crc_reg(27) xor crc_reg(30) xor crc_reg(31)
                xor data_in(3) xor data_in(6) xor data_in(7);

crc_next(30) <= crc_reg(22) xor crc_reg(28) xor crc_reg(31)
                xor data_in(4) xor data_in(7);

crc_next(31) <= crc_reg(23) xor crc_reg(29) xor data_in(5);

------------------------------------------------------------------------
-- CRC Register
------------------------------------------------------------------------

process(clk)
begin
    if rising_edge(clk) then

        if reset = '1' then
            crc_reg <= (others => '1');

        elsif crc_en = '1' then
            crc_reg <= crc_next;

        end if;

    end if;
end process;

end architecture;