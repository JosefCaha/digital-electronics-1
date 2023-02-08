# Lab 1: Josef Caha

### De Morgan's laws (1-gates)

1. Rovnost tri funkci, podle zadané "orig" funkce:

   ![funkce_DeMorgan](https://github.com/JosefCaha/digital-electronics-1/blob/main/01-gates/DeMorgan.jpg)

2. VHDL kod pro funkce:

```vhdl
architecture dataflow of gates is
begin
    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    f_nand_o <= <= not(not(not(b_i) and a_i) and not(c_i and not(b_i) and a_i));
    f_nor_o  <= not(b_i or not(a_i)) or not(not(c_i) or b_i or not(a_i));
end architecture dataflow;
```

3. Tabulka vystupu logickych funkci podle jejich zadanych vstupu:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |
   
   Z logiky DeMorganovych zakonu vim, ze funkce originalni, nand-ova i nor-ova se museji rovnat.

### Distributive laws

1. Overeni 1. distribucniho zakonu a screenshot prubehu signalu:

   ![prvni_distribucni_zakon](https://github.com/JosefCaha/digital-electronics-1/blob/main/01-gates/prvni_distribucni_zakon.PNG)
   
   Signaly overujici PLATNOST 1. disttibucniho zakonu:
   ![signaly_distribucni_zakon](https://github.com/JosefCaha/digital-electronics-1/blob/main/01-gates/signaly_distribucni_zakon.PNG)

2. EDA Playground - Josef Caha:

   [EDA playground - Josef Caha (1-gates)](https://www.edaplayground.com/x/JJpR)
