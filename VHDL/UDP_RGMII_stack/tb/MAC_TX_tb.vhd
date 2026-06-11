library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_tx_tb is
end entity;

architecture sim of mac_tx_tb is

    --------------------------------------------------------------------
    -- Clock / Reset
    --------------------------------------------------------------------
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';

    constant clk_period : time := 8 ns;

    --------------------------------------------------------------------
    -- MAC Stream Input
    --------------------------------------------------------------------
    signal s_data   : std_logic_vector(7 downto 0);
    signal s_valid  : std_logic := '0';
    signal s_last   : std_logic := '0';
    signal s_ready  : std_logic;

    --------------------------------------------------------------------
    -- MAC Output
    --------------------------------------------------------------------
    signal tx_data  : std_logic_vector(7 downto 0);
    signal tx_valid : std_logic;

begin

    --------------------------------------------------------------------
    -- Clock Generation
    --------------------------------------------------------------------
    clk_process : process
    begin
        while true loop

            clk <= '0';
            wait for clk_period/2;

            clk <= '1';
            wait for clk_period/2;

        end loop;
    end process;

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.eth_mac_tx
    port map (
        clk      => clk,
        reset    => reset,

        s_data   => s_data,
        s_valid  => s_valid,
        s_last   => s_last,
        s_ready  => s_ready,

        tx_data  => tx_data,
        tx_valid => tx_valid
    );

    --------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------
    stim_proc : process

        type payload_t is array(0 to 15)
            of std_logic_vector(7 downto 0);

        constant payload : payload_t := (
            x"DE", x"AD", x"BE", x"EF",
            x"11", x"22", x"33", x"44",
            x"55", x"66", x"77", x"88",
            x"99", x"AA", x"BB", x"CC"
        );

    begin

        ------------------------------------------------------------
        -- Reset
        ------------------------------------------------------------
        reset <= '1';

        wait for 50 ns;

        reset <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);

        wait for clk_period;

        ------------------------------------------------------------
        -- Wait for MAC ready
        ------------------------------------------------------------
        wait until rising_edge(clk);

        ------------------------------------------------------------
        -- Send payload
        ------------------------------------------------------------
        report "STARTING STIMULUS";
        for i in payload'range loop

            ------------------------------------------------------------
            -- Wait until MAC is ready
            ------------------------------------------------------------
            wait until rising_edge(clk);

                if s_ready = '1' then
                    s_valid <= '1';
                    s_data  <= payload(i);
                    --report "STATE PROGRESS: sending byte";
                end if;

            ------------------------------------------------------------
            -- Send byte
            ------------------------------------------------------------
            --s_valid <= '1';
            --s_data  <= payload(i);

            if i = payload'high then
                s_last <= '1';
            else
                s_last <= '0';
            end if;

        end loop;

        ------------------------------------------------------------
        -- End stream
        ------------------------------------------------------------
        wait until rising_edge(clk);

        s_valid <= '0';
        s_last  <= '0';

        ------------------------------------------------------------
        -- Let MAC finish CRC + IFG
        ------------------------------------------------------------
        wait for 5 us;

        ------------------------------------------------------------
        -- Finish simulation
        ------------------------------------------------------------
        assert false
        report "MAC TEST COMPLETE"
        severity failure;

    end process;

    --------------------------------------------------------------------
    -- Output Monitor
    --------------------------------------------------------------------
    monitor_proc : process(clk)

        variable byte_count : integer := 0;

    begin
        if rising_edge(clk) then

            if tx_valid = '1' then

                report
                    "TX[" &
                    integer'image(byte_count) &
                    "] = 0x" &
                    to_hstring(tx_data);

                byte_count := byte_count + 1;

            end if;

        end if;
    end process;

end architecture;