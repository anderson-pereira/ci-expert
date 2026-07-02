# ==========================================
# Diretórios
# ==========================================
RTL_DIR = rtl
TB_DIR  = tb
LIB_DIR = libs
# ==========================================
# Arquivos
# ==========================================
RTL_FILES = $(RTL_DIR)/*.sv
TB_FILES  = $(TB_DIR)/*.sv
LIB_FILES = $(LIB_DIR)/*.db
# Top do testbench
TOP = tb_porta_and

# ==========================================
# 1. Verificação de sintaxe
# ==========================================
syntax:
	vlogan -full64 -sverilog -kdb +lint=all $(RTL_FILES) $(TB_FILES)

# ==========================================
# 2. Compilação / Elaboração
# ==========================================
compile: syntax
	vcs -full64 -debug_access+all -kdb $(TOP)

compile_pos_sintax:
	vcs -sverilog tb/tb_porta_and.sv porta_and_mapeada.sv -v libs/saed32nm.v +neg_tchk -debug_access+all -full64 -timescale=1ps/1ps -kdb

# ==========================================
# 3. Rodar simulação
# ==========================================
run: compile
	./simv

# ==========================================
# Abrir waveform no Verdi
# ==========================================
wave:
	verdi -ssf waves.fsdb &

# ==========================================
# Limpeza
# ==========================================
clean:
	rm -rf \
	    csrc \
	    simv* \
	    *.daidir \
		novas* \
		AN.DB \
	    ucli.key \
	    verdi* \
	    DVEfiles \
		.vlogan* \
	    *.fsdb \
	    *.log \
		.inter.fsdb.tbsim \
		work.lib++ \
