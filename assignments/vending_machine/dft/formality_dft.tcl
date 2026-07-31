# ============================================================
# formality_dft.tcl — Equivalência: netlist funcional (golden)
# x netlist com scan chain (revision)
# Controlador de Vending Machine
# ============================================================

set ROOT_DIR    $env(ROOT_DIR)
set REPORT_DIR  "${ROOT_DIR}/reports"
set SYNTH_DIR   "${ROOT_DIR}/build/synthesis"
set LIB_DIR     "${ROOT_DIR}/libs"

file mkdir ${REPORT_DIR}/formality_dft

set TARGET_LIBRARY "saed32rvt_tt1p05v25c.db"

# 1. Biblioteca de células — a mesma da síntese e da inserção de DFT
read_db ${LIB_DIR}/${TARGET_LIBRARY}

# 2. (Opcional) SVF de guidance, se gerado na Etapa 5
set synopsys_auto_setup true
set_svf ${REPORT_DIR}/dft/default_dft.svf

# 3. Golden — netlist funcional, já provada equivalente ao RTL
read_verilog -r ${SYNTH_DIR}/vending_top_syn.v
set_top r:/WORK/vending_top

# 4. Revision — netlist com scan chain
read_verilog -i ${REPORT_DIR}/dft/vending_top_netlist_scan.v
set_top i:/WORK/vending_top

# 5. Restringe a verificação ao modo funcional: scan_enable sempre 0
# do lado do revision, para que o mux de scan sempre selecione o
# dado funcional durante a prova.
set_constant -type port i:/WORK/vending_top/scan_enable 0
set_constant -type port i:/WORK/vending_top/scan_in 0

# 6. Se a inserção tiver criado alguma lockup latch ou célula de
# teste sem correspondente possível no golden, exclua-a da prova
# explicitamente (ajuste o caminho ao nome real da instância):
# set_dont_verify_point i:/WORK/vending_top/lockup_latch_0

set_dont_verify_point i:/WORK/vending_top/scan_out

match
report_svf_operation -status accepted > ${REPORT_DIR}/formality_dft/formality_dft_svf_accepted.rpt
report_svf_operation -status rejected > ${REPORT_DIR}/formality_dft/formality_dft_svf_rejected.rpt
report_matched_points > ${REPORT_DIR}/formality_dft/formality_dft_matched.rpt
report_unmatched_points > ${REPORT_DIR}/formality_dft/formality_dft_unmatched.rpt

verify
report_status > "${REPORT_DIR}/formality_dft/formality_dft_status.rpt"
report_passing_points > "${REPORT_DIR}/formality_dft/formality_dft_passing.rpt"
report_failing_points > "${REPORT_DIR}/formality_dft/formality_dft_failing.rpt"
report_unmatched_points > "${REPORT_DIR}/formality_dft/formality_dft_unmatched.rpt"

exit