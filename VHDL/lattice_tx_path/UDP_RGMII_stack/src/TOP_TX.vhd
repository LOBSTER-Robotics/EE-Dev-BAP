library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_TX is
port (

    --------------------------------------------------------------------
    -- Clock / Reset
    --------------------------------------------------------------------
    clk125 : in  std_logic;
    reset  : in  std_logic;

    --------------------------------------------------------------------
    -- User FIFO Interface
    --------------------------------------------------------------------
    fifo_data  : in  std_logic_vector(7 downto 0);
    fifo_empty : in  std_logic;
    fifo_almostfull  : in  std_logic;
    fifo_rd_en : out std_logic;

    --------------------------------------------------------------------
    -- RGMII PHY Interface
    --------------------------------------------------------------------
    rgmii_txd    : out std_logic_vector(3 downto 0);
    rgmii_txctl  : out std_logic;
    rgmii_txc    : out std_logic

);
end entity;

architecture rtl of TOP_TX is

    --------------------------------------------------------------------
    -- UDP → MAC AXI-stream
    --------------------------------------------------------------------
    signal udp_tdata  : std_logic_vector(7 downto 0);
    signal udp_tvalid : std_logic;
    signal udp_tready : std_logic;
    signal udp_tlast  : std_logic;

    --------------------------------------------------------------------
    -- MAC → RGMII GMII
    --------------------------------------------------------------------
    signal gmii_txd   : std_logic_vector(7 downto 0);
    signal gmii_tx_en : std_logic;
    signal gmii_tx_er : std_logic;

begin

    --------------------------------------------------------------------
    -- UDP Packetizer
    --------------------------------------------------------------------
    udp_inst : entity work.UDP_FIFO_AXI
    port map (

        clk => clk125,
        rst => reset,

        ------------------------------------------------------------
        -- FIFO input
        ------------------------------------------------------------
        fifo_data  => fifo_data,
        fifo_empty => fifo_empty,
        fifo_almostfull  => fifo_almostfull,
        fifo_rd_en => fifo_rd_en,

        ------------------------------------------------------------
        -- AXI-stream output
        ------------------------------------------------------------
        t_data  => udp_tdata,
        t_valid => udp_tvalid,
        t_ready => udp_tready,
        t_last  => udp_tlast
    );

    --------------------------------------------------------------------
    -- Ethernet MAC
    --------------------------------------------------------------------
    mac_inst : entity work.MAC_AXItoRGMII
    port map (

        clk   => clk125,
        reset => reset,

        ------------------------------------------------------------
        -- AXI-stream input
        ------------------------------------------------------------
        s_data  => udp_tdata,
        s_valid => udp_tvalid,
        s_last  => udp_tlast,
        s_ready => udp_tready,

        ------------------------------------------------------------
        -- GMII output
        ------------------------------------------------------------
        gmii_txd   => gmii_txd,
        gmii_tx_en => gmii_tx_en,
        gmii_tx_er => gmii_tx_er
    );

    --------------------------------------------------------------------
    -- GMII → RGMII PHY adapter
    --------------------------------------------------------------------
    rgmii_inst : entity work.rgmii_tx_ddr
    port map (

        clk125 => clk125,
        reset  => reset,

        ------------------------------------------------------------
        -- GMII input
        ------------------------------------------------------------
        txd_in => gmii_txd,
        tx_en  => gmii_tx_en,
        tx_er  => gmii_tx_er,

        ------------------------------------------------------------
        -- RGMII PHY output
        ------------------------------------------------------------
        rgmii_txd   => rgmii_txd,
        rgmii_txctl => rgmii_txctl,
        rgmii_txc   => rgmii_txc
    );

end architecture;