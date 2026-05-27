library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_udp_reg is
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;

        -- From FIFO to UDP
        fifo_data  : in  std_logic_vector(7 downto 0);
        fifo_empty : in  std_logic;
        fifo_almostfull  : in  std_logic;
        reg_fifo_rd_en : out std_logic;

        -- FROM UDP to FIFO
        reg_fifo_data  : out  std_logic_vector(7 downto 0);
        reg_fifo_empty : out  std_logic;
        reg_fifo_almostfull  : out  std_logic;
        fifo_rd_en : in std_logic

        
    );
end entity;

architecture rtl of fifo_udp_reg is

    signal data_reg         : std_logic_vector(7 downto 0);
    signal empty_reg        : std_logic;
    signal almostfull_reg   : std_logic;
    signal rd_en_reg        : std_logic;

begin
    -- Register incoming FIFO signals
    process(clk, rst)
    begin
        if rst = '1' then
            data_reg       <= (others => '0');
            empty_reg      <= '1';
            almostfull_reg <= '0';
            rd_en_reg      <= '0';

        elsif rising_edge(clk) then
            data_reg       <= fifo_data;
            empty_reg      <= fifo_empty;
            almostfull_reg <= fifo_almostfull;
            rd_en_reg      <= fifo_rd_en;
        end if;
    end process;

    -- Drive outputs from registers
    reg_fifo_data       <= data_reg;
    reg_fifo_empty      <= empty_reg;
    reg_fifo_almostfull <= almostfull_reg;
    reg_fifo_rd_en      <= rd_en_reg;

end architecture rtl;