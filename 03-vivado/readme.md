# Lab 3: Josef Caha

### Three-bit wide 4-to-1 multiplexer

FPGA pins - LEDs and Switches

|LED|number|
|-|-|
|LD0|H17|
|LD1|K15|
|LD2|J13|
|LD3|N14|
|LD4|R18|
|LD5|V17|
|LD6|U17|
|LD7|U16|
|LD8|V16|
|LD9|T15|
|LD10|U14|
|LD11|T16|
|LD12|V15|
|LD13|V14|
|LD14|V12|
|LD15|V11|

|SWITCH|number|
|-|-|
|SW0|J15|
|SW1|L16|
|SW2|M13|
|SW3|R15|
|SW4|R17|
|SW5|T18|
|SW6|U18|
|SW7|R13|
|SW8|T8|
|SW9|U8|
|SW10|R16|
|SW11|T13|
|SW12|H6|
|SW13|U12|
|SW14|U11|
|SW15|V10|

1. Listing of VHDL architecture from source file `mux_3bit_4to1.vhd`:

```vhdl
architecture behavioral of mux_2bit_4to1 is
begin
    f_o <=  a_i when (sel_i = "00") else 
            b_i when (sel_i = "01") else 
            c_i when (sel_i = "10") else 
            d_i;
 
end architecture behavioral;
```

2. Screenshot with simulated time waveforms.

   ![simulovane_signaly](https://github.com/JosefCaha/digital-electronics-1/blob/main/03-vivado/simulation.jpg)

3. Listing of pin assignments for the Nexys A7 board in `nexys-a7-50t.xdc`.

```shell
##Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { a_i[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { a_i[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { a_i[2] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { b_i[0] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { b_i[1] }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { b_i[2] }]; #IO_L7N_T1_D10_14 Sch=sw[5]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { c_i[0] }]; #IO_L17N_T2_A13_D29_14 Sch=sw[6]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { c_i[1] }]; #IO_L5N_T0_D07_14 Sch=sw[7]
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { c_i[2] }]; #IO_L24N_T3_34 Sch=sw[8]
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS18 } [get_ports { d_i[0] }]; #IO_25_34 Sch=sw[9]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { d_i[1] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=sw[10]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { d_i[2] }]; #IO_L23P_T3_A03_D19_14 Sch=sw[11]

set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { sel[0] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { sel[1] }]; #IO_L21P_T3_DQS_14 Sch=sw[15]

## LEDs

set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { y_o[0] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { y_o[1] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { y_o[2] }]; #IO_L16N_T2_A15_D31_14 Sch=led[8]
```
