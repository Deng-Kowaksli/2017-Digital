vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" \
"M:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"M:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" "+incdir+../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2" \
"../../../../PLAY.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

