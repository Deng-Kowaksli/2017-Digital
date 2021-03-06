# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/vivado_experiment/vivado_uart/vivado_uart.cache/wt [current_project]
set_property parent.project_path D:/vivado_experiment/vivado_uart/vivado_uart.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/vivado_experiment/vivado_uart/vivado_uart.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/tx_control_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/tx_bps_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/rx_control_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/rx_bps_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/debounce_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/tx_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/rx_module.v
  D:/vivado_experiment/vivado_uart/vivado_uart.srcs/sources_1/new/uart_module.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/vivado_experiment/vivado_uart/vivado_uart.srcs/constrs_1/new/uart_constraints.xdc
set_property used_in_implementation false [get_files D:/vivado_experiment/vivado_uart/vivado_uart.srcs/constrs_1/new/uart_constraints.xdc]


synth_design -top uart_module -part xc7a35tcsg324-1


write_checkpoint -force -noxdef uart_module.dcp

catch { report_utilization -file uart_module_utilization_synth.rpt -pb uart_module_utilization_synth.pb }
