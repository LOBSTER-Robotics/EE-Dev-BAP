library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RX_integration_tb is
end entity;

architecture sim of RX_integration_tb is

    --------------------------------------------------------------------
    -- CLOCKS
    --------------------------------------------------------------------
    constant CLK_PERIOD         : time := 8 ns;
    constant UDP_PAYLOAD_BYTES  : integer := 192;  -- 192 bytes = 1536 bits

    signal clk125    : std_logic := '0';
    signal rgmii_rxc : std_logic := '0';

    signal reset : std_logic := '1';

    --------------------------------------------------------------------
    -- RGMII INPUT
    --------------------------------------------------------------------
    signal rgmii_rxd   : std_logic_vector(3 downto 0) := (others => '0');
    signal rgmii_rxctl : std_logic := '0';

    --------------------------------------------------------------------
    -- RX_integration CONTROL / OUTPUTS
    --------------------------------------------------------------------
    signal i_enable : std_logic := '0';

    signal i_small_fifo_rd_en : std_logic_vector(15 downto 0) := (others => '0');

    signal o_small_fifo_dout : std_logic_vector(255 downto 0);

    signal o_small_fifo_empty        : std_logic_vector(15 downto 0);
    signal o_small_fifo_full         : std_logic_vector(15 downto 0);
    signal o_small_fifo_almost_empty : std_logic_vector(15 downto 0);
    signal o_small_fifo_almost_full  : std_logic_vector(15 downto 0);

    signal o_large_fifo_empty        : std_logic;
    signal o_large_fifo_full         : std_logic;
    signal o_large_fifo_almost_empty : std_logic;
    signal o_large_fifo_almost_full  : std_logic;

    signal o_fifo_sel   : unsigned(3 downto 0);
    signal o_busy       : std_logic;
    signal o_frame_done : std_logic;

    signal frame_done_seen : std_logic := '0';

begin

    --------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------
    dut : entity work.RX_integration
        port map (
            ----------------------------------------------------------------
            -- CLOCK / RESET
            ----------------------------------------------------------------
            clk125      => clk125,
            reset       => reset,

            ----------------------------------------------------------------
            -- RGMII PHY INPUT
            ----------------------------------------------------------------
            rgmii_rxd   => rgmii_rxd,
            rgmii_rxctl => rgmii_rxctl,
            rgmii_rxc   => rgmii_rxc,

            ----------------------------------------------------------------
            -- FIFO CONTROLLER INTERFACE
            ----------------------------------------------------------------
            i_enable => i_enable,

            i_small_fifo_rd_en => i_small_fifo_rd_en,

            o_small_fifo_dout => o_small_fifo_dout,

            o_small_fifo_empty        => o_small_fifo_empty,
            o_small_fifo_full         => o_small_fifo_full,
            o_small_fifo_almost_empty => o_small_fifo_almost_empty,
            o_small_fifo_almost_full  => o_small_fifo_almost_full,

            o_large_fifo_empty        => o_large_fifo_empty,
            o_large_fifo_full         => o_large_fifo_full,
            o_large_fifo_almost_empty => o_large_fifo_almost_empty,
            o_large_fifo_almost_full  => o_large_fifo_almost_full,

            o_fifo_sel   => o_fifo_sel,
            o_busy       => o_busy,
            o_frame_done => o_frame_done
        );

    --------------------------------------------------------------------
    -- CLOCKS
    --------------------------------------------------------------------
    clk125    <= not clk125 after CLK_PERIOD / 2;
    rgmii_rxc <= clk125;

    --------------------------------------------------------------------
    -- STIMULUS
    --------------------------------------------------------------------
    stim : process

        ----------------------------------------------------------------
        -- RGMII BYTE SEND
        -- Low nibble on rising edge, high nibble on falling edge.
        ----------------------------------------------------------------
        procedure send_byte(data : std_logic_vector(7 downto 0)) is
        begin
            wait until rising_edge(rgmii_rxc);
            rgmii_rxd   <= data(3 downto 0);
            rgmii_rxctl <= '1';

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

        report "START RX_integration TEST";
        report "Sending UDP payload of 192 bytes = 1536 bits";

        ----------------------------------------------------------------
        -- PREAMBLE + SFD
        ----------------------------------------------------------------
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");
        send_byte(x"55");

        -- Your original testbench used x"5D".
        -- If your RX expects normal Ethernet SFD byte ordering, use x"D5".
        send_byte(x"5D");

        ----------------------------------------------------------------
        -- ETHERNET + IP + UDP HEADER BYTES
        -- Same 42-byte dummy header style as your original testbench.
        ----------------------------------------------------------------
        for i in 0 to 41 loop
            send_byte(std_logic_vector(to_unsigned(i, 8)));
        end loop;

        ----------------------------------------------------------------
        -- UDP PAYLOAD
        -- 192 bytes = 1536 bits minimum packet payload.
        ----------------------------------------------------------------
        for i in 0 to UDP_PAYLOAD_BYTES - 1 loop
            send_byte(std_logic_vector(to_unsigned((i + 16) mod 256, 8)));
        end loop;

        ----------------------------------------------------------------
        -- END FRAME
        ----------------------------------------------------------------
        wait until rising_edge(rgmii_rxc);
        rgmii_rxctl <= '0';
        rgmii_rxd   <= (others => '0');

        report "Finished sending large RGMII packet";

        ----------------------------------------------------------------
        -- Give integration logic time to move data through FIFOs
        ----------------------------------------------------------------
		i_enable <= '1';
        wait for 2000 ns;
		

        ----------------------------------------------------------------
        -- Read each small FIFO a few times
        ----------------------------------------------------------------
        for read_round in 0 to 15 loop
            for fifo_index in 0 to 15 loop

                if o_small_fifo_empty(fifo_index) = '0' then
                    i_small_fifo_rd_en <= (others => '0');
                    i_small_fifo_rd_en(fifo_index) <= '1';

                    wait until rising_edge(clk125);

                    i_small_fifo_rd_en <= (others => '0');

                    wait until rising_edge(clk125);

                    report "Read pulse issued to small FIFO " &
                           integer'image(fifo_index);
                end if;

            end loop;
        end loop;

        wait for 500 ns;

        assert false
            report "RX_integration TEST COMPLETE"
            severity failure;

    end process;

    --------------------------------------------------------------------
    -- MONITOR
    --------------------------------------------------------------------
    monitor : process(clk125)
    begin
        if rising_edge(clk125) then

            if o_frame_done = '1' and frame_done_seen = '0' then
                report "FRAME DONE ASSERTED";
                frame_done_seen <= '1';
            end if;

            if o_busy = '1' then
                report "RX_integration busy, fifo_sel = " &
                       integer'image(to_integer(o_fifo_sel));
            end if;

            if o_large_fifo_full = '1' then
                report "WARNING: large FIFO full";
            end if;

            if o_large_fifo_almost_full = '1' then
                report "WARNING: large FIFO almost full";
            end if;

        end if;
    end process;

end architecture;