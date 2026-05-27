library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_rx_tb is
end entity;

architecture sim of mac_rx_tb is

    --------------------------------------------------------------------
    -- CLOCK
    --------------------------------------------------------------------
    constant CLK_PERIOD : time := 8 ns;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';

    --------------------------------------------------------------------
    -- GMII RX INPUTS
    --------------------------------------------------------------------
    signal gmii_rxd   : std_logic_vector(7 downto 0) := (others => '0');
    signal gmii_rx_dv : std_logic := '0';
    signal gmii_rx_er : std_logic := '0';

    --------------------------------------------------------------------
    -- AXI OUTPUTS
    --------------------------------------------------------------------
    signal m_data  : std_logic_vector(7 downto 0);
    signal m_valid : std_logic;
    signal m_last  : std_logic;
    signal m_ready : std_logic := '1';

    --------------------------------------------------------------------
    -- COUNTER
    --------------------------------------------------------------------
    signal rx_cnt : integer := 0;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.mac_rx
    port map (
        clk        => clk,
        reset      => reset,

        gmii_rxd   => gmii_rxd,
        gmii_rx_dv => gmii_rx_dv,
        gmii_rx_er => gmii_rx_er,

        m_data     => m_data,
        m_valid    => m_valid,
        m_last     => m_last,
        m_ready    => m_ready
    );

    --------------------------------------------------------------------
    -- CLOCK
    --------------------------------------------------------------------
    clk <= not clk after CLK_PERIOD/2;

    --------------------------------------------------------------------
    -- STIMULUS
    --------------------------------------------------------------------
    stim_proc : process

        ----------------------------------------------------------------
        -- SEND BYTE PROCEDURE
        ----------------------------------------------------------------
        procedure send_byte(data : std_logic_vector(7 downto 0)) is
        begin
            gmii_rxd   <= data;
            gmii_rx_dv <= '1';

            wait until rising_edge(clk);
        end procedure;

    begin

        ----------------------------------------------------------------
        -- RESET
        ----------------------------------------------------------------
        wait for 40 ns;

        reset <= '0';

        wait for 20 ns;

        report "START RX TEST";

        ----------------------------------------------------------------
        -- PREAMBLE
        ----------------------------------------------------------------
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");

        ----------------------------------------------------------------
        -- SFD
        ----------------------------------------------------------------
        send_byte(x"D5");

        ----------------------------------------------------------------
        -- PAYLOAD
        ----------------------------------------------------------------
        send_byte(x"11");
        send_byte(x"22");
        send_byte(x"33");
        send_byte(x"44");
        send_byte(x"55");
        send_byte(x"66");
        send_byte(x"77");
        send_byte(x"88");

        ----------------------------------------------------------------
        -- END FRAME
        ----------------------------------------------------------------
        gmii_rx_dv <= '0';

        wait until rising_edge(clk);

        ----------------------------------------------------------------
        -- WAIT
        ----------------------------------------------------------------
        wait for 200 ns;

        assert false
        report "RX TEST COMPLETE"
        severity failure;

    end process;

    --------------------------------------------------------------------
    -- MONITOR OUTPUT
    --------------------------------------------------------------------
    monitor_proc : process(clk)
    begin
        if rising_edge(clk) then

            if m_valid = '1' then

                report
                    "RX[" &
                    integer'image(rx_cnt) &
                    "] = 0x" &
                    to_hstring(m_data);

                rx_cnt <= rx_cnt + 1;

            end if;

            if m_last = '1' then

                report "RX LAST ASSERTED";

            end if;

        end if;
    end process;

end architecture;