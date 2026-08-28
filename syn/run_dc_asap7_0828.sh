#!/usr/bin/env bash
# AttAcc/Fugue hardware-overhead synthesis using the downloaded ASAP7 library.
#
# Frequency constraints are taken from attacc_drampim/src/ramulator_wrapper.py:
#   HBM3-PIM tCK = 0.769 ns (1.3004 GHz)  -> logic-die softmax/TLB/metadata/RoPE
#   AttAcc PE = 0.666 GHz                 -> 1.5 ns
# Fugue MQ PE is clocked at one MAC/tCK   -> 0.769 ns
#
# All output is kept below syn/0828/.  Jobs are deliberately sequential; DC is
# limited to four cores, avoiding 4x parallel jobs that would over-subscribe CPU
# and licenses.  Override only when necessary: SYN_MAX_CORES=2 ./...sh
set -euo pipefail
cd "$(dirname "$0")"
set +u
. /home/common/profile_synopsys
set -u

OUT_ROOT="${SYN_OUT_ROOT:-0828}"
MAX_CORES="${SYN_MAX_CORES:-4}"
mkdir -p "$OUT_ROOT"

# A second invocation previously overwrote the first DC job's log and WORK
# directory.  Keep one complete matrix per output directory; the advisory lock
# is released automatically if the shell exits or is interrupted.
exec 9>"$OUT_ROOT/.matrix.lock"
if ! flock -n 9; then
    echo "Another 0828 synthesis matrix is already running for $OUT_ROOT." >&2
    echo "Wait for it to finish, or use SYN_OUT_ROOT=<new-directory>." >&2
    exit 1
fi

run() {
    local tag=$1 profile=$2 top=$3 period=$4
    echo "== ${tag}: ${top}, ${period} ns =="
    SYN_OUT_ROOT="$OUT_ROOT" SYN_TAG="$tag" SYN_PROFILE="$profile" SYN_TOP="$top" \
    SYN_PERIOD_NS="$period" SYN_MAX_CORES="$MAX_CORES" \
      dc_shell -f run_dc_asap7.tcl > "$OUT_ROOT/${tag}.log" 2>&1 || {
        echo "FAILED: ${tag}; see $OUT_ROOT/${tag}.log" >&2
        return 1
      }
    if [[ ! -s "$OUT_ROOT/$tag/${top}_qor.rpt" ]]; then
        echo "FAILED: ${tag} finished without a QoR report; see $OUT_ROOT/${tag}.log" >&2
        return 1
    fi
    echo "DONE: $OUT_ROOT/$tag"
}

# AttAcc-original overhead: HBM logic-die softmax + 666 MHz bank PE.
run attacc_softmax_p769       logic  softmax_unit          0.769
run attacc_softmaxbuf_p769    smbuf  softmax_buffer_attacc 0.769
run attacc_pe_p1500           bankpe attacc_bank_pe        1.500
run attacc_logic_die_p769     attacc_sram attacc_logic_die 0.769

# Fugue additions.  Softmax arithmetic is shared with AttAcc, while the
# per-query score/probability buffer is separately reported because Fugue
# provisions NUM_Q contexts.  fugue2 isolates TLB+diff; fugue adds on-die RoPE.
run fugue_softmaxbuf_p769     smbuf_sram  softmax_buffer_fugue  0.769
run fugue_tlb_e32_p769        kvtlb  kv_tlb_e32            0.769
run fugue_diff_p769           diff   diff_decoder          0.769
run fugue_rope_bf16_p769      rotate rotate_q_bf16         0.769
run fugue_mq_pe16x2_p769      bankpe mq_pe_16x2_d32        0.769
run fugue2_logic_die_p769     fugue2_sram fugue2_logic_die 0.769
run fugue_logic_die_p769      fugue_sram fugue_logic_die   0.769

python3 summarize_dc_asap7.py "$OUT_ROOT" | tee "$OUT_ROOT/SUMMARY.md"
