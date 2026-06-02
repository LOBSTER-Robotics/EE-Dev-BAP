library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_fpga is
    port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        enable        : in  std_logic;
        fifo_full     : in  std_logic;
        Data          : out std_logic_vector(7 downto 0);
        fifo_write_en : out std_logic
    );
end entity top_tb_fpga;

architecture rtl of top_tb_fpga is

    constant TOTAL_BYTES_C : natural := 1500;

    type state_t is (
        IDLE,
        WRITE_FIFO
    );

    signal state       : state_t := IDLE;

    signal data_cnt    : unsigned(7 downto 0) := (others => '0');
    signal write_count : natural range 0 to TOTAL_BYTES_C - 1 := 0;

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state         <= IDLE;
                data_cnt      <= (others => '0');
                write_count   <= 0;
                Data          <= (others => '0');
                fifo_write_en <= '0';

            else

                case state is

                    ----------------------------------------------------
                    -- Wait for one-clock enable pulse
                    ----------------------------------------------------
                    when IDLE =>
                        fifo_write_en <= '0';
                        Data          <= (others => '0');
                        data_cnt      <= (others => '0');
                        write_count   <= 0;

                        if enable = '1' then
                            -- Prepare first byte
                            Data          <= std_logic_vector(data_cnt);
                            fifo_write_en <= '1';
                            state         <= WRITE_FIFO;
                        end if;

                    ----------------------------------------------------
                    -- Write 1600 bytes into FIFO
                    ----------------------------------------------------
                    when WRITE_FIFO =>

                        if fifo_full = '0' then
                            fifo_write_en <= '1';
                            Data          <= std_logic_vector(data_cnt);

                            if write_count = TOTAL_BYTES_C - 1 then
                                fifo_write_en <= '0';
                                state         <= IDLE;
                                write_count   <= 0;
                                data_cnt      <= (others => '0');
                            else
                                write_count <= write_count + 1;
                                data_cnt    <= data_cnt + 1;
                            end if;

                        else
                            fifo_write_en <= '0';
                        end if;

                end case;

            end if;
        end if;
    end process;

end architecture rtl;