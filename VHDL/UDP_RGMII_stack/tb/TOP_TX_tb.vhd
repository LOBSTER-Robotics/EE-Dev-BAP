library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tx_tb is
end entity;

architecture sim of top_tx_tb is

    --------------------------------------------------------------------
    -- Clock / Reset
    --------------------------------------------------------------------
    signal clk125 : std_logic := '0';
    signal reset  : std_logic := '1';

    --------------------------------------------------------------------
    -- FIFO Interface
    --------------------------------------------------------------------
    signal fifo_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal fifo_empty : std_logic := '1';
    signal fifo_last  : std_logic := '0';
    signal fifo_rd_en : std_logic;

    --------------------------------------------------------------------
    -- RGMII Outputs
    --------------------------------------------------------------------
    signal rgmii_txd   : std_logic_vector(3 downto 0);
    signal rgmii_txctl : std_logic;
    signal rgmii_txc   : std_logic;

    --------------------------------------------------------------------
    -- Payload Memory
    --------------------------------------------------------------------
    type payload_t is array (0 to 15) of std_logic_vector(7 downto 0);

    constant payload : payload_t := (
        x"DE", x"AD", x"BE", x"EF",
        x"11", x"22", x"33", x"44",
        x"55", x"66", x"77", x"88",
        x"99", x"AA", x"BB", x"CC"
    );

    signal payload_idx : integer := 0;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.TOP_TX
    port map (

        clk125 => clk125,
        reset  => reset,

        ------------------------------------------------------------
        -- FIFO
        ------------------------------------------------------------
        fifo_data  => fifo_data,
        fifo_empty => fifo_empty,
        fifo_last  => fifo_last,
        fifo_rd_en => fifo_rd_en,

        ------------------------------------------------------------
        -- RGMII
        ------------------------------------------------------------
        rgmii_txd   => rgmii_txd,
        rgmii_txctl => rgmii_txctl,
        rgmii_txc   => rgmii_txc
    );

    --------------------------------------------------------------------
    -- Clock Generation (125 MHz)
    --------------------------------------------------------------------
    clk125 <= not clk125 after 4 ns;

    --------------------------------------------------------------------
    -- Reset
    --------------------------------------------------------------------
    process
    begin

        reset <= '1';

        wait for 40 ns;

        reset <= '0';

        wait;

    end process;

    --------------------------------------------------------------------
    -- FIFO Model
    --------------------------------------------------------------------
    process(clk125)
    begin
        if rising_edge(clk125) then

            if reset = '1' then

                payload_idx <= 0;

                fifo_empty <= '0';
                fifo_last  <= '0';

                fifo_data <= payload(0);

            else

                --------------------------------------------------------
                -- DUT requests next FIFO byte
                --------------------------------------------------------
                if fifo_rd_en = '1' then

                    fifo_data <= payload(payload_idx);

                    ----------------------------------------------------
                    -- LAST flag
                    ----------------------------------------------------
                    if payload_idx = payload'high then
                        fifo_last <= '1';
                    else
                        fifo_last <= '0';
                    end if;

                    ----------------------------------------------------
                    -- Advance pointer
                    ----------------------------------------------------
                    if payload_idx < payload'high then

                        payload_idx <= payload_idx + 1;

                    else

                        fifo_empty <= '1';

                    end if;

                end if;

            end if;

        end if;
    end process;

    --------------------------------------------------------------------
    -- RGMII Monitor
    --------------------------------------------------------------------
    process(clk125)

        variable nibble_count : integer := 0;

    begin
        if rising_edge(clk125) then

            if rgmii_txctl = '1' then

                report
                    "RGMII TX RISE[" &
                    integer'image(nibble_count) &
                    "] = 0x" &
                    to_hstring(rgmii_txd);

                nibble_count := nibble_count + 1;

            end if;

        end if;

        if falling_edge(clk125) then

            if rgmii_txctl = '1' then

                report
                    "RGMII TX FALL[" &
                    integer'image(nibble_count) &
                    "] = 0x" &
                    to_hstring(rgmii_txd);

                nibble_count := nibble_count + 1;

            end if;

        end if;
    end process;

    --------------------------------------------------------------------
    -- End Simulation
    --------------------------------------------------------------------
    process
    begin

        wait for 6000 ns;

        assert false
            report "TOP LEVEL TEST COMPLETE"
            severity failure;

    end process;

end architecture;