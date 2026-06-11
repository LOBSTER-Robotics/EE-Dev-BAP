library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_blinker is
    generic (
        CLOCK_FREQ_HZ : integer := 125000000;
        BLINK_HZ      : integer := 1
    );
    port (
        clk : in  std_logic;
        led : out std_logic
    );
end entity;

architecture rtl of led_blinker is

    constant COUNT_MAX : integer :=
        CLOCK_FREQ_HZ / (2 * BLINK_HZ);

    signal counter : unsigned(31 downto 0) := (others => '0');
    signal led_reg : std_logic := '0';

begin

    process(clk)
    begin
        if rising_edge(clk) then

            if counter = COUNT_MAX - 1 then
                counter <= (others => '0');
                led_reg <= not led_reg;
            else
                counter <= counter + 1;
            end if;

        end if;
    end process;

    led <= led_reg;

end architecture;