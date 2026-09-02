#!/usr/bin/env bash
# Component-level DC/ASAP7 matrix for rtl/0830-02 (no top-level synthesis;
# per-level overhead is rolled up from these areas, see
# docs/0830-02/Hardware_Overhead_Breakdown.md).
#
# Timing contract (docs/Hardware Overhead.md, matching attacc_drampim):
#   * AttAcc GEMV / BG accumulator, every logic-die and controller block:
#     666 MHz  -> 1.5015015 ns
#   * Fugue GEMV / BG accumulator (bank clock raised to the command rate):
#     1.3 GHz  -> 0.769 ns   (same RTL, only the constraint changes)
# The softmax leaves (fp32_add s3 / fp32_mul s2 / fp32_exp s11 / softmax_pe)
# already close 699 ps setup+hold in syn/dc_0830-01 and are NOT re-run.
#
# Usage:  cd kvpim-rtl/syn && ./run_dc_0830-02.sh
set -uo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
out_root="${SYN_OUT_ROOT:-$script_dir/dc_0830-02}"
max_cores="${SYN_MAX_CORES:-4}"
p_attacc=1.5015015     # 666 MHz
p_fugue=0.769          # 1.3 GHz

set +u
. /home/common/profile_synopsys
# The shared profile lists license endpoints unreachable from some hosts;
# keep the override local (see run_softmax_dc_staged.sh).
export LM_LICENSE_FILE="${SYN_LM_LICENSE_FILE:-36550@166.111.78.2}"
set -u

command -v dc_shell >/dev/null || { echo "dc_shell not on PATH" >&2; exit 1; }
mkdir -p "$out_root"

fail=0
run_dc() {
    local tag=$1 profile=$2 top=$3 period=$4
    local log="$out_root/${tag}.log"
    echo "== ${tag}: ${top} (${profile}) @ ${period} ns =="
    SYN_OUT_ROOT="$out_root" SYN_TAG="$tag" SYN_PROFILE="$profile" \
    SYN_TOP="$top" SYN_PERIOD_NS="$period" SYN_MAX_CORES="$max_cores" \
        dc_shell -f "$script_dir/run_dc_asap7_0830-02.tcl" >"$log" 2>&1
    if grep -q '^Error:' "$log"; then
        echo "   ERROR in $tag (see $log)"; fail=1
    else
        grep -E "Critical Path Slack|Design Area" \
            "$out_root/$tag/${top}_qor.rpt" 2>/dev/null | sed 's/^/   /'
    fi
}

# ---- Bank level (AttAcc @666 MHz, Fugue @1.3 GHz; identical RTL) ----
run_dc gemv_attacc_p1501   gemv         gemv_unit        "$p_attacc"
run_dc gemv_fugue_p769     gemv         gemv_unit        "$p_fugue"
run_dc dbuf_p1501          dbuf         dbuf_16x256      "$p_attacc"
run_dc dbuf_p769           dbuf         dbuf_16x256      "$p_fugue"
# flop-buffer reference point (macro-vs-flop accounting)
run_dc gemv_flop_p1501     gemv_flop    gemv_unit        "$p_attacc"

# ---- Bank-group level ----
# accum buffer: AttAcc 8xFP16 vs Fugue 64xFP16 (n_cap=8 resident queries x 8
# slots, multi-Q over one shared K column) — same 256x16 macro, capacity in
# the report is the architectural bit count.
run_dc accbg_attacc_p1501  accum_bg     accumulator_bg          "$p_attacc"
run_dc accbg_fugue_p769    accum_bg     accumulator_bg          "$p_fugue"
run_dc accbuf_attacc_p1501 accum_buf_bg accum_buffer_bg_attacc  "$p_attacc"
run_dc accbuf_fugue_p769   accum_buf_bg accum_buffer_bg_fugue   "$p_fugue"

# ---- Logic die (all at 666 MHz) ----
run_dc acclogic_p1501      accum_logic  accumulator_logic          "$p_attacc"
run_dc diffdec_p1501       diff_channel diff_decoder_channel_dc_top "$p_attacc"
run_dc causal_p1501        causal_cmp   causal_comparator          "$p_attacc"
# Ablation only: on-die RoPE variant (the paper's die has no rotation logic).
run_dc rope_p1501          rope         rotate_q_bf16              "$p_attacc"

# ---- Softmax: only the leaf missing from dc_0830-01 (669/699 ps class) ----
run_dc recip_p699          fp32_recip   fp32_recip          0.699

# ---- HBM controller (666 MHz) ----
run_dc kvtlb_p1501         kvtlb        kv_tlb_top          "$p_attacc"
run_dc ctrl_attacc_p1501   ctrl_attacc  attacc_hbm_ctrl_top "$p_attacc"
run_dc ctrl_fugue_p1501    ctrl_fugue   fugue_hbm_ctrl_top  "$p_attacc"

if (( fail )); then echo "MATRIX FINISHED WITH ERRORS"; exit 1; fi
echo "MATRIX DONE -> $out_root"
