vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" \
"M:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"M:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" \
"../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

