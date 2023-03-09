# Lab 5: Josef Caha

### Flip-flops

1. VHDL architektura pro **T-type flip-flop**. -> PŘEDĚLAT NA JK-FLIP-FLOP

```vhdl
architecture Behavioral of t_ff_rst is
    -- It must use this local signal instead of output ports
    -- because "out" ports cannot be read within the architecture
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active synchro reset,
    -- rising-edge clk.
    -- q(n+1) = t./q(n) + /t.q(n)
    -- q(n+1) =  q(n) if t = 0 (no change)
    -- q(n+1) = /q(n) if t = 1 (inversion)
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
begin
    if rising_edge (clk) then
        if (rst = '1') then
            s_q         <= '0';
            s_q_bar     <= '1';
        else
            if (t = '0') then
                s_q      <= s_q;
                s_q_bar  <= s_q_bar;
            else 
                s_q      <= not s_q;
                s_q_bar  <= not s_q_bar;
            end if;
            end if;
    end if;        
end process p_t_ff_rst;
end Behavioral;
```

2. Simulovane prubehy signalu pro **D-latch** a **T-flip-flop**

### D-latch:
   ![simulace_D-latch](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/d-latch_simulation.png)
   
### T-flip-flop:
   ![simulace t-flip-flop](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/t-ff.png)

### Shift register

1. Image of the shift register `top` level schematic. -> ZKONTROLOVAT SPRÁVNOST

   ![top-shift_register](https://github.com/JosefCaha/digital-electronics-1/blob/main/05-ffs/shift_register.png)
