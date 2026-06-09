library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity byte_to_14seg is
    port (
        reset    : in  std_logic;

        data_in  : in  std_logic_vector(7 downto 0);
        sel_high : in  std_logic;  -- '0' = low nibble, '1' = high nibble

        -- 14-segment display outputs, active-low
        seg_a    : out std_logic;
        seg_b    : out std_logic;
        seg_c    : out std_logic;
        seg_d    : out std_logic;
        seg_e    : out std_logic;
        seg_f    : out std_logic;
        seg_g    : out std_logic;
        seg_h    : out std_logic;
        seg_j    : out std_logic;
        seg_k    : out std_logic;
        seg_l    : out std_logic;
        seg_m    : out std_logic;
        seg_n    : out std_logic;
        seg_p    : out std_logic;
        seg_dp   : out std_logic
    );
end entity;

architecture rtl of byte_to_14seg is

    -- Segment order:
    -- seg_on(0)  = A
    -- seg_on(1)  = B
    -- seg_on(2)  = C
    -- seg_on(3)  = D
    -- seg_on(4)  = E
    -- seg_on(5)  = F
    -- seg_on(6)  = G
    -- seg_on(7)  = H
    -- seg_on(8)  = J
    -- seg_on(9)  = K
    -- seg_on(10) = L
    -- seg_on(11) = M
    -- seg_on(12) = N
    -- seg_on(13) = P

    constant SA : natural := 0;
    constant SB : natural := 1;
    constant SC : natural := 2;
    constant SD : natural := 3;
    constant SE : natural := 4;
    constant SF : natural := 5;
    constant SG : natural := 6;
    constant SH : natural := 7;
    constant SJ : natural := 8;
    constant SK : natural := 9;
    constant SL : natural := 10;
    constant SM : natural := 11;
    constant SN : natural := 12;
    constant SP : natural := 13;

    signal nibble : std_logic_vector(3 downto 0);
    signal seg_on : std_logic_vector(13 downto 0);

    function hex_to_14seg(n : std_logic_vector(3 downto 0))
        return std_logic_vector
    is
        variable s : std_logic_vector(13 downto 0);
    begin
        s := (others => '0');

        case n is

            -- 0
            when "0000" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';
                s(SD) := '1'; s(SE) := '1'; s(SF) := '1';

            -- 1
            when "0001" =>
                s(SB) := '1'; s(SC) := '1';

            -- 2
            when "0010" =>
                s(SA) := '1'; s(SB) := '1';
                s(SP) := '1'; s(SK) := '1';
                s(SE) := '1'; s(SD) := '1';

            -- 3
            when "0011" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';
                s(SD) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- 4
            when "0100" =>
                s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';
                s(SB) := '1'; s(SC) := '1';

            -- 5
            when "0101" =>
                s(SA) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';
                s(SC) := '1'; s(SD) := '1';

            -- 6
            when "0110" =>
                s(SA) := '1'; s(SF) := '1'; s(SE) := '1';
                s(SD) := '1'; s(SC) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- 7
            when "0111" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';

            -- 8
            when "1000" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';
                s(SD) := '1'; s(SE) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- 9
            when "1001" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';
                s(SD) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- A
            when "1010" =>
                s(SA) := '1'; s(SB) := '1'; s(SC) := '1';
                s(SE) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- b
            when "1011" =>
                s(SC) := '1'; s(SD) := '1'; s(SE) := '1';
                s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- C
            when "1100" =>
                s(SA) := '1'; s(SD) := '1';
                s(SE) := '1'; s(SF) := '1';

            -- d
            when "1101" =>
                s(SB) := '1'; s(SC) := '1'; s(SD) := '1';
                s(SE) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- E
            when "1110" =>
                s(SA) := '1'; s(SD) := '1';
                s(SE) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';

            -- F
            when others =>
                s(SA) := '1';
                s(SE) := '1'; s(SF) := '1';
                s(SP) := '1'; s(SK) := '1';
        end case;

        return s;
    end function;

begin

    nibble <= data_in(7 downto 4) when sel_high = '1'
              else data_in(3 downto 0);

    seg_on <= hex_to_14seg(nibble) when reset = '0'
              else (others => '0');

    -- Active-low outputs: '0' turns a segment ON.
    seg_a <= not seg_on(SA);
    seg_b <= not seg_on(SB);
    seg_c <= not seg_on(SC);
    seg_d <= not seg_on(SD);
    seg_e <= not seg_on(SE);
    seg_f <= not seg_on(SF);
    seg_g <= not seg_on(SG);
    seg_h <= not seg_on(SH);
    seg_j <= not seg_on(SJ);
    seg_k <= not seg_on(SK);
    seg_l <= not seg_on(SL);
    seg_m <= not seg_on(SM);
    seg_n <= not seg_on(SN);
    seg_p <= not seg_on(SP);

    -- Decimal point ON when high nibble is selected.
    seg_dp <= '1' when reset = '1' else not sel_high;

end architecture;