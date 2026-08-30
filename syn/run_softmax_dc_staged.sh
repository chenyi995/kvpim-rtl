#!/usr/bin/env bash
# Stage softmax timing closure: leaf arithmetic first, then the full unit.
# Usage: RTL_VERSION=0829-05 ./run_softmax_dc_staged.sh
set -uo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
root_dir=$(cd "$script_dir/.." && pwd)
rtl_version="${RTL_VERSION:-0829-05}"
rtl_dir="$root_dir/rtl/$rtl_version"
out_root="$script_dir/dc_$rtl_version/softmax_staged"
period=1.5015015
max_cores=10

mkdir -p "$out_root"
set +u
. /home/common/profile_synopsys
# The shared profile lists license endpoints that are not reachable from this
# host.  Keep this override local to this invocation; callers can replace it
# without editing the shared profile, e.g. SYN_LM_LICENSE_FILE=port@host.
export LM_LICENSE_FILE="${SYN_LM_LICENSE_FILE:-36550@166.111.78.2}"
set -u

run_dc() {
    local top=$1 profile=$2 tag=$3
    local log="$out_root/${tag}.log"
    echo "== ${tag}: ${top} @ ${period} ns =="
    SYN_RTL_DIR="$rtl_dir" SYN_OUT_ROOT="$out_root" SYN_TAG="$tag" \
    SYN_PROFILE="$profile" SYN_TOP="$top" SYN_PERIOD_NS="$period" \
    SYN_MAX_CORES="$max_cores" dc_shell -f "$script_dir/run_dc_asap7.tcl" >"$log" 2>&1
    if rg -q '^Error:' "$log"; then
        echo "FAILED: ${tag}; see ${log}" >&2
        return 1
    fi
    rg -m1 'slack \(' "$out_root/$tag/${top}_timing.rpt" 2>/dev/null || true
}

status=0
run_dc fp32_add        softmax_compute fp32_add_p1501        || status=1
run_dc fp32_mul        softmax_compute fp32_mul_p1501        || status=1
run_dc fp32_exp        softmax_compute fp32_exp_p1501        || status=1
run_dc fp32_recip      softmax_compute fp32_recip_p1501      || status=1
run_dc fp32_max16_pipe softmax_compute fp32_max16_p1501      || status=1
run_dc fp32_sum16      softmax_compute fp32_sum16_p1501      || status=1

if [[ "$status" -eq 0 ]]; then
    run_dc buffered_softmax_unit buffered_smax buffered_softmax_p1501 || status=1
else
    echo "Leaf timing failed: skipping buffered_softmax_unit." >&2
fi

echo "Reports: $out_root/<tag>/"
exit "$status"
