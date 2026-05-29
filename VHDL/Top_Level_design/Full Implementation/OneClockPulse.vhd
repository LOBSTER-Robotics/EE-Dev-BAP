library ieee;
use ieee.std_logic_1164.all;

entity OneClockPulse is
    generic (
        -- Number of clk cycles ext_in must remain stable before it is accepted.
        -- Example: 100 MHz clk, 10 ms debounce = 1_000_000 cycles.
        DEBOUNCE_CYCLES : positive := 5_000_000
    );
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

    signal debounced      : std_logic := '0';
    signal debounced_prev : std_logic := '0';

    signal debounce_count : natural range 0 to DEBOUNCE_CYCLES := 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                ext_sync_1      <= '0';
                ext_sync_2      <= '0';
                debounced       <= '0';
                debounced_prev  <= '0';
                debounce_count  <= 0;
                pulse_out       <= '0';

            else
                -- Synchronize external/asynchronous input
                ext_sync_1 <= ext_in;
                ext_sync_2 <= ext_sync_1;

                -- Default output
                pulse_out <= '0';

                -- Debounce logic
                if ext_sync_2 = debounced then
                    -- Input matches current debounced state,
                    -- so no change is pending.
                    debounce_count <= 0;

                else
                    -- Input differs from debounced state.
                    -- Require it to remain different for DEBOUNCE_CYCLES.
                    if debounce_count = DEBOUNCE_CYCLES - 1 then
                        debounced      <= ext_sync_2;
                        debounce_count <= 0;
                    else
                        debounce_count <= debounce_count + 1;
                    end if;
                end if;

                -- Rising-edge detect on debounced signal only
                if enable = '1' then
                    pulse_out <= debounced and not debounced_prev;
                end if;

                -- Always update previous debounced state.
                -- This prevents a false pulse when enable becomes high.
                debounced_prev <= debounced;

            end if;
        end if;
    end process;

end architecture;