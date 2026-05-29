library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_tx_test is
    port (
        Clk     : in  std_logic;
        Rst     : in  std_logic;

        Uart_Tx : out std_logic;
        Uart_Rx : in  std_logic    -- unused
    );
end entity;

architecture rtl of uart_tx_test is

    signal tx_valid         : std_logic := '0';
    signal tx_ready         : std_logic;
    signal tx_data          : std_logic_vector(7 downto 0) := x"55";

    signal rx_valid         : std_logic;
    signal rx_data          : std_logic_vector(7 downto 0);
    signal rx_parity_error  : std_logic;

begin

    --------------------------------------------------------------------------
    -- UART
    --------------------------------------------------------------------------
    u_uart : entity work.olo_intf_uart
        generic map (
            ClkFreq_g  => 125.0e6,
            BaudRate_g => 115.2e3,
            DataBits_g => 8,
            StopBits_g => "1",
            Parity_g   => "none"
        )
        port map (
            Clk             => Clk,
            Rst             => Rst,

            Tx_Valid        => tx_valid,
            Tx_Ready        => tx_ready,
            Tx_Data         => tx_data,

            Rx_Valid        => rx_valid,
            Rx_Data         => rx_data,
            Rx_ParityError  => rx_parity_error,

            Uart_Tx         => Uart_Tx,
            Uart_Rx         => Uart_Rx
        );

    --------------------------------------------------------------------------
    -- Continuously transmit 0x55
    --------------------------------------------------------------------------
    process (Clk)
    begin
        if rising_edge(Clk) then

            if Rst = '1' then
                tx_valid <= '0';

            else

                -- Present a new byte whenever the UART is ready
                if tx_ready = '1' then
                    tx_valid <= '1';
                    tx_data  <= x"55";
                else
                    tx_valid <= '0';
                end if;

            end if;
        end if;
    end process;

end architecture;