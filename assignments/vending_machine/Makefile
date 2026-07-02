# ==========================================
# Default Goal
# ==========================================
.DEFAULT_GOAL := all

# ==========================================
# Base Directories (Absolute Paths)
# ==========================================
ROOT_DIR  := $(CURDIR)
RTL_DIR   := $(ROOT_DIR)/rtl
TB_DIR    := $(ROOT_DIR)/sim
SYNTH_DIR := $(ROOT_DIR)/synth
PKG_DIR   := $(ROOT_DIR)/pkg
LIB_DIR   := $(ROOT_DIR)/libs

# ==========================================
# Build Directories (Artifacts)
# ==========================================
BUILD_DIR   := $(ROOT_DIR)/build
SIM_RTL_OUT := $(BUILD_DIR)/sim_rtl
SIM_GLS_OUT := $(BUILD_DIR)/sim_gls
SYNTH_OUT   := $(BUILD_DIR)/synthesis

# ==========================================
# PDK Configuration (External Libraries)
# ==========================================
PDK_VERILOG_SRC := /Tools/PDK/SAED32/EDK_Digital/lib/stdcell_rvt/verilog/saed32nm.v
PDK_DB_SRC      := /Tools/PDK/SAED32/EDK_Digital/lib/stdcell_rvt/db_nldm/saed32rvt_tt1p05v25c.db

LIB_VERILOG := $(LIB_DIR)/saed32nm.v
LIB_DB      := $(LIB_DIR)/saed32rvt_tt1p05v25c.db

# ==========================================
# Files
# ==========================================
PKG_FILES = $(PKG_DIR)/*.sv
RTL_FILES = $(RTL_DIR)/*.sv
TB_FILES  = $(TB_DIR)/tb_vending.sv

# ==========================================
# Testbench Top & Scripts
# ==========================================
TOP = tb_vending
SYNTH_SCRIPT = $(SYNTH_DIR)/synthesize.tcl

# ==========================================
# Post-Synthesis / Gate-Level Files
# ==========================================
RTL_SYNTH_FILES := $(SYNTH_OUT)/vending_machine_syn.v
RTL_LIB_FILES   := $(LIB_VERILOG)

# ==========================================
# Flags
# ==========================================
TIMESCALE = 1ns/1ps

VLOGAN_FLAGS =  -full64 \
                -timescale=$(TIMESCALE) \
                -sverilog \
                -kdb \
                +lint=all

VCS_FLAGS =     -full64 \
                -timescale=$(TIMESCALE) \
                -debug_access+all \
                -kdb

# ==========================================
# Gate-Level Simulation (GLS) Flags
# ==========================================
VCS_GLS_FLAGS = $(VCS_FLAGS) \
                +nospecify \
                +notimingchecks

# ==========================================
# Library Setup & Verification
# ==========================================
$(LIB_DIR):
	mkdir -p $(LIB_DIR)

$(LIB_VERILOG): | $(LIB_DIR)
	@echo "[INFO] Copying PDK Verilog library..."
	cp $(PDK_VERILOG_SRC) $@

$(LIB_DB): | $(LIB_DIR)
	@echo "[INFO] Copying PDK Synthesis library (DB)..."
	cp $(PDK_DB_SRC) $@

prep_libs: $(LIB_VERILOG) $(LIB_DB)

# ==========================================
# Directory Preparation
# ==========================================
prep_sim_rtl: prep_libs
	mkdir -p $(SIM_RTL_OUT)

prep_sim_gls: prep_libs
	mkdir -p $(SIM_GLS_OUT)

prep_synth: prep_libs
	mkdir -p $(SYNTH_OUT)

# ==========================================
# RTL Syntax / Compilation / View
# ==========================================
rtl_syntax: prep_sim_rtl
	cd $(SIM_RTL_OUT) && vlogan $(VLOGAN_FLAGS) \
		$(PKG_FILES) \
		$(RTL_FILES) \
		$(TB_FILES)

rtl_compile: rtl_syntax
	cd $(SIM_RTL_OUT) && vcs $(VCS_FLAGS) -top $(TOP)

rtl_run:
	cd $(SIM_RTL_OUT) && ./simv -l simulation.log

rtl_view: rtl_run
	cd $(SIM_RTL_OUT) && verdi -ssf waves.fsdb &

# ==========================================
# Gate-Level Syntax / Compilation / View
# ==========================================
gls_syntax: prep_sim_gls synthesis
	cd $(SIM_GLS_OUT) && vlogan $(VLOGAN_FLAGS) \
		$(PKG_FILES) \
		$(RTL_LIB_FILES) \
		$(RTL_SYNTH_FILES) \
		$(TB_FILES)

gls_compile: gls_syntax
	cd $(SIM_GLS_OUT) && vcs $(VCS_GLS_FLAGS) -top $(TOP)

gls_run:
	cd $(SIM_GLS_OUT) && ./simv -l gls_simulation.log

gls_view: gls_run
	cd $(SIM_GLS_OUT) && verdi -ssf waves.fsdb &

# ==========================================
# Synthesis Elaboration / View
# ==========================================
synthesis: prep_synth
	cd $(SYNTH_OUT) && env ROOT_DIR=$(ROOT_DIR) dc_shell -f $(SYNTH_SCRIPT) | tee synthesis.log

synth_view:
	cd $(SYNTH_OUT) && design_vision -x "set env(ROOT_DIR) $(ROOT_DIR); source $(SYNTH_DIR)/.synopsys_dc.setup; read_ddc vending_machine.ddc"

# ==========================================
# Simulation + Synthesis + GLS + View
# ==========================================
all: rtl_compile synthesis gls_compile synth_view

# ==========================================
# Clean-up
# ==========================================
clean:
	rm -rf $(BUILD_DIR)
	rm -rf novas.rc novas.conf

clean_libs:
	rm -rf $(LIB_DIR)

clean_all: clean clean_libs

.PHONY: prep_libs prep_sim_rtl prep_sim_gls prep_synth rtl_syntax rtl_compile rtl_run rtl_view synthesis synth_view gls_syntax gls_compile gls_run gls_view all clean clean_libs clean_all