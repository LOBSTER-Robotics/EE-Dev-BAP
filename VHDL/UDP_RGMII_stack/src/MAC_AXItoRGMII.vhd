library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAC_AXItoRGMII is
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
    gmii_txd   : out std_logic_vector(7 downto 0);
    gmii_tx_en : out std_logic;
    gmii_tx_er : out std_logic;

    --------------------------------------------------------------------
    -- Debug Output
    -- debug_state(0) = IDLE
    -- debug_state(1) = PREAMBLE
    -- debug_state(2) = PAYLOAD
    -- debug_state(3) = PADDING
    -- debug_state(4) = CRC
    -- debug_state(5) = IFG
    -- debug_state(6) = frame active, state /= IDLE
    -- debug_state(7) = input handshake active, PAYLOAD and s_valid
    --------------------------------------------------------------------
    debug_state : out std_logic_vector(7 downto 0)
);
end entity;

architecture rtl of MAC_AXItoRGMII is

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

    signal state, next_state : state_t;

    --------------------------------------------------------------------
    -- Counters
    --------------------------------------------------------------------
    signal pre_cnt, next_pre_cnt : integer range 0 to 7 := 0;
    signal pad_cnt, next_pad_cnt : integer range 0 to 63 := 0;
    signal crc_cnt, next_crc_cnt : integer range 0 to 3 := 0;
    signal ifg_cnt, next_ifg_cnt : integer range 0 to 11 := 0;

    signal frame_len, next_frame_len : integer range 0 to 1600 := 0;

    --------------------------------------------------------------------
    -- CRC
    --------------------------------------------------------------------
    signal crc_reg, next_crc_reg : std_logic_vector(31 downto 0);
    signal crc_next  : std_logic_vector(31 downto 0);
    signal crc_input : std_logic_vector(7 downto 0);

begin

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
    -- Debug Output
    --------------------------------------------------------------------
    process(all)
    begin
        debug_state <= (others => '0');

        case state is
            when IDLE =>
                debug_state(0) <= '1';

            when PREAMBLE =>
                debug_state(1) <= '1';

            when PAYLOAD =>
                debug_state(2) <= '1';

            when PADDING =>
                debug_state(3) <= '1';

            when CRC =>
                debug_state(4) <= '1';

            when IFG =>
                debug_state(5) <= '1';
        end case;

        -- Frame active: any state except IDLE
        if state /= IDLE then
            debug_state(6) <= '1';
        else
            debug_state(6) <= '0';
        end if;

        -- Input stream is being accepted in PAYLOAD
        if s_valid = '1' then
            debug_state(7) <= '1';
        else
            debug_state(7) <= '0';
        end if;
    end process;

    --------------------------------------------------------------------
    -- Registers
    --------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then

                state      <= IDLE;
                pre_cnt    <= 0;
                pad_cnt    <= 0;
                crc_cnt    <= 0;
                ifg_cnt    <= 0;
                frame_len  <= 0;
                crc_reg    <= (others => '1');

            else

                state      <= next_state;
                pre_cnt    <= next_pre_cnt;
                pad_cnt    <= next_pad_cnt;
                crc_cnt    <= next_crc_cnt;
                ifg_cnt    <= next_ifg_cnt;
                frame_len  <= next_frame_len;
                crc_reg    <= next_crc_reg;

            end if;
        end if;
    end process;

    --------------------------------------------------------------------
    -- Main FSM
    --------------------------------------------------------------------
    process(all)
    begin

        ----------------------------------------------------------------
        -- defaults
        ----------------------------------------------------------------
        next_state     <= state;

        next_pre_cnt   <= pre_cnt;
        next_pad_cnt   <= pad_cnt;
        next_crc_cnt   <= crc_cnt;
        next_ifg_cnt   <= ifg_cnt;
        next_frame_len <= frame_len;
        next_crc_reg   <= crc_reg;

        gmii_tx_en <= '0';
        gmii_tx_er <= '0';
        gmii_txd   <= (others => '0');
        s_ready    <= '0';

        ----------------------------------------------------------------
        -- CRC input default
        ----------------------------------------------------------------
        crc_input <= x"00";

        case state is

            ------------------------------------------------------------
            -- IDLE
            ------------------------------------------------------------
            when IDLE =>

                next_frame_len <= 0;
                next_crc_reg   <= (others => '1');

                if s_valid = '1' then
                    next_pre_cnt <= 0;
                    next_state   <= PREAMBLE;
                end if;

            ------------------------------------------------------------
            -- PREAMBLE
            ------------------------------------------------------------
            when PREAMBLE =>

                gmii_tx_en <= '1';

                if pre_cnt < 7 then
                    gmii_txd <= x"55";
                else
                    gmii_txd <= x"D5";
                end if;

                if pre_cnt = 7 then
                    next_state <= PAYLOAD;
                else
                    next_pre_cnt <= pre_cnt + 1;
                end if;

            ------------------------------------------------------------
            -- PAYLOAD
            ------------------------------------------------------------
            when PAYLOAD =>

                s_ready <= '1';

                if s_valid = '1' then

                    gmii_tx_en <= '1';
                    gmii_txd   <= s_data;

                    crc_input    <= s_data;
                    next_crc_reg <= crc_next;

                    next_frame_len <= frame_len + 1;

                    if s_last = '1' then

                        if frame_len < 58 then
                            next_pad_cnt <= 57 - frame_len;
                            next_state   <= PADDING;
                        else
                            next_crc_cnt <= 0;
                            next_state   <= CRC;
                        end if;

                    end if;

                end if;

            ------------------------------------------------------------
            -- PADDING
            ------------------------------------------------------------
            when PADDING =>

                gmii_tx_en <= '1';
                gmii_txd   <= x"00";

                crc_input    <= x"00";
                next_crc_reg <= crc_next;

                if pad_cnt = 0 then
                    next_crc_cnt <= 0;
                    next_state   <= CRC;
                else
                    next_pad_cnt <= pad_cnt - 1;
                end if;

            ------------------------------------------------------------
            -- CRC
            ------------------------------------------------------------
            when CRC =>

                gmii_tx_en <= '1';

                case crc_cnt is
                    when 0 => gmii_txd <= not crc_reg(7 downto 0);
                    when 1 => gmii_txd <= not crc_reg(15 downto 8);
                    when 2 => gmii_txd <= not crc_reg(23 downto 16);
                    when 3 => gmii_txd <= not crc_reg(31 downto 24);
                    when others => gmii_txd <= (others => '1');
                end case;

                if crc_cnt = 3 then
                    next_ifg_cnt <= 0;
                    next_state   <= IFG;
                else
                    next_crc_cnt <= crc_cnt + 1;
                end if;

            ------------------------------------------------------------
            -- IFG: inter frame gap
            ------------------------------------------------------------
            when IFG =>

                gmii_tx_en <= '0';

                if ifg_cnt = 11 then
                    next_state <= IDLE;
                else
                    next_ifg_cnt <= ifg_cnt + 1;
                end if;

        end case;

    end process;

end architecture;