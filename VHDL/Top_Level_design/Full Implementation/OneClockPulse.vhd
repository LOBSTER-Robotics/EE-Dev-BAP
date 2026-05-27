library ieee;
use ieee.std_logic_1164.all;

entity OneClockPulse is
    port (
        clk       : in  std_logic;
        reset     : in  std_logic;
        enable    : in  std_logic;
        ext_in    : in  std_logic;
        pulse_out : out std_logic
    );
end entity;

architecture rtl of OneClockPulse is
    signal ext_sync_1 : std_logic := '0';
    signal ext_sync_2 : std_logic := '0';
    signal ext_prev   : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                ext_sync_1 <= '0';
                ext_sync_2 <= '0';
                ext_prev   <= '0';
                pulse_out  <= '0';
            else
                -- Synchronize external input
                ext_sync_1 <= ext_in;
                ext_sync_2 <= ext_sync_1;

                -- Default output
                pulse_out <= '0';

                -- Rising edge detect only when enabled
                if enable = '1' then
                    pulse_out <= ext_sync_2 and not ext_prev;
                end if;

                -- Always update previous state
                -- This prevents a false pulse when enable becomes high
                ext_prev <= ext_sync_2;
            end if;
        end if;
    end process;

end architecture;