#!/usr/bin/env bash
# Fixed-RTL timing/area characterization for logic-die hardware.
#
# Frequencies follow the selected AttAcc/Fugue operating points, with NO
# frequency margin and no RTL retiming/pipelining performed by this script:
#   softmax_array    1.3 GHz  (0.769 ns), 256 softmax_pe macro leaves
#   AttAcc GEMV      666 MHz  (1.502 ns), 64 = 4 x 16 instances
#   Fugue GEMV       1.3 GHz  (0.769 ns), 64 = 4 x 16 instances
#   RoPE/TLB/diff/control/accumulator 666 MHz (1.502 ns)
#
# Each entry is one sequential dc_shell invocation with SYN_MAX_CORES=10.
# A failing timing target is reported as a characterization result; it does
# not cause later hardware blocks to be skipped.
set -uo pipefail

cd "$(dirname "$0")"

runner="./run_dc_10core.sh"
failures=0

SOFTMAX_PERIOD_NS="${SOFTMAX_PERIOD_NS:-0.769}"
ATTACC_GEMV_PERIOD_NS="${ATTACC_GEMV_PERIOD_NS:-1.502}"
FUGUE_GEMV_PERIOD_NS="${FUGUE_GEMV_PERIOD_NS:-0.769}"
LOGIC_PERIOD_NS="${LOGIC_PERIOD_NS:-1.502}"
ROPE_INSTANCES="${ROPE_INSTANCES:-8}"
GEMV_INSTANCES="${GEMV_INSTANCES:-2048}"
GEMV_BUFFER_INSTANCES="${GEMV_BUFFER_INSTANCES:-4096}"
ACCUMULATOR_INSTANCES="${ACCUMULATOR_INSTANCES:-256}"
DIFF_DECODER_INSTANCES="${DIFF_DECODER_INSTANCES:-16}"

tag_period() {
  local value="$1"
  printf '%s' "${value/./}"
}

run_job() {
  local name="$1" profile="$2" top="$3" period_ns="$4" instances="$5"
  local tag="logic_char_${name}_p$(tag_period "$period_ns")"
  local qor="dc_asap7/${tag}/${top}_qor.rpt"
  local area_rpt="dc_asap7/${tag}/${top}_area.rpt"

  echo "=== ${name}: ${period_ns} ns, ${instances} instance(s), top=${top} ==="
  if ! "$runner" "$tag" "$profile" "$top" "$period_ns"; then
    echo "RESULT ${name}: DC failed; see dc_10core/${tag}.log" >&2
    return 1
  fi
  if [[ ! -f "$qor" ]]; then
    echo "RESULT ${name}: missing QoR report; see dc_10core/${tag}.log" >&2
    return 1
  fi

  local wns paths hold area scaled
  wns="$(awk '/Critical Path Slack:/ {print $4; exit}' "$qor")"
  paths="$(awk '/No. of Violating Paths:/ {print $5; exit}' "$qor")"
  hold="$(awk '/Worst Hold Violation:/ {print $4; exit}' "$qor")"
  area="$(awk '/Total cell area:/ {print $4; exit}' "$area_rpt")"
  if [[ -n "$area" ]]; then
    scaled="$(awk -v a="$area" -v n="$instances" 'BEGIN {printf "%.6f", a*n}')"
  else
    scaled="N/A"
  fi
  printf 'RESULT %-20s setup_WNS=%s ps  setup_violations=%s  worst_hold=%s ps  area=%s um^2  scaled_x%s=%s um^2\n' \
    "$name" "${wns:-N/A}" "${paths:-N/A}" "${hold:-N/A}" \
    "${area:-N/A}" "$instances" "$scaled"
}

jobs=(
  # 16 channels x 16 softmax PE = 256 PE. softmax_pe.db is linked by the
  # softmax_array_256 profile and is not flattened.
  # This integrated AttAcc (CONTEXTS=2) array ALREADY contains 16 softmax
  # buffers.  Do not add its area to softmax_buffer_attacc_32kb below.
  "softmax_array_256pe:softmax_array_256:softmax_array_256:${SOFTMAX_PERIOD_NS}:1"
  # Stand-alone SRAM characterizations: use them to verify macro area, and
  # to replace the AttAcc buffer contribution with Fugue's 256-KiB/channel
  # buffer. They are not additive to the integrated array result.
  "softmax_buffer_attacc_32kb:softmax_buffer_attacc:softmax_buffer_attacc_32kb:${SOFTMAX_PERIOD_NS}:16"
  "softmax_buffer_fugue_256kb:softmax_buffer_fugue:softmax_buffer_fugue_256kb:${SOFTMAX_PERIOD_NS}:16"
  # 16 channels x 64 banks/channel x 2 GEMV units/bank = 2048 units.
  "gemv_attacc_666mhz:gemv_macro:gemv_unit:${ATTACC_GEMV_PERIOD_NS}:${GEMV_INSTANCES}"
  "gemv_fugue_1300mhz:gemv_macro:gemv_unit:${FUGUE_GEMV_PERIOD_NS}:${GEMV_INSTANCES}"
  # A GEMV unit has a matrix and a vector operand buffer: 2 x 2048 = 4096.
  "gemv_buffer_attacc_666mhz:gemv_buffer:dbuf_16x256:${ATTACC_GEMV_PERIOD_NS}:${GEMV_BUFFER_INSTANCES}"
  "gemv_buffer_fugue_1300mhz:gemv_buffer:dbuf_16x256:${FUGUE_GEMV_PERIOD_NS}:${GEMV_BUFFER_INSTANCES}"
  # Current rotate_q_bf16 leaf is 8 pairs/16 BF16 lanes and 5-cycle latency.
  "rope_bf16_666mhz:rotate:rotate_q_bf16:${LOGIC_PERIOD_NS}:${ROPE_INSTANCES}"
  "kv_tlb_666mhz:kvtlb:kv_tlb_top:${LOGIC_PERIOD_NS}:1"
  # Fugue and Fugue2 each use one 16-lane decoder per HBM channel.
  "diff_decoder_16ch_666mhz:diff_channel:diff_decoder_channel_dc_top:${LOGIC_PERIOD_NS}:${DIFF_DECODER_INSTANCES}"
  "attacc_controller_666mhz:controller:attacc_controller:${LOGIC_PERIOD_NS}:1"
  "direct_addr_plan_666mhz:direct_addr:direct_addr_plan:${LOGIC_PERIOD_NS}:1"
  # One accumulator per four-bank bank group: 16 x (64 / 4) = 256.  Each
  # accumulator reduces the two GEMV results from each of its four banks.
  "accumulator_bg_666mhz:accum_bg:accumulator_bg_dc_top:${LOGIC_PERIOD_NS}:${ACCUMULATOR_INSTANCES}"
)

for job in "${jobs[@]}"; do
  IFS=: read -r name profile top period instances <<< "$job"
  if ! run_job "$name" "$profile" "$top" "$period" "$instances"; then
    failures=$((failures + 1))
  fi
done

if (( failures != 0 )); then
  echo "Characterization completed with ${failures} failed DC task(s)." >&2
  exit 1
fi
