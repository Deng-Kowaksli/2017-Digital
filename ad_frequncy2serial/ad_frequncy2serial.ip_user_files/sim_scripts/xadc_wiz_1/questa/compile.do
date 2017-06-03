vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../ad_frequncy2serial.srcs/sources_1/ip/xadc_wiz_1/xadc_wiz_1_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

