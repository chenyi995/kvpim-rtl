#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
run() { local n=$1; shift; iverilog -g2012 -s "$n" -o "testbench/$n.vvp" "$@" "testbench/$n.sv" 2>/dev/null; vvp "testbench/$n.vvp"; }
run tb_fp16_bf16_arith rtl/fp16_add.sv rtl/fp16_mult.sv rtl/bf16_add.sv rtl/bf16_mult.sv
run tb_fp32_add_mul rtl/fp32_add.sv rtl/fp32_mul.sv
run tb_fp32_exp_recip rtl/fp32_exp.sv rtl/fp32_recip.sv
run tb_dbuf rtl/dbuf_16x256.sv
run tb_dbuf_sram testbench/sram_macro_models.sv rtl/dbuf_sram.sv
run tb_kv_tlb rtl/kv_tlb_pkg.sv rtl/kv_seg_tlb.sv rtl/kv_ptw.sv rtl/kv_scan_planner.sv rtl/kv_tlb_top.sv
run tb_diff_decoder rtl/fugue_pkg.sv rtl/diff_decoder.sv
run tb_mq_diff_decoder rtl/fugue_pkg.sv rtl/mq_diff_decoder.sv
run tb_mq_score_store rtl/fugue_pkg.sv rtl/kv_tlb_pkg.sv rtl/fugue_mq_logic_die.sv
run tb_sincos_bf16 rtl/bf16_add.sv rtl/bf16_mult.sv rtl/sincos_bf16.sv
run tb_rotate_q_unit rtl/fp16_add.sv rtl/fp16_mult.sv rtl/rotate_q_unit.sv
run tb_rotate_q_bf16 rtl/bf16_add.sv rtl/bf16_mult.sv rtl/sincos_bf16.sv rtl/rotate_q_bf16.sv
run tb_accumulator rtl/fugue_pkg.sv rtl/fp16_add.sv rtl/accumulator.sv
run tb_mac_tree16 rtl/fp16_add.sv rtl/fp16_mult.sv rtl/mac_tree16.sv
run tb_mac_tree16_piped rtl/fp16_add_piped.sv rtl/fp16_mult_piped.sv rtl/mac_tree16_piped.sv
run tb_mq_bg_reduce rtl/fp16_add.sv rtl/mq_bg_reduce.sv
run tb_gemv_unit rtl/fp16_add.sv rtl/fp16_mult.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv
run tb_gemv_unit_modes rtl/fp16_add.sv rtl/fp16_mult.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv
run tb_softmax_unit rtl/fugue_pkg.sv rtl/fp32_add.sv rtl/fp32_mul.sv rtl/fp32_exp.sv rtl/fp32_recip.sv rtl/softmax_unit.sv
run tb_softmax_buffer rtl/softmax_buffer.sv
run tb_attacc_controller rtl/fugue_pkg.sv rtl/kv_tlb_pkg.sv rtl/attacc_controller.sv
run tb_attacc_controller_mac rtl/fugue_pkg.sv rtl/kv_tlb_pkg.sv rtl/attacc_controller.sv
run tb_mq_bank_pe rtl/fp16_add.sv rtl/fp16_mult.sv rtl/fp16_add_piped.sv rtl/fp16_mult_piped.sv rtl/mac_tree16_piped.sv rtl/dbuf_16x256.sv rtl/mq_bank_pe.sv
