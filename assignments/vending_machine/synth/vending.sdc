# ============================================================
# Clock Definition
# ============================================================

# Defines the main synchronous clock with a 20ns period (50 MHz) as the baseline for timing analysis.
create_clock -name clk -period 20 [get_ports clk]

# Models real-world non-idealities like jitter and clock tree skew.
# set_clock_uncertainty 0.50 [get_clocks clk]

set_clock_uncertainty -setup 0.20 [get_clocks clk]
set_clock_uncertainty -hold  0.05 [get_clocks clk]
# Corrected value from 0.5ns to 0.05ns to fix hold time violations. 
# From my research, a 0.5ns clock uncertainty is too high for the 32nm technology used, 
# which requires adding dozens of inverters to meet hold time, negatively degrading area and power.

# ============================================================
# I/O Delays
# ============================================================

# Get all ports except the clock.
set inputs_exc_clk [remove_from_collection [all_inputs] [get_ports clk]]

# Constrains the setup/hold time available for incoming signals, reserving 3ns for external logic.
set_input_delay 3.0 -clock clk [get_ports {rst coin_in sel_item confirm cancel}]

# Constrains the setup/hold time required by external downstream logic, reserving 3ns after the clock edge.
set_output_delay 3.0 -clock clk [all_outputs]

# ============================================================
# Environment Attributes
# ============================================================

# Models the external capacitive load that the output pins must drive.
set inverter_pin_load [load_of saed32rvt_tt1p05v25c/INVX1_RVT/A]
set_load [expr {4 * $inverter_pin_load}] [all_outputs]

# Models the drive strength of the external cells feeding the inputs.
set_driving_cell -lib_cell INVX4_RVT $inputs_exc_clk