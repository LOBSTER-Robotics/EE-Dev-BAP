library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_RX_tb is
end entity;

architecture sim of TOP_RX_tb is

    --------------------------------------------------------------------
    -- CLOCKS
    --------------------------------------------------------------------
    constant CLK_PERIOD : time := 8 ns;

    signal clk125   : std_logic := '0';
    signal rgmii_rxc : std_logic := '0';

    signal reset : std_logic := '1';

    --------------------------------------------------------------------
    -- RGMII INPUT
    --------------------------------------------------------------------
    signal rgmii_rxd   : std_logic_vector(3 downto 0) := (others => '0');
    signal rgmii_rxctl : std_logic := '0';

    --------------------------------------------------------------------
    -- FIFO OUTPUT
    --------------------------------------------------------------------
    signal fifo_data  : std_logic_vector(7 downto 0);
    signal fifo_wr_en : std_logic;
    signal fifo_last  : std_logic;
    signal fifo_full  : std_logic := '0';

    signal rx_cnt : integer := 0;

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.TOP_RX
    port map (
        clk125      => clk125,
        reset       => reset,

        rgmii_rxd   => rgmii_rxd,
        rgmii_rxctl => rgmii_rxctl,
        rgmii_rxc   => rgmii_rxc,

        fifo_data   => fifo_data,
        fifo_wr_en  => fifo_wr_en,
        fifo_last   => fifo_last,
        fifo_full   => fifo_full
    );

    --------------------------------------------------------------------
    -- CLOCKS
    --------------------------------------------------------------------
    clk125   <= not clk125 after CLK_PERIOD/2;
    rgmii_rxc <= clk125;-- after 2 ns;

    
    --------------------------------------------------------------------
    -- STIMULUS
    --------------------------------------------------------------------
    stim : process
        --------------------------------------------------------------------
        -- RGMII BYTE SEND (SIMPLIFIED: 1 BYTE PER CYCLE MODEL)
        --------------------------------------------------------------------
        procedure send_byte(data : std_logic_vector(7 downto 0)) is
        begin
            -- low nibble
            wait until rising_edge(rgmii_rxc);
            rgmii_rxd   <= data(3 downto 0);
            rgmii_rxctl <= '1';

            -- high nibble
            wait until falling_edge(rgmii_rxc);
            rgmii_rxd   <= data(7 downto 4);
            rgmii_rxctl <= '1';
        end procedure;

    begin

        ----------------------------------------------------------------
        -- RESET
        ----------------------------------------------------------------
        wait for 50 ns;
        reset <= '0';

        wait for 50 ns;

        report "START TOP RX TEST";

        ----------------------------------------------------------------
        -- PREAMBLE (8x 0x55 + 0xD5 handled by MAC RX)
        ----------------------------------------------------------------
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"5D");

        ----------------------------------------------------------------
        -- ETHERNET + IP + UDP (ignored by UDP parser)
        ----------------------------------------------------------------
        for i in 0 to 41 loop
            send_byte(std_logic_vector(to_unsigned(i, 8)));
        end loop;

        ----------------------------------------------------------------
        -- UDP PAYLOAD (THIS SHOULD APPEAR AT OUTPUT FIFO)
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
        -- END FRAME (drop RXDV)
        ----------------------------------------------------------------
        wait until rising_edge(rgmii_rxc);
        rgmii_rxctl <= '0';

        wait for 200 ns;

        assert false
        report "TOP RX TEST COMPLETE"
        severity failure;

    end process;

    --------------------------------------------------------------------
    -- MONITOR FIFO OUTPUT
    --------------------------------------------------------------------
    monitor : process(clk125)
    begin
        if rising_edge(clk125) then

            if fifo_wr_en = '1' then
                report "FIFO[" & integer'image(rx_cnt) &
                       "] = 0x" & to_hstring(fifo_data);

                rx_cnt <= rx_cnt + 1;
            end if;

            if fifo_last = '1' then
                report "FIFO LAST ASSERTED";
            end if;

        end if;
    end process;

end architecture;