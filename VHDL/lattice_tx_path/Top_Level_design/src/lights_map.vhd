library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lights_map is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        lights : in  unsigned(7 downto 0);
        light_0 : out std_logic;
        light_1 : out std_logic;
        light_2 : out std_logic;
        light_3 : out std_logic;
        light_4 : out std_logic;
        light_5 : out std_logic;
        light_6 : out std_logic;
        light_7 : out std_logic
    );
end entity;

architecture Behavioral of lights_map is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            light_0 <= '0';
            light_1 <= '0';
            light_2 <= '0';
            light_3 <= '0';
            light_4 <= '0';
            light_5 <= '0';
            light_6 <= '0';
            light_7 <= '0';
        elsif rising_edge(clk) then
            light_0 <= lights(0);
            light_1 <= lights(1);
            light_2 <= lights(2);
            light_3 <= lights(3);
            light_4 <= lights(4);
            light_5 <= lights(5);
            light_6 <= lights(6);
            light_7 <= lights(7);
        end if;
    end process;
end architecture;




