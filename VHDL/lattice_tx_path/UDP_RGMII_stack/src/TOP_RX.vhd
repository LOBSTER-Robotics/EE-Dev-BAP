library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_RX is
port (
    --------------------------------------------------------------------
    -- CLOCK / RESET
    --------------------------------------------------------------------
    clk125         : in  std_logic;
    reset          : in  std_logic;

    --------------------------------------------------------------------
    -- RGMII PHY INPUT
    --------------------------------------------------------------------
    rgmii_rxd      : in  std_logic_vector(3 downto 0);
    rgmii_rxctl    : in  std_logic;
    rgmii_rxc      : in  std_logic;

    --------------------------------------------------------------------
    -- FIFO OUTPUT
    --------------------------------------------------------------------
    fifo_data      : out std_logic_vector(7 downto 0);
    fifo_wr_en     : out std_logic;
    fifo_last      : out std_logic;
    fifo_full      : in  std_logic
);
end entity;

architecture rtl of TOP_RX is

    --------------------------------------------------------------------
    -- GMII SIGNALS
    --------------------------------------------------------------------
    signal gmii_rxd    : std_logic_vector(7 downto 0);
    signal gmii_rx_dv  : std_logic;
    signal gmii_rx_er  : std_logic;

    --------------------------------------------------------------------
    -- AXI STREAM BETWEEN MAC + UDP
    --------------------------------------------------------------------
    signal mac_tdata   : std_logic_vector(7 downto 0);
    signal mac_tvalid  : std_logic;
    signal mac_tlast   : std_logic;
    signal mac_tready  : std_logic;

begin

    --------------------------------------------------------------------
    -- RGMII RX
    --------------------------------------------------------------------
    rgmii_rx_inst : entity work.rgmii_rx
    port map (
        rx_clk       => rgmii_rxc,
        reset        => reset,

        rgmii_rxd    => rgmii_rxd,
        rgmii_rxctl  => rgmii_rxctl,

        rx_dout      => gmii_rxd,
        rx_dv        => gmii_rx_dv,
        rx_er        => gmii_rx_er
    );

    --------------------------------------------------------------------
    -- MAC RX
    --------------------------------------------------------------------
    mac_rx_inst : entity work.mac_rx
    port map (
        clk         => clk125,
        reset       => reset,

        gmii_rxd    => gmii_rxd,
        gmii_rx_dv  => gmii_rx_dv,
        gmii_rx_er  => gmii_rx_er,

        m_data      => mac_tdata,
        m_valid     => mac_tvalid,
        m_last      => mac_tlast,
        m_ready     => mac_tready
    );

    --------------------------------------------------------------------
    -- UDP RX
    --------------------------------------------------------------------
    udp_rx_inst : entity work.udp_rx
    port map (
        clk         => clk125,
        reset       => reset,

        s_data      => mac_tdata,
        s_valid     => mac_tvalid,
        s_last      => mac_tlast,
        s_ready     => mac_tready,

        fifo_data   => fifo_data,
        fifo_wr_en  => fifo_wr_en,
        fifo_last   => fifo_last,
        fifo_full   => fifo_full
    );

end architecture;