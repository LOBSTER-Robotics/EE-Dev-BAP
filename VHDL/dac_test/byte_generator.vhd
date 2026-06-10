library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity byte_generator is
    port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        enable        : in  std_logic;
        fifo_full     : in  std_logic;
        Data          : out std_logic_vector(15 downto 0);
        fifo_write_en : out std_logic
    );
end entity byte_generator;

architecture rtl of byte_generator is

    constant TOTAL_BYTES_C : natural := 65536;

    type state_t is (
        IDLE,
        WRITE_FIFO
    );

    signal state       : state_t := IDLE;

    signal data_cnt    : unsigned(15 downto 0) := (others => '0');
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
                            state <= WRITE_FIFO;
                        end if;

                    ----------------------------------------------------
                    -- Write 65536 values (0x0000 -> 0xFFFF) into FIFO
                    ----------------------------------------------------
                    when WRITE_FIFO =>

                        if fifo_full = '0' then
                            fifo_write_en <= '1';
                            Data          <= std_logic_vector(data_cnt);

                            if write_count = TOTAL_BYTES_C - 1 then
                                -- 0xFFFF is written this cycle, then wrap
                                state       <= IDLE;
                                write_count <= 0;
                                data_cnt    <= (others => '0');
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