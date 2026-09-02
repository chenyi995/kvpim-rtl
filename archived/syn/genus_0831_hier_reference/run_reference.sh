#!/usr/bin/env bash
# Reference runs of the genus_0831_hier matrix that are NOT part of the three
# paper configurations (archived 2026-09-02): macro-buffer GEMV (the AttAcc
# 13.12 mm^2/die anchor), standalone macro dbuf, standalone TLB, standalone
# fp32_recip.  Uses the official directory's tcl, converted SRAM libs and
# frozen leaf netlists; writes results into THIS directory.
set -uo pipefail
cd "$(dirname "$0")"
HERE=$(pwd)
OFF=$(cd ../../../syn/genus_0831_hier && pwd)
RTL=$(cd ../../../rtl && pwd)
GENUS=${GENUS:-/data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus}
JOBS=${JOBS:-6}; CPUS=${CPUS:-4}
SRAMS=""; for m in srambank_64x4x16_6t122 srambank_64x4x32_6t122 srambank_64x4x80_6t122 \
  srambank_256x4x32_6t122 srambank_256x4x64_6t122 srambank_256x4x80_6t122; do SRAMS="$SRAMS $OFF/libs_ps/$m.lib"; done
P_ATT=1501.5; P_FUG=769; P_SFM=699
run_one() { local tag=$1 top=$2 period=$3 macros=$4 extra=$5; shift 5
  local files=""; for f in "$@"; do case "$f" in /*) files="$files $f";; *) files="$files $RTL/$f";; esac; done
  if ls "$HERE/$tag"/*_qor.rpt >/dev/null 2>&1; then echo "skip $tag (done)"; return 0; fi
  mkdir -p "$HERE/$tag"
  ( cd "$HERE/$tag" && G_TAG=$tag G_TOP=$top G_PERIOD_PS=$period G_CPUS=$CPUS G_MACRO_MODS="$macros" \
    G_RETIME="${R:-1}" G_IN_FRAC="${IF:-0.10}" G_EXTRA_LIBS="$extra" G_FILES="$files" G_OUT="$HERE/$tag" \
    "$GENUS" -no_gui -overwrite -f "$OFF/run_genus_0831.tcl" -log genus_$tag > genus_$tag.stdout 2>&1 )
  ls "$HERE/$tag"/*_qor.rpt >/dev/null 2>&1 && echo "done $tag" || echo "FAIL $tag"; }
throttle() { while [ "$(jobs -rp | wc -l)" -ge "$JOBS" ]; do sleep 5; done; }
F16F="$OFF/fp16_mult_p700/fp16_mult_mapped.v $OFF/fp16_add_p700/fp16_add_mapped.v"
F16A="$OFF/fp16_mult_p1350/fp16_mult_mapped.v $OFF/fp16_add_p1350/fp16_add_mapped.v"
M16="fp16_mult fp16_add"
throttle; run_one gemv_attacc_p1501 gemv_unit $P_ATT "$M16" "$SRAMS" $F16A dbuf_16x256_asap7.sv gemv_unit.sv &
throttle; run_one gemv_fugue_p769   gemv_unit $P_FUG "$M16" "$SRAMS" $F16F dbuf_16x256_asap7.sv gemv_unit.sv &
throttle; run_one dbuf_p1501 dbuf_16x256 $P_ATT "" "$SRAMS" dbuf_16x256_asap7.sv &
throttle; run_one dbuf_p769  dbuf_16x256 $P_FUG "" "$SRAMS" dbuf_16x256_asap7.sv &
throttle; run_one recip_p699 fp32_recip $P_SFM "" "" fp32_recip.sv &
throttle; run_one kvtlb_p1501 kv_tlb_top $P_ATT "" "" kv_tlb_pkg.sv kv_seg_tlb.sv kv_ptw.sv kv_scan_planner.sv kv_tlb_top.sv &
# BG buffer: the implementations NOT chosen by the 2026-09-02 ruling
throttle; run_one accbuf_attacc_p1501_macro accum_buffer_bg_attacc_macro $P_ATT "" "$SRAMS" accum_buffer_bg.sv "$HERE/accum_buffer_bg_ref_tops.sv" &
throttle; run_one accbuf_fugue_p769_flop    accum_buffer_bg_fugue_flop  $P_FUG "" ""        accum_buffer_bg.sv "$HERE/accum_buffer_bg_ref_tops.sv" &
# RoPE ablation (archived 2026-09-02): bf16 leaves at the tight clock, then rotate_q_bf16 @666 MHz
ROPE_RTL=$(cd ../../rtl/rope && pwd)
throttle; R=0 IF=0.25 run_one bf16_mult_p1350 bf16_mult 1350 "" "" $ROPE_RTL/bf16_mult.sv &
throttle; R=0 IF=0.25 run_one bf16_add_p1350  bf16_add  1350 "" "" $ROPE_RTL/bf16_add.sv &
wait
throttle; run_one rope_p1501 rotate_q_bf16 $P_ATT "bf16_mult bf16_add" "" $HERE/bf16_mult_p1350/bf16_mult_mapped.v $HERE/bf16_add_p1350/bf16_add_mapped.v $ROPE_RTL/sincos_bf16.sv $ROPE_RTL/rotate_q_bf16.sv &
wait; echo REFERENCE_DONE
