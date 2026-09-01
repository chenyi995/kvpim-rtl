# run_genus_0831.tcl — Genus/ASAP7 hierarchical (leaf-as-macro) synthesis.
# One generic script for both phases:
#   * leaf phase: synthesize a leaf multiplier/adder at a TIGHTER clock than
#     any parent; its mapped netlist becomes the macro handed upward.
#     (This Genus install has no standalone ETM/.lib writer, so the macro is
#     the frozen gate-level netlist rather than an extracted timing model —
#     timing seen at the parent is therefore exact, not abstracted.)
#   * upper phase: read the leaf mapped netlists together with the level's
#     RTL and dont_touch/preserve the leaf modules (G_MACRO_MODS), so they
#     are never re-synthesized; ASAP7 SRAM macros come in as real .lib views
#     (G_EXTRA_LIBS).
# env: G_TAG G_TOP G_FILES (space-sep paths) G_PERIOD_PS G_CPUS G_EXTRA_LIBS
#      G_MACRO_MODS G_OUT (run dir, made by the driver)
# Units: ASAP7 liberty time unit is 1 ps — all SDC values below are ps.

proc envdef {name default} {
  return [expr {[info exists ::env($name)] ? $::env($name) : $default}]
}

set tag        [envdef G_TAG run]
set top        [envdef G_TOP ""]
set files      [envdef G_FILES ""]
set period     [envdef G_PERIOD_PS 1501.5]
set ncpus      [envdef G_CPUS 4]
set extra_libs [envdef G_EXTRA_LIBS ""]
set macro_mods [envdef G_MACRO_MODS ""]
set do_retime  [envdef G_RETIME 1]
set in_frac    [envdef G_IN_FRAC 0.10]
set out_dir    [envdef G_OUT .]

set_db max_cpus_per_server $ncpus
set_db hdl_language sv
set_db hdl_auto_sync_set_reset true
set_db hdl_unconnected_value none
set_db lp_power_unit mW

# ---- libraries: ASAP7 std cells (TT 0.7V, RVT+LVT+SLVT) + macros ----------
set nldm /data2/tools-additional/pdk/asap7/asap7sc7p5t_27/LIB/NLDM
set libs {}
foreach grp {AO OA INVBUF SEQ SIMPLE} { foreach vt {RVT LVT SLVT} {
  lappend libs [file join $nldm "asap7sc7p5t_${grp}_${vt}_TT_nldm_201020.lib"]
} }
foreach l [split $extra_libs] { if {$l ne ""} { lappend libs $l } }
read_libs $libs

# ---- RTL + leaf macro netlists ---------------------------------------------
set_db hdl_error_on_blackbox false
set_db root: .auto_ungroup none
read_hdl -sv [split $files]
elaborate $top
init_design -top $top

# freeze the leaf macros: never re-synthesized, hierarchy kept
foreach m [split $macro_mods] {
  if {$m eq ""} { continue }
  foreach mod [get_db modules -if ".base_name == $m"] {
    catch { set_db $mod .dont_touch true }
    catch { set_db $mod .preserve true }
  }
  foreach hi [get_db hinsts -if ".module.base_name == $m"] {
    catch { set_db $hi .preserve true }
  }
}

# ---- constraints (ps) ------------------------------------------------------
set clk_ports [get_db ports -if {.base_name == clk}]
if {[llength $clk_ports] > 0} {
  create_clock [get_db ports clk] -name clk -period $period
  set_clock_uncertainty [expr {$period*0.03}] [get_clocks clk]
  set data_ins [remove_from_collection [all_inputs] [get_ports clk]]
} else {
  create_clock -name vclk -period $period
  set data_ins [all_inputs]
}
set_input_delay  [expr {$period*$in_frac}] -clock [get_clocks *] $data_ins
set_output_delay [expr {$period*0.10}] -clock [get_clocks *] [all_outputs]
set_max_fanout 32 [current_design]
set_driving_cell -lib_cell BUFx4_ASAP7_75t_R $data_ins
set_load 5 [all_outputs]
if {[llength [get_db ports -if {.base_name == rst_n}]] > 0} {
  set_false_path -from [get_ports rst_n]
}

# ---- synthesis --------------------------------------------------------------
# Uppers: retiming ON (single-cycle datapaths close 769 ps this way — proven
# by the balance-point mp1 run). Leaves: retiming OFF so the architected
# comb->output-register boundary is preserved for the macro hand-off, with a
# larger input budget (G_IN_FRAC) standing in for the parent's glue.
if {$do_retime} {
  set_db [current_design] .retime true
  set_db / .retime_effort_level high
} else {
  set_db [current_design] .retime false
}
set_db syn_generic_effort high
syn_generic
set_db syn_map_effort high
syn_map
set_db syn_opt_effort high
syn_opt

# ---- reports ---------------------------------------------------------------
report_timing            > $out_dir/${top}_timing.rpt
report_qor               > $out_dir/${top}_qor.rpt
report_area              > $out_dir/${top}_area.rpt
report_power             > $out_dir/${top}_power.rpt
report_gates             > $out_dir/${top}_gates.rpt
write_hdl                > $out_dir/${top}_mapped.v

puts "== GENUS DONE: tag=$tag top=$top period=${period}ps =="
quit
