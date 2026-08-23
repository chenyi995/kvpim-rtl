#!/usr/bin/env bash
# MQ microarchitecture sweep — ALL 10 runs, batches of two concurrent Genus
# jobs, resumable: a tag whose reports directory is non-empty is skipped.
# Run under nohup/setsid so it survives the launching session.
set -u
cd "$(dirname "$0")"
run() {
  local top=$1 fl=$2 tag=$3 per=$4
  if [ -n "$(ls build_$tag/reports_$tag/ 2>/dev/null)" ]; then
    echo "skip $tag (reports exist)"; return
  fi
  make mqrun TOP=$top FL=$fl TAG=$tag PERIOD_NS=$per > /dev/null 2>&1
  echo "done $tag rc=$?"
}
run attacc_bank_pe  filelist_bankpe.f bankpe_attacc_p15  1.5 &
run mq_pe_16x2_d32  filelist_bankpe.f bankpe_mq16x2_p15  1.5 &
wait
run mq_pe_16x2_d32  filelist_bankpe.f bankpe_mq16x2_p10  1.0 &
run mq_pe_16x2_d32  filelist_bankpe.f bankpe_mq16x2_p077 0.77 &
wait
run mq_pe_32x4_d64  filelist_bankpe.f bankpe_mq32x4_p10  1.0 &
run mq_pe_8x1_d16   filelist_bankpe.f bankpe_mq8x1_p15   1.5 &
wait
run mq_pe_32x4_d64  filelist_bankpe.f bankpe_mq32x4_p077 0.77 &
run fugue_mq_a8     filelist_fugue_mq.f fuguemq_a8_p20   2.0 &
wait
run fugue_mq_a16    filelist_fugue_mq.f fuguemq_a16_p20  2.0 &
run fugue_mq_a32    filelist_fugue_mq.f fuguemq_a32_p20  2.0 &
wait
echo SWEEP_DONE
