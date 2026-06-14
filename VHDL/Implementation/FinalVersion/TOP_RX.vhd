library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ecp5um;
use ecp5um.components.all;

entity TOP_RX_FIFO is
    generic (
        CLK_FREQ_HZ : positive := 125_000_000;
        PHY_ADDR    : std_logic_vector(4 downto 0) := "00000";
        C_NUM_CHANNELS           : positive := 1;
        C_DAC_WIDTH              : positive := 16;
        C_ADC_WIDTH              : positive := 24;
        C_BYTE_WIDTH             : positive := 8;
        C_MUX_WAIT_CYCLES        : positive := 3
    );
    port (
        --------------------------------------------------------------------
        -- CLOCK / RESET
        --------------------------------------------------------------------
        clk125              : in  std_logic;
        clk100              : in  std_logic;
        reset               : in  std_logic;  -- active-high FPGA reset

        high_imp1   : inout std_logic;
        high_imp2   : inout std_logic;
        high_imp3   : inout std_logic;
        high_imp4   : inout std_logic;

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
        Uart_Rx : in  std_logic;
        --------------------------------------------------------------------
        -- SPI DAC
        --------------------------------------------------------------------
        extClk    : in  std_logic;
        sdi_dac   : out std_logic;
        cs_n_dac  : out std_logic;

        --------------------------------------------------------------------
        -- SPI ADC
        --------------------------------------------------------------------
        MISO1     : in  std_logic;
        MISO2     : in  std_logic;
        SCK       : out std_logic;
        CS        : out std_logic;
        CNV       : out std_logic;
        MOSI      : out std_logic
    );
end TOP_RX_FIFO;

architecture rtl of TOP_RX_FIFO is

    type t_small_fifo_DAC_data_array is array (0 to C_NUM_CHANNELS - 1) of std_logic_vector(C_DAC_WIDTH - 1 downto 0);
    type t_small_fifo_ADC_data_array is array (0 to C_NUM_CHANNELS - 1) of std_logic_vector(C_ADC_WIDTH - 1 downto 0);

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
    signal gmii_rx_async : std_logic_vector(9 downto 0);
    signal gmii_rx_sync  : std_logic_vector(9 downto 0);
    signal gmii_rxd_buf   : std_logic_vector(7 downto 0);
    signal gmii_rx_dv_buf : std_logic;
    signal gmii_rx_er_buf : std_logic;
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
    signal rx_fifo_wr_en_safe        : std_logic;
    signal rx_fifo_last         : std_logic;
    signal rx_fifo_data_q          : std_logic_vector(7 downto 0);
    signal rx_fifo_full_i          : std_logic;
    signal rx_fifo_empty_i         : std_logic;
    signal rx_fifo_almost_empty_i  : std_logic;
    signal rx_fifo_almost_full_i   : std_logic;
    signal rx_fifo_read_enable     : std_logic;
    signal rx_fifo_rd_en_i         : std_logic;
    signal rx_fifo_rd_en_safe         : std_logic;

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



    --------------------------------------------------------------------
    -- FIFO small DAC
    --------------------------------------------------------------------
    signal s_fifo_sel : unsigned(3 downto 0);

    signal s_small_fifo_DAC_wr_en        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_DAC_rd_en        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_DAC_din          : std_logic_vector(C_DAC_WIDTH - 1 downto 0);

    signal s_small_fifo_DAC_q            : t_small_fifo_DAC_data_array;

    signal s_small_fifo_DAC_empty        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_DAC_full         : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_DAC_almost_empty : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_DAC_almost_full  : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
	signal o_small_fifo_dout : std_logic_vector(C_NUM_CHANNELS * C_DAC_WIDTH - 1 downto 0);

    -- Separate small FIFO signals for ADC path (avoid name collision with DAC small FIFOs)
    signal s_small_fifo_ADC_q            : t_small_fifo_ADC_data_array;

    signal s_small_fifo_ADC_empty        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_ADC_full         : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_ADC_almost_empty : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_ADC_almost_full  : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_ADC_din          : t_small_fifo_ADC_data_array;
    signal s_small_fifo_ADC_wr_en        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);
    signal s_small_fifo_ADC_rd_en        : std_logic_vector(C_NUM_CHANNELS - 1 downto 0);

    signal fifo_dout_to_packer : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal fifo_sel : unsigned(3 downto 0);

    --------------------------------------------------------------------
    -- FIFO small DAC
    --------------------------------------------------------------------
    signal clk50 : std_logic := '0';
    signal clk80 : std_logic := '0';
    signal sel_high_i : std_logic;

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

    gmii_rx_async <= gmii_rx_er & gmii_rx_dv & gmii_rxd;

    u_gmii_rx_sync : entity work.vector_synchronizer
    generic map (
        WIDTH  => 10,
        STAGES => 3
    )
    port map (
        clk_dst  => clk125,
        clk_rgmii => rgmii_rxc,
        rst    => reset,
        async_in => gmii_rx_async,
        sync_out => gmii_rx_sync
    );

    gmii_rxd_buf   <= gmii_rx_sync(7 downto 0);
    gmii_rx_dv_buf <= gmii_rx_sync(8);
    gmii_rx_er_buf <= gmii_rx_sync(9);

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
    debug_bus(0) <= rx_reset;
    debug_bus(1) <= s_small_fifo_DAC_empty(0);
    debug_bus(2) <= gmii_rx_dv;
    debug_bus(3) <= phy_link_up_i;
    debug_bus(4) <= s_small_fifo_DAC_rd_en(0);
    debug_bus(5) <= reg_fifo_almostfull;
    debug_bus(6) <= s_small_fifo_DAC_almost_full(0);
	debug_bus(7) <= rx_fifo_full_i;

    --mac_debug_state(7) <= rx_fifo_empty_i;

    fifo_q <= not mac_debug_state;
    rx_fifo_wr_en_safe <= rx_fifo_wr_en and not rx_fifo_full_i;
    rx_fifo_rd_en_safe <= rx_fifo_rd_en_i and not rx_fifo_empty_i;
    sel_high_i <= not seg_sel_sw;

    CLOCK_BLOCK_50_80 : entity work.PLL60
    port map (
        CLKI => clk100,
        CLKOP => clk50
    );

    seg_display_inst : entity work.byte_to_14seg
    port map (
        reset    => reset,

        -- Use your internal normal-polarity debug bus if you have it.
        -- If fifo_q is active-low for LEDs, then use not fifo_q.
        data_in  => rx_fifo_data_q,

        -- DIP switch ON = logic 0, so invert it.
        sel_high => sel_high_i,

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
    -- RGMII RX
    --------------------------------------------------------------------
    rgmii_rx_inst_DDR : entity work.rgmii_rx
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
    mac_rx_inst : entity work.MAC_RX
        port map (
            clk         => clk125,
            reset       => rx_reset,
            gmii_rxd    => gmii_rxd_buf,
            gmii_rx_dv  => gmii_rx_dv_buf,
            gmii_rx_er  => gmii_rx_er_buf,
            m_data      => mac_tdata,
            m_valid     => mac_tvalid,
            m_last      => mac_tlast,
            m_ready     => mac_tready
            --debug_state => mac_debug_state(6 downto 0)
        );

    --------------------------------------------------------------------
    -- UDP RX
    --------------------------------------------------------------------
    udp_rx_inst : entity work.UDP_FIFO_RX
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
            fifo_full  => rx_fifo_full_i,
            debug => open
        );

    --------------------------------------------------------------------
    -- FIFO
    --------------------------------------------------------------------
    fifo_rx_inst : entity work.Fifo_lg_RX
        port map (
            Data        => rx_fifo_data,
            Clock       => clk125,
            WrEn        => rx_fifo_wr_en_safe,
            RdEn        => rx_fifo_rd_en_safe,
            Reset       => rx_reset,
            Q           => rx_fifo_data_q,
            Empty       => rx_fifo_empty_i,
            Full        => rx_fifo_full_i,
            AlmostEmpty => rx_fifo_almost_empty_i,
            AlmostFull  => rx_fifo_almost_full_i
        );
    fifo_tx_inst : entity work.Fifolg
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
    -- fifo_to_uart_inst : entity work.fifo_to_uart_byte
    -- port map (
    --     Clk        => clk125,
    --     Rst        => rx_reset,
    --
    --     Fifo_Q     => rx_fifo_data_q,
    --     Fifo_Empty => rx_fifo_empty_i,
    --     Fifo_RdEn  => rx_fifo_rd_en_i,
    --
    --     Tx_Valid   => uart_tx_valid_i,
    --     Tx_Ready   => uart_tx_ready_i,
    --     Tx_Data    => uart_tx_data_i
    -- );

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
    UDP_FIFO_TX : entity work.UDP_FIFO_TX
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
        t_last  => udp_tlast,
        debug_state => open
    );

    --------------------------------------------------------------------
    -- Ethernet MAC
    --------------------------------------------------------------------
    mac_tx_inst : entity work.MAC_TX
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
        --debug_state => mac_debug_state

    );

    --------------------------------------------------------------------
    -- GMII ? RGMII PHY adapter
    --------------------------------------------------------------------
    rgmii_inst_TX : entity work.rgmii_tx_ddr
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
    -- top_tb_fpga_inst : entity work.top_tb_fpga
    --     port map (
    --         clk           => clk125,
    --         rst           => rx_reset,
    --         enable        => '1',
    --         fifo_full     => tx_fifo_full_i,
    --         Data          => tx_fifo_data,
    --         fifo_write_en => tx_fifo_wr_en
    --     );
    --------------------------------------------------------------------
    -- Controller
    --------------------------------------------------------------------

    u_controller_DAC : entity work.Controller_DAC
        generic map (
            G_NUM_CHANNELS           => C_NUM_CHANNELS,
            G_DAC_WIDTH              => C_DAC_WIDTH,
            G_BYTE_WIDTH             => C_BYTE_WIDTH
        )
        port map (
            i_clk                     => clk125,
            i_rst                     => rx_reset,
            i_enable                  => '1',
            i_large_fifo_almost_empty => rx_fifo_almost_empty_i,
            o_small_fifo_wr_en        => s_small_fifo_DAC_wr_en,
            i_fifo_dout               => rx_fifo_data_q,
            i_small_fifo_almost_full  => s_small_fifo_DAC_almost_full,
            o_large_fifo_rd_en        => rx_fifo_rd_en_i,
            o_small_fifo_din          => s_small_fifo_DAC_din
        );

    --------------------------------------------------------------------
    -- 16 small FIFOs for DAC data
    --------------------------------------------------------------------
    gen_small_fifos : for ch in 0 to C_NUM_CHANNELS - 1 generate

        u_small_fifo : entity work.Fifosm_DAC_async
            port map (
                Data        => s_small_fifo_DAC_din,
                WrClock     => clk125,
                RdClock     => extClk,
                WrEn        => s_small_fifo_DAC_wr_en(ch),
                RdEn        => s_small_fifo_DAC_rd_en(ch),
                Reset       => rx_reset,
                RPReset     => rx_reset,
                Q           => s_small_fifo_DAC_q(ch),
                Empty       => s_small_fifo_DAC_empty(ch),
                Full        => s_small_fifo_DAC_full(ch),
                AlmostEmpty => s_small_fifo_DAC_almost_empty(ch),
                AlmostFull  => s_small_fifo_DAC_almost_full(ch)
            );

    end generate;

    u_adc_fifo_frame_packer : entity work.Controller_ADC
        generic map (
            C_NUM_CHANNELS           => C_NUM_CHANNELS,
            C_ADC_WIDTH              => C_ADC_WIDTH,
            C_BYTE_WIDTH             => C_BYTE_WIDTH,
            C_MUX_WAIT_CYCLES        => C_MUX_WAIT_CYCLES
        )
        port map (
            i_clk   => clk125,
            i_rst   => rx_reset,

            i_enable => '1',

            i_small_fifo_empty => s_small_fifo_ADC_almost_empty,

            o_fifo_sel => fifo_sel,

            o_small_fifo_rd_en => s_small_fifo_ADC_rd_en,

            i_fifo_dout => fifo_dout_to_packer,

            i_large_fifo_almost_full => tx_fifo_almost_full_i,
            o_large_fifo_wr_en      => tx_fifo_wr_en,
            o_large_fifo_din        => tx_fifo_data
        );

    u_MuxFifo : entity work.fifo_16ch_mux
        generic map (
            C_ADC_WIDTH => 24
        )
        port map (
            i_clk => clk125,
            i_rst => rx_reset,

            i_fifo_sel => fifo_sel,

            i_fifo_0_dout  => s_small_fifo_ADC_q(0),
            i_fifo_1_dout  => s_small_fifo_ADC_q(0),
            i_fifo_2_dout  => s_small_fifo_ADC_q(0),
            i_fifo_3_dout  => s_small_fifo_ADC_q(0),
            i_fifo_4_dout  => s_small_fifo_ADC_q(0),
            i_fifo_5_dout  => s_small_fifo_ADC_q(0),
            i_fifo_6_dout  => s_small_fifo_ADC_q(0),
            i_fifo_7_dout  => s_small_fifo_ADC_q(0),
            i_fifo_8_dout  => s_small_fifo_ADC_q(0),
            i_fifo_9_dout  => s_small_fifo_ADC_q(0),
            i_fifo_10_dout => s_small_fifo_ADC_q(0),
            i_fifo_11_dout => s_small_fifo_ADC_q(0),
            i_fifo_12_dout => s_small_fifo_ADC_q(0),
            i_fifo_13_dout => s_small_fifo_ADC_q(0),
            i_fifo_14_dout => s_small_fifo_ADC_q(0),
            i_fifo_15_dout => s_small_fifo_ADC_q(0),

            o_fifo_dout => fifo_dout_to_packer
        );
    --------------------------------------------------------------------
    -- SPI master
    --------------------------------------------------------------------
    -- u_spi_DAC : entity work.spi_master_dac_ext
    --     generic map (
    --         Num_Channels    => C_NUM_CHANNELS,
    --         DONE_WAIT_CYCLS => 6
    --     )
    --     port map (
    --         clk           => extClk,
    --         rst           => reset,
    --         data_in       => s_small_fifo_DAC_q(0),
    --         fifo_empty(0) => s_small_fifo_DAC_empty(0),
    --         read_en(0)       => s_small_fifo_DAC_rd_en(0),
    --         sdi(0)        => sdi_dac,
    --         cs_n          => cs_n_dac,
    --         high_imp       => high_imp4
    --     );
    u_top_1khz_test : entity work.top_1khz_test
    port map (
        clk      => extClk,             -- use the 50 MHz clock generated in this design
        rst_n    => reset,      -- active-low reset, rx_reset is active-high here
        sdi(0)      => sdi_dac,    -- map scalar sdi_dac into the 1-element vector
        cs_n     => cs_n_dac,          -- share the DAC CS signal
        high_imp => high_imp4,         -- connect to one of the high_imp pins (board-specific)
        led      => mac_debug_state(3 downto 0)               -- leave LEDs unconnected (or map to signals if you prefer)
    );

    -- DC test module instance
    -- u_top_dc_test : entity work.top_dc_test
    --     port map (
    --         extClk   => extClk,               -- external SPI clock (shared with DAC path)
    --         rst_n    => not rx_reset,         -- active-low reset
    --         sdi(0)      => (0 => sdi_dac),       -- map single-bit sdi_dac into 1-element vector
    --         cs_n     => cs_n_dac,             -- share DAC chip-select (careful with contention)
    --         high_imp => high_imp2,            -- use high_imp2 for this test instance
    --         led      => open                  -- leave LEDs unconnected (or map to signals if desired)
    --     );
    --
    -- -- DAC AC test module instance
    -- u_top_dac_ac_test : entity work.top_dac_ac_test
    --     port map (
    --         clk      => extClk,                -- use internal 50 MHz clock
    --         rst_n    => not rx_reset,         -- active-low reset
    --         sdi(0)      => (0 => sdi_dac),       -- map single-bit sdi_dac into 1-element vector
    --         cs_n     => cs_n_dac,             -- share the DAC chip-select line
    --         high_imp => high_imp3,            -- use high_imp3 for this test instance
    --         led      => open                  -- leave LEDs unconnected (or map to signals if desired)
    --     );




    --------------------------------------------------------------------
    -- 16 small FIFOs for ADC data buffering
    --------------------------------------------------------------------
    gen_small_fifos_adc : for ch in 0 to C_NUM_CHANNELS - 1 generate

        u_small_fifo_adc : entity work.Fifosm_ADC_async
            port map (
                Data        => s_small_fifo_ADC_din(ch),
                WrClock     => clk50,
                RdClock     => clk125,
                WrEn        => s_small_fifo_ADC_wr_en(ch),
                RdEn        => s_small_fifo_ADC_rd_en(ch),
                Reset       => rx_reset,
                RPReset     => rx_reset,
                Q           => s_small_fifo_ADC_q(ch),
                Empty       => s_small_fifo_ADC_empty(ch),
                Full        => s_small_fifo_ADC_full(ch),
                AlmostEmpty => s_small_fifo_ADC_almost_empty(ch),
                AlmostFull  => s_small_fifo_ADC_almost_full(ch)
            );

    end generate;

    u_spi_ADC : entity work.ADC_SPI_Controller
        port map (
            clk           => clk50,
            RESET_N           => rx_reset,
            high_imp1       => high_imp1,
            high_imp2    => high_imp2,
            high_imp3       => high_imp3,
            MISO1           => MISO1,
            MISO2          => MISO2,
            SCK       => SCK,
            CS       => CS,
            CNV       => CNV,
            MOSI       => MOSI,
            Data1     => s_small_fifo_ADC_din(0),
            Data2     => open,
            DataValid => s_small_fifo_ADC_wr_en(0),
            FIFO_ENABLE => not s_small_fifo_ADC_almost_full(0)
        );

end rtl;