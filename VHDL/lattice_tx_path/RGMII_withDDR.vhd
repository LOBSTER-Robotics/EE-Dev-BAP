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
 
    DDR_TX: entity work.DDR_forRGMII port map (
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
    signal low_nibble  : std_logic_vector(3 downto 0);
    signal high_nibble : std_logic_vector(3 downto 0);
    signal ctl_rise, ctl_fall, next_dv, next_er : std_logic;
    signal next_rx_dout : std_logic_vector(7 downto 0);
begin

    process(rx_clk, high_nibble, ctl_fall)
    begin
        if rising_edge(rx_clk) then
            low_nibble <= rgmii_rxd;
            ctl_rise   <= rgmii_rxctl;
            
            next_rx_dout <= high_nibble & rgmii_rxd;
            next_dv <= rgmii_rxctl;
            next_er <= rgmii_rxctl xor ctl_fall;
        elsif falling_edge(rx_clk) then
            high_nibble <= rgmii_rxd;
            ctl_fall    <= rgmii_rxctl;
        end if;
    end process;

    process(rx_clk, next_rx_dout, ctl_rise, ctl_fall)
    begin
        if rising_edge(rx_clk) then
            rx_dout <= next_rx_dout;

            rx_dv <= next_dv;
            rx_er <= next_er;
        end if;
    end process;

end architecture;