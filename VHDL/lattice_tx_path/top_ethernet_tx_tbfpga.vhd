library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_fpga is
    port (
        clk : in std_logic;
        rst : in std_logic;
		enable : in std_logic;
		Data : out std_logic_vector(7 downto 0);
		fifo_write_en : out std_logic
    );
end entity top_tb_fpga;

architecture Behavioral of top_tb_fpga is
	signal Data: std_logic_vector(7 downto 0);
	signal fifo_empty: std_logic;
	signal fifo_almostfull: std_logic;
	signal Read_large_fifo: std_logic :='0';
	
	--signal next_data: std_logic_vector(7 downto 0);
	signal next_fifo_empty: std_logic;
	signal next_fifo_almostfull: std_logic;
	
	signal cnt : unsigned(7 downto 0);
	signal next_cnt : unsigned(7 downto 0);
	signal lenght_cnt : integer;
	signal next_lenght_cnt : integer;
begin
dut : entity work.top_ethernet_tx
        port map (
            clk                 => clk,
            rst                 => rst,
            Data                => Data,
			write_enable_fifo   => write_enable_fifo,
			rgmii_txd => rgmii_txd,
			rgmii_txctl => rgmii_txctl,
			rgmii_txc => rgmii_txc
        );

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				Data <= (others => '0');
				
				cnt <= (others => '0');
				lenght_cnt <= 0;
			else
				Data <= std_logic_vector(next_cnt);
				
				cnt <= next_cnt;
				lenght_cnt <= next_lenght_cnt;
			end if;
		end if;
	end process;
	
	process(all)
	begin
		if lenght_cnt <= 80 then
			next_lenght_cnt <= lenght_cnt + 1;
			next_cnt <= cnt + 1;
			
			next_fifo_empty <= '0';
			next_fifo_almostfull <= '1';
		else
			next_lenght_cnt <= 0;
			next_cnt <= cnt;
			
			next_fifo_empty <= '1';
			next_fifo_almostfull <= '0';
		end if;
	end process;
end Behavioral;