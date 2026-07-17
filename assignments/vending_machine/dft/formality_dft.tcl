# ============================================================
# formality_dft.tcl — Equivalência: netlist funcional (golden)
# x netlist com scan chain (revision)
# Controlador de Vending Machine
# ============================================================

set ROOT_DIR    $env(ROOT_DIR)
set REPORT_DIR  "${ROOT_DIR}/reports/dft"
set SYNTH_DIR   "${ROOT_DIR}/build/synthesis"
set LIB_DIR     "${ROOT_DIR}/libs"

file mkdir ${REPORT_DIR}

set TARGET_LIBRARY "saed32rvt_tt1p05v25c.db"

# 1. Biblioteca de células — a mesma da síntese e da inserção de DFT
read_db ${LIB_DIR}/${TARGET_LIBRARY}

# 2. (Opcional) SVF de guidance, se gerado na Etapa 5
# set_svf reports/default_dft.svf
# set synopsys_auto_setup true

# 3. Golden — netlist funcional, já provada equivalente ao RTL
read_verilog ${SYNTH_DIR}/vending_top_syn.v
set_top r:/WORK/vending_top

# 4. Revision — netlist com scan chain
read_verilog -i ${REPORT_DIR}/vending_top_netlist_scan.v
set_top i:/WORK/vending_top

# 5. Restringe a verificação ao modo funcional: scan_enable sempre 0
# do lado do revision, para que o mux de scan sempre selecione o
# dado funcional durante a prova.
set_constant i:/WORK/vending_top/scan_enable 0

# 6. Se a inserção tiver criado alguma lockup latch ou célula de
# teste sem correspondente possível no golden, exclua-a da prova
# explicitamente (ajuste o caminho ao nome real da instância):
# set_dont_verify_point i:/WORK/vending_top/lockup_latch_0
# 7. Casamento de pontos e prova
match
verify

# 8. Relatórios de sign-off
report_status -verbose > ${REPORT_DIR}/formality_dft_status.rpt
report_unmatched_points > ${REPORT_DIR}/formality_dft_unmatched.rpt
report_failing_points > ${REPORT_DIR}/formality_dft_failing.rpt
exit