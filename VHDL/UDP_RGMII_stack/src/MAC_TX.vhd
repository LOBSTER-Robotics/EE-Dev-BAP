library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eth_mac_tx is
port (
    clk      : in  std_logic;
    reset    : in  std_logic;

    --------------------------------------------------------------------
    -- Input Stream
    --------------------------------------------------------------------
    s_data   : in  std_logic_vector(7 downto 0);
    s_valid  : in  std_logic;
    s_last   : in  std_logic;
    s_ready  : out std_logic;

    --------------------------------------------------------------------
    -- MAC Output
    --------------------------------------------------------------------
    tx_data  : out std_logic_vector(7 downto 0);
    tx_valid : out std_logic
);
end entity;

architecture rtl of eth_mac_tx is

    --------------------------------------------------------------------
    -- FSM
    --------------------------------------------------------------------
    type state_t is (
        IDLE,
        PREAMBLE,
        PAYLOAD,
        PADDING,
        CRC,
        IFG
    );

    signal state : state_t := IDLE;

    --------------------------------------------------------------------
    -- Counters
    --------------------------------------------------------------------
    signal pre_cnt  : integer range 0 to 7 := 0;
    signal pad_cnt  : integer range 0 to 63 := 0;
    signal crc_cnt  : integer range 0 to 3 := 0;
    signal ifg_cnt  : integer range 0 to 11 := 0;

    signal frame_len : integer := 0;

    --------------------------------------------------------------------
    -- CRC
    --------------------------------------------------------------------
    signal crc_reg   : std_logic_vector(31 downto 0)
        := (others => '1');

    signal crc_next  : std_logic_vector(31 downto 0);

    signal crc_input : std_logic_vector(7 downto 0);

begin

    --------------------------------------------------------------------
    -- CRC Input Selection
    --------------------------------------------------------------------
    crc_input <= s_data when state = PAYLOAD else x"00";

    --------------------------------------------------------------------
    -- CRC Generator
    --------------------------------------------------------------------
    crc_inst : entity work.crc32_8
    port map (
        crcIn  => crc_reg,
        data   => crc_input,
        crcOut => crc_next
    );

    --------------------------------------------------------------------
    -- Main FSM
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            --report "STATE=" & state_t'image(state);
            if reset = '1' then

                state <= IDLE;

                tx_valid <= '0';
                tx_data  <= (others => '0');

                s_ready <= '0';

                crc_reg <= (others => '1');

                pre_cnt <= 0;
                pad_cnt <= 0;
                crc_cnt <= 0;
                ifg_cnt <= 0;

                frame_len <= 0;

            else

                --------------------------------------------------------
                -- Defaults
                --------------------------------------------------------
                tx_valid <= '0';
                s_ready  <= '0';

                case state is

                    ----------------------------------------------------
                    -- IDLE
                    ----------------------------------------------------
                    when IDLE =>

                        crc_reg <= (others => '1');

                        frame_len <= 0;

                        s_ready <= '1';
                        if s_valid = '1' then

                            pre_cnt <= 0;
                            state <= PREAMBLE;

                        end if;

                    ----------------------------------------------------
                    -- PREAMBLE + SFD
                    ----------------------------------------------------
                    when PREAMBLE =>

                        tx_valid <= '1';

                        if pre_cnt < 7 then
                            tx_data <= x"55";
                        else
                            tx_data <= x"D5";
                        end if;

                        if pre_cnt = 7 then
                            state <= PAYLOAD;
                        else
                            pre_cnt <= pre_cnt + 1;
                        end if;

                    ----------------------------------------------------
                    -- PAYLOAD
                    ----------------------------------------------------
                    when PAYLOAD =>
                        --report "STATE = PAYLOAD";
                        s_ready <= '1';

                        if s_valid = '1' then

                            ------------------------------------------------
                            -- Send byte
                            ------------------------------------------------
                            tx_valid <= '1';
                            tx_data  <= s_data;

                            ------------------------------------------------
                            -- Update CRC
                            ------------------------------------------------
                            crc_reg <= crc_next;

                            ------------------------------------------------
                            -- Frame length
                            ------------------------------------------------
                            frame_len <= frame_len + 1;

                            ------------------------------------------------
                            -- End of payload
                            ------------------------------------------------
                            if s_last = '1' then

                                if frame_len < 59 then

                                    ------------------------------------------------
                                    -- Pad to minimum Ethernet frame
                                    ------------------------------------------------
                                    pad_cnt <= 59 - (frame_len + 1);
                                    state <= PADDING;

                                else

                                    ------------------------------------------------
                                    -- Send CRC next
                                    ------------------------------------------------
                                    crc_cnt <= 0;
                                    state <= CRC;

                                end if;

                            end if;

                        end if;

                    ----------------------------------------------------
                    -- PADDING
                    ----------------------------------------------------
                    when PADDING =>

                        tx_valid <= '1';
                        tx_data  <= x"00";

                        ------------------------------------------------
                        -- Update CRC with padding byte
                        ------------------------------------------------
                        crc_reg <= crc_next;

                        if pad_cnt = 0 then

                            crc_cnt <= 0;
                            state <= CRC;

                        else

                            pad_cnt <= pad_cnt - 1;

                        end if;

                    ----------------------------------------------------
                    -- CRC TRANSMIT
                    ----------------------------------------------------
                    when CRC =>

                        tx_valid <= '1';

                        case crc_cnt is

                            when 0 =>
                                tx_data <= not crc_reg(7 downto 0);

                            when 1 =>
                                tx_data <= not crc_reg(15 downto 8);

                            when 2 =>
                                tx_data <= not crc_reg(23 downto 16);

                            when others =>
                                tx_data <= not crc_reg(31 downto 24);

                        end case;

                        if crc_cnt = 3 then

                            ifg_cnt <= 0;
                            state <= IFG;

                        else

                            crc_cnt <= crc_cnt + 1;

                        end if;

                    ----------------------------------------------------
                    -- INTERFRAME GAP
                    ----------------------------------------------------
                    when IFG =>

                        tx_valid <= '0';

                        if ifg_cnt = 11 then

                            state <= IDLE;

                        else

                            ifg_cnt <= ifg_cnt + 1;

                        end if;

                end case;

            end if;

        end if;
    end process;

end architecture;