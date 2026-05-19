library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_16ch_mux is
    generic (
        G_DAC_WIDTH : positive := 24
    );
    port (
        i_fifo_sel : in unsigned(3 downto 0);
        i_fifo_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);

        o_fifo_0_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_1_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_2_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_3_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_4_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_5_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_6_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_7_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_8_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_9_dout  : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_10_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_11_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_12_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_13_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_14_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0);
        o_fifo_15_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0)
    );
end entity fifo_16ch_mux;


architecture rtl of fifo_16ch_mux is
begin

    process(i_fifo_sel, i_fifo_dout)
    begin

        case i_fifo_sel is

            when "0000" =>
                o_fifo_0_dout <= i_fifo_dout;

            when "0001" =>
                o_fifo_1_dout <= i_fifo_dout;

            when "0010" =>
                o_fifo_2_dout <= i_fifo_dout;

            when "0011" =>
                o_fifo_3_dout <= i_fifo_dout;

            when "0100" =>
                o_fifo_4_dout <= i_fifo_dout;

            when "0101" =>
                o_fifo_5_dout <= i_fifo_dout;

            when "0110" =>
                o_fifo_6_dout <= i_fifo_dout;

            when "0111" =>
                o_fifo_7_dout <= i_fifo_dout;

            when "1000" =>
                o_fifo_8_dout <= i_fifo_dout;

            when "1001" =>
                o_fifo_9_dout <= i_fifo_dout;

            when "1010" =>
                o_fifo_10_dout <= i_fifo_dout;

            when "1011" =>
                o_fifo_11_dout <= i_fifo_dout;

            when "1100" =>
                o_fifo_12_dout <= i_fifo_dout;

            when "1101" =>
                o_fifo_13_dout <= i_fifo_dout;

            when "1110" =>
                o_fifo_14_dout <= i_fifo_dout;

            when "1111" =>
                o_fifo_15_dout <= i_fifo_dout;

            when others =>
                o_fifo_0_dout <= (others => '0');

        end case;

    end process;

end architecture rtl;