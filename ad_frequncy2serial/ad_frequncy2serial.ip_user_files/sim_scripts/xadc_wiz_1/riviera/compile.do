vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../ad_frequncy2serial.srcs/sources_1/ip/xadc_wiz_1/xadc_wiz_1_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

