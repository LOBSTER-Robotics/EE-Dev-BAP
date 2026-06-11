library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UDP_FIFO_AXI is
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;

        -- FIFO input
        fifo_data       : in  std_logic_vector(7 downto 0);
        fifo_empty      : in  std_logic;
        fifo_almostfull : in  std_logic;
        fifo_rd_en      : out std_logic;

        -- AXI-stream output to MAC
        t_data  : out std_logic_vector(7 downto 0);
        t_valid : out std_logic;
        t_ready : in  std_logic;
        t_last  : out std_logic;

        -- Debug bits
        -- debug_state(0) = IDLE
        -- debug_state(1) = ETH_HDR
        -- debug_state(2) = IP_HDR
        -- debug_state(3) = UDP_HDR
        -- debug_state(4) = PAYLOAD
        -- debug_state(5) = DONE
        -- debug_state(6) = frame active / not IDLE
        debug_state : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of UDP_FIFO_AXI is

    type state_t is (
        IDLE,
        ETH_HDR,
        IP_HDR,
        UDP_HDR,
        PAYLOAD,
        DONE
    );

    type byte_array is array (natural range <>) of std_logic_vector(7 downto 0);

    constant eth_header : byte_array(0 to 13) := (
        x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",
        x"12",x"34",x"56",x"78",x"9A",x"BC",
        x"08",x"00"
    );

    constant ip_header : byte_array(0 to 19) := (
        x"45", x"00",
        x"00", x"3C",
        x"00", x"00",
        x"00", x"00",
        x"40", x"11",
        x"00", x"00",
        x"C0", x"A8", x"01", x"0A",
        x"C0", x"A8", x"01", x"64"
    );

    constant udp_header : byte_array(0 to 7) := (
        x"04", x"D2",
        x"16", x"2E",
        x"00", x"28",
        x"00", x"00"
    );

    signal state, next_state : state_t;

    signal idx, next_idx : integer range 0 to 255 := 0;
    signal pld_cnt, next_pld_cnt : integer range 0 to 1500 := 0;

begin

    --------------------------------------------------------------------
    -- State register
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state   <= IDLE;
                idx     <= 0;
                pld_cnt <= 0;
            else
                state   <= next_state;
                idx     <= next_idx;
                pld_cnt <= next_pld_cnt;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Debug state output
    --------------------------------------------------------------------
    process(all)
    begin
        debug_state <= (others => '0');

        case state is
            when IDLE =>
                debug_state(0) <= '1';

            when ETH_HDR =>
                debug_state(1) <= '1';

            when IP_HDR =>
                debug_state(2) <= '1';

            when UDP_HDR =>
                debug_state(3) <= '1';

            when PAYLOAD =>
                debug_state(4) <= '1';

            when DONE =>
                debug_state(5) <= '1';
        end case;

        if state /= IDLE then
            debug_state(6) <= '1';
        end if;
        if pld_cnt >= 1440 then
            debug_state(7) <= '1';
        end if;
    end process;

    --------------------------------------------------------------------
    -- Main FSM
    --------------------------------------------------------------------
    process(all)
    begin

        -- defaults
        next_state   <= state;
        next_idx     <= idx;
        next_pld_cnt <= pld_cnt;

        t_valid    <= '0';
        t_last     <= '0';
        fifo_rd_en <= '0';
        t_data     <= (others => '0');

        case state is

            ------------------------------------------------------------
            -- IDLE
            ------------------------------------------------------------
            when IDLE =>
                next_idx <= 0;

                if fifo_almostfull = '1' then
                    next_state <= ETH_HDR;
                    next_idx   <= 0;
                end if;

            ------------------------------------------------------------
            -- Ethernet header
            ------------------------------------------------------------
            when ETH_HDR =>

                t_valid <= '1';
                t_data  <= eth_header(idx);

                if t_ready = '1' then
                    if idx = eth_header'length - 1 then
                        next_state <= IP_HDR;
                        next_idx   <= 0;
                    else
                        next_idx <= idx + 1;
                    end if;
                end if;

            ------------------------------------------------------------
            -- IP header
            ------------------------------------------------------------
            when IP_HDR =>

                t_valid <= '1';
                t_data  <= ip_header(idx);

                if t_ready = '1' then
                    if idx = ip_header'length - 1 then
                        next_state <= UDP_HDR;
                        next_idx   <= 0;
                    else
                        next_idx <= idx + 1;
                    end if;
                end if;

            ------------------------------------------------------------
            -- UDP header
            ------------------------------------------------------------
            when UDP_HDR =>

                t_valid <= '1';
                t_data  <= udp_header(idx);

                if t_ready = '1' then
                    if idx = udp_header'length - 1 then
                        next_state   <= PAYLOAD;
                        next_idx     <= 0;
                        fifo_rd_en   <= '1';
                        next_pld_cnt <= 0;
                    -- Remove elsif or change the -int to fix when bytes start
                    elsif idx >= udp_header'length - 2 then
                        fifo_rd_en <= '1';
                        next_idx   <= idx + 1;
                    else
                        next_idx <= idx + 1;
                    end if;
                end if;

            ------------------------------------------------------------
            -- PAYLOAD
            ------------------------------------------------------------
            when PAYLOAD =>

                t_valid      <= '1';
                t_data       <= fifo_data;

                if fifo_empty = '0' and t_ready = '1' and pld_cnt < 1438 then
                    fifo_rd_en <= '1';
                    next_pld_cnt <= pld_cnt + 1;
                elsif fifo_empty = '0' and t_ready = '1' and pld_cnt < 1439 then
                    next_pld_cnt <= pld_cnt + 1;
                elsif fifo_empty = '1' or pld_cnt >= 1439 then
                    next_state   <= DONE;
                    t_last       <= '1';
                    next_pld_cnt <= 0;
                end if;

            ------------------------------------------------------------
            -- DONE
            ------------------------------------------------------------
            when DONE =>
                t_valid    <= '0';
                next_state <= IDLE;

        end case;

    end process;

end architecture;