> **导航（2026-08-31）**：本 README 是早期 N28 logic-die 时代的文档。
> 当前状态、现行 RTL、两套综合矩阵谁权威，请看 **`docs/README.md`**。

# Fugue logic-die RTL (TSMC N28)

RTL for the **Fugue** HBM **logic die** (buffer-die logic for master-diff KV
attention). It extends **AttAcc**'s near-DRAM buffer-die logic with three Fugue
additions — a **KV TLB**, a **RoPE rotate-Q unit**, and a bidirectional
**master-diff `diff_decoder`** — and synthesizes on **TSMC N28** with Cadence
**Genus** in a **full-flatten** flow.

Two synthesizable tops let you measure the added-hardware cost head-to-head:
- `attacc_logic_die` — the AttAcc-original baseline (GEMV + softmax + accumulator + controller, direct addressing).
- `fugue_logic_die`  — the baseline **+ TLB + rotate_q_unit + diff_decoder**.

## Result headline (N28, SS/0.72 V/125 °C, full-flatten, 500 MHz)

| Metric | AttAcc baseline | Fugue | Δ = added hardware |
|---|---:|---:|---:|
| Total area | 473,939 µm² (0.474 mm²) | 516,310 µm² (0.516 mm²) | **+42,372 µm² (+8.9%)** |
| Std-cell instances | 270,772 | 299,896 | +29,124 (+10.8%) |
| Total power (Genus est.) | 285.8 mW | 295.4 mW | +9.7 mW (+3.4%) |
| Clock (met, 0 violations) | 500 MHz | 500 MHz | timing-neutral |
| Critical path | GEMV buf → FP16 mult | `rotate_q_unit` RoPE MAC | shifts into RoPE |

Approx Δ split (vs an intermediate no-diff-decoder run at 508,517 µm²):
`rotate_q_unit`+`tlb` ≈ +34.6k µm², `diff_decoder` ≈ +7.8k µm².
Full reports: `syn/build_attacc/reports_attacc/`, `syn/build_fugue/reports_fugue/`.

## What's here

```
rtl/
  fugue_pkg.sv          shared params, PIM opcodes (incl. PIM_SET_META), types
  # --- reused as-is from KV-rtl/gemv_n28 ---
  fp16_mult.sv fp16_add.sv   IEEE754 binary16 mul/add (1-cyc, RNE, FTZ)
  dbuf_16x256.sv             double-buffered 16x256b operand store (flops)
  gemv_unit.sv               16-lane FP16 GEMV (16 mul + 8+4+2+1 tree + acc)
  # --- new FP32 arithmetic for softmax (agent-authored, style-matched) ---
  fp32_add.sv fp32_mul.sv fp32_exp.sv fp32_recip.sv
  # --- compute datapath ---
  rotate_q_unit.sv      RoPE rotate on a 256b (8-pair) Q/K word   [NEW]
  accumulator.sv        FP16 cross-GEMV partial-sum reduction
  softmax_unit.sv       FP32 max->exp->normalize over a LANES tile
  diff_decoder.sv       bidirectional master-diff merge decoder   [NEW]
  # --- KV address translation (drampim CacheBlendTLB in hardware, see KV_TLB.md) ---
  kv_tlb_pkg.sv         drampim geometry (34-b HBM addr, 256-B vectors, V=K+8MiB), seg_desc_t, run_t
  kv_seg_tlb.sv         fully-assoc *segment* range-CAM + min-key iterate   [NEW]
  kv_ptw.sv             page-table walker: directory + binary search / attach [NEW]
  kv_scan_planner.sv    scan_runs in hardware (cover + physical-order merge)  [NEW]
  kv_tlb_top.sv         LOOKUP / PLAN / ATTACH / FLUSH command port + run stream
  kv_tlb_variants.sv    kv_tlb_e16 / e32 / e64 synthesis tops (ENTRIES sweep)
  direct_addr_plan.sv   AttAcc baseline: same port, one affine run, no table
  attacc_controller.sv  instr queue + decoder + config regfile + run-based
                        DRAM addr-gen (plan port) + DRAM cmd FSM + PIM_SET_META/ATTACH
  # --- tops ---
  fugue_logic_die.sv    Fugue (baseline + 3 additions)
  attacc_logic_die.sv   AttAcc-original baseline
testbench/
  tb_kv_tlb.sv          segment TLB vs drampim-derived vectors (vectors/kv_tlb/)
  gen_kv_tlb_vectors.py builds those vectors from attacc_drampim's CacheBlendTLB
syn/
  run_syn.tcl           Genus recipe (T-cube style, ungroup -all -flatten)
  run_syn_hier.tcl      hierarchy-preserving recipe (per-block area breakdown)
  tsmcn28_mmmc.tcl      TSMC N28 MMMC (SS/FF/TT) — from T-cube
  filelist_fugue.f  filelist_attacc.f  filelist.f(=fugue)  Makefile
  area_breakdown.py     parse hier area reports -> stacked-area table
  AREA_BREAKDOWN.md     per-block area deliverable (phase 2)
  build_attacc/  build_fugue/          isolated A/B run dirs + reports (flat)
  build_attacc_hier/  build_fugue_hier/ isolated A/B run dirs (hierarchical)
```

## The three Fugue-new blocks

- **`rotate_q_unit`** — RoPE, following **RoPIM** (Jeon et al., IEEE CAL 2025):
  datapath **separate → negate → multiply → add**, adjacent-pair convention
  `y[2i]=x[2i]·cos − x[2i+1]·sin`, `y[2i+1]=x[2i]·sin + x[2i+1]·cos`. Negate =
  FP16 sign-bit flip; cos/sin are streamed operands (not CORDIC/ROM). Reuses
  `fp16_mult`+`fp16_add`, 2-cycle.
- **`kv_tlb_top`** (segment TLB) — `attacc_drampim`'s `CacheBlendTLB` in
  hardware: a 32-entry fully-associative *range* CAM of segment descriptors
  (a consumer's logical token range → one physically contiguous K/V run in
  the master or diff channel pool), a page-table walker (directory + binary
  search; `ATTACH` bulk-loads a (ctx, layer)) and a scan planner that emits
  `scan_runs`-identical run lists (physical-address order, adjacency merge).
  The controller consumes runs and issues ACT/RD per 32-B column.  Details,
  scale justification and measured cycles: **`KV_TLB.md`**.  (The former
  page-granular `tlb.sv` — 32 × 2 KiB VPN→PPN, linear page table — is gone;
  the area numbers above were measured with it and predate this swap.)
- **`diff_decoder`** — bidirectional master-diff merge. One control-loaded
  `diff_mask[]` (per score word) drives **forward** (compact diff scores
  scattered by mask, overwriting the master score → softmax) and **reverse**
  (softmax probabilities split by the same mask into master/diff sides). Mask is
  loaded by the **`PIM_SET_META`** instruction — same control path as `cfg[]`.

## Synthesize

```sh
cd syn
make both                     # AttAcc baseline + Fugue, in parallel, 500 MHz
make attacc                   # baseline only
make fugue PERIOD_NS=1.5      # Fugue at ~667 MHz target
```

Uses Genus at `/data/eda_tools/cadence/DDI251/GENUS251/...` and the TSMC N28
PDK at `/data2/tools-additional/pdk/N28`. Reports land in
`build_<tag>/reports_<tag>/` (area/timing/power/gates/qor); mapped netlist in
`build_<tag>/outputs_<tag>/`.

## Next steps & handoff

See **`HANDOFF.md`** for the full status, design decisions, environment
gotchas, representative-vs-real stand-ins, and the prioritized next-step work.
The first item — **per-block hierarchical area breakdown** — is **done**:
see **`syn/AREA_BREAKDOWN.md`** (the +42k µm² Fugue tax is 96% the three added
blocks: RoPE 28k, TLB 6.8k, diff_decoder 5.0k). A follow-on block,
**`syn/ROTATE_M2_BF16.md`**, synthesizes a BF16 RoPE rotate that generates its
own cos/sin on-die (LUT+interp sincos = 3,018 µm²/lane; full 8-pair word 44.8k µm²
@ 500 MHz), so the die needs only the angle from upstream. Next up: Fmax sweep +
testbenches.
