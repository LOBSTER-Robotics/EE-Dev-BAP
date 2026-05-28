library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Samengevoegd uit TOP_RX.vhd en TOP_RX_!.vhd.
-- Dit bestand bevat één top-level entity: TOP_RX_FIFO.
entity TOP_RX_FIFO is
    port (
        --------------------------------------------------------------------
        -- CLOCK / RESET
        --------------------------------------------------------------------
        clk125              : in  std_logic;
        reset               : in  std_logic;

        --------------------------------------------------------------------
        -- RGMII PHY INPUT
        --------------------------------------------------------------------
        rgmii_rxd           : in  std_logic_vector(3 downto 0);
        rgmii_rxctl         : in  std_logic;
        rgmii_rxc           : in  std_logic;
		phy_reset 		    : out std_logic;

        --------------------------------------------------------------------
        -- SWITCH READ INPUT
        --------------------------------------------------------------------
        read_switch         : in  std_logic;

        --------------------------------------------------------------------
        -- FIFO OUTPUT
        --------------------------------------------------------------------
        fifo_q              : out std_logic_vector(7 downto 0)
    );
end TOP_RX_FIFO;

architecture rtl of TOP_RX_FIFO is

    --------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    --------------------------------------------------------------------
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
            clk        : in  std_logic;
            reset      : in  std_logic;
            gmii_rxd   : in  std_logic_vector(7 downto 0);
            gmii_rx_dv : in  std_logic;
            gmii_rx_er : in  std_logic;
            m_data     : out std_logic_vector(7 downto 0);
            m_valid    : out std_logic;
            m_last     : out std_logic;
            m_ready    : in  std_logic;
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
    -- GMII SIGNALS
    --------------------------------------------------------------------
    signal gmii_rxd             : std_logic_vector(7 downto 0);
    signal gmii_rx_dv           : std_logic;
    signal gmii_rx_er           : std_logic;

    --------------------------------------------------------------------
    -- AXI STREAM BETWEEN MAC + UDP
    --------------------------------------------------------------------
    signal mac_tdata            : std_logic_vector(7 downto 0);
    signal mac_tvalid           : std_logic;
    signal mac_tlast            : std_logic;
    signal mac_tready           : std_logic;

    --------------------------------------------------------------------
    -- UDP RX TO FIFO SIGNALS
    --------------------------------------------------------------------
    signal rx_fifo_data         : std_logic_vector(7 downto 0);
    signal rx_fifo_wr_en        : std_logic;
    signal rx_fifo_last         : std_logic;

    --------------------------------------------------------------------
    -- FIFO STATUS SIGNALS
    --------------------------------------------------------------------
    signal fifo_full_i          : std_logic;
    signal fifo_empty_i         : std_logic;
    signal fifo_almost_empty_i  : std_logic;
    signal fifo_almost_full_i   : std_logic;

    --------------------------------------------------------------------
    -- READ PULSE SIGNALS
    --------------------------------------------------------------------
    signal fifo_read_enable     : std_logic;
    signal fifo_rd_en_i         : std_logic;

begin

    --------------------------------------------------------------------
    -- Enable read pulse only when FIFO is not empty
    --------------------------------------------------------------------
    fifo_read_enable <= not fifo_empty_i;
	phy_reset <= not reset;
	

    --------------------------------------------------------------------
    -- SWITCH TO ONE-CLOCK FIFO READ PULSE
    --------------------------------------------------------------------
    read_pulse_inst : OneClockPulse
        port map (
            clk       => clk125,
            reset     => reset,
            enable    => fifo_read_enable,
            ext_in    => read_switch,
            pulse_out => fifo_rd_en_i
        );

    --------------------------------------------------------------------
    -- RGMII RX
    --------------------------------------------------------------------
    rgmii_rx_inst : rgmii_rx
        port map (
            rx_clk      => rgmii_rxc,
            reset       => reset,
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
            clk        => clk125,
            reset      => reset,
            gmii_rxd   => gmii_rxd,
            gmii_rx_dv => gmii_rx_dv,
            gmii_rx_er => gmii_rx_er,
            m_data     => mac_tdata,
            m_valid    => mac_tvalid,
            m_last     => mac_tlast,
            m_ready    => mac_tready,
			debug_state => fifo_q
	);

    --------------------------------------------------------------------
    -- UDP RX
    --------------------------------------------------------------------
    udp_rx_inst : udp_rx
        port map (
            clk        => clk125,
            reset      => reset,
            s_data     => mac_tdata,
            s_valid    => mac_tvalid,
            s_last     => mac_tlast,
            s_ready    => mac_tready,
            fifo_data  => rx_fifo_data,
            fifo_wr_en => rx_fifo_wr_en,
            fifo_last  => rx_fifo_last,
            fifo_full  => fifo_full_i
        );

    --------------------------------------------------------------------
    -- FIFO
    --------------------------------------------------------------------
    fifo_inst : Fifolg
        port map (
            Data        => rx_fifo_data,
            Clock       => clk125,
            WrEn        => rx_fifo_wr_en,
            RdEn        => fifo_rd_en_i,
            Reset       => reset,
            Q           => open,
            Empty       => fifo_empty_i,
            Full        => fifo_full_i,
            AlmostEmpty => fifo_almost_empty_i,
            AlmostFull  => fifo_almost_full_i
        );
	
end rtl;
