vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sources_1/new/seg_display.v" \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sources_1/new/smg_display.v" \
"../../../../vivado_adc.srcs/sources_1/ip/smg_display_0/sim/smg_display_0.v" \


vlog -work xil_defaultlib "glbl.v"

