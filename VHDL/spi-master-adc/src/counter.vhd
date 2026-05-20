library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        q     : out unsigned(3 downto 0)
    );
end entity;

architecture rtl of counter is
    signal cnt : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;

    q <= cnt;
end architecture;