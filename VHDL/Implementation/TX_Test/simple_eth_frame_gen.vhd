library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----Example port map
-- test_gen_inst : entity work.simple_eth_frame_gen
--     port map (
--         clk   => clk125,
--         reset => reset,

--         txd   => mac_txd_8bit,
--         tx_en => mac_tx_en,
--         tx_er => mac_tx_er
--     );

entity simple_eth_frame_gen is
    generic (
        CLK_FREQ_HZ : integer := 125_000_000;
        PERIOD_US   : integer := 1000          -- 1 ms
    );
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;               -- active high reset

        txd     : out std_logic_vector(7 downto 0);
        tx_en   : out std_logic;
        tx_er   : out std_logic
    );
end entity;

architecture rtl of simple_eth_frame_gen is

    -- Ethernet frame:
    --
    -- Preamble:  55 55 55 55 55 55 55
    -- SFD:       D5
    --
    -- Destination MAC: FF FF FF FF FF FF
    -- Source MAC:      02 00 00 00 00 01
    -- Ethertype:       88 B5
    -- Payload:         "RGMII TEST FRAME 0001" + zero padding
    -- FCS:             D1 0F C9 7E
    --
    -- Total after SFD:
    -- 60 bytes payload/header + 4 bytes FCS = 64 bytes Ethernet frame
    --
    -- Total sent including preamble/SFD:
    -- 72 bytes

    type byte_array_t is array (natural range <>) of std_logic_vector(7 downto 0);

    constant FRAME : byte_array_t := (
        -- Preamble + SFD
        x"55", x"55", x"55", x"55", x"55", x"55", x"55", x"D5",

        -- Destination MAC: broadcast
        x"FF", x"FF", x"FF", x"FF", x"FF", x"FF",

        -- Source MAC: 02:00:00:00:00:01
        x"02", x"00", x"00", x"00", x"00", x"01",

        -- Ethertype: 0x88B5
        x"88", x"B5",

        -- Payload: "RGMII TEST FRAME 0001"
        x"52", x"47", x"4D", x"49", x"49", x"20", x"54", x"45",
        x"53", x"54", x"20", x"46", x"52", x"41", x"4D", x"45",
        x"20", x"30", x"30", x"30", x"31",

        -- Padding to minimum Ethernet payload size
        x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
        x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
        x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00",
        x"00",

        -- Ethernet FCS, little-endian on the wire
        x"D1", x"0F", x"C9", x"7E"
    );

    constant FRAME_LEN : integer := FRAME'length;

    constant PERIOD_CYCLES : integer :=
        CLK_FREQ_HZ / 1_000_000 * PERIOD_US;

    type state_t is (
        IDLE,
        SEND_FRAME,
        WAIT_GAP
    );

    signal state      : state_t := IDLE;
    signal byte_index : integer range 0 to FRAME_LEN - 1 := 0;
    signal wait_count : integer range 0 to PERIOD_CYCLES := 0;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                state      <= IDLE;
                byte_index <= 0;
                wait_count <= 0;

                txd   <= x"00";
                tx_en <= '0';
                tx_er <= '0';

            else
                -- defaults
                txd   <= x"00";
                tx_en <= '0';
                tx_er <= '0';

                case state is

                    when IDLE =>
                        byte_index <= 0;
                        state      <= SEND_FRAME;

                    when SEND_FRAME =>
                        txd   <= FRAME(byte_index);
                        tx_en <= '1';
                        tx_er <= '0';

                        if byte_index = FRAME_LEN - 1 then
                            byte_index <= 0;
                            wait_count <= 0;
                            state      <= WAIT_GAP;
                        else
                            byte_index <= byte_index + 1;
                        end if;

                    when WAIT_GAP =>
                        txd   <= x"00";
                        tx_en <= '0';
                        tx_er <= '0';

                        if wait_count = PERIOD_CYCLES - FRAME_LEN - 1 then
                            wait_count <= 0;
                            state      <= SEND_FRAME;
                        else
                            wait_count <= wait_count + 1;
                        end if;

                end case;
            end if;
        end if;
    end process;

end architecture;