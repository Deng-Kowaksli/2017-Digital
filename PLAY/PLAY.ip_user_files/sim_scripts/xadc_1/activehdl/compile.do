vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../PLAY.srcs/sources_1/ip/xadc_1/xadc_1_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

