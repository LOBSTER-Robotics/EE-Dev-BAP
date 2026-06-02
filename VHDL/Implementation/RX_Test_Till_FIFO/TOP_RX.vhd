library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_RX_FIFO is
    generic (
        CLK_FREQ_HZ : positive := 125_000_000;
        PHY_ADDR    : std_logic_vector(4 downto 0) := "00000"
    );
    port (
        --------------------------------------------------------------------
        -- CLOCK / RESET
        --------------------------------------------------------------------
        clk125              : in  std_logic;
        reset               : in  std_logic;  -- active-high FPGA reset
		fifo_reset 		     : in std_logic;

        --------------------------------------------------------------------
        -- RGMII PHY INPUT
        --------------------------------------------------------------------
        rgmii_rxd           : in  std_logic_vector(3 downto 0);
        rgmii_rxctl         : in  std_logic;
        rgmii_rxc           : in  std_logic;

        --------------------------------------------------------------------
        -- PHY CONTROL / MDIO
        --------------------------------------------------------------------
        phy_reset           : out std_logic;  -- PHY RESETn, active-low
        phy_mdc             : out std_logic;
        phy_mdio            : inout std_logic;
		
		--------------------------------------------------------------------
        -- RGMII PHY OUTPUT
        --------------------------------------------------------------------
		rgmii_txd : out std_logic_vector(3 downto 0);
        rgmii_txctl : out std_logic;
        rgmii_txc : out std_logic;

        --------------------------------------------------------------------
        -- SWITCH READ INPUT
        --------------------------------------------------------------------
        read_switch         : in  std_logic;
		seg_sel_sw : in std_logic;

        --------------------------------------------------------------------
        -- DEBUG LED OUTPUT
        --------------------------------------------------------------------
        fifo_q              : out std_logic_vector(7 downto 0);
		
		seg_a  : out std_logic;
		seg_b  : out std_logic;
		seg_c  : out std_logic;
		seg_d  : out std_logic;
		seg_e  : out std_logic;
		seg_f  : out std_logic;
		seg_g  : out std_logic;
		seg_h  : out std_logic;
		seg_j  : out std_logic;
		seg_k  : out std_logic;
		seg_l  : out std_logic;
		seg_m  : out std_logic;
		seg_n  : out std_logic;
		seg_p  : out std_logic;
		seg_dp : out std_logic;

        --------------------------------------------------------------------
        -- UART
        --------------------------------------------------------------------
        Uart_Tx : out std_logic;
        Uart_Rx : in  std_logic
    );
end TOP_RX_FIFO;

architecture rtl of TOP_RX_FIFO is

    component OneClockPulse is
        port (
            clk       : in  std_logic;
            reset     : in  std_logic;
            enable    : in  std_logic;
            ext_in    : in  std_logic;
            pulse_out : out std_logic
        );
    end component;

    component rgmii_rx is
        port (
            rx_clk      : in  std_logic;
            reset       : in  std_logic;
            rgmii_rxd   : in  std_logic_vector(3 downto 0);
            rgmii_rxctl : in  std_logic;
            rx_dout     : out std_logic_vector(7 downto 0);
            rx_dv       : out std_logic;
            rx_er       : out std_logic
        );
    end component;

    component mac_rx is
        port (
            clk         : in  std_logic;
            reset       : in  std_logic;
            gmii_rxd    : in  std_logic_vector(7 downto 0);
            gmii_rx_dv  : in  std_logic;
            gmii_rx_er  : in  std_logic;
            m_data      : out std_logic_vector(7 downto 0);
            m_valid     : out std_logic;
            m_last      : out std_logic;
            m_ready     : in  std_logic;
            debug_state : out std_logic_vector(7 downto 0)
        );
    end component;

    component udp_rx is
        port (
            clk        : in  std_logic;
            reset      : in  std_logic;
            s_data     : in  std_logic_vector(7 downto 0);
            s_valid    : in  std_logic;
            s_last     : in  std_logic;
            s_ready    : out std_logic;
            fifo_data  : out std_logic_vector(7 downto 0);
            fifo_wr_en : out std_logic;
            fifo_last  : out std_logic;
            fifo_full  : in  std_logic
        );
    end component;

    component Fifolg is
        port (
            Data        : in  std_logic_vector(7 downto 0);
            Clock       : in  std_logic;
            WrEn        : in  std_logic;
            RdEn        : in  std_logic;
            Reset       : in  std_logic;
            Q           : out std_logic_vector(7 downto 0);
            Empty       : out std_logic;
            Full        : out std_logic;
            AlmostEmpty : out std_logic;
            AlmostFull  : out std_logic
        );
    end component;

    --------------------------------------------------------------------
    -- PHY / MDIO status
    --------------------------------------------------------------------
    signal phy_resetn_i         : std_logic;
    signal mdio_init_done_i     : std_logic;
    signal phy_link_up_i        : std_logic;
    signal phy_speed_i          : std_logic_vector(1 downto 0);
    signal phy_duplex_i         : std_logic;

    --------------------------------------------------------------------
    -- RX reset
    --------------------------------------------------------------------
    signal rx_reset             : std_logic;

    --------------------------------------------------------------------
    -- GMII signals
    --------------------------------------------------------------------
    signal gmii_rxd             : std_logic_vector(7 downto 0);
    signal gmii_rx_dv           : std_logic;
    signal gmii_rx_er           : std_logic;
	signal gmii_txd   : std_logic_vector(7 downto 0);
    signal gmii_tx_en : std_logic;
    signal gmii_tx_er : std_logic;

    --------------------------------------------------------------------
    -- MAC / UDP signals
    --------------------------------------------------------------------
    signal mac_tdata            : std_logic_vector(7 downto 0);
    signal mac_tvalid           : std_logic;
    signal mac_tlast            : std_logic;
    signal mac_tready           : std_logic;
    signal mac_debug_state      : std_logic_vector(7 downto 0);
	signal udp_tdata  : std_logic_vector(7 downto 0);
    signal udp_tvalid : std_logic;
    signal udp_tready : std_logic;
    signal udp_tlast  : std_logic;

    --------------------------------------------------------------------
    -- FIFO signals RX
    --------------------------------------------------------------------
    signal rx_fifo_data         : std_logic_vector(7 downto 0);
    signal rx_fifo_wr_en        : std_logic;
    signal rx_fifo_last         : std_logic;
    signal rx_fifo_data_q          : std_logic_vector(7 downto 0);
    signal rx_fifo_full_i          : std_logic;
    signal rx_fifo_empty_i         : std_logic;
    signal rx_fifo_almost_empty_i  : std_logic;
    signal rx_fifo_almost_full_i   : std_logic;
    signal rx_fifo_read_enable     : std_logic;
    signal rx_fifo_rd_en_i         : std_logic;
	
	--------------------------------------------------------------------
    -- FIFO signals TX
    --------------------------------------------------------------------
    signal tx_fifo_data         : std_logic_vector(7 downto 0);
    signal tx_fifo_wr_en        : std_logic;
    signal tx_fifo_last         : std_logic;
    signal tx_fifo_data_q          : std_logic_vector(7 downto 0);
    signal tx_fifo_full_i          : std_logic;
    signal tx_fifo_empty_i         : std_logic;
    signal tx_fifo_almost_empty_i  : std_logic;
    signal tx_fifo_almost_full_i   : std_logic;
    signal tx_fifo_read_enable     : std_logic;
    signal tx_fifo_rd_en_i         : std_logic;

    signal uart_tx_valid_i : std_logic;
    signal uart_tx_ready_i : std_logic;
    signal uart_tx_data_i  : std_logic_vector(7 downto 0);
	
	signal reg_fifo_data : std_logic_vector(7 downto 0);
    signal reg_fifo_empty : std_logic;
    signal reg_fifo_almostfull : std_logic;
	signal fifo_rd_en_in :std_logic;
	signal start_fill         : std_logic;

    --------------------------------------------------------------------
    -- LED/debug bus before active-low inversion
    --------------------------------------------------------------------
    signal debug_bus            : std_logic_vector(7 downto 0);

begin

    --------------------------------------------------------------------
    -- PHY reset output
    --------------------------------------------------------------------
    phy_reset <= phy_resetn_i;

    --------------------------------------------------------------------
    -- Hold RX chain reset until PHY MDIO setup is complete
    --------------------------------------------------------------------
    rx_reset <= reset or (not mdio_init_done_i) or not phy_link_up_i;

    --------------------------------------------------------------------
    -- Marvell 88E1512 PHY init
    --------------------------------------------------------------------
    phy_init_inst : entity work.marvell_88e1512_rgmii_init
        generic map (
            CLK_FREQ_HZ => CLK_FREQ_HZ,
            PHY_ADDR    => PHY_ADDR,
            MDC_FREQ_HZ => 2_500_000
        )
        port map (
            clk        => clk125,
            rst        => reset,

            phy_resetn => phy_resetn_i,
            mdc        => phy_mdc,
            mdio       => phy_mdio,

            init_done  => mdio_init_done_i,
            link_up    => phy_link_up_i,
            speed      => phy_speed_i,
            duplex     => phy_duplex_i
        );

    --------------------------------------------------------------------
    -- DEBUG LED MAP
    --
    -- debug_bus bit meaning:
    -- bit 0 = reset input
    -- bit 1 = PHY resetn output, 1 means PHY released from reset
    -- bit 2 = MDIO init done
    -- bit 3 = PHY link up
    -- bit 4 = PHY duplex, 1 = full duplex
    -- bit 6:5 = speed, 10=1000M, 01=100M, 00=10M
    -- bit 7 = FIFO not empty
    --
    -- Versa user LEDs are active-low, so fifo_q is inverted.
    --------------------------------------------------------------------
    debug_bus(0) <= reset;
    debug_bus(1) <= fifo_reset;
    debug_bus(2) <= mdio_init_done_i;
    debug_bus(3) <= phy_link_up_i;
    debug_bus(4) <= tx_fifo_wr_en;
    debug_bus(5) <= reg_fifo_almostfull;
	debug_bus(6) <= start_fill;
	debug_bus(7) <= tx_fifo_empty_i;

    fifo_q <= not debug_bus;

    seg_display_inst : entity work.byte_to_14seg
    port map (
        reset    => reset,

        -- Use your internal normal-polarity debug bus if you have it.
        -- If fifo_q is active-low for LEDs, then use not fifo_q.
        data_in  => rx_fifo_data_q,

        -- DIP switch ON = logic 0, so invert it.
        sel_high => not seg_sel_sw,

        seg_a    => seg_a,
        seg_b    => seg_b,
        seg_c    => seg_c,
        seg_d    => seg_d,
        seg_e    => seg_e,
        seg_f    => seg_f,
        seg_g    => seg_g,
        seg_h    => seg_h,
        seg_j    => seg_j,
        seg_k    => seg_k,
        seg_l    => seg_l,
        seg_m    => seg_m,
        seg_n    => seg_n,
        seg_p    => seg_p,
        seg_dp   => seg_dp
    );

    --------------------------------------------------------------------
    -- FIFO read pulse
    --------------------------------------------------------------------

     read_pulse_inst : OneClockPulse
         port map (
             clk       => clk125,
             reset     => rx_reset,
             enable    => tx_fifo_empty_i,
             ext_in    => read_switch,
             pulse_out => start_fill
         );
    --------------------------------------------------------------------
    -- RGMII RX
    --------------------------------------------------------------------
    rgmii_rx_inst : rgmii_rx
        port map (
            rx_clk      => rgmii_rxc,
            reset       => rx_reset,
            rgmii_rxd   => rgmii_rxd,
            rgmii_rxctl => rgmii_rxctl,
            rx_dout     => gmii_rxd,
            rx_dv       => gmii_rx_dv,
            rx_er       => gmii_rx_er
        );

    --------------------------------------------------------------------
    -- MAC RX
    --------------------------------------------------------------------
    mac_rx_inst : mac_rx
        port map (
            clk         => clk125,
            reset       => rx_reset,
            gmii_rxd    => gmii_rxd,
            gmii_rx_dv  => gmii_rx_dv,
            gmii_rx_er  => gmii_rx_er,
            m_data      => mac_tdata,
            m_valid     => mac_tvalid,
            m_last      => mac_tlast,
            m_ready     => mac_tready,
            debug_state => mac_debug_state
        );

    --------------------------------------------------------------------
    -- UDP RX
    --------------------------------------------------------------------
    udp_rx_inst : udp_rx
        port map (
            clk        => clk125,
            reset      => rx_reset,
            s_data     => mac_tdata,
            s_valid    => mac_tvalid,
            s_last     => mac_tlast,
            s_ready    => mac_tready,
            fifo_data  => rx_fifo_data,
            fifo_wr_en => rx_fifo_wr_en,
            fifo_last  => rx_fifo_last,
            fifo_full  => rx_fifo_full_i
        );

    --------------------------------------------------------------------
    -- FIFO
    --------------------------------------------------------------------
    fifo_rx_inst : Fifolg
        port map (
            Data        => rx_fifo_data,
            Clock       => clk125,
            WrEn        => rx_fifo_wr_en,
            RdEn        => rx_fifo_rd_en_i,
            Reset       => rx_reset,
            Q           => rx_fifo_data_q,
            Empty       => rx_fifo_empty_i,
            Full        => rx_fifo_full_i,
            AlmostEmpty => rx_fifo_almost_empty_i,
            AlmostFull  => rx_fifo_almost_full_i
        );
    fifo_tx_inst : Fifolg
        port map (
            Data        => tx_fifo_data,
            Clock       => clk125,
            WrEn        => tx_fifo_wr_en,
            RdEn        => tx_fifo_rd_en_i,
            Reset       => rx_reset,
            Q           => tx_fifo_data_q,
            Empty       => tx_fifo_empty_i,
            Full        => tx_fifo_full_i,
            AlmostEmpty => tx_fifo_almost_empty_i,
            AlmostFull  => tx_fifo_almost_full_i
        );
    uart_inst : entity work.olo_intf_uart
    generic map (
        ClkFreq_g  => 125.0e6,
        BaudRate_g => 115.2e3,
        DataBits_g => 8,
        StopBits_g => "1",
        Parity_g   => "none"
    )
    port map (
        Clk            => clk125,
        Rst            => rx_reset,

        Tx_Valid       => uart_tx_valid_i,
        Tx_Ready       => uart_tx_ready_i,
        Tx_Data        => uart_tx_data_i,

        Rx_Valid       => open,
        Rx_Data        => open,
        Rx_ParityError => open,

        Uart_Tx        => Uart_Tx,
        Uart_Rx        => Uart_Rx

    );
    fifo_to_uart_inst : entity work.fifo_to_uart_byte
    port map (
        Clk        => clk125,
        Rst        => rx_reset,

        Fifo_Q     => rx_fifo_data_q,
        Fifo_Empty => rx_fifo_empty_i,
        Fifo_RdEn  => rx_fifo_rd_en_i,

        Tx_Valid   => uart_tx_valid_i,
        Tx_Ready   => uart_tx_ready_i,
        Tx_Data    => uart_tx_data_i
    );
	
	reg_inst: entity work.fifo_udp_reg
    port map (
        clk => clk125,
        rst => rx_reset,

        -- From FIFO to UDP
        fifo_data  => tx_fifo_data_q,
        fifo_empty => tx_fifo_empty_i,
        fifo_almostfull  => tx_fifo_almost_full_i,
        reg_fifo_rd_en => tx_fifo_rd_en_i,

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

        clk => clk125,
        rst => rx_reset,

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

        clk   => clk125,
        reset => rx_reset,

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

        clk125 => clk125,
        reset  => rx_reset,

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
	top_tb_fpga_inst : entity work.top_tb_fpga
    port map (
        clk           => clk125,
        rst           => rx_reset,
        enable        => tx_fifo_empty_i,
        Data          => tx_fifo_data,
        fifo_write_en => tx_fifo_wr_en
    );

end rtl;