library ieee;
use ieee.std_logic_1164.all;

entity vector_synchronizer is
    generic (
        WIDTH  : positive := 2;  -- 2 for a 2-bit signal, or wider
        STAGES : positive := 2   -- Use 2 or 3
    );
    port (
        clk_dst  : in  std_logic;
        rst    : in  std_logic;
        async_in : in  std_logic_vector(WIDTH-1 downto 0);
        sync_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity vector_synchronizer;

architecture rtl of vector_synchronizer is

    type sync_array_t is array (natural range <>) of std_logic_vector(WIDTH-1 downto 0);
    signal sync_ff : sync_array_t(0 to STAGES-1);

begin

    process(clk_dst, rst)
    begin
        if rst = '1' then
            sync_ff <= (others => (others => '0'));

        elsif rising_edge(clk_dst) then
            sync_ff(0) <= async_in;

            for i in 1 to STAGES-1 loop
                sync_ff(i) <= sync_ff(i-1);
            end loop;
        end if;
    end process;

    sync_out <= sync_ff(STAGES-1);

end architecture rtl;