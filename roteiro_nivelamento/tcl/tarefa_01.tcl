set fp [open "netlist.v" r]
set conteudo [read $fp]
close $fp

array set contagem {}

set ignorar {module always if else for while reg wire input output inout assign parameter begin}

foreach {match nome_modulo} [regexp -all -inline {([a-zA-Z_]\w*)\s+[a-zA-Z_]\w*\s*\(} $conteudo] {
    if {$nome_modulo ni $ignorar} {
        incr contagem($nome_modulo)
    }
}

puts "\n--- Relatório de Instâncias ---"
parray contagem
puts "-------------------------------"
