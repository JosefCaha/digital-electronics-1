library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_ff_rst is
    -- Entity of testbench is always empty
end entity tb_ff_rst;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns; -- !!! 100MHZ = 10 ns !!! (v realitě 100MHz odpovídá času 10ns)

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_data       : std_logic;
    signal s_d_q        : std_logic;
    signal s_d_q_bar    : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            d     => s_data,
            q     => s_d_q,
            q_bar => s_d_q_bar
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 200 ns loop -- 20 periods of 100MHz clock -- !!! 100MHZ = 10 ns !!!
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 13 ns;

        s_rst <= '1'; -- activated
        wait for 28 ns;

        s_rst <= '0'; -- deactivated
     -- wait for 65 ns;

     -- s_rst <= '1';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        -- without output
        s_clk_100MHz    <=  '0'; 
        s_rst  <=  '0';
        s_data     <=  '0'; 
        wait for 10 ns;

        s_rst  <=  '1';
        wait for 10 ns;

        s_rst  <=  '0';

        -- Test 1
        s_data     <=  '0';
        s_clk_100MHz    <=  '0';
        wait for 10ns;
        s_rst  <=  '0';

        assert (s_d_q = '0' and s_d_q_bar = '1') 
        report "Error (d=0,en=0,arst=0)" severity error;

        -- Test 2
        s_data     <=  '1';
        s_clk_100MHz    <=  '0';
        wait for 10ns;
        s_rst  <=  '0';

        assert (s_d_q = '0' and s_d_q_bar = '1')
        report "Error (d=1,en=0,arst=0)" severity error;
   
        -- Test 3
        s_data     <=  '0';
        s_clk_100MHz    <=  '1';
        wait for 10ns;
        s_rst  <=  '0';

        assert (s_d_q = '0' and s_d_q_bar = '1') 
        report "Error (d=0,en=1,arst=0)" severity error;

        -- Test 4       
        s_data     <=  '1';
        s_clk_100MHz    <=  '1';
        wait for 10ns;
        s_rst  <=  '0';

        assert (s_d_q = '1' and s_d_q_bar = '0') 
        report "Error (d=1,en=1,arst=0)" severity error;

        -- Test 5
        s_data     <=  '1';
        s_clk_100MHz    <=  '1';
        wait for 10ns;
        s_rst  <=  '1';

        assert (s_d_q = '0' and s_d_q_bar = '1') 
        report "Error (d=1,en=1,arst=1)" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
