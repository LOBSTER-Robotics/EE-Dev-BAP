library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAC_AXItoRGMII_tb is
end entity;

architecture sim of MAC_AXItoRGMII_tb is

    --------------------------------------------------------------------
    -- Clock / Reset
    --------------------------------------------------------------------
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';

    --------------------------------------------------------------------
    -- AXI-Stream Input
    --------------------------------------------------------------------
    signal s_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal s_valid : std_logic := '0';
    signal s_last  : std_logic := '0';
    signal s_ready : std_logic;

    --------------------------------------------------------------------
    -- GMII Output
    --------------------------------------------------------------------
    signal gmii_txd   : std_logic_vector(7 downto 0);
    signal gmii_tx_en : std_logic;
    signal gmii_tx_er : std_logic;

    --------------------------------------------------------------------
    -- Payload memory
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
    dut : entity work.eth_mac_tx
    port map (
        clk        => clk,
        reset      => reset,

        s_data     => s_data,
        s_valid    => s_valid,
        s_last     => s_last,
        s_ready    => s_ready,

        gmii_txd   => gmii_txd,
        gmii_tx_en => gmii_tx_en,
        gmii_tx_er => gmii_tx_er
    );

    --------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------
    clk <= not clk after 4 ns;

    --------------------------------------------------------------------
    -- Reset generation
    --------------------------------------------------------------------
    process
    begin
        reset <= '1';
        wait for 40 ns;

        reset <= '0';

        wait;
    end process;

    --------------------------------------------------------------------
    -- Stimulus process
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then

            if reset = '1' then

                payload_idx <= 0;

                s_valid <= '0';
                s_last  <= '0';
                s_data  <= (others => '0');

            else

                --------------------------------------------------------
                -- Drive payload when MAC is ready
                --------------------------------------------------------
                if s_ready = '1' then

                    s_valid <= '1';

                    s_data <= payload(payload_idx);

                    ----------------------------------------------------
                    -- Last byte
                    ----------------------------------------------------
                    if payload_idx = payload'high then
                        s_last <= '1';
                    else
                        s_last <= '0';
                    end if;

                    ----------------------------------------------------
                    -- Advance payload pointer
                    ----------------------------------------------------
                    if payload_idx < payload'high then
                        payload_idx <= payload_idx + 1;
                    end if;

                else

                    s_valid <= '0';
                    s_last  <= '0';

                end if;

            end if;

        end if;
    end process;

    --------------------------------------------------------------------
    -- GMII Monitor
    --------------------------------------------------------------------
    process(clk)

        variable tx_count : integer := 0;

    begin
        if rising_edge(clk) then

            if gmii_tx_en = '1' then

                report
                    "GMII TX[" &
                    integer'image(tx_count) &
                    "] = 0x" &
                    to_hstring(gmii_txd);

                tx_count := tx_count + 1;

            end if;

        end if;
    end process;

    --------------------------------------------------------------------
    -- Simulation end
    --------------------------------------------------------------------
    process
    begin

        wait for 2500 ns;

        assert false
            report "MAC TX TEST COMPLETE"
            severity failure;

    end process;

end architecture;