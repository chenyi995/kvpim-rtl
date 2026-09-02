#!/usr/bin/env bash
# One DC task, using up to ten cores inside that single dc_shell invocation.
set -euo pipefail
cd "$(dirname "$0")"
set +u
. /home/common/profile_synopsys
set -u

if (( $# != 4 )); then
  echo "Usage: $0 <tag> <profile> <top> <period_ns>" >&2
  exit 2
fi
mkdir -p dc_10core
SYN_TAG="$1" SYN_PROFILE="$2" SYN_TOP="$3" SYN_PERIOD_NS="$4" \
SYN_RTL_DIR="${SYN_RTL_DIR:-../rtl/0830-01}" SYN_IO_DELAY_RATIO=0 SYN_FIX_HOLD=1 SYN_MAX_CORES=10 \
dc_shell -no_init -timeout 1 -wait 10 -f run_dc_asap7.tcl \
  > "dc_10core/$1.log" 2>&1
