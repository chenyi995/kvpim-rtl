#!/usr/bin/env bash
# Unit/smoke tests for rtl/ (the 0830-02 component set), iverilog.  Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")/../.."
R=rtl
T=testbench
run() { local n=$1; shift; iverilog -g2012 -s "$n" -o "$T/$n.vvp" "$@" "$T/$n.sv"; vvp "$T/$n.vvp"; }

run tb_gemv_unit_0830_02     $R/fp16_add.sv $R/fp16_mult.sv $R/dbuf_16x256.sv $R/gemv_unit.sv
# same TB over the ASAP7-macro double buffer (the configuration DC synthesizes)
run tb_gemv_unit_0830_02     $R/fp16_add.sv $R/fp16_mult.sv $T/asap7_srambank_models.sv $R/dbuf_16x256_asap7.sv $R/gemv_unit.sv
run tb_accumulators_0830_02  $R/fp16_add.sv $R/accumulator_bg.sv $T/asap7_srambank_models.sv $R/accum_buffer_bg.sv $R/accumulator_logic.sv
run tb_dma_engine_0830_02    $R/dma_engine.sv
run tb_attacc_ctrl_0830_02   $R/fugue_pkg.sv $R/kv_tlb_pkg.sv $R/attacc_controller.sv $R/direct_addr_plan.sv $R/dma_engine.sv $R/attacc_hbm_ctrl_top.sv
run tb_fugue_ctrl_0830_02    $R/fugue_pkg.sv $R/kv_tlb_pkg.sv $R/attacc_controller.sv $R/kv_seg_tlb.sv $R/kv_ptw.sv $R/kv_scan_planner.sv $R/kv_tlb_top.sv $R/dma_engine.sv $R/fugue_hbm_ctrl_top.sv
run tb_logic_die_units_0830_02 $R/fugue_pkg.sv $R/fp32_add.sv $R/fp32_mul.sv $R/fp32_exp.sv $R/fp32_recip.sv $R/softmax_pe.sv $R/causal_comparator.sv $T/asap7_srambank_models.sv $R/softmax_buffer_sram.sv $R/softmax_unit.sv

echo "ALL 0830-02 TESTS PASSED"
