library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_rx is
    generic (
        --------------------------------------------------------------------
        -- RX FILTER GENERICS
        -- Byte order is network order:
        -- LOCAL_MAC_ADDR = x"001122334455" accepts DA 00:11:22:33:44:55
        -- LOCAL_IP_ADDR  = x"C0A80164"     accepts 192.168.1.100
        --
        -- This version is intentionally static:
        --   * Ethernet destination MAC must exactly match LOCAL_MAC_ADDR
        --   * EtherType must be IPv4, x"0800"
        --   * IPv4 first header byte must be x"45"
        --       - IPv4
        --       - IHL = 5 words = 20 bytes
        --       - IPv4 options are not supported and are dropped
        --   * IPv4 protocol must be UDP, x"11"
        --   * IPv4 destination address must exactly match LOCAL_IP_ADDR
        --   * UDP header length is fixed at 8 bytes
        --
        -- Broadcast MAC frames are rejected because the destination MAC check
        -- is an exact unicast/local-address match only.
        --------------------------------------------------------------------
        LOCAL_MAC_ADDR : std_logic_vector(47 downto 0) := x"001122334455";
        LOCAL_IP_ADDR  : std_logic_vector(31 downto 0) := x"C0A80164"
    );
    port (
        clk         : in  std_logic;
        reset       : in  std_logic;

        --------------------------------------------------------------------
        -- AXI INPUT FROM MAC RX
        --------------------------------------------------------------------
        s_data      : in  std_logic_vector(7 downto 0);
        s_valid     : in  std_logic;
        s_last      : in  std_logic;
        s_ready     : out std_logic;

        --------------------------------------------------------------------
        -- FIFO OUTPUT: UDP payload only
        --------------------------------------------------------------------
        fifo_data   : out std_logic_vector(7 downto 0);
        fifo_wr_en  : out std_logic;
        fifo_last   : out std_logic;
        fifo_full   : in  std_logic
    );
end entity;

architecture rtl of udp_rx is

    type state_t is (
        IDLE,
        ETH_HDR,
        IP_HDR,
        UDP_HDR,
        PAYLOAD,
        DROP_FRAME
    );

    constant ETH_HDR_LAST : integer := 13; -- Ethernet header bytes 0..13
    constant IP_HDR_LAST  : integer := 19; -- Static IPv4 header bytes 0..19
    constant UDP_HDR_LAST : integer := 7;  -- UDP header bytes 0..7

    signal state      : state_t := IDLE;
    signal next_state : state_t := IDLE;

    ------------------------------------------------------------------------
    -- Separate counters per FSM section.
    -- Only the counter belonging to the active state is incremented.
    ------------------------------------------------------------------------
    signal eth_cnt      : integer range 0 to ETH_HDR_LAST := 0;
    signal next_eth_cnt : integer range 0 to ETH_HDR_LAST := 0;

    signal ip_cnt       : integer range 0 to IP_HDR_LAST := 0;
    signal next_ip_cnt  : integer range 0 to IP_HDR_LAST := 0;

    signal udp_cnt      : integer range 0 to UDP_HDR_LAST := 0;
    signal next_udp_cnt : integer range 0 to UDP_HDR_LAST := 0;

    signal fifo_data_reg   : std_logic_vector(7 downto 0) := (others => '0');
    signal fifo_wr_reg     : std_logic := '0';
    signal fifo_last_reg   : std_logic := '0';

    signal next_fifo_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal next_fifo_wr    : std_logic := '0';
    signal next_fifo_last  : std_logic := '0';

    signal ready_i : std_logic;

begin

    fifo_data  <= fifo_data_reg;
    fifo_wr_en <= fifo_wr_reg;
    fifo_last  <= fifo_last_reg;

    ------------------------------------------------------------------------
    -- Only apply FIFO backpressure while payload bytes are being written.
    -- Header and drop states always consume bytes until s_last.
    ------------------------------------------------------------------------
    ready_i <= '0' when (state = PAYLOAD and fifo_full = '1') else '1';
    s_ready <= ready_i;

    ------------------------------------------------------------------------
    -- Clocked register process
    ------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state       <= IDLE;
                eth_cnt     <= 0;
                ip_cnt      <= 0;
                udp_cnt     <= 0;

                fifo_data_reg <= (others => '0');
                fifo_wr_reg   <= '0';
                fifo_last_reg <= '0';
            else
                state       <= next_state;
                eth_cnt     <= next_eth_cnt;
                ip_cnt      <= next_ip_cnt;
                udp_cnt     <= next_udp_cnt;

                fifo_data_reg <= next_fifo_data;
                fifo_wr_reg   <= next_fifo_wr;
                fifo_last_reg <= next_fifo_last;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------------
    -- Combinational FSM / next-state process
    ------------------------------------------------------------------------
    process(all)
        variable accept_byte : boolean;
    begin
        next_state       <= state;
        next_eth_cnt     <= eth_cnt;
        next_ip_cnt      <= ip_cnt;
        next_udp_cnt     <= udp_cnt;

        next_fifo_data <= fifo_data_reg;
        next_fifo_wr   <= '0';
        next_fifo_last <= '0';

        accept_byte := s_valid = '1';

        case state is

            ----------------------------------------------------------------
            -- Wait for the first Ethernet byte.
            -- The first accepted byte is Ethernet byte 0.
            ----------------------------------------------------------------
            when IDLE =>
                next_eth_cnt     <= 0;
                next_ip_cnt      <= 0;
                next_udp_cnt     <= 0;

                if accept_byte then
                    -- Ethernet destination MAC byte 0
                    if s_data /= LOCAL_MAC_ADDR(47 downto 40) then
                        if s_last = '1' then
                            next_state <= IDLE;
                        else
                            next_state <= DROP_FRAME;
                        end if;
                    elsif s_last = '1' then
                        next_state <= IDLE;
                    else
                        next_eth_cnt <= 1;
                        next_state   <= ETH_HDR;
                    end if;
                end if;

            ----------------------------------------------------------------
            -- Static Ethernet header parser.
            -- Checks destination MAC bytes 1..5 and EtherType bytes 12..13.
            -- Other Ethernet header bytes are consumed but ignored.
            ----------------------------------------------------------------
            when ETH_HDR =>
                if accept_byte then
                    if s_last = '1' then
                        next_state   <= IDLE;
                        next_eth_cnt <= 0;
                    else
                        case eth_cnt is
                            when 1 =>
                                if s_data /= LOCAL_MAC_ADDR(39 downto 32) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 2 =>
                                if s_data /= LOCAL_MAC_ADDR(31 downto 24) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 3 =>
                                if s_data /= LOCAL_MAC_ADDR(23 downto 16) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 4 =>
                                if s_data /= LOCAL_MAC_ADDR(15 downto 8) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 5 =>
                                if s_data /= LOCAL_MAC_ADDR(7 downto 0) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 12 =>
                                -- EtherType high byte: IPv4 = 0x0800
                                if s_data /= x"08" then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= eth_cnt + 1;
                                end if;

                            when 13 =>
                                -- EtherType low byte: IPv4 = 0x0800
                                if s_data /= x"00" then
                                    next_state <= DROP_FRAME;
                                else
                                    next_eth_cnt <= 0;
                                    next_ip_cnt  <= 0;
                                    next_state   <= IP_HDR;
                                end if;

                            when others =>
                                next_eth_cnt <= eth_cnt + 1;
                        end case;
                    end if;
                end if;

            ----------------------------------------------------------------
            -- Static IPv4 header parser.
            -- Only accepts byte 0 = x"45", meaning:
            --   Version = IPv4
            --   IHL     = 5 words = 20 bytes
            -- Therefore IPv4 options are not accepted.
            ----------------------------------------------------------------
            when IP_HDR =>
                if accept_byte then
                    next_ip_cnt <= ip_cnt + 1;
                    if s_last = '1' then
                        next_state  <= IDLE;
                        next_ip_cnt <= 0;
                    else
                        case ip_cnt is
                            when 0 =>
                                -- IPv4, 20-byte header, no options
                                if s_data /= x"45" then
                                    next_state <= DROP_FRAME;
                                end if;

                            when 9 =>
                                -- Protocol: UDP = 0x11
                                if s_data /= x"11" then
                                    next_state <= DROP_FRAME;
                                end if;

                            when 16 =>
                                if s_data /= LOCAL_IP_ADDR(31 downto 24) then
                                    next_state <= DROP_FRAME;
                                end if;

                            when 17 =>
                                if s_data /= LOCAL_IP_ADDR(23 downto 16) then
                                    next_state <= DROP_FRAME;
                                end if;

                            when 18 =>
                                if s_data /= LOCAL_IP_ADDR(15 downto 8) then
                                    next_state <= DROP_FRAME;
                                end if;

                            when 19 =>
                                if s_data /= LOCAL_IP_ADDR(7 downto 0) then
                                    next_state <= DROP_FRAME;
                                else
                                    next_ip_cnt  <= 0;
                                    next_udp_cnt <= 0;
                                    next_state   <= UDP_HDR;
                                end if;

                            when others =>

                        end case;
                    end if;
                end if;

            ----------------------------------------------------------------
            -- Static UDP header parser.
            -- UDP header is always 8 bytes. This design consumes those bytes
            -- and starts writing the following bytes as UDP payload.
            ----------------------------------------------------------------
            when UDP_HDR =>
                if accept_byte then
                    if s_last = '1' then
                        next_state   <= IDLE;
                        next_udp_cnt <= 0;
                    elsif udp_cnt = UDP_HDR_LAST then
                        next_udp_cnt     <= 0;
                        next_state       <= PAYLOAD;
                        next_fifo_wr   <= '0';
                    else
                        next_udp_cnt <= udp_cnt + 1;
                    end if;
                end if;

            ----------------------------------------------------------------
            -- Write UDP payload only.
            ----------------------------------------------------------------
            when PAYLOAD =>
                if accept_byte then
                    next_fifo_wr   <= '1';
                    next_fifo_data <= s_data;
                end if;
                if s_last = '1' then
                    next_fifo_last   <= '1';
                    next_state       <= IDLE;
                end if;

            ----------------------------------------------------------------
            -- Consume the rest of the frame without writing to FIFO.
            ----------------------------------------------------------------
            when DROP_FRAME =>
                next_fifo_wr   <= '0';
                next_fifo_last <= '0';

                if s_last = '1' then
                    next_state       <= IDLE;
                    next_eth_cnt     <= 0;
                    next_ip_cnt      <= 0;
                    next_udp_cnt     <= 0;
                end if;

        end case;
    end process;

end architecture;
