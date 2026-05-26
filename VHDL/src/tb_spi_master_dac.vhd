library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_dac_tb is
end entity spi_master_dac_tb;

architecture sim of spi_master_dac_tb is

    signal clk        : std_logic := '0';
    signal rst        : std_logic := '1';
    signal data_in    : std_logic_vector(15 downto 0) := (others => '0');
    signal fifo_empty : std_logic_vector(0 downto 0)  := "1";
    signal read_en    : std_logic_vector(0 downto 0);
    signal sdi        : std_logic_vector(0 downto 0);
    signal cs_n       : std_logic;
    signal spi_clk    : std_logic;

begin

    clk <= not clk after 10 ns;

    dut : entity work.spi_master_dac
        generic map (Num_Channels => 1)
        port map (
            clk => clk, rst => rst,
            data_in => data_in, fifo_empty => fifo_empty, read_en => read_en,
            sdi => sdi, cs_n => cs_n, spi_clk => spi_clk
        );

    process
    begin
        rst <= '1';
        wait for 100 ns;
        rst <= '0';

        -- Frame 1
        data_in <= x"AAAA";
        fifo_empty <= "0";
        wait for 600 ns;

        -- Frame 2
        data_in <= x"1234";
        wait for 600 ns;

        -- Stall
        fifo_empty <= "1";
        wait for 200 ns;

        -- Frame 3
        data_in <= x"DEAD";
        fifo_empty <= "0";
        wait for 600 ns;

        fifo_empty <= "1";
        wait for 200 ns;

        wait;
    end process;

end architecture sim;