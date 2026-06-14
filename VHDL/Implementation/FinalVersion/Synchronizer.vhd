library ieee;
use ieee.std_logic_1164.all;

entity vector_synchronizer is
    generic (
        WIDTH  : positive := 2;  -- 2 for a 2-bit signal, or wider
        STAGES : positive := 2   -- Use 2 or 3
    );
    port (
        clk_dst  : in  std_logic;
        clk_rgmii : in  std_logic;
        rst    : in  std_logic;
        async_in : in  std_logic_vector(WIDTH-1 downto 0);
        sync_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity vector_synchronizer;

architecture rtl of vector_synchronizer is

    type sync_array_t is array (natural range <>) of std_logic_vector(WIDTH-1 downto 0);
    signal sync_ff_rgmii, sync_ff_dst : sync_array_t(0 to STAGES-1);

begin

    process(clk_rgmii)
    begin
        sync_ff_rgmii(0) <= async_in;

        for i in 1 to STAGES-1 loop
            sync_ff_rgmii(i) <= sync_ff_rgmii(i-1);
        end loop;

    end process;

    process(clk_dst, rst)
    begin
        if rst = '1' then
            sync_ff_dst <= (others => (others => '0'));

        elsif rising_edge(clk_dst) then
            sync_ff_dst(0) <= sync_ff_rgmii(STAGES-1);

            for i in 1 to STAGES-1 loop
                sync_ff_dst(i) <= sync_ff_dst(i-1);
            end loop;
        end if;
    end process;

    sync_out <= sync_ff_dst(STAGES-1);

end architecture rtl;