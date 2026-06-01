library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_rx is
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

    --------------------------------------------------------------------
    -- FIXED RX FILTER CONSTANTS
    -- Byte order is network order:
    -- LOCAL_MAC_ADDR = x"001122334455" accepts DA 00:11:22:33:44:55
    -- LOCAL_IP_ADDR  = x"C0A80164"     accepts 192.168.1.100
    -- Change these constants to match your FPGA/board address.
    --------------------------------------------------------------------
    constant LOCAL_MAC_ADDR : std_logic_vector(47 downto 0) := x"001122334455";
    constant LOCAL_IP_ADDR  : std_logic_vector(31 downto 0) := x"C0A80164";

    type state_t is (
        IDLE,
        ETH_HDR,
        IP_HDR,
        UDP_HDR,
        PAYLOAD,
        DROP_FRAME
    );

    signal state      : state_t := IDLE;
    signal next_state : state_t := IDLE;

    -- Counts the byte index inside the current header/payload section.
    signal cnt        : integer range 0 to 255 := 0;
    signal next_cnt   : integer range 0 to 255 := 0;

    signal dst_mac        : std_logic_vector(47 downto 0) := (others => '0');
    signal next_dst_mac   : std_logic_vector(47 downto 0) := (others => '0');
    signal dst_ip         : std_logic_vector(31 downto 0) := (others => '0');
    signal next_dst_ip    : std_logic_vector(31 downto 0) := (others => '0');
    signal eth_type       : std_logic_vector(15 downto 0) := (others => '0');
    signal next_eth_type  : std_logic_vector(15 downto 0) := (others => '0');

    signal mac_ok       : std_logic := '0';
    signal next_mac_ok  : std_logic := '0';
    signal ip_ok        : std_logic := '0';
    signal next_ip_ok   : std_logic := '0';
    signal udp_ok       : std_logic := '0';
    signal next_udp_ok  : std_logic := '0';

    -- IPv4 header length in bytes. Minimum 20, maximum 60.
    signal ip_hdr_len      : integer range 0 to 60 := 20;
    signal next_ip_hdr_len : integer range 0 to 60 := 20;

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

    -- Only apply FIFO backpressure while actual payload bytes are being written.
    ready_i <= '0' when (state = PAYLOAD and fifo_full = '1') else '1';
    s_ready <= ready_i;

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state      <= IDLE;
                cnt        <= 0;
                dst_mac    <= (others => '0');
                dst_ip     <= (others => '0');
                eth_type   <= (others => '0');
                mac_ok     <= '0';
                ip_ok      <= '0';
                udp_ok     <= '0';
                ip_hdr_len <= 20;

                fifo_data_reg <= (others => '0');
                fifo_wr_reg   <= '0';
                fifo_last_reg <= '0';
            else
                state      <= next_state;
                cnt        <= next_cnt;
                dst_mac    <= next_dst_mac;
                dst_ip     <= next_dst_ip;
                eth_type   <= next_eth_type;
                mac_ok     <= next_mac_ok;
                ip_ok      <= next_ip_ok;
                udp_ok     <= next_udp_ok;
                ip_hdr_len <= next_ip_hdr_len;

                fifo_data_reg <= next_fifo_data;
                fifo_wr_reg   <= next_fifo_wr;
                fifo_last_reg <= next_fifo_last;
            end if;
        end if;
    end process;

    process(all)
        variable accept_byte : boolean;
        variable mac_v       : std_logic_vector(47 downto 0);
        variable ip_v        : std_logic_vector(31 downto 0);
        variable eth_v       : std_logic_vector(15 downto 0);
        variable ihl_v       : integer range 0 to 60;
        variable ip_ok_v    : std_logic;
        variable udp_ok_v   : std_logic;
    begin
        next_state      <= state;
        next_cnt        <= cnt;
        next_dst_mac    <= dst_mac;
        next_dst_ip     <= dst_ip;
        next_eth_type   <= eth_type;
        next_mac_ok     <= mac_ok;
        next_ip_ok      <= ip_ok;
        next_udp_ok     <= udp_ok;
        next_ip_hdr_len <= ip_hdr_len;

        next_fifo_data <= fifo_data_reg;
        next_fifo_wr   <= '0';
        next_fifo_last <= '0';

        accept_byte := (s_valid = '1' and ready_i = '1');
        mac_v := dst_mac;
        ip_v  := dst_ip;
        eth_v := eth_type;
        ihl_v := ip_hdr_len;
        ip_ok_v := ip_ok;
        udp_ok_v := udp_ok;

        case state is

            when IDLE =>
                next_cnt        <= 0;
                next_dst_mac    <= (others => '0');
                next_dst_ip     <= (others => '0');
                next_eth_type   <= (others => '0');
                next_mac_ok     <= '0';
                next_ip_ok      <= '0';
                next_udp_ok     <= '0';
                next_ip_hdr_len <= 20;

                if accept_byte then
                    -- First Ethernet byte is already present in IDLE.
                    next_dst_mac <= x"0000000000" & s_data;
                    if s_last = '1' then
                        next_state <= IDLE;
                    else
                        next_cnt   <= 1;
                        next_state <= ETH_HDR;
                    end if;
                end if;

            when ETH_HDR =>
                if accept_byte then
                    if cnt <= 5 then
                        mac_v := dst_mac(39 downto 0) & s_data;
                        next_dst_mac <= mac_v;

                        if cnt = 5 then
                            -- Exact unicast destination MAC match only.
                            -- Broadcast FF:FF:FF:FF:FF:FF is intentionally rejected.
                            if mac_v = LOCAL_MAC_ADDR then
                                next_mac_ok <= '1';
                            else
                                next_mac_ok <= '0';
                            end if;
                        end if;

                    elsif cnt = 12 then
                        eth_v := s_data & x"00";
                        next_eth_type <= eth_v;

                    elsif cnt = 13 then
                        eth_v := eth_type(15 downto 8) & s_data;
                        next_eth_type <= eth_v;

                        -- Only IPv4 frames are forwarded to the UDP parser.
                        if mac_ok = '1' and eth_v = x"0800" then
                            next_cnt   <= 0;
                            next_state <= IP_HDR;
                        else
                            next_state <= DROP_FRAME;
                        end if;
                    end if;

                    if s_last = '1' then
                        next_state <= IDLE;
                    elsif cnt < 13 then
                        next_cnt <= cnt + 1;
                    end if;
                end if;

            when IP_HDR =>
                if accept_byte then
                    if cnt = 0 then
                        -- IPv4 version and IHL.
                        ihl_v := to_integer(unsigned(s_data(3 downto 0))) * 4;
                        next_ip_hdr_len <= ihl_v;

                        if s_data(7 downto 4) /= "0100" or ihl_v < 20 then
                            next_state <= DROP_FRAME;
                        end if;

                    elsif cnt = 9 then
                        -- Protocol field: 0x11 = UDP.
                        if s_data = x"11" then
                            udp_ok_v := '1';
                            next_udp_ok <= '1';
                        else
                            udp_ok_v := '0';
                            next_udp_ok <= '0';
                        end if;

                    elsif cnt >= 16 and cnt <= 19 then
                        ip_v := dst_ip(23 downto 0) & s_data;
                        next_dst_ip <= ip_v;

                        if cnt = 19 then
                            -- Exact destination IPv4 match only.
                            if ip_v = LOCAL_IP_ADDR then
                                ip_ok_v := '1';
                                next_ip_ok <= '1';
                            else
                                ip_ok_v := '0';
                                next_ip_ok <= '0';
                            end if;
                        end if;
                    end if;

                    if s_last = '1' then
                        next_state <= IDLE;
                    elsif cnt = ip_hdr_len - 1 then
                        if ip_ok_v = '1' and udp_ok_v = '1' then
                            next_cnt   <= 0;
                            next_state <= UDP_HDR;
                        else
                            next_state <= DROP_FRAME;
                        end if;
                    elsif next_state /= DROP_FRAME then
                        next_cnt <= cnt + 1;
                    end if;
                end if;

            when UDP_HDR =>
                if accept_byte then
                    if s_last = '1' then
                        next_state <= IDLE;
                    elsif cnt = 7 then
                        -- Do not write the checksum byte. Payload starts on next byte.
                        next_cnt   <= 0;
                        next_state <= PAYLOAD;
                    else
                        next_cnt <= cnt + 1;
                    end if;
                end if;

            when PAYLOAD =>
                if accept_byte then
                    next_fifo_data <= s_data;
                    next_fifo_wr   <= '1';

                    if s_last = '1' then
                        next_fifo_last <= '1';
                        next_state     <= IDLE;
                        next_cnt       <= 0;
                    else
                        next_cnt <= cnt + 1;
                    end if;
                end if;

            when DROP_FRAME =>
                if accept_byte and s_last = '1' then
                    next_state <= IDLE;
                    next_cnt   <= 0;
                end if;

        end case;
    end process;

end architecture;
