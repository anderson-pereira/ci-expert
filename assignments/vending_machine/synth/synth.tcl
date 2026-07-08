# ============================================================
# Synthesis Script (synth.tcl)
# ============================================================

set ROOT_DIR $env(ROOT_DIR)

# Define the output directory for ALL generated artifacts
set SYNTH_DIR "${ROOT_DIR}/build/synthesis"
set REPORT_DIR "${ROOT_DIR}/reports"

# Ensure the output directory exists (works like 'mkdir -p')
file mkdir ${SYNTH_DIR}
file mkdir ${REPORT_DIR}

# ============================================================
# 1. Environment & Library Setup
# ============================================================
source ${ROOT_DIR}/synth/dc_setup.tcl

# ============================================================
# 2. RTL Analysis
# ============================================================
analyze -format sverilog [glob ${ROOT_DIR}/pkg/*.sv]
analyze -format sverilog [glob ${ROOT_DIR}/rtl/*.sv]

# ============================================================
# 3. Elaboration & Linking
# ============================================================
elaborate vending_top
link

# ============================================================
# 4. Design Constraints
# ============================================================
read_sdc ${ROOT_DIR}/synth/vending.sdc

# ============================================================
# 5. Pre-Synthesis Verification
# ============================================================
echo ""
echo "=================================================="
echo "CHECKING DESIGN INTEGRITY"
echo "=================================================="
redirect -tee ${SYNTH_DIR}/check_design.rpt { check_design }

# ============================================================
# 6. Logic Synthesis
# ============================================================
echo ""
echo "=================================================="
echo "STARTING SYNTHESIS (compile_ultra)"
echo "=================================================="
redirect -tee ${REPORT_DIR}/compile_ultra.log { compile_ultra -no_autoungroup }


# ============================================================
# 7. Post-Synthesis Reports
# ============================================================
redirect -tee ${REPORT_DIR}/report_area.rpt { report_area -hierarchy }
redirect -tee ${REPORT_DIR}/report_timing_setup.rpt { report_timing -delay_type max -max_paths 10 }
redirect -tee ${REPORT_DIR}/report_timing_hold.rpt  { report_timing -delay_type min -max_paths 10 }
redirect -tee ${REPORT_DIR}/report_power.rpt { report_power }
redirect -tee ${REPORT_DIR}/report_constraint.rpt { report_constraint -all_violators }

# ============================================================
# 8. Output Generation
# ============================================================
echo ""
echo "=================================================="
echo "EXPORTING GENERATED FILES"
echo "=================================================="
write -format verilog -hierarchy -output ${SYNTH_DIR}/vending_top_syn.v
write -format ddc -hierarchy -output ${SYNTH_DIR}/vending_top.ddc

echo ""
echo "=================================================="
echo "SYNTHESIS COMPLETED SUCCESSFULLY"
echo "-> All reports saved in: ${REPORT_DIR}/"
echo "-> Build files saved in: ${SYNTH_DIR}/"
echo "=================================================="

quit