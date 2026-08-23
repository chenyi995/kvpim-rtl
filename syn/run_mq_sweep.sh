#!/usr/bin/env bash
# MQ microarchitecture sweep — batches of two concurrent Genus runs.
set -u
run() { make mqrun TOP=$1 FL=$2 TAG=$3 PERIOD_NS=$4 > /dev/null 2>&1; echo "done $3 rc=$?"; }
# batch 2: bank PE frequency points
run mq_pe_16x2_d32 filelist_bankpe.f bankpe_mq16x2_p10 1.0 &
run mq_pe_16x2_d32 filelist_bankpe.f bankpe_mq16x2_p077 0.77 &
wait
# batch 3: (32,4) + minimal config
run mq_pe_32x4_d64 filelist_bankpe.f bankpe_mq32x4_p10 1.0 &
run mq_pe_8x1_d16  filelist_bankpe.f bankpe_mq8x1_p15  1.5 &
wait
run mq_pe_32x4_d64 filelist_bankpe.f bankpe_mq32x4_p077 0.77 &
# batch 4: logic-die AGENTS sweep at the 500 MHz comparison point
run fugue_mq_a8  filelist_fugue_mq.f fuguemq_a8_p20  2.0 &
wait
run fugue_mq_a16 filelist_fugue_mq.f fuguemq_a16_p20 2.0 &
run fugue_mq_a32 filelist_fugue_mq.f fuguemq_a32_p20 2.0 &
wait
echo SWEEP_DONE
