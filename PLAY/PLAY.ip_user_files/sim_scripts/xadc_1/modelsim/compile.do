vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../PLAY.srcs/sources_1/ip/xadc_1/xadc_1_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

