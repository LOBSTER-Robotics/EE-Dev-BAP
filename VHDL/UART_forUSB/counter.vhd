library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity variable_clock_divider is
    generic (
        COUNTER_WIDTH : positive := 32
    );
    port (
        clk            : in  std_logic;
        reset          : in  std_logic;

        -- Number of input clock cycles before clk_div toggles
        terminal_count : in  unsigned(COUNTER_WIDTH-1 downto 0);

        clk_div        : out std_logic
    );
end entity;

architecture rtl of variable_clock_divider is
    signal counter   : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0');
    signal clk_div_r : std_logic := '0';
begin

    clk_div <= clk_div_r;

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter   <= (others => '0');
                clk_div_r <= '0';

            else
                if terminal_count = 0 then
                    counter   <= (others => '0');
                    clk_div_r <= '0';

                elsif counter = terminal_count - 1 then
                    counter   <= (others => '0');
                    clk_div_r <= not clk_div_r;

                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;

end architecture;