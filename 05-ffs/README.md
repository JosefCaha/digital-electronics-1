# Lab 5: Josef Caha

### Flip-flops

1. VHDL architektura pro **JK-type flip-flop**.

```vhdl
architecture behavioral of jk_ff_rst is

signal sig_q : std_logic;

begin
    --------------------------------------------------------
    -- p_jk_ff_rst:
    -- JK type flip-flop 

    --------------------------------------------------------
    p_jk_ff_rst : process (clk) is
    begin
        if rising_edge(clk) then  -- Synchronous process
            if rst = '1' then
              sig_q <= '0';
              q_bar <= not(sig_q);
            elsif j = '0' and k = '0' then
                sig_q <= sig_q;
                q_bar <= not(sig_q);
            elsif j = '1' and k = '0' then
                sig_q <= '1';
                q_bar <= not(sig_q);
            elsif j = '0' and k = '1' then
                sig_q <= '0';
                q_bar <= not(sig_q);
            else
            sig_q <= not(sig_q);
            q_bar <= not(sig_q);
                       
             
              end if;
        end if;
    end process p_jk_ff_rst;
end architecture behavioral;
```

2. Simulovane prubehy signalu pro **D-latch** a **T-flip-flop**

### D-latch:
   ![simulace_D-latch](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/d-latch_simulation.png)
   
### T-flip-flop:
   ![simulace t-flip-flop](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/t-ff.png)

### Shift register

1. Image of the shift register `top` level schematic.

   ![top-shift_register](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/shift_register.png)
