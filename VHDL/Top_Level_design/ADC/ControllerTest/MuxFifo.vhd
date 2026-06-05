library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_16ch_mux is
    generic (
        C_ADC_WIDTH : positive := 24
    );
    port (
        i_clk : in std_logic;
        i_rst : in std_logic;

        i_fifo_sel : in unsigned(3 downto 0);

        i_fifo_0_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_1_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_2_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_3_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_4_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_5_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_6_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_7_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_8_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_9_dout  : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_10_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_11_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_12_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_13_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_14_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);
        i_fifo_15_dout : in std_logic_vector(C_ADC_WIDTH-1 downto 0);

        o_fifo_dout : out std_logic_vector(C_ADC_WIDTH-1 downto 0)
    );
end entity fifo_16ch_mux;

architecture rtl of fifo_16ch_mux is

    signal mux_g0_c : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g1_c : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g2_c : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g3_c : std_logic_vector(C_ADC_WIDTH-1 downto 0);

    signal mux_g0_r : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g1_r : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g2_r : std_logic_vector(C_ADC_WIDTH-1 downto 0);
    signal mux_g3_r : std_logic_vector(C_ADC_WIDTH-1 downto 0);

    signal fifo_sel_hi_r : unsigned(1 downto 0);

begin

    ---------------------------------------------------------------------------
    -- Stage 1: four smaller 4-to-1 muxes
    ---------------------------------------------------------------------------
    process(all)
    begin
        case i_fifo_sel(1 downto 0) is
            when "00"   => mux_g0_c <= i_fifo_0_dout;
            when "01"   => mux_g0_c <= i_fifo_1_dout;
            when "10"   => mux_g0_c <= i_fifo_2_dout;
            when others => mux_g0_c <= i_fifo_3_dout;
        end case;

        case i_fifo_sel(1 downto 0) is
            when "00"   => mux_g1_c <= i_fifo_4_dout;
            when "01"   => mux_g1_c <= i_fifo_5_dout;
            when "10"   => mux_g1_c <= i_fifo_6_dout;
            when others => mux_g1_c <= i_fifo_7_dout;
        end case;

        case i_fifo_sel(1 downto 0) is
            when "00"   => mux_g2_c <= i_fifo_8_dout;
            when "01"   => mux_g2_c <= i_fifo_9_dout;
            when "10"   => mux_g2_c <= i_fifo_10_dout;
            when others => mux_g2_c <= i_fifo_11_dout;
        end case;

        case i_fifo_sel(1 downto 0) is
            when "00"   => mux_g3_c <= i_fifo_12_dout;
            when "01"   => mux_g3_c <= i_fifo_13_dout;
            when "10"   => mux_g3_c <= i_fifo_14_dout;
            when others => mux_g3_c <= i_fifo_15_dout;
        end case;
    end process;

    ---------------------------------------------------------------------------
    -- Register stage 1
    ---------------------------------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                mux_g0_r      <= (others => '0');
                mux_g1_r      <= (others => '0');
                mux_g2_r      <= (others => '0');
                mux_g3_r      <= (others => '0');
                fifo_sel_hi_r <= (others => '0');
            else
                mux_g0_r      <= mux_g0_c;
                mux_g1_r      <= mux_g1_c;
                mux_g2_r      <= mux_g2_c;
                mux_g3_r      <= mux_g3_c;
                fifo_sel_hi_r <= i_fifo_sel(3 downto 2);
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Stage 2: final 4-to-1 mux, also registered
    ---------------------------------------------------------------------------
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                o_fifo_dout <= (others => '0');
            else
                case fifo_sel_hi_r is
                    when "00"   => o_fifo_dout <= mux_g0_r;
                    when "01"   => o_fifo_dout <= mux_g1_r;
                    when "10"   => o_fifo_dout <= mux_g2_r;
                    when others => o_fifo_dout <= mux_g3_r;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;