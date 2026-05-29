library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_echo is
    port (
        Clk     : in  std_logic;
        Rst     : in  std_logic;

        Uart_Tx : out std_logic;
        Uart_Rx : in  std_logic;
		leds : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of uart_echo is

    signal tx_valid         : std_logic := '0';
    signal tx_ready         : std_logic;
    signal tx_data          : std_logic_vector(7 downto 0);

    signal rx_valid         : std_logic;
    signal rx_data          : std_logic_vector(7 downto 0);
    signal rx_parity_error  : std_logic;

    signal echo_pending     : std_logic := '0';
    signal echo_data        : std_logic_vector(7 downto 0);

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
            Uart_Rx         => Uart_Rx,
			Debug_Leds_n    => leds
        );

    --------------------------------------------------------------------------
    -- Echo received bytes
    --------------------------------------------------------------------------
    process (Clk)
    begin
        if rising_edge(Clk) then

            if Rst = '1' then
                tx_valid     <= '0';
                echo_pending <= '0';

            else

                -- Default: deassert valid after handshake
                if tx_valid = '1' and tx_ready = '1' then
                    tx_valid <= '0';
                end if;

                -- Store received byte
                if rx_valid = '1' then
                    echo_data    <= rx_data;
                    echo_pending <= '1';
                end if;

                -- Send stored byte when transmitter is ready
                if echo_pending = '1' and tx_valid = '0' then
                    tx_data      <= echo_data;
                    tx_valid     <= '1';
                    echo_pending <= '0';
                end if;

            end if;

        end if;
    end process;

end architecture;