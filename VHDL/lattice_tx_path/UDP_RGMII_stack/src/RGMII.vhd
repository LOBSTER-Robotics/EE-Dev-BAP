library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
--TX
--

entity rgmii_tx is
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

architecture rtl of rgmii_tx is
    signal txd_reg : std_logic_vector(7 downto 0) := (others => '0');
    signal ctl_reg : std_logic := '0';
begin

    process(clk125)
    begin
        if rising_edge(clk125) then
            txd_reg <= txd_in;
            ctl_reg <= tx_en xor tx_er;
        end if;
    end process;

    -- DDR transmit (simplified behavioral model)
    process(clk125)
    begin
        if rising_edge(clk125) then
            rgmii_txd   <= txd_reg(3 downto 0); -- low nibble
            rgmii_txctl <= ctl_reg;
        elsif falling_edge(clk125) then
            rgmii_txd   <= txd_reg(7 downto 4); -- high nibble
            rgmii_txctl <= ctl_reg;
        end if;
    end process;

    rgmii_txc <= clk125;

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