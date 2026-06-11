library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_to_uart_byte is
    port (
        Clk         : in  std_logic;
        Rst         : in  std_logic;

        -- FIFO side
        Fifo_Q      : in  std_logic_vector(7 downto 0);
        Fifo_Empty  : in  std_logic;
        Fifo_RdEn   : out std_logic;

        -- UART TX side
        Tx_Valid    : out std_logic;
        Tx_Ready    : in  std_logic;
        Tx_Data     : out std_logic_vector(7 downto 0)
    );
end entity fifo_to_uart_byte;

architecture rtl of fifo_to_uart_byte is

    type state_t is (
        IDLE,
        READ_FIFO,
        WAIT_FIFO_Q,
        LOAD_UART,
        WAIT_UART_ACCEPT
    );

    signal state : state_t := IDLE;

begin

    process (Clk)
    begin
        if rising_edge(Clk) then
            if Rst = '1' then
                state     <= IDLE;
                Fifo_RdEn <= '0';
                Tx_Valid  <= '0';
                Tx_Data   <= (others => '0');

            else
                -- Defaults
                Fifo_RdEn <= '0';

                case state is

                    ----------------------------------------------------
                    -- Wait for FIFO data and UART availability
                    ----------------------------------------------------
                    when IDLE =>
                        Tx_Valid <= '0';

                        if Fifo_Empty = '0' and Tx_Ready = '1' then
                            state <= READ_FIFO;
                        end if;

                    ----------------------------------------------------
                    -- Pulse FIFO read enable
                    ----------------------------------------------------
                    when READ_FIFO =>
                        Fifo_RdEn <= '1';
                        state     <= WAIT_FIFO_Q;

                    ----------------------------------------------------
                    -- Wait for synchronous FIFO Q to update
                    ----------------------------------------------------
                    when WAIT_FIFO_Q =>
                        state <= LOAD_UART;

                    ----------------------------------------------------
                    -- Load byte into UART transmit bus
                    ----------------------------------------------------
                    when LOAD_UART =>
                        Tx_Data  <= Fifo_Q;
                        Tx_Valid <= '1';
                        state    <= WAIT_UART_ACCEPT;

                    ----------------------------------------------------
                    -- Hold Tx_Valid until UART accepts byte
                    ----------------------------------------------------
                    when WAIT_UART_ACCEPT =>
                        Tx_Valid <= '1';

                        if Tx_Ready = '1' then
                            Tx_Valid <= '0';

                            if Fifo_Empty = '0' then
                                state <= READ_FIFO;
                            else
                                state <= IDLE;
                            end if;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture rtl;