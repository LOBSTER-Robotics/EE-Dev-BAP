library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_dac is
    generic (
        Num_Channels     : positive := 1;
        -- Extra clock cycles to wait in DONE before starting next transfer.
        -- Controls the DAC sample rate:
        --   sample_rate = f_clk / (19 + DONE_WAIT_CYCLS)
        -- At 50 MHz for 2 MSps: 50e6 / (19 + 6) = 2.0 MSps  → DONE_WAIT_CYCLS = 6
        -- At 50 MHz for max:    50e6 /  19        = 2.63 MSps → DONE_WAIT_CYCLS = 0
        DONE_WAIT_CYCLS : natural := 6
    );
    port (
        clk        : in  std_logic;
        rst        : in  std_logic;

        data_in    : in  std_logic_vector(Num_Channels * 16 - 1 downto 0);
        fifo_empty : in  std_logic_vector(Num_Channels - 1 downto 0);
        read_en    : out std_logic_vector(Num_Channels - 1 downto 0);

        sdi        : out std_logic_vector(Num_Channels - 1 downto 0);
        cs_n       : out std_logic;
        spi_clk    : out std_logic     -- TEMPORARY: remove when ext osc connected
    );
end entity spi_master_dac;


architecture rtl of spi_master_dac is

    type data_array_t is array (0 to Num_Channels - 1) of std_logic_vector(15 downto 0);
    type state_t      is (IDLE, READ, SETUP, TRANSFER, DONE);

    constant ALL_NOT_EMPTY : std_logic_vector(Num_Channels - 1 downto 0) := (others => '0');

    signal state       : state_t                                     := IDLE;
    signal shift_reg   : data_array_t                                := (others => (others => '0'));
    signal bit_count   : unsigned(3 downto 0)                        := (others => '0');
    signal wait_count  : natural range 0 to DONE_WAIT_CYCLS       := 0;
    signal cs_n_reg    : std_logic                                   := '1';
    signal read_en_reg : std_logic_vector(Num_Channels - 1 downto 0) := (others => '0');
    signal sdi_reg     : std_logic_vector(Num_Channels - 1 downto 0) := (others => '0');

    signal next_state      : state_t;
    signal next_shift_reg  : data_array_t;
    signal next_bit_count  : unsigned(3 downto 0);
    signal next_wait_count : natural range 0 to DONE_WAIT_CYCLS;
    signal next_cs_n       : std_logic;
    signal next_read_en    : std_logic_vector(Num_Channels - 1 downto 0);

begin

    gen_sdi : for k in 0 to Num_Channels - 1 generate
        sdi(k) <= sdi_reg(k);
    end generate;

    cs_n    <= cs_n_reg;
    read_en <= read_en_reg;
    spi_clk <= clk;  -- TEMPORARY


    p_comb : process(state, fifo_empty, data_in, shift_reg, bit_count,
                     cs_n_reg, wait_count)
    begin
        next_state      <= state;
        next_shift_reg  <= shift_reg;
        next_bit_count  <= bit_count;
        next_wait_count <= wait_count;
        next_cs_n       <= cs_n_reg;
        next_read_en    <= (others => '0');

        case state is

            when IDLE =>
                next_cs_n <= '1';
                if fifo_empty = ALL_NOT_EMPTY then
                    next_read_en <= (others => '1');
                    next_state   <= READ;
                end if;

            when READ =>
                next_cs_n <= '1';
                for k in 0 to Num_Channels - 1 loop
                    next_shift_reg(k) <= data_in(k * 16 + 15 downto k * 16);
                end loop;
                next_bit_count <= to_unsigned(15, 4);
                next_state     <= SETUP;

            when SETUP =>
                next_cs_n  <= '0';
                next_state <= TRANSFER;

            when TRANSFER =>
                next_cs_n <= '0';
                for k in 0 to Num_Channels - 1 loop
                    next_shift_reg(k) <= shift_reg(k)(14 downto 0) & '0';
                end loop;
                if bit_count = 0 then
                    next_state <= DONE;
                else
                    next_bit_count <= bit_count - 1;
                end if;

            when DONE =>
                next_cs_n <= '1';
                -- Rate limiter: hold in DONE for DONE_WAIT_CYCLS extra cycles
                if wait_count < DONE_WAIT_CYCLS then
                    next_wait_count <= wait_count + 1;
                else
                    next_wait_count <= 0;
                    if fifo_empty = ALL_NOT_EMPTY then
                        next_read_en <= (others => '1');
                        next_state   <= READ;
                    else
                        next_state <= IDLE;
                    end if;
                end if;

            when others =>
                next_state <= IDLE;

        end case;
    end process p_comb;


    p_rising : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state       <= IDLE;
                shift_reg   <= (others => (others => '0'));
                bit_count   <= (others => '0');
                wait_count  <= 0;
                cs_n_reg    <= '1';
                read_en_reg <= (others => '0');
            else
                state       <= next_state;
                shift_reg   <= next_shift_reg;
                bit_count   <= next_bit_count;
                wait_count  <= next_wait_count;
                cs_n_reg    <= next_cs_n;
                read_en_reg <= next_read_en;
            end if;
        end if;
    end process p_rising;


    p_falling : process(clk)
    begin
        if falling_edge(clk) then
            if rst = '1' then
                sdi_reg <= (others => '0');
            elsif cs_n_reg = '0' then
                for k in 0 to Num_Channels - 1 loop
                    sdi_reg(k) <= shift_reg(k)(15);
                end loop;
            end if;
        end if;
    end process p_falling;

end architecture rtl;
