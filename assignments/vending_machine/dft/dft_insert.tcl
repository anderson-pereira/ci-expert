# ============================================================
# dft_insert.tcl — Inserção de scan chain (DFT Compiler / TestMAX DFT)
# Controlador de Vending Machine
# ============================================================

set ROOT_DIR    $env(ROOT_DIR)
set REPORT_DIR  "${ROOT_DIR}/reports/dft"
set SYNTH_DIR   "${ROOT_DIR}/build/synthesis"
set LIB_DIR     "${ROOT_DIR}/libs"

file mkdir ${REPORT_DIR}

set TARGET_LIBRARY "saed32rvt_tt1p05v25c.db"

# 1. Biblioteca de células — a mesma target_library do synth.tcl
# read_db ${LIB_DIR}/${TARGET_LIBRARY}

# 1. Biblioteca de células — a mesma target_library da síntese
set target_library "${LIB_DIR}/${TARGET_LIBRARY}"
set link_library "* ${LIB_DIR}/${TARGET_LIBRARY}"

# 2. Lê a netlist funcional já sintetizada (golden desta atividade)
read_verilog ${SYNTH_DIR}/vending_top_syn.v
current_design vending_top
link

# 3. Estilo de scan: multiplexed flip-flop (mux-scan), o mais simples
set_scan_configuration -style multiplexed_flip_flop

create_port scan_enable -direction in
create_port scan_in -direction in
create_port scan_out -direction out

# 4. Declaração dos sinais de teste (novas portas do ponto de vista da DFT)
set_dft_signal -view spec -type ScanEnable -port scan_enable -active_state 1
set_dft_signal -view spec -type ScanDataIn -port scan_in
set_dft_signal -view spec -type ScanDataOut -port scan_out

# 5. Geração do protocolo de teste (infere clock/reset a partir do design)
create_test_protocol -infer_clock -infer_async

# 6. DRC de testabilidade — ANTES da inserção
dft_drc > ${REPORT_DIR}/dft_drc_pre.rpt

# 7. Uma única cadeia de scan é suficiente para este design pequeno
set_scan_configuration -chain_count 1

# 8. Preview: mostra como a cadeia ficaria SEM inserir de fato
preview_dft > ${REPORT_DIR}/preview_dft.rpt

# 9. Inserção efetiva da cadeia de scan
insert_dft

# 10. DRC pós-inserção, agora com estimativa de cobertura de teste
dft_drc -coverage_estimate > ${REPORT_DIR}/dft_drc_post.rpt

# 11. Confirma a estrutura final da cadeia
report_scan_path -v exist -chain all > ${REPORT_DIR}/scan_path.rpt

# 12. Recompilação incremental (legaliza a netlist com scan)
compile -incremental

# 13. Netlist final com scan chain
write -format verilog -hierarchy -output ${REPORT_DIR}/vending_top_netlist_scan.v
write -format ddc -hierarchy -output ${REPORT_DIR}/vending_top.ddc


# 14. Artefatos de teste para uso posterior no ATPG (fora do escopo aqui)
write_test_protocol -output ${REPORT_DIR}/vending_scan.spf

# 15. Relatórios finais
report_area > ${REPORT_DIR}/dft_area.rpt
report_timing > ${REPORT_DIR}/dft_timing.rpt