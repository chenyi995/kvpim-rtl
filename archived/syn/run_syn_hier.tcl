# run_syn_hier.tcl — Fugue logic die, TSMC N28, HIERARCHY-PRESERVING synthesis.
# Same MMMC / effort / SDC as run_syn.tcl, but WITHOUT the full flatten so we can
# itemize per-block area (u_tlb, u_rotate, u_diff, u_sfm, g_gemv[*], u_ctrl, ...).
# Use this ONLY for the per-block area breakdown — the headline QoR numbers come
# from the flattened run_syn.tcl (unflattened QoR differs slightly: less
# cross-boundary optimization).
#   env: FUGUE_TOP        (default fugue_logic_die)
#        FUGUE_PERIOD_NS  (default 2.0 -> 500 MHz)
#        FUGUE_TAG        (default hier)
#        FUGUE_FILELIST   (default filelist.f)

proc envdef {name default} {
  return [expr {[info exists ::env($name)] ? $::env($name) : $default}]
}

set top_module  [envdef FUGUE_TOP       fugue_logic_die]
set period      [envdef FUGUE_PERIOD_NS 2.0]
set tag         [envdef FUGUE_TAG       hier]
set filelist    [envdef FUGUE_FILELIST  filelist.f]
set sdc_file    "chip_${tag}.sdc"
set mmmc_file   "tsmcn28_mmmc.tcl"
set outputs_dir "outputs_${tag}"
set reports_dir "reports_${tag}"

foreach dir [list $outputs_dir $reports_dir] {
  if {![file exists $dir]} { file mkdir $dir }
}

# ---- generate the SDC for this clock target (identical to run_syn.tcl) ----
set f [open $sdc_file w]
puts $f "create_clock \[get_ports clk\] -name clk -period $period -waveform \{0 [expr {$period/2.0}]\}"
puts $f "set_clock_uncertainty 0.05 \[get_clocks clk\]"
puts $f "set_clock_transition -rise 0.02 \[get_clocks clk\]"
puts $f "set_clock_transition -fall 0.02 \[get_clocks clk\]"
puts $f "set_input_delay  \[expr {$period*0.30}\] -clock clk \[remove_from_collection \[all_inputs\] \[get_ports clk\]\]"
puts $f "set_output_delay \[expr {$period*0.30}\] -clock clk \[all_outputs\]"
puts $f "set_max_transition \[expr {$period*0.20}\] \[current_design\]"
puts $f "set_max_fanout 32 \[current_design\]"
puts $f "set_driving_cell -lib_cell BUFFD4BWP30P140 \[remove_from_collection \[all_inputs\] \[get_ports clk\]\]"
puts $f "set_load 0.005 \[all_outputs\]"
puts $f "set_false_path -from \[get_ports rst_n\]"
close $f

# ---- Genus knobs (T-cube recipe, but preserve hierarchy) ----
set_db hdl_error_on_blackbox     true
set_db max_cpus_per_server       8
set_db hdl_auto_sync_set_reset   true
set_db hdl_unconnected_value     none
set_db hdl_language              sv
set_db hdl_track_filename_row_col true
# Preserve the RTL hierarchy so per-instance area is reportable.
set_db root: .auto_ungroup none

# ---- MMMC ----
create_constraint_mode -name my_constraint_mode -sdc_files [list $sdc_file]
read_mmmc $mmmc_file
set_analysis_view -setup {SS.setup_view} -hold {FF.hold_view TT.extra_view}

# ---- RTL ----
read_hdl -f $filelist
elaborate $top_module
init_design -top $top_module

# ---- NO full flatten here (this is the whole point of the hier run) ----

# ---- synthesis ----
set_db [current_design] .retime false
set_db / .retime_effort_level low
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
# Per-instance hierarchical area breakdown (the phase-2 deliverable).
report_area -depth 5 > $reports_dir/${top_module}_area_hier.rpt
report_power  > $reports_dir/${top_module}_power.rpt
report_gates  > $reports_dir/${top_module}_gates.rpt
write_hdl     > $outputs_dir/${top_module}_mapped.v

puts "== SYN(HIER) DONE: top=$top_module period=${period}ns tag=$tag =="
quit
