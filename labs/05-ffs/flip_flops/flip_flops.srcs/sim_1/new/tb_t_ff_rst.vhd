----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2022 12:16:14 PM
-- Design Name: 
-- Module Name: tb_t_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_t_ff_rst is
--  Port ( );
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is
constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_t          : std_logic;
    signal s_d_q        : std_logic;
    signal s_d_q_bar    : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            t     => s_t,
            q     => s_d_q,
            q_bar => s_d_q_bar
        );
--------------------------------------------------------------------
-- Clock generation process
--------------------------------------------------------------------
p_clk_gen : process
begin
    while now < 300 ns loop         -- 30 periods of 100MHz clock
        s_clk_100MHz <= '0';
        wait for c_CLK_100MHZ_PERIOD / 2;
        s_clk_100MHz <= '1';
        wait for c_CLK_100MHZ_PERIOD / 2;
    end loop;
    wait;
end process p_clk_gen;

--------------------------------------------------------------------
-- Reset generation process
--------------------------------------------------------------------
p_reset_gen : process
begin
    s_rst      <= '0';
    wait for 5 ns;
    s_rst      <= '1';
    wait for 5 ns;
    s_rst      <= '0';
    wait for 90 ns;
    s_rst      <= '1';
    wait for 100 ns;
    s_rst      <= '0';
    wait;
end process p_reset_gen;

--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
p_stimulus : process
begin
    report "Stimulus process started" severity note;
    
    -- Test data input 
    s_t <= '1'; 
    wait for 20 ns;
    -- Expected output
    assert ((s_d_q = '1') and (s_d_q_bar = '0'))
    -- If false, then report an error
    report "Test failed for t=1, rst=0" severity error;

    wait for 10 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=1, rst=0" severity error;
    wait for 50 ns;
    
    s_t <= '0'; 
    wait for 30 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=0, rst=0" severity error;
    
    -- Test reset
    s_t <= '1'; 
    wait for 10 ns;   
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=1, rst=1" severity error;
    
    wait for 25 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=1, rst=1" severity error;
    
    wait for 25 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=1, rst=1" severity error;
    
    wait for 25 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=1, rst=1" severity error;
    
    wait for 20 ns;
    assert ((s_d_q = '1') and (s_d_q_bar = '0'))
    -- If false, then report an error
    report "Test failed for t=1, rst=0" severity error;
    
    wait for 30 ns;

    s_t <= '0'; 
    wait for 10 ns;
    -- Expected output
    assert ((s_d_q = '0') and (s_d_q_bar = '1'))
    -- If false, then report an error
    report "Test failed for t=0, rst=0" severity error;

    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;


end Behavioral;
