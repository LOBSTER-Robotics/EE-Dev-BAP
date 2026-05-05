library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end;

architecture sim of counter_tb is
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal q     : unsigned(3 downto 0);

begin
    uut: entity work.counter
        port map (
            clk => clk,
            reset => reset,
            q => q
        );

    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;

end architecture;