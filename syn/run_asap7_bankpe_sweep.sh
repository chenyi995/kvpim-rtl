#!/usr/bin/env bash
# ASAP7 in-bank GEMV PE frequency sweep.
# Job pool: at most MAXJOBS concurrent Genus runs x FUGUE_CPUS threads each
# (4 x 4 = 16 cores, the session's core budget).
set -u
cd "$(dirname "$0")"

GENUS=${GENUS:-/data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus}
MAXJOBS=${MAXJOBS:-4}
CPUS=${CPUS:-4}

run_one() {  # top filelist tag period_ps
  local top=$1 fl=$2 tag=$3 pps=$4
  local bdir="build_asap7_${tag}"
  # resumable: skip finished points (reports on disk) and points another
  # runner instance is currently synthesizing
  if ls "$bdir"/reports_"$tag"/*_qor.rpt >/dev/null 2>&1; then
    echo "skip ${tag} (done)"; return 0
  fi
  if pgrep -f "log genus_${tag}$" >/dev/null 2>&1; then
    echo "skip ${tag} (in flight)"; return 0
  fi
  mkdir -p "$bdir"
  cp run_syn_asap7.tcl asap7_mmmc.tcl "$bdir"/
  ( cd "$bdir" && \
    FUGUE_TOP=$top FUGUE_FILELIST="$(cd .. && pwd)/$fl" \
    FUGUE_PERIOD_PS=$pps FUGUE_TAG=$tag FUGUE_CPUS=$CPUS \
    "$GENUS" -no_gui -overwrite -f run_syn_asap7.tcl -log "genus_${tag}" \
      > "genus_${tag}.stdout" 2>&1 )
  echo "done ${tag} rc=$?"
}

pids=0
throttle() {
  while [ "$(jobs -rp | wc -l)" -ge "$MAXJOBS" ]; do sleep 15; done
}

# MQ in-bank PE (n_q=16, the balance-point subject): 14 frequency points.
# Retiming distributes the MPIPE/APIPE registers (see run_syn_asap7.tcl).
for pps in 2500 2000 1500 1250 1000 833 769 667 588 500 435 385 333 300; do
  throttle
  run_one mq_pe_16x2_d32 filelist_bankpe.f "mq16x2_${pps}ps" "$pps" &
done

# Deep-pipe variant (MPIPE=4, APIPE=4) for the top of the frequency range —
# Fmax is a soft limit: a point the 2-stage pipe cannot close re-runs with
# more adder/multiplier sub-stages (same 1 MAC/cycle throughput).
for pps in 500 435 385 333 300; do
  throttle
  run_one mq_pe_16x2_d32_mp4 filelist_bankpe.f "mq16x2mp4_${pps}ps" "$pps" &
done

# AttAcc baseline bank PE (plain gemv_unit) reference points
for pps in 2500 1500 1000 769 500 333; do
  throttle
  run_one attacc_bank_pe filelist_bankpe.f "attaccpe_${pps}ps" "$pps" &
done

wait
echo ASAP7_BANKPE_SWEEP_DONE
