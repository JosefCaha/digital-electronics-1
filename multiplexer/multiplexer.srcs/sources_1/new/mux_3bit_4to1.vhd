library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3bit_4to1 is
    Port ( a_i : in STD_LOGIC_VECTOR (2 downto 0);
           b_i : in STD_LOGIC_VECTOR (2 downto 0);
           c_i : in STD_LOGIC_VECTOR (2 downto 0);
           d_i : in STD_LOGIC_VECTOR (2 downto 0);
           s_i : in STD_LOGIC_VECTOR (1 downto 0);
           o_o : out STD_LOGIC_VECTOR (2 downto 0)
           );
end mux_3bit_4to1;

architecture Behavioral of mux_3bit_4to1 is
begin
       
   o_o <= a_i when (s_i = "00") else
          b_i when (s_i = "01") else
          c_i when (s_i = "10") else
          d_i
    
end Behavioral;