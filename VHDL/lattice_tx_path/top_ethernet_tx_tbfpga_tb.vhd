library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_fpga_tb is
end entity;

architecture tb of top_tb_fpga_tb is

    -- DUT signals
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';

    signal rgmii_txd   : std_logic_vector(3 downto 0);
    signal rgmii_txctl : std_logic;
    signal rgmii_txc   : std_logic;

begin

    ------------------------------------------------------------------
    -- Instantiate your design (DUT)
    ------------------------------------------------------------------
    dut : entity work.top_tb_fpga
        port map (
            clk => clk,
            rst => rst,

            rgmii_txd   => rgmii_txd,
            rgmii_txctl => rgmii_txctl,
            rgmii_txc   => rgmii_txc
        );

    ------------------------------------------------------------------
    -- Clock generator (125 MHz)
    ------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 4 ns;
            clk <= '1';
            wait for 4 ns;
        end loop;
    end process;

    ------------------------------------------------------------------
    -- Reset generator
    ------------------------------------------------------------------
    rst_process : process
    begin
        rst <= '1';
        wait for 80 ns;
        rst <= '0';
        wait;
    end process;

end architecture;