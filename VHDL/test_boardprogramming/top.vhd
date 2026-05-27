library ieee;
use ieee.std_logic_1164.all;

entity top is
    port (
        ------------------------------------------------------------------
        -- Ethernet PHY 125 MHz clock
        ------------------------------------------------------------------
        phy_clk125 : in std_logic;

        ------------------------------------------------------------------
        -- User switches
        ------------------------------------------------------------------
        sw  : in  std_logic_vector(7 downto 0);

        ------------------------------------------------------------------
        -- User LEDs (active low)
        ------------------------------------------------------------------
        led : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of top is

    signal blink_led : std_logic;

begin

    ----------------------------------------------------------------------
    -- 1 Hz blinker
    ----------------------------------------------------------------------
    u_blinker : entity work.led_blinker
        generic map (
            CLOCK_FREQ_HZ => 125000000,
            BLINK_HZ      => 1
        )
        port map (
            clk => phy_clk125,
            led => blink_led
        );

    ----------------------------------------------------------------------
    -- LED0 = blinking LED
    -- Active low output
    ----------------------------------------------------------------------
    led(0) <= not blink_led;

    ----------------------------------------------------------------------
    -- LED1..LED7 controlled by switches
    -- LEDs are active low
    ----------------------------------------------------------------------
    led(1) <= not sw(0);
    led(2) <= not sw(1);
    led(3) <= not sw(2);
    led(4) <= not sw(3);
    led(5) <= not sw(4);
    led(6) <= not sw(5);
    led(7) <= not (sw(6) and sw(7));

end architecture;