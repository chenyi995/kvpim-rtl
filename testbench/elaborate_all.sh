#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
out=testbench/build
mkdir -p "$out"
elab(){ local top=$1 outname=$2; shift 2; iverilog -g2012 -s "$top" -o "$out/$outname.vvp" "$@" >/dev/null 2>&1; printf 'PASS elaborate %s\n' "$top"; }
BASE=(rtl/fugue_pkg.sv rtl/fp16_mult.sv rtl/fp16_add.sv rtl/dbuf_16x256.sv rtl/fp32_add.sv rtl/fp32_mul.sv rtl/fp32_exp.sv rtl/fp32_recip.sv rtl/gemv_unit.sv rtl/accumulator.sv rtl/softmax_unit.sv rtl/attacc_controller.sv)
elab attacc_logic_die attacc_logic_die "${BASE[@]}" rtl/attacc_logic_die.sv
elab fugue2_logic_die fugue2_logic_die "${BASE[@]}" rtl/tlb.sv rtl/diff_decoder.sv rtl/fugue2_logic_die.sv
elab fugue_logic_die fugue_logic_die "${BASE[@]}" rtl/bf16_mult.sv rtl/bf16_add.sv rtl/sincos_bf16.sv rtl/rotate_q_bf16.sv rtl/tlb.sv rtl/diff_decoder.sv rtl/fugue_logic_die.sv
elab fugue_mq_a8 fugue_mq_a8 "${BASE[@]}" rtl/tlb.sv rtl/mq_diff_decoder.sv rtl/fugue_mq_logic_die.sv
elab mac_tree16_p22 mac_tree16_p22 rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/mac_tree16_variants.sv
elab mac_tree16_p23 mac_tree16_p23 rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/mac_tree16_variants.sv
elab mac_tree16_p33 mac_tree16_p33 rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/mac_tree16_variants.sv
elab attacc_bank_pe attacc_bank_pe rtl/fp16_mult.sv rtl/fp16_add.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv rtl/mq_bank_pe.sv
elab mq_pe_8x1_d16 mq_pe_8x1_d16 rtl/fp16_mult.sv rtl/fp16_add.sv rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv rtl/mq_bank_pe.sv
elab mq_pe_16x2_d32 mq_pe_16x2_d32 rtl/fp16_mult.sv rtl/fp16_add.sv rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv rtl/mq_bank_pe.sv
elab mq_pe_32x4_d64 mq_pe_32x4_d64 rtl/fp16_mult.sv rtl/fp16_add.sv rtl/fp16_mult_piped.sv rtl/fp16_add_piped.sv rtl/mac_tree16_piped.sv rtl/dbuf_16x256.sv rtl/gemv_unit.sv rtl/mq_bank_pe.sv
elab mq_bg_8x1 mq_bg_8x1 rtl/fp16_add.sv rtl/mq_bg_reduce.sv
elab mq_bg_16x2 mq_bg_16x2 rtl/fp16_add.sv rtl/mq_bg_reduce.sv
elab mq_bg_32x4 mq_bg_32x4 rtl/fp16_add.sv rtl/mq_bg_reduce.sv
