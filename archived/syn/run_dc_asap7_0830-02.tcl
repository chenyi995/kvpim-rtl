# Per-component ASAP7 synthesis for the rtl/0830-02 snapshot.
# Same constraint recipe as run_dc_asap7.tcl (bundled ASAP7 RVT/TT NLDM
# standard-cell .db views; identical constraints across profiles) but with a
# profile table for the 0830-02 component set only.  No top-level synthesis:
# each hardware level's overhead is rolled up from these component areas
# (docs/0830-02/Hardware_Overhead_Breakdown.md).
#
# Example (from syn/):
#   . /home/common/profile_synopsys
#   SYN_PROFILE=gemv SYN_TOP=gemv_unit SYN_TAG=gemv_attacc \
#     SYN_PERIOD_NS=1.5015015 dc_shell -f run_dc_asap7_0830-02.tcl

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ..]]
set lib_dir    [file join $root_dir third_party asap7_lib db]
set sram_dir   [file join $root_dir third_party asap7 asap7_sram_0p0 generated]

proc envdef {name default} {
    return [expr {[info exists ::env($name)] ? $::env($name) : $default}]
}

set rtl_dir [envdef SYN_RTL_DIR [file join $root_dir rtl 0830-02]]
if {[file pathtype $rtl_dir] ne "absolute"} {
    set from_script_dir [file normalize [file join $script_dir $rtl_dir]]
    if {[file isdirectory $from_script_dir]} {
        set rtl_dir $from_script_dir
    } else {
        set rtl_dir [file normalize [file join $root_dir $rtl_dir]]
    }
}

set top_module [envdef SYN_TOP gemv_unit]
set profile    [envdef SYN_PROFILE gemv]
set tag        [envdef SYN_TAG $top_module]
set period_ns  [envdef SYN_PERIOD_NS 1.5015015]
set max_cores  [envdef SYN_MAX_CORES 4]
set io_delay_ratio [envdef SYN_IO_DELAY_RATIO 0.30]
set fix_hold   [envdef SYN_FIX_HOLD 1]
set period     [expr {$period_ns * 1000.0}]
set out_root   [envdef SYN_OUT_ROOT dc_0830-02]
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

set_host_options -max_cores $max_cores

# Link the compiled ASAP7 SRAM macro .db views (compile_asap7_sram_libs.tcl).
proc enable_asap7_sram {sram_dir} {
    global target_library link_library
    foreach name {srambank_64x4x16_6t122 srambank_64x4x32_6t122 srambank_64x4x80_6t122 \
                  srambank_256x4x32_6t122 srambank_256x4x80_6t122 srambank_256x4x64_6t122} {
        set db [file join $sram_dir db ${name}.db]
        if {[file exists $db]} {
            lappend target_library $db
        }
    }
    if {![file exists [file join $sram_dir db srambank_64x4x16_6t122.db]]} {
        error "Missing SRAM DB views in $sram_dir/db. Run compile_asap7_sram_libs.tcl first."
    }
    set link_library "* $target_library"
}

# ---------------------------------------------------------------------------
# Profiles: RTL needed for each component (per docs/Hardware Overhead.md and
# the Fugue paper Sec. 4.3).  Frequencies are set by the driver script.
# ---------------------------------------------------------------------------
switch -- $profile {
    gemv {
        # Bank level: one GEMV unit (16 FP16 mult + 16 dual-mode FP16 add +
        # double-buffered 16x256b vector buffer + control unit).  The buffer
        # is the ASAP7 SRAM-macro implementation (2 groups x 16 x 256x16b).
        enable_asap7_sram $sram_dir
        set sources [list fp16_mult.sv fp16_add.sv dbuf_16x256_asap7.sv gemv_unit.sv]
    }
    dbuf {
        # The double-buffered GEMV buffer alone (breakdown term), macro-backed.
        enable_asap7_sram $sram_dir
        set sources [list dbuf_16x256_asap7.sv]
    }
    gemv_flop {
        # Reference point: the same GEMV unit with the flop-based buffer.
        set sources [list fp16_mult.sv fp16_add.sv dbuf_16x256.sv gemv_unit.sv]
    }
    accum_bg {
        # BG level: 4->1 FP16 accumulator with bypass/sum modes.
        set sources [list fp16_add.sv accumulator_bg.sv]
    }
    accum_buf_bg {
        # BG level: the accumulator buffer on one 256x16 ASAP7 macro.
        # Tops: accum_buffer_bg_attacc (8 x FP16, one query in flight) /
        #       accum_buffer_bg_fugue (64 x FP16 = n_cap(8) resident queries
        #       x 8-slot staging each; multi-Q over one shared K column).
        enable_asap7_sram $sram_dir
        set sources [list accum_buffer_bg.sv]
    }
    accum_logic {
        # Logic die: one per-channel context accumulator (16 lanes x 4 words).
        set sources [list fp16_add.sv accumulator_logic.sv]
    }
    diff_channel {
        # Logic die (Fugue): one per-channel D_i map / diff decoder.
        set sources [list fugue_pkg.sv diff_decoder.sv diff_decoder_channel_dc_top.sv]
    }
    causal_cmp {
        # Logic die (Fugue): one per-channel causal comparator.
        set sources [list causal_comparator.sv]
    }
    rope {
        # Ablation only ("Fugue with on-die RoPE"); the paper's die does NOT
        # carry rotation logic (RoPE runs on the GPU, Sec. 4.2).
        set sources [list bf16_mult.sv bf16_add.sv sincos_bf16.sv rotate_q_bf16.sv]
    }
    kvtlb {
        # Controller breakdown term: the KV segment TLB alone.
        set sources [list kv_tlb_pkg.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv]
    }
    ctrl_attacc {
        # HBM controller, AttAcc: instr queue/decoder + config memory +
        # addr-gen/DRAM FSM + DMA engine + direct address path.
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv attacc_controller.sv \
            direct_addr_plan.sv dma_engine.sv attacc_hbm_ctrl_top.sv]
    }
    ctrl_fugue {
        # HBM controller, Fugue: same core + DMA + the KV segment TLB
        # (diff-block address management).
        set sources [list fugue_pkg.sv kv_tlb_pkg.sv attacc_controller.sv \
            kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv \
            dma_engine.sv fugue_hbm_ctrl_top.sv]
    }
    softmax_pe {
        # Reference only: softmax_pe already met 699 ps in dc_0830-01
        # (setup/hold clean), which covers the 1.3 GHz (769 ps) requirement;
        # re-synthesis is NOT needed.
        set sources [list fp32_add.sv fp32_exp.sv fp32_mul.sv softmax_pe.sv]
    }
    fp32_recip {
        # The one softmax leaf missing from dc_0830-01 (one per channel
        # engine); synthesized once at the softmax clock for the roll-up.
        set sources [list fp32_recip.sv]
    }
    default { error "Unknown SYN_PROFILE=$profile" }
}

set src_paths {}
foreach source $sources { lappend src_paths [file join $rtl_dir $source] }

define_design_lib WORK -path [file join $out_dir WORK]
analyze -format sverilog $src_paths
elaborate $top_module
current_design $top_module
link

create_clock -name clk -period $period [get_ports clk]
set_clock_uncertainty 50.0 [get_clocks clk]
set_clock_transition 20.0 [get_clocks clk]
set clock_reset_ports [get_ports {clk rst_n}]
set data_ports [remove_from_collection [all_inputs] $clock_reset_ports]
set_input_delay [expr {$period * $io_delay_ratio}] -clock clk $data_ports
set_output_delay [expr {$period * $io_delay_ratio}] -clock clk [all_outputs]
set_driving_cell -lib_cell BUFx2_ASAP7_75t_R $data_ports
set_load 0.005 [all_outputs]
set_false_path -from [get_ports rst_n]
if {$fix_hold} {
    set_fix_hold [get_clocks clk]
}

compile -map_effort low -area_effort low
if {$fix_hold} {
    compile -incremental -only_hold_time
}

report_qor -nosplit > [file join $out_dir ${top_module}_qor.rpt]
report_area -hierarchy -nosplit > [file join $out_dir ${top_module}_area.rpt]
report_reference -hierarchy -nosplit > [file join $out_dir ${top_module}_references.rpt]
report_timing -delay_type max -max_paths 20 -nosplit > [file join $out_dir ${top_module}_timing.rpt]
report_timing -delay_type min -max_paths 20 -nosplit > [file join $out_dir ${top_module}_timing_hold.rpt]
report_power -nosplit > [file join $out_dir ${top_module}_power.rpt]
write -format verilog -hierarchy -output [file join $out_dir ${top_module}_mapped.v]
write_sdc [file join $out_dir ${top_module}.sdc]
quit
