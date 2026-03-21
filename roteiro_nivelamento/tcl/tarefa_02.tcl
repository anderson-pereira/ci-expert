set fp [open "netlist.v" r]
set txt [read $fp]
close $fp

# limpa sujeira de encoding (non-breaking spaces) e comentários
set txt [string map {"\xA0" " " "\xC2" " "} $txt]
regsub -all {/\*.*?\*/} $txt "" txt
regsub -all {//[^\n]*} $txt "" txt

set ignore {module always if else for while reg wire input output inout assign parameter begin end endmodule}

array set tree {}
array set counts {}
array set is_sub {}
set all_mods {}

set in_mod 0
set curr_mod ""
set body ""

# varre o arquivo construindo a relação de módulos
foreach line [split $txt "\n"] {
    set line [string trim $line]
    if {$line eq ""} continue

    # acha o inicio do modulo
    if {[regexp {^module\s+([a-zA-Z_]\w*)} $line -> m_name]} {
        set in_mod 1
        set curr_mod $m_name
        lappend all_mods $curr_mod
        set tree($curr_mod) {}
        set body ""
        continue
    }
    
    # acha o fim do modulo e processa tudo que tem dentro
    if {$in_mod && [regexp {^endmodule} $line]} {
        set in_mod 0
        
        foreach {~ sub} [regexp -all -inline {([a-zA-Z_]\w*)\s+[a-zA-Z_]\w*\s*\(} $body] {
            if {$sub ni $ignore} {
                if {$sub ni $tree($curr_mod)} {
                    lappend tree($curr_mod) $sub
                }
                incr counts($curr_mod,$sub)
                set is_sub($sub) 1
            }
        }
        continue
    }
    
    # acumula o conteudo do modulo
    if {$in_mod} {
        append body "$line\n"
    }
}

# --- exibe relatorio simples ---
puts "\n--- Módulos e Instâncias ---"
foreach m $all_mods {
    set insts {}
    foreach sub $tree($m) {
        lappend insts "$sub ($counts($m,$sub))"
    }
    set desc [expr {[llength $insts] > 0 ? [join $insts ", "] : "Nenhuma"}]
    puts "$m -> $desc"
}

# --- exibe arvore ---
proc print_tree {pai mod prefix is_last} {
    global tree counts
    
    set marker [expr {$is_last ? "\\-- " : "|-- "}]
    puts "${prefix}${marker}${mod} ($counts($pai,$mod))"
    
    set space [expr {$is_last ? "    " : "|   "}]
    set next_pref "${prefix}${space}"
    
    # se o modulo atual tiver filhos, desce mais um nivel
    if {[info exists tree($mod)]} {
        set subs $tree($mod)
        set total [llength $subs]
        for {set i 0} {$i < $total} {incr i} {
            print_tree $mod [lindex $subs $i] $next_pref [expr {$i == ($total - 1)}]
        }
    }
}

puts "\n--- Árvore Hierárquica ---"

set has_top 0
foreach m $all_mods {
    # se o modulo nunca apareceu como filho, ele é o top level
    if {![info exists is_sub($m)]} {
        puts "\[TOP\] $m"
        set has_top 1
        
        set subs $tree($m)
        set total [llength $subs]
        for {set i 0} {$i < $total} {incr i} {
            print_tree $m [lindex $subs $i] "  " [expr {$i == ($total - 1)}]
        }
        puts ""
    }
}

if {!$has_top} { puts "Aviso: Nenhum Top Module encontrado." }