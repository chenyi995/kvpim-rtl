#!/usr/bin/env bash
# Ten-CPU-core parallel ASAP7 DC matrix for the revised AttAcc/Fugue RTL.
#
# Default resource policy: 10 concurrent dc_shell jobs x 1 DC core/job.
# This uses at most ten CPU cores in total, rather than running a single
# multi-threaded compile.  Every timing period matches run_dc_asap7_0828.sh.
#
# Usage:
#   cd kvpim-rtl/syn
#   ./run_dc_asap7_xinyao_0828_parallel.sh
#
# Optional overrides (keep SYN_JOBS * SYN_MAX_CORES <= available CPUs):
#   SYN_JOBS=5 SYN_MAX_CORES=2 ./run_dc_asap7_xinyao_0828_parallel.sh
set -euo pipefail

cd "$(dirname "$0")"
set +u
. /home/common/profile_synopsys
set -u

OUT_ROOT="${SYN_OUT_ROOT:-xinyao_0828}"
JOBS="${SYN_JOBS:-10}"
MAX_CORES="${SYN_MAX_CORES:-1}"

if ! [[ "$JOBS" =~ ^[1-9][0-9]*$ && "$MAX_CORES" =~ ^[1-9][0-9]*$ ]]; then
    echo "SYN_JOBS and SYN_MAX_CORES must be positive integers." >&2
    exit 2
fi

mkdir -p "$OUT_ROOT"
exec 9>"$OUT_ROOT/.matrix.lock"
if ! flock -n 9; then
    echo "A synthesis matrix is already using $OUT_ROOT." >&2
    exit 1
fi

# Profiles containing SRAM macros need these compiled Liberty DB views.  The
# Synopsys environment above provides lc_shell, so make this self-contained
# instead of requiring users to source an extra profile manually.
need_sram_db=0
for macro in srambank_256x4x64_6t122 srambank_64x4x16_6t122; do
    macro_db="../third_party/asap7/asap7_sram_0p0/generated/db/${macro}.db"
    [[ -s "$macro_db" ]] || need_sram_db=1
done
if (( need_sram_db )); then
    echo "== Building ASAP7 SRAM Liberty DB views =="
    lc_shell -f compile_asap7_sram_libs.tcl >"$OUT_ROOT/compile_asap7_sram_libs.log" 2>&1
fi
for macro in srambank_256x4x64_6t122 srambank_64x4x16_6t122; do
    macro_db="../third_party/asap7/asap7_sram_0p0/generated/db/${macro}.db"
    if [[ ! -s "$macro_db" ]]; then
        echo "Failed to generate SRAM timing library: $macro_db" >&2
        echo "See $OUT_ROOT/compile_asap7_sram_libs.log" >&2
        exit 1
    fi
done

run_one() {
    local tag=$1 profile=$2 top=$3 period=$4
    local log="$OUT_ROOT/${tag}.log"
    echo "== ${tag}: ${top}, ${period} ns =="
    if ! SYN_OUT_ROOT="$OUT_ROOT" SYN_TAG="$tag" SYN_PROFILE="$profile" \
         SYN_TOP="$top" SYN_PERIOD_NS="$period" SYN_MAX_CORES="$MAX_CORES" \
         dc_shell -f run_dc_asap7.tcl >"$log" 2>&1; then
        echo "FAILED: ${tag}; see ${log}" >&2
        return 1
    fi
    if [[ ! -s "$OUT_ROOT/$tag/${top}_qor.rpt" ]]; then
        echo "FAILED: ${tag} has no QoR report; see ${log}" >&2
        return 1
    fi
    echo "DONE: $OUT_ROOT/$tag"
}

# tag|profile|top|period(ns); periods intentionally match the previous matrix.
tasks=(
    "attacc_softmax_p769|logic|softmax_unit|0.769"
    "attacc_softmaxbuf_p769|smbuf|softmax_buffer_attacc|0.769"
    "attacc_pe_p1500|bankpe|attacc_bank_pe|1.500"
    "attacc_logic_die_p769|attacc_sram|attacc_logic_die|0.769"
    "fugue_softmaxbuf_p769|smbuf_sram|softmax_buffer_fugue|0.769"
    "fugue_tlb_e32_p769|kvtlb|kv_tlb_e32|0.769"
    "fugue_diff_p769|diff|diff_decoder|0.769"
    "fugue_rope_bf16_p769|rotate|rotate_q_bf16|0.769"
    "fugue_mq_pe16x2_p769|bankpe|mq_pe_16x2_d32|0.769"
    "fugue2_logic_die_p769|fugue2_sram|fugue2_logic_die|0.769"
    "fugue_logic_die_p769|fugue_sram|fugue_logic_die|0.769"
)

pids=()
failed=0
for task in "${tasks[@]}"; do
    IFS='|' read -r tag profile top period <<<"$task"
    run_one "$tag" "$profile" "$top" "$period" &
    pids+=("$!")
    # Keep no more than JOBS dc_shell instances alive at once.
    if (( ${#pids[@]} >= JOBS )); then
        if ! wait "${pids[0]}"; then failed=1; fi
        pids=("${pids[@]:1}")
    fi
done
for pid in "${pids[@]}"; do
    if ! wait "$pid"; then failed=1; fi
done

python3 summarize_dc_asap7.py "$OUT_ROOT" | tee "$OUT_ROOT/SUMMARY.md"
exit "$failed"
