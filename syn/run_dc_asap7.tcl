# Reproducible module/top synthesis using the bundled open ASAP7 RVT/TT NLDM
# libraries.  All constraints are deliberately identical across profiles.
#
# Example (from syn/):
#   . /home/common/profile_synopsys
#   SYN_TOP=softmax_unit SYN_PROFILE=logic SYN_TAG=softmax_p20 \
#     SYN_PERIOD_NS=2.0 dc_shell -f run_dc_asap7.tcl

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ..]]
set lib_dir    [file join $root_dir third_party asap7_lib db]
set sram_dir   [file join $root_dir third_party asap7 asap7_sram_0p0 generated]
set pe_macro_db [file join $script_dir softmax_pe.db]

proc envdef {name default} {
    return [expr {[info exists ::env($name)] ? $::env($name) : $default}]
}

# Keep each RTL optimization trial self-contained.  SYN_RTL_DIR only changes
# the source directory; constraints below remain exactly the same.
set rtl_dir [envdef SYN_RTL_DIR [file join $root_dir rtl]]
if {[file pathtype $rtl_dir] ne "absolute"} {
    # Command-line users invoke this script from syn/.  Resolve a relative
    # trial directory there first, so ../rtl/0830-01 selects kvpim-rtl's
    # branch rather than a nonexistent workspace-level rtl/ directory.
    set from_script_dir [file normalize [file join $script_dir $rtl_dir]]
    if {[file isdirectory $from_script_dir]} {
        set rtl_dir $from_script_dir
    } else {
        set rtl_dir [file normalize [file join $root_dir $rtl_dir]]
    }
}

set top_module [envdef SYN_TOP attacc_logic_die]
set profile    [envdef SYN_PROFILE logic]
set tag        [envdef SYN_TAG $top_module]
set period_ns  [envdef SYN_PERIOD_NS 2.0]
set pe_period_ns [envdef SYN_PE_PERIOD_NS ""]
set max_cores  [envdef SYN_MAX_CORES 4]
set io_delay_ratio [envdef SYN_IO_DELAY_RATIO 0.30]
set fix_hold [envdef SYN_FIX_HOLD 0]
set period     [expr {$period_ns * 1000.0}]
set out_root   [envdef SYN_OUT_ROOT dc_asap7]
if {[file pathtype $out_root] ne "absolute"} {
    set out_root [file join $script_dir $out_root]
}
set out_dir    [file join $out_root $tag]
file mkdir $out_dir

set target_library [glob -nocomplain [file join $lib_dir *.db]]
if {[llength $target_library] == 0} {
    error "No ASAP7 .db views in $lib_dir"
}
set link_library "* $target_library"
set search_path [list $rtl_dir $lib_dir $sram_dir [file join $sram_dir verilog]]

# Bound a single DC invocation to the requested local CPU budget.  The matrix
# shell driver runs jobs sequentially, so SYN_MAX_CORES=4 means at most four
# CPU cores are used by this flow (rather than four concurrent DC jobs).
set_host_options -max_cores $max_cores

# Profiles keep package/source ordering deterministic and only compile RTL used
# by the requested hardware block.
set common_logic [list \
    fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256.sv \
    fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv \
    accumulator.sv softmax_pe.sv softmax_tile_unit.sv]
set sram_common [list \
    fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv \
    fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv \
    accumulator.sv softmax_pe.sv softmax_buffer_sram.sv softmax_unit.sv]
set sram_common_pe_macro [list \
    fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv \
    fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv \
    accumulator.sv softmax_pe_blackbox.sv softmax_buffer_sram.sv softmax_unit.sv softmax_array_256.sv]
proc enable_asap7_sram {sram_dir} {
    global target_library link_library
    foreach name {srambank_256x4x64_6t122 srambank_64x4x16_6t122 srambank_64x4x80_6t122 srambank_64x4x32_6t122 srambank_256x4x80_6t122 srambank_256x4x32_6t122} {
        set db [file join $sram_dir db ${name}.db]
        if {[file exists $db]} {
            lappend target_library $db
        } else {
            error "Missing SRAM DB view: $db. Run compile_asap7_sram_libs.tcl with lc_shell_exec."
        }
    }
    set link_library "* $target_library"
}
proc enable_softmax_pe_macro {pe_macro_db} {
    global target_library link_library
    if {![file exists $pe_macro_db]} {
        error "Missing PE macro DB: $pe_macro_db. Compile softmax_pe_macro.lib first."
    }
    lappend target_library $pe_macro_db
    set link_library "* $target_library"
}
switch -- $profile {
    logic {
        # softmax_unit is macro-backed even when synthesized standalone.
        enable_asap7_sram $sram_dir
        set sources $sram_common
    }
    fp32_add { set sources [list fp32_add.sv] }
    fp32_exp { set sources [list fp32_exp.sv] }
    fp32_mul { set sources [list fp32_mul.sv] }
    fp32_recip { set sources [list fp32_recip.sv] }
    softmax_comparator_tree { set sources [list softmax_comparator_tree.sv] }
    softmax_pe { set sources [list fp32_add.sv fp32_exp.sv fp32_mul.sv softmax_pe.sv] }
    softmax_array_256 {
        enable_asap7_sram $sram_dir
        enable_softmax_pe_macro $pe_macro_db
        set sources $sram_common_pe_macro
    }
    gemv {
        set sources [list fp16_mult.sv fp16_add.sv dbuf_16x256.sv gemv_unit.sv]
    }
    gemv_macro {
        enable_asap7_sram $sram_dir
        set sources [list fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv gemv_unit.sv]
    }
    gemv_buffer {
        enable_asap7_sram $sram_dir
        set sources [list dbuf_16x256_asap7.sv]
    }
    softmax_buffer_attacc {
        enable_asap7_sram $sram_dir
        set sources [list softmax_buffer_sram.sv softmax_buffer_dc_tops.sv]
    }
    softmax_buffer_fugue {
        enable_asap7_sram $sram_dir
        set sources [list softmax_buffer_sram.sv softmax_buffer_dc_tops.sv]
    }
    accum {
        set sources [list fugue_pkg.sv fp16_add.sv accumulator.sv]
    }
    accum_bg {
        set sources [list fugue_pkg.sv fp16_add.sv accumulator.sv accumulator_bg_dc_top.sv]
    }
    controller {
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv direct_addr_plan.sv attacc_controller.sv]
    }
    direct_addr {
        set sources [list kv_tlb_pkg.sv direct_addr_plan.sv]
    }
    diff_leaf {
        set sources [list fugue_pkg.sv diff_decoder.sv]
    }
    diff_channel {
        set sources [list fugue_pkg.sv diff_decoder.sv diff_decoder_channel_dc_top.sv]
    }
    kvseg {
        set sources [list kv_tlb_pkg.sv kv_seg_tlb.sv]
    }
    kvptw {
        set sources [list kv_tlb_pkg.sv kv_ptw.sv]
    }
    kvplan {
        set sources [list kv_tlb_pkg.sv kv_scan_planner.sv]
    }
    diff {
        set sources [concat $common_logic [list diff_decoder.sv]]
    }
    attacc {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list direct_addr_plan.sv attacc_controller.sv attacc_logic_die.sv]]
    }
    attacc_macro {
        enable_asap7_sram $sram_dir
        enable_softmax_pe_macro $pe_macro_db
        set sources [concat $sram_common_pe_macro [list direct_addr_plan.sv attacc_controller.sv attacc_logic_die.sv]]
    }
    attacc_sram {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list direct_addr_plan.sv attacc_controller.sv attacc_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]]
    }
    attacc_buffered_sram {
        enable_asap7_sram $sram_dir
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv \
            fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv accumulator.sv \
            softmax_sram_16kb.sv buffered_softmax_unit.sv direct_addr_plan.sv attacc_controller.sv attacc_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]
    }
    fugue2 {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue2_logic_die.sv]]
    }
    fugue2_macro {
        enable_asap7_sram $sram_dir
        enable_softmax_pe_macro $pe_macro_db
        set sources [concat $sram_common_pe_macro [list kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue2_logic_die.sv]]
    }
    fugue2_sram {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue2_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]]
    }
    fugue2_buffered_sram {
        enable_asap7_sram $sram_dir
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv \
            fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv accumulator.sv \
            fp16_mult_piped.sv fp16_add_piped.sv mac_tree16_piped.sv mq_bank_pe.sv \
            softmax_sram_16kb.sv buffered_softmax_unit.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv \
            diff_decoder.sv attacc_controller.sv fugue2_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]
    }
    fugue {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue_logic_die.sv]]
    }
    fugue_macro {
        enable_asap7_sram $sram_dir
        enable_softmax_pe_macro $pe_macro_db
        set sources [concat $sram_common_pe_macro [list bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue_logic_die.sv]]
    }
    fugue_sram {
        enable_asap7_sram $sram_dir
        set sources [concat $sram_common [list bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]]
    }
    fugue_buffered_sram {
        enable_asap7_sram $sram_dir
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv \
            fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv gemv_unit.sv accumulator.sv \
            fp16_mult_piped.sv fp16_add_piped.sv mac_tree16_piped.sv mq_bank_pe.sv \
            softmax_sram_16kb.sv buffered_softmax_unit.sv bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv \
            kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv diff_decoder.sv attacc_controller.sv fugue_logic_die.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v] \
            [file join $sram_dir verilog srambank_64x4x16_6t122.v]]
    }
    kvtlb {
        set sources [list kv_tlb_pkg.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv kv_tlb_variants.sv]
    }
    rotate {
        set sources [list bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv]
    }
    smbuf {
        set sources [list fugue_pkg.sv softmax_buffer.sv]
    }
    smbuf_sram {
        set sram_db [file join $sram_dir db srambank_256x4x64_6t122.db]
        if {![file exists $sram_db]} {
            error "Missing $sram_db. Run: lc_shell -f compile_asap7_sram_libs.tcl"
        }
        lappend target_library $sram_db
        set link_library "* $target_library"
        set sources [list fugue_pkg.sv softmax_buffer_sram.sv softmax_buffer.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v]]
    }
    bankpe {
        set sources [list fugue_pkg.sv fp16_mult.sv fp16_add.sv fp16_mult_piped.sv fp16_add_piped.sv mac_tree16_piped.sv dbuf_16x256.sv gemv_unit.sv mq_bank_pe.sv]
    }
    softmax_compute {
        # Arithmetic and reduction-tree timing checks.  No SRAM macro is
        # needed until the complete buffered_softmax_unit stage.
        set sources [list fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv buffered_softmax_unit.sv]
    }
    buffered_smax {
        set sram_db [file join $sram_dir db srambank_256x4x64_6t122.db]
        if {![file exists $sram_db]} { error "Missing $sram_db" }
        lappend target_library $sram_db
        set link_library "* $target_library"
        set sources [list fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv \
            softmax_sram_16kb.sv buffered_softmax_unit.sv \
            [file join $sram_dir verilog srambank_256x4x64_6t122.v]]
    }
    default { error "Unknown SYN_PROFILE=$profile" }
}
set src_paths {}
foreach source $sources {
    if {[file pathtype $source] eq "absolute"} { lappend src_paths $source } \
    else { lappend src_paths [file join $rtl_dir $source] }
}

define_design_lib WORK -path [file join $out_dir WORK]
analyze -format sverilog $src_paths
elaborate $top_module
current_design $top_module
link

create_clock -name clk -period $period [get_ports clk]
if {$pe_period_ns ne "" && [sizeof_collection [get_ports pe_clk]] != 0} {
    create_clock -name pe_clk -period [expr {$pe_period_ns * 1000.0}] [get_ports pe_clk]
    # The structural MQ model has a dedicated PE clock domain.  CDC logic is
    # outside this area-estimation abstraction, so do not time one domain as
    # combinational logic driven by the other.
    set_clock_groups -asynchronous -group [get_clocks clk] -group [get_clocks pe_clk]
}
set_clock_uncertainty 50.0 [get_clocks clk]
set_clock_transition 20.0 [get_clocks clk]
if {[sizeof_collection [get_ports pe_clk]] != 0} {
    set clock_reset_ports [get_ports {clk pe_clk rst_n}]
} else {
    set clock_reset_ports [get_ports {clk rst_n}]
}
set data_ports [remove_from_collection [all_inputs] $clock_reset_ports]
set_input_delay [expr {$period * $io_delay_ratio}] -clock clk $data_ports
set_output_delay [expr {$period * $io_delay_ratio}] -clock clk [all_outputs]
set_driving_cell -lib_cell BUFx2_ASAP7_75t_R $data_ports
set_load 0.005 [all_outputs]
set_false_path -from [get_ports rst_n]
if {$fix_hold} {
    set_fix_hold [get_clocks clk]
}

# Low effort keeps the full matrix practical for the ~0.5 mm² logic-die tops.
# It remains timing/area-driven technology mapping, with identical effort for
# every A/B point; this is not a sign-off/PPA-closure run.
compile -map_effort low -area_effort low
if {$fix_hold} {
    # The first mapping pass is setup-driven.  Run DC's dedicated incremental
    # min-delay repair afterwards so the reported macro view is setup *and*
    # hold clean, without re-optimising the pipeline structure.
    compile -incremental -only_hold_time
}

report_qor -nosplit > [file join $out_dir ${top_module}_qor.rpt]
report_area -hierarchy -nosplit > [file join $out_dir ${top_module}_area.rpt]
# Keeps the SRAM macro count, reference and mapped area explicit instead of
# folding it into the surrounding softmax-buffer hierarchy.
report_reference -hierarchy -nosplit > [file join $out_dir ${top_module}_references.rpt]
report_timing -delay_type max -max_paths 20 -nosplit > [file join $out_dir ${top_module}_timing.rpt]
report_timing -delay_type min -max_paths 20 -nosplit > [file join $out_dir ${top_module}_timing_hold.rpt]
report_power -nosplit > [file join $out_dir ${top_module}_power.rpt]
write -format verilog -hierarchy -output [file join $out_dir ${top_module}_mapped.v]
write_sdc [file join $out_dir ${top_module}.sdc]
quit
