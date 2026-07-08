# ============================================================
# Synopsys Design Compiler Setup for SAED32_EDK
# ============================================================

# Retrieve ROOT_DIR from environment
set ROOT_DIR $env(ROOT_DIR)

# Library paths (Updated to point to the root directory)
set search_path "$search_path ${ROOT_DIR}/libs"

# Target library
set target_library "saed32rvt_tt1p05v25c.db"

# Link library
set link_library "* saed32rvt_tt1p05v25c.db dw_foundation.sldb"

# DesignWare library
set synthetic_library "dw_foundation.sldb"

# Work library (Left as relative to stay inside build/synth)
define_design_lib WORK -path ./work

# SystemVerilog configuration
set hdlin_enable_rtl_for_iq 1
set hdlin_check_no_latch true
set compile_autonogate true

puts "============================================================"
puts "SAED32 configured successfully"
puts "============================================================"