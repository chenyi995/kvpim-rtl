#!/usr/bin/env bash
# Genus/ASAP7 hierarchical (leaf-as-macro) matrix for rtl/ (the 0830-02 component set).
# Phase 1: leaf multipliers/adders at a TIGHTER clock -> frozen mapped netlists.
# Phase 2: every component of the (archived) DC 0830-02 matrix; leaf netlists read in and
#          dont_touch'ed (macro treatment), SRAM macros as real .lib views.
# Phase 3: integrated logic-die softmax fabric (softmax_pe frozen as macro).
# Parallelism: JOBS x CPUS <= 32 cores (default 8 x 4).
set -uo pipefail
cd "$(dirname "$0")"
HERE=$(pwd)
RTL=$(cd ../../rtl && pwd)   # official component RTL (was rtl/0830-02 before the 2026-09-02 tidy)
GENUS=${GENUS:-/data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus}
JOBS=${JOBS:-8}
CPUS=${CPUS:-4}
# srambank .lib converted to ps/fF (mixed ns/ps reads mis-scale in Genus)
[ -d "$HERE/libs_ps" ] || python3 "$HERE/convert_sram_libs.py"
SRAM_LIB="$HERE/libs_ps"
SRAMS=""
for m in srambank_64x4x16_6t122 srambank_64x4x32_6t122 srambank_64x4x80_6t122 \
         srambank_256x4x32_6t122 srambank_256x4x64_6t122 srambank_256x4x80_6t122; do
  SRAMS="$SRAMS $SRAM_LIB/$m.lib"
done

P_ATT=1501.5     # 666 MHz
P_FUG=769        # 1.3 GHz
P_SFM=699        # softmax class (dc_0830-01 convention)
P_LEAF_FUG=700   # leaves: tighter than every parent
P_LEAF_ATT=1350
P_LEAF_SFM=630

run_one() {  # tag top period macro_mods extra_libs files...
  local tag=$1 top=$2 period=$3 macros=$4 extra=$5; shift 5
  local files=""; for f in "$@"; do
    case "$f" in /*) files="$files $f";; *) files="$files $RTL/$f";; esac
  done
  if ls "$HERE/$tag"/*_qor.rpt >/dev/null 2>&1; then echo "skip $tag (done)"; return 0; fi
  mkdir -p "$HERE/$tag"
  ( cd "$HERE/$tag" && \
    G_TAG=$tag G_TOP=$top G_PERIOD_PS=$period G_CPUS=$CPUS G_MACRO_MODS="$macros" \
    G_RETIME="${R:-1}" G_IN_FRAC="${IF:-0.10}" \
    G_EXTRA_LIBS="$extra" G_FILES="$files" G_OUT="$HERE/$tag" \
    "$GENUS" -no_gui -overwrite -f "$HERE/run_genus_0831.tcl" -log genus_$tag \
      > genus_$tag.stdout 2>&1 )
  local rc=$?
  ls "$HERE/$tag"/*_qor.rpt >/dev/null 2>&1 \
    && echo "done $tag rc=$rc" || echo "FAIL $tag rc=$rc"
}

throttle() { while [ "$(jobs -rp | wc -l)" -ge "$JOBS" ]; do sleep 5; done; }

echo "== phase 1: leaf macros (tight clocks) =="
throttle; R=0 IF=0.25 run_one fp16_mult_p700   fp16_mult $P_LEAF_FUG "" "" fp16_mult.sv &
throttle; R=0 IF=0.25 run_one fp16_add_p700    fp16_add  $P_LEAF_FUG "" "" fp16_add.sv &
throttle; R=0 IF=0.25 run_one fp16_mult_p1350  fp16_mult $P_LEAF_ATT "" "" fp16_mult.sv &
throttle; R=0 IF=0.25 run_one fp16_add_p1350   fp16_add  $P_LEAF_ATT "" "" fp16_add.sv &
throttle; R=0 IF=0.25 run_one fp32_add_p630    fp32_add  $P_LEAF_SFM "" "" fp32_add.sv &
throttle; R=0 IF=0.25 run_one fp32_mul_p630    fp32_mul  $P_LEAF_SFM "" "" fp32_mul.sv &
throttle; R=0 IF=0.25 run_one bf16_mult_p1350  bf16_mult $P_LEAF_ATT "" "" bf16_mult.sv &
throttle; R=0 IF=0.25 run_one bf16_add_p1350   bf16_add  $P_LEAF_ATT "" "" bf16_add.sv &
wait

F16F="$HERE/fp16_mult_p700/fp16_mult_mapped.v $HERE/fp16_add_p700/fp16_add_mapped.v"
F16A="$HERE/fp16_mult_p1350/fp16_mult_mapped.v $HERE/fp16_add_p1350/fp16_add_mapped.v"
F32="$HERE/fp32_add_p630/fp32_add_mapped.v $HERE/fp32_mul_p630/fp32_mul_mapped.v"
BF16="$HERE/bf16_mult_p1350/bf16_mult_mapped.v $HERE/bf16_add_p1350/bf16_add_mapped.v"
M16="fp16_mult fp16_add"
M32="fp32_add fp32_mul"
MBF="bf16_mult bf16_add"

echo "== phase 2: components (leaves as macros) =="
# ---- bank ----  (macro-buffer / standalone-dbuf reference runs: archived/syn/genus_0831_hier_reference/run_reference.sh)
throttle; run_one gemv_flop_p1501   gemv_unit $P_ATT "$M16" "" $F16A dbuf_16x256.sv gemv_unit.sv &
# flop-buffer bank at 1.3 GHz (ruling 2026-09-01; originally run by hand, added here for reproducibility)
throttle; run_one gemv_flop_p769    gemv_unit $P_FUG "$M16" "" $F16F dbuf_16x256.sv gemv_unit.sv &
# ---- bank group ----
throttle; run_one accbg_attacc_p1501  accumulator_bg $P_ATT "$M16" "" $F16A accumulator_bg.sv &
throttle; run_one accbg_fugue_p769    accumulator_bg $P_FUG "$M16" "" $F16F accumulator_bg.sv &
throttle; run_one accbuf_attacc_p1501 accum_buffer_bg_attacc $P_ATT "" "" accum_buffer_bg.sv &          # 16 B: flop array (ruling 2026-09-02)
throttle; run_one accbuf_fugue_p769   accum_buffer_bg_fugue  $P_FUG "" "$SRAMS" accum_buffer_bg.sv &  # 128 B: SRAM macro (ruling 2026-09-02)
# ---- logic die components ----
throttle; run_one acclogic_p1501 accumulator_logic $P_ATT "$M16" "" $F16A accumulator_logic.sv &
throttle; run_one diffdec_p1501  diff_decoder_channel_dc_top $P_ATT "" "" fugue_pkg.sv diff_decoder.sv diff_decoder_channel_dc_top.sv &
throttle; run_one causal_p1501   causal_comparator $P_ATT "" "" causal_comparator.sv &
throttle; run_one rope_p1501     rotate_q_bf16 $P_ATT "$MBF" "" $BF16 sincos_bf16.sv rotate_q_bf16.sv &
throttle; run_one sfmpe_p699     softmax_pe $P_SFM "$M32" "" $F32 fp32_exp.sv softmax_pe.sv &
# ---- HBM controller ----
throttle; run_one ctrl_attacc_p1501 attacc_hbm_ctrl_top $P_ATT "" "" fugue_pkg.sv kv_tlb_pkg.sv attacc_controller.sv direct_addr_plan.sv dma_engine.sv attacc_hbm_ctrl_top.sv &
throttle; run_one ctrl_fugue_p1501  fugue_hbm_ctrl_top  $P_ATT "" "" fugue_pkg.sv kv_tlb_pkg.sv attacc_controller.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv dma_engine.sv fugue_hbm_ctrl_top.sv &
wait

SFMPE="$HERE/sfmpe_p699/softmax_pe_mapped.v"
MSFM="softmax_pe fp32_add fp32_mul"
echo "== phase 3: integrated logic-die softmax fabric =="
# softmax_pe_mapped.v already carries the frozen fp32_add/fp32_mul module
# definitions, so they are NOT passed again (redefinition would race).
throttle; run_one sfmarray_attacc_p769 sfm_array_attacc $P_FUG "$MSFM" "$SRAMS" \
  $SFMPE fugue_pkg.sv fp32_recip.sv softmax_buffer_sram.sv softmax_unit.sv softmax_array_256.sv "$HERE/sfm_array_tops.sv" &
throttle; run_one sfmarray_fugue_p769  sfm_array_fugue  $P_FUG "$MSFM" "$SRAMS" \
  $SFMPE fugue_pkg.sv fp32_recip.sv softmax_buffer_sram.sv softmax_unit.sv softmax_array_256.sv "$HERE/sfm_array_tops.sv" &
wait

python3 collect.py || true
echo GENUS_0831_HIER_DONE
