# ============================================================
# formality.tcl — Equivalência RTL (golden) x Netlist (revision)
# Controlador de Vending Machine — com guidance de SVF
# ============================================================

set ROOT_DIR    $env(ROOT_DIR)
set REPORT_DIR  "${ROOT_DIR}/reports"
set SYNTH_DIR   "${ROOT_DIR}/build/synthesis"
set LIB_DIR     "${ROOT_DIR}/libs"

file mkdir ${REPORT_DIR}/formality

set TARGET_LIBRARY "saed32rvt_tt1p05v25c.db"

# 1. Biblioteca de células — a mesma target_library do synth.tcl
read_db ${LIB_DIR}/${TARGET_LIBRARY}

# 2. ESSENCIAL: habilita o modo de setup automático baseado no SVF.
# Sem esta variável, o Formality só aproveita o guidance
# parcialmente (limitado a poucas operações estruturais) — é ela
# que faz o Formality de fato consumir o histórico de otimizações
# do Design Compiler (constantes, retiming, merge/inversão de
# registrador, reencodificação de FSM) durante o match.
set synopsys_auto_setup true

# 3. Carrega o SVF gerado pelo Design Compiler (Etapa 1) como guidance.
# Deve vir ANTES de qualquer read_verilog/set_top: o Formality lê
# o histórico de otimizações da síntese e passa a registrar também
# as próprias operações desta sessão no mesmo arquivo.
set_svf ${REPORT_DIR}/default.svf

# 4. Design de referência (golden) — RTL pré-síntese
set golden_files [concat [glob -nocomplain ${ROOT_DIR}/pkg/*.sv] [glob -nocomplain ${ROOT_DIR}/rtl/*.sv]]
read_sverilog -r $golden_files
set_top r:/WORK/vending_top

# 5. Design revisado — netlist gerada pelo Design Compiler
read_verilog -i ${SYNTH_DIR}/vending_top_syn.v
set_top i:/WORK/vending_top

# 6. Casamento de pontos entre golden e revised, usando o guidance do SVF
match
# Verifica quais operações do SVF foram usadas com sucesso como guidance
# e quais foram rejeitadas (precisam de investigação manual)
report_svf_operation -status accepted > ${REPORT_DIR}/formality/formality_svf_accepted.rpt
report_svf_operation -status rejected > ${REPORT_DIR}/formality/formality_svf_rejected.rpt
# Inspecione o resultado do casamento antes de seguir para verify
report_matched_points > ${REPORT_DIR}/formality/formality_matched.rpt
report_unmatched_points > ${REPORT_DIR}/formality/formality_unmatched.rpt

# 7. Prova de equivalência ponto a ponto
verify
# 8. Relatórios de sign-off
report_status > "${REPORT_DIR}/formality/formality_status.rpt"
report_passing_points > "${REPORT_DIR}/formality/formality_passing.rpt"
report_failing_points > "${REPORT_DIR}/formality/formality_failing.rpt"
report_unmatched_points > "${REPORT_DIR}/formality/formality_unmatched.rpt"
exit