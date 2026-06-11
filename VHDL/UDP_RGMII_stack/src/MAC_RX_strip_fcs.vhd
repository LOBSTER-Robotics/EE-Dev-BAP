library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mac_rx is
port (
    clk         : in  std_logic;
    reset       : in  std_logic;

    --------------------------------------------------------------------
    -- GMII INPUT
    -- The rgmii module converts the rgmii to gmii
    --------------------------------------------------------------------
    gmii_rxd    : in  std_logic_vector(7 downto 0);
    gmii_rx_dv  : in  std_logic;
    gmii_rx_er  : in  std_logic;

    --------------------------------------------------------------------
    -- AXI STREAM OUTPUT
    -- Output contains Ethernet frame bytes without the final 4-byte FCS.
    --------------------------------------------------------------------
    m_data      : out std_logic_vector(7 downto 0);
    m_valid     : out std_logic;
    m_last      : out std_logic;
    m_ready     : in  std_logic
);
end entity;

architecture rtl of mac_rx is

    --------------------------------------------------------------------
    -- FSM
    --------------------------------------------------------------------
    type state_t is (
        IDLE,
        PREAMBLE,
        PAYLOAD,
        LAST_BYTE,
        DROP
    );

    signal state   : state_t := IDLE;
    signal pre_cnt : integer range 0 to 7 := 0;

    --------------------------------------------------------------------
    -- Output registers
    --------------------------------------------------------------------
    signal data_reg  : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_reg : std_logic := '0';
    signal last_reg  : std_logic := '0';

    --------------------------------------------------------------------
    -- Five-byte delay line
    -- At end of frame:
    --   d0 = final non-FCS frame byte
    --   d1 = FCS byte 0
    --   d2 = FCS byte 1
    --   d3 = FCS byte 2
    --   d4 = FCS byte 3
    -- This lets the MAC strip d1..d4 and assert m_last on d0.
    --------------------------------------------------------------------
    signal d0, d1, d2, d3, d4 : std_logic_vector(7 downto 0) := (others => '0');
    signal byte_cnt           : unsigned(15 downto 0) := (others => '0');

    signal pending_last_data  : std_logic_vector(7 downto 0) := (others => '0');

begin

    --------------------------------------------------------------------
    -- Outputs
    --------------------------------------------------------------------
    m_data  <= data_reg;
    m_valid <= valid_reg;
    m_last  <= last_reg;

    --------------------------------------------------------------------
    -- Clocked FSM
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state             <= IDLE;
                pre_cnt           <= 0;
                data_reg          <= (others => '0');
                valid_reg         <= '0';
                last_reg          <= '0';
                d0                <= (others => '0');
                d1                <= (others => '0');
                d2                <= (others => '0');
                d3                <= (others => '0');
                d4                <= (others => '0');
                byte_cnt          <= (others => '0');
                pending_last_data <= (others => '0');
            else
                ----------------------------------------------------------------
                -- Default pulse outputs
                ----------------------------------------------------------------
                valid_reg <= '0';
                last_reg  <= '0';

                case state is

                    ----------------------------------------------------------------
                    -- Wait for start of preamble
                    ----------------------------------------------------------------
                    when IDLE =>
                        pre_cnt  <= 0;
                        byte_cnt <= (others => '0');

                        if gmii_rx_dv = '1' then
                            if gmii_rxd = x"55" then
                                pre_cnt <= 1;
                                state   <= PREAMBLE;
                            else
                                state <= DROP;
                            end if;
                        end if;

                    ----------------------------------------------------------------
                    -- Detect 7x 0x55 preamble bytes and 1x 0xD5 SFD
                    ----------------------------------------------------------------
                    when PREAMBLE =>
                        if gmii_rx_dv = '0' then
                            state <= IDLE;
                        elsif gmii_rx_er = '1' then
                            state <= DROP;
                        elsif pre_cnt < 7 then
                            if gmii_rxd = x"55" then
                                pre_cnt <= pre_cnt + 1;
                            else
                                state <= DROP;
                            end if;
                        else
                            if gmii_rxd = x"D5" then
                                state    <= PAYLOAD;
                                byte_cnt <= (others => '0');
                            else
                                state <= DROP;
                            end if;
                        end if;

                    ----------------------------------------------------------------
                    -- Receive frame bytes after SFD and keep the last 5 delayed.
                    -- The output stream starts after 5 received bytes. At EOF,
                    -- d1..d4 are the 4 CRC/FCS bytes and are not transmitted.
                    ----------------------------------------------------------------
                    when PAYLOAD =>
                        if gmii_rx_er = '1' then
                            state <= DROP;

                        elsif gmii_rx_dv = '1' then
                            if byte_cnt >= 5 then
                                if m_ready = '1' then
                                    data_reg  <= d0;
                                    valid_reg <= '1';

                                    d0 <= d1;
                                    d1 <= d2;
                                    d2 <= d3;
                                    d3 <= d4;
                                    d4 <= gmii_rxd;

                                    byte_cnt <= byte_cnt + 1;
                                else
                                    -- GMII cannot be back-pressured. Drop the rest
                                    -- of this frame if downstream is not ready.
                                    state <= DROP;
                                end if;
                            else
                                -- Fill the delay line first.
                                case to_integer(byte_cnt) is
                                    when 0      => d0 <= gmii_rxd;
                                    when 1      => d1 <= gmii_rxd;
                                    when 2      => d2 <= gmii_rxd;
                                    when 3      => d3 <= gmii_rxd;
                                    when others => d4 <= gmii_rxd;
                                end case;

                                byte_cnt <= byte_cnt + 1;
                            end if;

                        else
                            --------------------------------------------------------
                            -- End of frame. Need at least 5 bytes so that d0 is
                            -- the final non-FCS byte and d1..d4 are the FCS bytes.
                            --------------------------------------------------------
                            if byte_cnt >= 5 then
                                pending_last_data <= d0;
                                state <= LAST_BYTE;
                            else
                                -- Invalid runt frame: fewer than 1 output byte + 4 FCS bytes.
                                state <= IDLE;
                            end if;
                        end if;

                    ----------------------------------------------------------------
                    -- Send final non-FCS byte with m_last.
                    ----------------------------------------------------------------
                    when LAST_BYTE =>
                        if m_ready = '1' then
                            data_reg  <= pending_last_data;
                            valid_reg <= '1';
                            last_reg  <= '1';
                            state     <= IDLE;
                        end if;

                    ----------------------------------------------------------------
                    -- Drop until end of current GMII frame
                    ----------------------------------------------------------------
                    when DROP =>
                        if gmii_rx_dv = '0' then
                            state <= IDLE;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture;
