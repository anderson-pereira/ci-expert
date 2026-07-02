# ============================================================
# Synthesis Script
# ============================================================

# ------------------------------------------------------------
# Retrieve ROOT_DIR from environment
# ------------------------------------------------------------
set ROOT_DIR $env(ROOT_DIR)

# ------------------------------------------------------------
# Load Configuration
# ------------------------------------------------------------
source ${ROOT_DIR}/synth/.synopsys_dc.setup

# ------------------------------------------------------------
# Read RTL
# ------------------------------------------------------------
# Using 'glob' ensures wildcard (*.sv) expands correctly with absolute paths
analyze -format sverilog [glob ${ROOT_DIR}/pkg/*.sv]
analyze -format sverilog [glob ${ROOT_DIR}/rtl/*.sv]

# ------------------------------------------------------------
# Elaborate
# ------------------------------------------------------------
elaborate vending_top
link

# ------------------------------------------------------------
# Constraints
# ------------------------------------------------------------
source ${ROOT_DIR}/synth/constraints.sdc

# ------------------------------------------------------------
# Check Design
# ------------------------------------------------------------
puts "\n=================================================="
puts "CHECK DESIGN"
puts "=================================================="
check_design

# ------------------------------------------------------------
# Pre-Synthesis Reports (Saved to current build directory)
# ------------------------------------------------------------
redirect area_pre.rpt {
    report_area -hierarchy
}

redirect timing_pre.rpt {
    report_timing -max_paths 10
}

# ------------------------------------------------------------
# Synthesis
# ------------------------------------------------------------
puts "\n=================================================="
puts "STARTING SYNTHESIS"
puts "=================================================="
compile_ultra -no_autoungroup

# ------------------------------------------------------------
# Post-Synthesis Reports (Saved to current build directory)
# ------------------------------------------------------------
redirect area_post.rpt {
    report_area -hierarchy
}

redirect timing_report.rpt {
    report_timing -max_paths 10
}

redirect power.rpt {
    report_power
}

redirect setup_violations.rpt {
    report_constraint -all_violators
}

# ------------------------------------------------------------
# Export Netlist (Saved to current build directory)
# ------------------------------------------------------------
write -format verilog -hierarchy -output vending_machine_syn.v
write -format ddc -hierarchy -output vending_machine_syn.ddc

# ------------------------------------------------------------
# Save DC Session
# ------------------------------------------------------------
write_file -format ddc -hierarchy -output vending_machine.ddc

puts "\n=================================================="
puts "SYNTHESIS COMPLETED"
puts "=================================================="
puts "Artifacts generated in build/synth/ :"
puts "  area_post.rpt"
puts "  timing_report.rpt"
puts "  power.rpt"
puts "  setup_violations.rpt"
puts "  vending_machine_syn.v"
puts "  vending_machine_syn.ddc"
puts "=================================================="

quit