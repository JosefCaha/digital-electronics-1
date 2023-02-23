library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1 is
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_mux_3bit_4to1 is

   signal sig_a : in STD_LOGIC_VECTOR (2 downto 0);
   signal sig_b : in STD_LOGIC_VECTOR (2 downto 0);
   signal sig_c : in STD_LOGIC_VECTOR (2 downto 0);
   signal sig_d : in STD_LOGIC_VECTOR (2 downto 0);
   signal sig_s : in STD_LOGIC_VECTOR (1 downto 0);
   signal sig_o : out STD_LOGIC_VECTOR (2 downto 0)
   );

begin

uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
    port map (
      a_i => sig_a,
      b_i => sig_b,
      c_i => sig_c,
      d_i => sig_d,
      s_i => sig_s,
      o_o => sig_o
    );
    
p_stimulus : process is
  begin
  ¨
    report "Stimulus process started";

    sig_a <= "001";
    sig_b <= "011";
    sig_c <= "100";
    sig_d <= "111";
    
    sig_s <= "00"; wait for 100 ns;
    assert (sig_o <= sig_a)
    
    sig_s <= "01"; wait for 100 ns;
    assert (sig_o <= sig_a)
    
    sig_s <= "10"; wait for 100 ns;
    assert (sig_o <= sig_a)
    
    sig_s <= "11"; wait for 100 ns;
    assert (sig_o <= sig_a)

    report "Stimulus process finished";

    wait;

  end process p_stimulus;

end architecture testbench;