vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sources_1/new/seg_display.v" \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sources_1/new/smg_display.v" \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sim/smg_display_0.v" \


vlog -work xil_defaultlib "glbl.v"

