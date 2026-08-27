# run_syn_asap7.tcl — bank-PE / logic-die synthesis on ASAP7, FULL-FLATTEN.
# Same recipe shape as run_syn.tcl (N28) with the ASAP7 unit conventions:
# the liberty time unit is 1 ps, so the clock target is passed in PS.
#   env: FUGUE_TOP        (default mq_pe_16x2_d32)
#        FUGUE_PERIOD_PS  (default 1500 -> 667 MHz)
#        FUGUE_TAG        (default asap7run)
#        FUGUE_FILELIST   (default filelist_bankpe.f)
#        FUGUE_CPUS       (default 4 — sweep runs several Genus in parallel)

proc envdef {name default} {
  return [expr {[info exists ::env($name)] ? $::env($name) : $default}]
}

set top_module  [envdef FUGUE_TOP       mq_pe_16x2_d32]
set period      [envdef FUGUE_PERIOD_PS 1500]
set tag         [envdef FUGUE_TAG       asap7run]
set filelist    [envdef FUGUE_FILELIST  filelist_bankpe.f]
set ncpus       [envdef FUGUE_CPUS      4]
# The *_piped units carry their extra pipeline registers at the output of one
# combinational cloud and rely on retiming to distribute them (see
# fp16_mult_piped.sv) — so retime defaults ON for the ASAP7 sweep.
set do_retime   [envdef FUGUE_RETIME    1]
set sdc_file    "chip_${tag}.sdc"
set mmmc_file   "asap7_mmmc.tcl"
set outputs_dir "outputs_${tag}"
set reports_dir "reports_${tag}"

foreach dir [list $outputs_dir $reports_dir] {
  if {![file exists $dir]} { file mkdir $dir }
}

# ---- generate the SDC for this clock target (values in ps, ASAP7 lib unit) ----
set f [open $sdc_file w]
puts $f "create_clock \[get_ports clk\] -name clk -period $period -waveform \{0 [expr {$period/2.0}]\}"
puts $f "set_clock_uncertainty [expr {$period*0.03}] \[get_clocks clk\]"
puts $f "set_clock_transition -rise [expr {$period*0.01}] \[get_clocks clk\]"
puts $f "set_clock_transition -fall [expr {$period*0.01}] \[get_clocks clk\]"
puts $f "set_input_delay  \[expr {$period*0.10}\] -clock clk \[remove_from_collection \[all_inputs\] \[get_ports clk\]\]"
puts $f "set_output_delay \[expr {$period*0.10}\] -clock clk \[all_outputs\]"
puts $f "set_max_transition \[expr {$period*0.20}\] \[current_design\]"
puts $f "set_max_fanout 32 \[current_design\]"
puts $f "set_driving_cell -lib_cell BUFx4_ASAP7_75t_R \[remove_from_collection \[all_inputs\] \[get_ports clk\]\]"
puts $f "set_load 5 \[all_outputs\]"
puts $f "set_false_path -from \[get_ports rst_n\]"
close $f

# ---- Genus knobs ----
set_db hdl_error_on_blackbox     true
set_db max_cpus_per_server       $ncpus
set_db hdl_auto_sync_set_reset   true
set_db hdl_unconnected_value     none
set_db hdl_language              sv
set_db hdl_track_filename_row_col true
set_db root: .auto_ungroup both
set_db lp_power_unit             mW

# ---- MMMC ----
create_constraint_mode -name my_constraint_mode -sdc_files [list $sdc_file]
read_mmmc $mmmc_file
set_analysis_view -setup {TT.setup_view} -hold {TT.hold_view}

# ---- RTL ----
read_hdl -f $filelist
elaborate $top_module
init_design -top $top_module

# ---- FULL FLATTEN (same convention as the N28 bank-PE study) ----
ungroup -all -flatten

# ---- synthesis ----
if {$do_retime} {
  set_db [current_design] .retime true
  set_db / .retime_effort_level high
} else {
  set_db [current_design] .retime false
  set_db / .retime_effort_level low
}
set_db syn_generic_effort high
syn_generic
set_db syn_map_effort high
syn_map
set_db syn_opt_effort high
syn_opt

# ---- reports ----
report_timing > $reports_dir/${top_module}_timing.rpt
report_qor    > $reports_dir/${top_module}_qor.rpt
report_area   > $reports_dir/${top_module}_area.rpt
report_power  > $reports_dir/${top_module}_power.rpt
report_gates  > $reports_dir/${top_module}_gates.rpt
write_hdl     > $outputs_dir/${top_module}_mapped.v

puts "== SYN DONE: top=$top_module period=${period}ps tag=$tag =="
quit
