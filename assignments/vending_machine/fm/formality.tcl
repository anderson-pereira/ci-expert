# formality.tcl — Equivalência RTL (golden) x Netlist (revision)

if {[info exists env(ROOT_DIR)]} {
    set ROOT_DIR $env(ROOT_DIR)
} else {
    set ROOT_DIR [file dirname [file dirname [file normalize [info script]]]]
    puts "INFO: ROOT_DIR not set via environment; inferred as ${ROOT_DIR}"
}
set REPORT_DIR  "${ROOT_DIR}/reports"
set SYNTH_DIR   "${ROOT_DIR}/build/synthesis"
set LIB_DIR     "${ROOT_DIR}/libs"

file mkdir ${REPORT_DIR}/formality_synth
set TARGET_LIBRARY "saed32rvt_tt1p05v25c.db"

# 1. Carrega biblioteca de células do processo
read_db ${LIB_DIR}/${TARGET_LIBRARY}

# 2. Usa o SVF gerado pelo synth como guidance
set synopsys_auto_setup true
set_svf ${ROOT_DIR}/reports/synthesis/default.svf

# 3. Carrega o design RTL (golden)
set golden_files [list \
    ${ROOT_DIR}/pkg/vending_pkg.sv \
    ${ROOT_DIR}/rtl/credit_reg.sv \
    ${ROOT_DIR}/rtl/memory.sv \
    ${ROOT_DIR}/rtl/comparator.sv \
    ${ROOT_DIR}/rtl/subtractor.sv \
    ${ROOT_DIR}/rtl/control_unit.sv \
    ${ROOT_DIR}/rtl/vending_top.sv \
]
read_sverilog -r $golden_files
set_top r:/WORK/vending_top

# 4. Carrega o netlist sintetizado (revised)
read_sverilog -i ${SYNTH_DIR}/vending_top_syn.v
set_top i:/WORK/vending_top

# 5. Compara e gera relatórios
match
report_svf_operation -status accepted > ${REPORT_DIR}/formality_synth/formality_svf_accepted.rpt
report_svf_operation -status rejected > ${REPORT_DIR}/formality_synth/formality_svf_rejected.rpt
report_matched_points > ${REPORT_DIR}/formality_synth/formality_matched.rpt
report_unmatched_points > ${REPORT_DIR}/formality_synth/formality_unmatched.rpt

# 6. Verifica equivalência e gera sign-off
verify
report_status > "${REPORT_DIR}/formality_synth/formality_status.rpt"
report_passing_points > "${REPORT_DIR}/formality_synth/formality_passing.rpt"
report_failing_points > "${REPORT_DIR}/formality_synth/formality_failing.rpt"
report_unmatched_points > "${REPORT_DIR}/formality_synth/formality_unmatched.rpt"
exit