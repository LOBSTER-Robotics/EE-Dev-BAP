library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top_ethernet_tx is
    port (
        clk : in std_logic;
        rst : in std_logic;
		-- FIFO
        Data: in  std_logic_vector(7 downto 0);
		fifo_empty: in std_logic;
		fifo_almostfull: in std_logic;
		Read_large_fifo: out std_logic;
		-- RGMII output
		rgmii_txd : out std_logic_vector(3 downto 0);
        rgmii_txctl : out std_logic;
        rgmii_txc : out std_logic
    );
end entity top_ethernet_tx;



architecture Behavioral of top_ethernet_tx is

	--------------------------------------------------------------------
    -- UDP -> MAC AXI-stream
    --------------------------------------------------------------------
    signal udp_tdata  : std_logic_vector(7 downto 0);
    signal udp_tvalid : std_logic;
    signal udp_tready : std_logic;
    signal udp_tlast  : std_logic;

    --------------------------------------------------------------------
    -- MAC -> RGMII -> GMII
    --------------------------------------------------------------------
    signal gmii_txd   : std_logic_vector(7 downto 0);
    signal gmii_tx_en : std_logic;
    signal gmii_tx_er : std_logic;
	
	signal fifo_almostempty : std_logic;
	signal data_out_large_fifo : std_logic_vector(7 downto 0);
	-- FIFO <-> Register <-> UDP
	signal reg_fifo_data : std_logic_vector(7 downto 0);
    signal reg_fifo_empty : std_logic;
    signal reg_fifo_almostfull : std_logic;
    signal fifo_rd_en_in :std_logic;
begin
	-- Register inbetwen FIFO and UDP
	reg_inst: entity work.fifo_udp_reg
    port map (
        clk => clk,
        rst => rst,

        -- From FIFO to UDP
        fifo_data  => data,
        fifo_empty => fifo_empty,
        fifo_almostfull  => fifo_almostfull,
        reg_fifo_rd_en => Read_large_fifo,

        -- FROM UDP to FIFO
        reg_fifo_data => reg_fifo_data,
        reg_fifo_empty => reg_fifo_empty,
        reg_fifo_almostfull => reg_fifo_almostfull,
        fifo_rd_en => fifo_rd_en_in        
    );
	
	--------------------------------------------------------------------
    -- UDP Packetizer
    --------------------------------------------------------------------
    udp_inst : entity work.UDP_FIFO_AXI
    port map (

        clk => clk,
        rst => rst,

        ------------------------------------------------------------
        -- FIFO input
        ------------------------------------------------------------
        fifo_data  => reg_fifo_data,
        fifo_empty => reg_fifo_empty,
        fifo_almostfull  => reg_fifo_almostfull,
        fifo_rd_en => fifo_rd_en_in,

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

        clk   => clk,
        reset => rst,

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
    -- GMII ? RGMII PHY adapter
    --------------------------------------------------------------------
    rgmii_inst : entity work.rgmii_tx_ddr
    port map (

        clk125 => clk,
        reset  => rst,

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
	


end Behavioral;


