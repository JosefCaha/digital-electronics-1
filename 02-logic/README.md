# Lab 2: Josef Caha

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps-greater](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/greater.png)

   Less than:

   ![K-maps-lesser](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/lesser_simp.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![SoP](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/g_SoP.png)
   ![PoS](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/l_PoS.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx33**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- My test case for "xxxx33" -> prvni testovany signal
        s_b <= "0011"; s_a <= "0011"; wait for 100 ns;
        -- PREDPOKLADANE VYSTUPY, PRO SPRAVNE NAPSANYCH PODMINKACH V DESIGNU
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination has failed" severity error;
        
        s_b <= "1111"; s_a <= "0000"; wait for 100 ns;
        s_b <= "0000"; s_a <= "1111"; wait for 100 ns;
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![signals-4-bit](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/testbench_4-bit.PNG)
   ![report-4-bit](https://github.com/JosefCaha/digital-electronics-1/blob/main/02-logic/report_4-bit.PNG)
   

3. Link to your public EDA Playground example:

   [EDA playground - Josef Caha](https://www.edaplayground.com/x/hkYW)
