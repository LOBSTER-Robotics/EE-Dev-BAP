library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_echo_tb is
end entity;

architecture sim of uart_echo_tb is

    ---------------------------------------------------------------------------
    -- Clock / UART constants
    ---------------------------------------------------------------------------
    constant ClkPeriod_c : time := 8 ns;  -- 125 MHz
    constant BaudRate_c  : integer := 115200;
    constant BitTime_c   : time := 1 sec / BaudRate_c;

    ---------------------------------------------------------------------------
    -- DUT signals
    ---------------------------------------------------------------------------
    signal Clk     : std_logic := '0';
    signal Rst     : std_logic := '1';

    signal Uart_Tx : std_logic;
    signal Uart_Rx : std_logic := '1';

    ---------------------------------------------------------------------------
    -- UART helper procedures
    ---------------------------------------------------------------------------

    procedure UartSendByte(
        signal SerialLine : out std_logic;
        constant Data     : in  std_logic_vector(7 downto 0)
    ) is
    begin
        -- Start bit
        SerialLine <= '0';
        wait for BitTime_c;

        -- Data bits LSB first
        for i in 0 to 7 loop
            SerialLine <= Data(i);
            wait for BitTime_c;
        end loop;

        -- Stop bit
        SerialLine <= '1';
        wait for BitTime_c;
    end procedure;

    procedure UartReceiveByte(
        signal SerialLine : in  std_logic;
        variable Data     : out std_logic_vector(7 downto 0)
    ) is
    begin
        -- Wait for start bit
        wait until SerialLine = '0';

        -- Sample middle of first data bit
        wait for BitTime_c + BitTime_c/2;

        -- Data bits LSB first
        for i in 0 to 7 loop
            Data(i) := SerialLine;

            if i /= 7 then
                wait for BitTime_c;
            end if;
        end loop;

        -- Stop bit
        wait for BitTime_c;
    end procedure;

begin

    ---------------------------------------------------------------------------
    -- Clock generation
    ---------------------------------------------------------------------------
    Clk <= not Clk after ClkPeriod_c/2;

    ---------------------------------------------------------------------------
    -- DUT
    ---------------------------------------------------------------------------
    dut : entity work.uart_echo
        port map (
            Clk     => Clk,
            Rst     => Rst,
            Uart_Tx => Uart_Tx,
            Uart_Rx => Uart_Rx
        );

    ---------------------------------------------------------------------------
    -- Stimulus
    ---------------------------------------------------------------------------
    stim_proc : process

        variable RxByte_v : std_logic_vector(7 downto 0);

    begin

        -----------------------------------------------------------------------
        -- Reset
        -----------------------------------------------------------------------
        wait for 100 ns;
        Rst <= '0';

        wait for 1 us;

        -----------------------------------------------------------------------
        -- Send 'A'
        -----------------------------------------------------------------------
        report "Sending character A";

        UartSendByte(Uart_Rx, x"41");

        -----------------------------------------------------------------------
        -- Expect echo
        -----------------------------------------------------------------------
        UartReceiveByte(Uart_Tx, RxByte_v);

        assert RxByte_v = x"41"
            report "Echo mismatch. Expected 0x41, got "
            & integer'image(to_integer(unsigned(RxByte_v)))
            severity failure;

        report "Echo test PASSED";

        wait for 1 ms;

        report "Simulation finished";
        wait;

    end process;

end architecture;