library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_packetizer is
port (
    clk       : in  std_logic;
    reset     : in  std_logic;

    -- FIFO interface
    fifo_data : in  std_logic_vector(7 downto 0);
    fifo_empty: in  std_logic;
    fifo_rd   : out std_logic;

    -- MAC interface
    tx_data   : out std_logic_vector(7 downto 0);
    tx_valid  : out std_logic;
    tx_last   : out std_logic
);
end entity;

architecture rtl of udp_packetizer is

type state_t is (
    IDLE,
    ETH_HDR,
    IP_HDR,
    UDP_HDR,
    PAYLOAD,
    DONE
);

signal state : state_t := IDLE;
signal new_state : state_t := IDLE;

signal new_tx_data   : std_logic_vector(7 downto 0) := "00000000";
signal new_tx_valid  : std_logic := '0';
signal new_tx_last   : std_logic := '0';
signal new_fifo_rd   : std_logic := '0';

signal cnt : integer := 0;
signal new_cnt : integer := 0;

constant PAYLOAD_SIZE : integer := 1472; --32

type byte_array is array(natural range <>) of std_logic_vector(7 downto 0);

------------------------------------------------------------
-- Ethernet Header
------------------------------------------------------------
constant eth_header : byte_array(0 to 13) := (
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- dest MAC
    x"12",x"34",x"56",x"78",x"9A",x"BC", -- src MAC
    x"08",x"00"                          -- IPv4
);

------------------------------------------------------------
-- IPv4 Header (minimal)
------------------------------------------------------------
constant ip_header : byte_array(0 to 19) := (
    x"45", x"00",
    x"00", x"3C", -- total length
    x"00", x"00",
    x"00", x"00",
    x"40", x"11", -- TTL + UDP
    x"00", x"00", -- checksum placeholder
    x"C0", x"A8", x"01", x"0A", -- src IP
    x"C0", x"A8", x"01", x"64"  -- dst IP
);

------------------------------------------------------------
-- UDP Header
------------------------------------------------------------
constant udp_header : byte_array(0 to 7) := (
    x"04", x"D2", -- src port 1234
    x"16", x"2E", -- dst port 5678
    x"00", x"28", -- length
    x"00", x"00"  -- checksum disabled
);

begin

process(clk)
begin
    if rising_edge(clk) then

        if reset = '1' then
            state <= IDLE;
            cnt <= 0;
            tx_valid <= '0';
            tx_last <= '0';
            --fifo_rd <= '0';
            tx_data <= "00000000";
        else
            state <= new_state;
            cnt <= new_cnt;
            tx_data <= new_tx_data;
            tx_valid <= new_tx_valid;
            tx_last <= new_tx_last;
            --fifo_rd <= new_fifo_rd;
        end if;
    end if;
end process;

process(state, cnt, fifo_empty, fifo_data)
begin
    --new_state <= state;
    case state is
        ------------------------------------------------
        when IDLE =>
            new_cnt <= 0;
            new_tx_valid <= '0';
            fifo_rd <= '0';

            if fifo_empty = '0' then
                new_state <= ETH_HDR;
            else
                new_state <= IDLE;
            end if;

        ------------------------------------------------
        when ETH_HDR =>
            new_tx_valid <= '1';
            new_tx_data <= eth_header(cnt);

            if cnt = 13 then
                new_cnt <= 0;
                new_state <= IP_HDR;
            else
                new_cnt <= cnt + 1;
                new_state <= ETH_HDR;
            end if;

        ------------------------------------------------
        when IP_HDR =>
            new_tx_valid <= '1';
            new_tx_data <= ip_header(cnt);

            if cnt = 19 then
                new_cnt <= 0;
                new_state <= UDP_HDR;
            else
                new_cnt <= cnt + 1;
                new_state <= IP_HDR;
            end if;

        ------------------------------------------------
        when UDP_HDR =>
            new_tx_valid <= '1';
            new_tx_data <= udp_header(cnt);

            if cnt = 7 then
                new_cnt <= 0;
                new_state <= PAYLOAD;
                fifo_rd <= '1';--start early
            else
                new_cnt <= cnt + 1;
                new_state <= UDP_HDR;
            end if;

        ------------------------------------------------
        when PAYLOAD =>

            new_tx_valid <= '1';
            new_tx_data <= fifo_data;

            if cnt = PAYLOAD_SIZE-1 or fifo_empty = '1' then  --cnt = PAYLOAD_SIZE-1 then
                new_tx_last <= '1';
                fifo_rd <= '0';
                new_state <= DONE;
            else
                new_cnt <= cnt + 1;
                fifo_rd <= '1';
                new_state <= PAYLOAD;
            end if;

        ------------------------------------------------
        when DONE =>
            new_tx_last <= '0';
            fifo_rd <= '0';
            new_state <= IDLE;

            new_tx_valid <= '0';
            new_tx_data <= fifo_data;
        ------------------------------------------------
        when others =>
            new_state <= IDLE;
    end case;
end process;


end architecture;