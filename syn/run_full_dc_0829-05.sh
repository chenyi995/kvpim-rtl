#!/usr/bin/env bash
# Compare the latest AttAcc and Fugue logic-die RTL with Design Compiler.
#
# The timing contract matches attacc_drampim:
#   * AttAcc PE and every logic-die/control block: 0.666 GHz (1.5015015 ns)
#   * Fugue MQ PE domain only: 1.3004 GHz (0.769 ns)
#
# Results include the mapped ASAP7 standard-cell area plus the linked softmax
# SRAM macros.  The three top-level runs are directly comparable:
#   1. AttAcc original
#   2. Fugue without on-die Q-RoPE (GPU performs RoPE)
#   3. Fugue with on-die BF16 Q-RoPE
#
# Usage (from any directory):
#   kvpim-rtl/syn/run_full_dc_0829-05.sh
# Optional output location:
#   SYN_OUT_ROOT=/path/to/results kvpim-rtl/syn/run_full_dc_0829-05.sh

set -uo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
root_dir=$(cd "$script_dir/.." && pwd)
rtl_dir="$root_dir/rtl/0829-05"
out_root="${SYN_OUT_ROOT:-$script_dir/dc_0829-05_full}"
# Passed to DC's set_host_options -max_cores; matrix points are serial, so the
# host never runs more than this many DC worker cores at once.
max_cores=20
logic_period_ns=1.5015015
mq_pe_period_ns=0.769

if [[ ! -f "$rtl_dir/attacc_logic_die.sv" || ! -f "$rtl_dir/fugue2_logic_die.sv" || \
      ! -f "$rtl_dir/fugue_logic_die.sv" || ! -f "$rtl_dir/softmax_sram_16kb.sv" ]]; then
    echo "Incomplete RTL directory: $rtl_dir" >&2
    exit 1
fi

mkdir -p "$out_root"

# Load DC tools first, then unconditionally replace the shared profile's
# unreachable 1701@lic_server* entries for this process and its DC children.
set +u
. /home/common/profile_synopsys
export LM_LICENSE_FILE=36550@166.111.78.2
set -u

# DC receives Ctrl-C while it is the foreground child.  Exit the matrix once
# that child returns instead of proceeding to the remaining configurations.
trap 'echo "Interrupted; stopping the DC matrix." >&2; exit 130' INT TERM

run_dc() {
    local tag=$1 profile=$2 top=$3 period_ns=$4 pe_period_ns=${5:-}
    local log="$out_root/${tag}.log"
    local pe_clk_label="not present (AttAcc uses clk)"
    if [[ -n "$pe_period_ns" ]]; then
        pe_clk_label="${pe_period_ns} ns"
    fi

    echo "== ${tag}: ${top}; clk=${period_ns} ns; pe_clk=${pe_clk_label}; DC cores=${max_cores} =="
    if ! SYN_RTL_DIR="$rtl_dir" SYN_OUT_ROOT="$out_root" SYN_TAG="$tag" \
        SYN_PROFILE="$profile" SYN_TOP="$top" SYN_PERIOD_NS="$period_ns" \
        SYN_PE_PERIOD_NS="$pe_period_ns" SYN_MAX_CORES="$max_cores" \
        dc_shell -f "$script_dir/run_dc_asap7.tcl" >"$log" 2>&1; then
        echo "FAILED: ${tag}; see ${log}" >&2
        return 1
    fi

    if [[ ! -s "$out_root/$tag/${top}_qor.rpt" || ! -s "$out_root/$tag/${top}_area.rpt" ]]; then
        echo "FAILED: ${tag} completed without QoR/area reports; see ${log}" >&2
        return 1
    fi
    echo "DONE: ${out_root}/${tag}"
}

status=0
run_dc attacc_original_p1501      attacc_buffered_sram attacc_logic_die  "$logic_period_ns" || status=1
run_dc fugue_no_qrope_p1501       fugue2_buffered_sram fugue2_logic_die  "$logic_period_ns" "$mq_pe_period_ns" || status=1
run_dc fugue_with_qrope_p1501     fugue_buffered_sram  fugue_logic_die   "$logic_period_ns" "$mq_pe_period_ns" || status=1

if [[ "$status" -eq 0 ]]; then
    python3 "$script_dir/summarize_dc_asap7.py" "$out_root" | tee "$out_root/SUMMARY.md"
fi

echo "Reports: $out_root/<tag>/<top>_{qor,area,references,timing,power}.rpt"
exit "$status"
