# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: imports/new/smg_display.xdc

# IP: ip/smg_display_0/smg_display_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==smg_display_0 || ORIG_REF_NAME==smg_display_0}]

# XDC: ip/smg_display_0/constrs_1/new/smg_display.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==smg_display_0 || ORIG_REF_NAME==smg_display_0}] {/inst }]/inst ]]