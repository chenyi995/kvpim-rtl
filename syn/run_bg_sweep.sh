#!/usr/bin/env bash
# BG-level reduction sweep: all 6 points fully parallel (Chenyi: 64 cores OK).
set -u
run() { make mqrun TOP=$1 FL=$2 TAG=$3 PERIOD_NS=$4 > /dev/null 2>&1; echo "done $3 rc=$?"; }
run mq_bg_16x2 filelist_bg.f bg_16x2_p15  1.5 &
run mq_bg_16x2 filelist_bg.f bg_16x2_p077 0.77 &
run mq_bg_32x4 filelist_bg.f bg_32x4_p15  1.5 &
run mq_bg_32x4 filelist_bg.f bg_32x4_p077 0.77 &
run mq_bg_8x1  filelist_bg.f bg_8x1_p15   1.5 &
run mq_bg_8x1  filelist_bg.f bg_8x1_p077  0.77 &
wait
echo BG_SWEEP_DONE
