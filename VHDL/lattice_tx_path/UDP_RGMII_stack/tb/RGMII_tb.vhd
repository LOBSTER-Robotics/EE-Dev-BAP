library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rgmii_tb is
end entity;

architecture sim of rgmii_tb is

    -- DUT signals
    signal clk125 : std_logic := '0';
    signal reset  : std_logic := '1';
    signal rx_clk : std_logic := '0';

    -- TX signals
    signal txd_in   : std_logic_vector(7 downto 0) := (others => '0');
    signal tx_en    : std_logic := '0';
    signal tx_er    : std_logic := '0';
    signal rgmii_txd   : std_logic_vector(3 downto 0);
    signal rgmii_txctl : std_logic;
    signal rgmii_txc   : std_logic;

    -- RX signals (loopback)
    signal rgmii_rxd   : std_logic_vector(3 downto 0);
    signal rgmii_rxctl : std_logic;
    signal rx_dout  : std_logic_vector(7 downto 0);
    signal rx_dv    : std_logic;
    signal rx_er    : std_logic;

    -- clock period (125 MHz = 8 ns)
    constant clk_period : time := 8 ns;

begin

    ------------------------------------------------------------
    -- Clock generation
    ------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk125 <= '0';
            wait for clk_period/2;
            clk125 <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- 2 ns delayed RX clock
    rx_clk <= transport clk125 after 2 ns;

    ------------------------------------------------------------
    -- Instantiate TX DUT
    ------------------------------------------------------------
    tx_inst : entity work.rgmii_tx
    port map (
        clk125       => clk125,
        reset        => reset,
        txd_in       => txd_in,
        tx_en        => tx_en,
        tx_er        => tx_er,
        rgmii_txd    => rgmii_txd,
        rgmii_txctl  => rgmii_txctl,
        rgmii_txc    => rgmii_txc
    );

    ------------------------------------------------------------
    -- Loopback model (TX → RX wiring simulation)
    ------------------------------------------------------------
    rgmii_rxd   <= transport rgmii_txd after 500 ps;
    rgmii_rxctl <= transport rgmii_txctl after 500 ps;

    ------------------------------------------------------------
    -- Instantiate RX DUT
    ------------------------------------------------------------
    rx_inst : entity work.rgmii_rx
    port map (
        rx_clk       => rx_clk,
        reset        => reset,
        rgmii_rxd    => rgmii_rxd,
        rgmii_rxctl  => rgmii_rxctl,
        rx_dout      => rx_dout,
        rx_dv        => rx_dv,
        rx_er        => rx_er
    );

    ------------------------------------------------------------
    -- Stimulus process
    ------------------------------------------------------------
    stim_proc : process
    begin
        -- reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        --------------------------------------------------------
        -- Send a few Ethernet-like bytes
        --------------------------------------------------------
        tx_en <= '1';

        txd_in <= x"AB";
        wait for clk_period;

        txd_in <= x"56";
        wait for clk_period;

        txd_in <= x"EF";
        wait for clk_period;

        txd_in <= x"98";
        wait for clk_period;

        tx_en <= '0';

        wait for 100 ns;

        --------------------------------------------------------
        -- End simulation
        --------------------------------------------------------
        assert false report "Simulation finished" severity failure;

    end process;

end architecture;