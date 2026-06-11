library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_fpga is
    port (
        clk : in std_logic;
        rst : in std_logic;
		Data : out std_logic_vector(7 downto 0);
		fifo_empty : out std_logic;
		fifo_almostfull : out std_logic
    );
end entity top_tb_fpga;

architecture Behavioral of top_tb_fpga is

	--signal next_data: std_logic_vector(7 downto 0);
	signal next_fifo_empty: std_logic;
	signal next_fifo_almostfull: std_logic;

	signal cnt : unsigned(7 downto 0);
	signal next_cnt : unsigned(7 downto 0);
	signal lenght_cnt : integer;
	signal next_lenght_cnt : integer;
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				Data <= (others => '0');
                fifo_empty <= '0';
                fifo_almostfull <= '0';
				cnt <= (others => '0');
				lenght_cnt <= 0;
			else
				Data <= std_logic_vector(next_cnt);
                fifo_empty <= next_fifo_empty;
                fifo_almostfull <= next_fifo_almostfull;
				cnt <= next_cnt;
				lenght_cnt <= next_lenght_cnt;
			end if;
		end if;
	end process;

	process(all)
	begin
		if lenght_cnt <= 2000 then
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