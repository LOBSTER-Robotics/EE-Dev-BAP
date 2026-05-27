library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo_16ch_mux is
    generic (
        G_DAC_WIDTH : positive := 24
    );
    port (
        i_fifo_sel : in unsigned(3 downto 0);

        i_fifo_0_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_1_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_2_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_3_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_4_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_5_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_6_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_7_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_8_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_9_dout  : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_10_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_11_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_12_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_13_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_14_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);
        i_fifo_15_dout : in std_logic_vector(G_DAC_WIDTH-1 downto 0);

        o_fifo_dout : out std_logic_vector(G_DAC_WIDTH-1 downto 0)
    );
end entity fifo_16ch_mux;


architecture rtl of fifo_16ch_mux is
begin

    process(i_fifo_sel, i_fifo_0_dout, i_fifo_1_dout, i_fifo_2_dout, i_fifo_3_dout, i_fifo_4_dout, i_fifo_5_dout, i_fifo_6_dout, i_fifo_7_dout, i_fifo_8_dout, i_fifo_9_dout, i_fifo_10_dout, i_fifo_11_dout, i_fifo_12_dout, i_fifo_13_dout, i_fifo_14_dout, i_fifo_15_dout)
    begin

        case i_fifo_sel is

            when "0000" =>
                o_fifo_dout <= i_fifo_0_dout;

            when "0001" =>
                o_fifo_dout <= i_fifo_1_dout;

            when "0010" =>
                o_fifo_dout <= i_fifo_2_dout;

            when "0011" =>
                o_fifo_dout <= i_fifo_3_dout;

            when "0100" =>
                o_fifo_dout <= i_fifo_4_dout;

            when "0101" =>
                o_fifo_dout <= i_fifo_5_dout;

            when "0110" =>
                o_fifo_dout <= i_fifo_6_dout;

            when "0111" =>
                o_fifo_dout <= i_fifo_7_dout;

            when "1000" =>
                o_fifo_dout <= i_fifo_8_dout;

            when "1001" =>
                o_fifo_dout <= i_fifo_9_dout;

            when "1010" =>
                o_fifo_dout <= i_fifo_10_dout;

            when "1011" =>
                o_fifo_dout <= i_fifo_11_dout;

            when "1100" =>
                o_fifo_dout <= i_fifo_12_dout;

            when "1101" =>
                o_fifo_dout <= i_fifo_13_dout;

            when "1110" =>
                o_fifo_dout <= i_fifo_14_dout;

            when "1111" =>
                o_fifo_dout <= i_fifo_15_dout;

            when others =>
                o_fifo_dout <= (others => '0');

        end case;

    end process;

end architecture rtl;