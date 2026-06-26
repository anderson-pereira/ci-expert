# ============================================================
# Script de Síntese - SAED32_EDK
# Suporte a SystemVerilog (.sv)
# ============================================================

# 1. CARREGAR CONFIGURAÇÃO
source ./scripts/.synopsys_dc.setup

# 2. LEAR O ARQUIVO RTL (SYSTEMVERILOG)
analyze -format sverilog ./rtl/ula.sv

# 3. ELABORAR O DESIGN
elaborate ula

# 4. LINKAR O DESIGN
# O comando 'link' é necessário para resolver todas as referências
# e preparar o design para a síntese
# Pode ser suprimido para designs muito pequenoas, mas é recomendado para designs maiores
# Não é uma boa prática retirar o comando
link

# 5. Gerar o arquivo de netlist não mapeado
# (opcional, mas útil para depuração)
write_file -format verilog -hier -out ula_nao_mapeada.sv

# 6. CARREGAR CONSTRAINTS
read_sdc scripts/constraints.sdc

# 7. SÍNTESE (compile_ultra é mais agressivo que compile)
puts "\n============================================================"
puts "INICIANDO SÍNTESE (SystemVerilog)..."
puts "============================================================"
compile_ultra

# 8. RELATÓRIOS PÓS-SÍNTESE
puts "\n============================================================"
puts "RELATÓRIOS PÓS-SÍNTESE"
puts "============================================================"

# Relatório de área
report_area -hierarchy > area_pos.rpt
puts "\n\[Área\] Relatório salvo em: area_pos.rpt"

# Relatório de timing (setup)
report_timing > timing_relatorio.rpt
puts "\[Timing\] Relatório salvo em: timing_relatorio.rpt"

# Relatório de power
report_power > power.rpt
puts "\[Power\] Relatório salvo em: power.rpt"

# Relatório de violações de setup
# report_constraint -all_violators -check_type setup > setup_violations.rpt
# puts "[Setup Violations] Relatório salvo em: setup_violations.rpt"

# Relatório de violações de hold
# report_constraint -all_violators -check_type hold > hold_violations.rpt
# puts "[Hold Violations] Relatório salvo em: hold_violations.rpt"

# 8. EXPORTAR NETLIST
# Formato Verilog (para simulação)
write -format verilog -hierarchy -output ula_mapeada.sv
puts "\n\[Netlist\] SystemVerilog salvo em: ula_mapeada.sv"

# Formato DDC (binário Synopsys, mais rápido para ICC2)
write -format ddc -hierarchy -output ula_mapeada.ddc
puts "\[Netlist\] DDC salvo em: ula_mapeada.ddc"

# 9. SALVAR DESIGN EM MEMORY
save_designs -force ula.db
puts "\[Design\] Salvo em: ula.db"

# 10. FINALIZAR
puts "\n============================================================"
puts "SÍNTESE CONCLUÍDA COM SUCESSO (SystemVerilog)!"
puts "============================================================"
puts "Arquivos gerados:"
puts "  - ula_mapeada.sv (netlist SystemVerilog)"
puts "  - ula_mapeada.ddc (netlist DDC)"
puts "  - area_pos.rpt (área)"
puts "  - timing_relatorio.rpt (timing)"
puts "  - power.rpt (potência)"
puts "============================================================"