library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
--TX
--

entity rgmii_tx_ddr is
port (
    clk125   : in  std_logic;
    reset    : in  std_logic;

    txd_in   : in  std_logic_vector(7 downto 0);
    tx_en    : in  std_logic;
    tx_er    : in  std_logic;

    rgmii_txd  : out std_logic_vector(3 downto 0) := (others => '0');
    rgmii_txctl: out std_logic := '0';
    rgmii_txc  : out std_logic
);
end entity;

architecture rtl of rgmii_tx_ddr is
    --signal txd_reg : std_logic_vector(7 downto 0) := (others => '0');
    signal ctl_reg : std_logic := '0';
	
	signal data_tx : std_logic_vector(9 downto 0) := (others => '0');
	signal dout_tx : std_logic_vector(4 downto 0) := (others => '0');
begin
	ctl_reg <= tx_en xor tx_er;
	
	data_tx <= ctl_reg & txd_in(7 downto 4) & ctl_reg & txd_in(3 downto 0);
 
    DDR_TX: entity work.DDR_Transmit port map (
        clkout =>rgmii_txc,
        refclk =>clk125, 
        reset =>reset,
        data =>data_tx,
        dout =>dout_tx
		);
		
	rgmii_txd <= dout_tx(3 downto 0);
	rgmii_txctl <= dout_tx(4);

end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
--RX
--
entity rgmii_rx is
port (
    rx_clk   : in  std_logic;
    reset    : in  std_logic;

    rgmii_rxd   : in  std_logic_vector(3 downto 0);
    rgmii_rxctl : in  std_logic;

    rx_dout  : out std_logic_vector(7 downto 0);
    rx_dv    : out std_logic;
    rx_er    : out std_logic
);
end entity;

architecture rtl of rgmii_rx is

	signal data_out : std_logic_vector(9 downto 0);
	signal data_in : std_logic_vector(4 downto 0);

begin

	data_in <= rgmii_rxctl & rgmii_rxd(3 downto 0);

	DDR_RX: entity work.DDR_Recieve port map (
		clkin => rx_clk,
		reset => reset,
		sclk => open,
		datain => data_in, 
		q => data_out
	);
	
	rx_dout <= data_out(8 downto 5) & data_out(3 downto 0);
	rx_dv <= data_out(4);
	rx_er <= data_out(4) xor data_out(9);

end architecture;