# Per-block area breakdown (N28, SS/0.72 V/125 °C, 500 MHz)

Phase-2 deliverable for HANDOFF §9 item 1. Produced by a **hierarchy-preserving**
re-synthesis (`run_syn_hier.tcl`: same MMMC/SDC/effort as the flat headline run,
but `auto_ungroup none`, no `ungroup -all -flatten`) so per-instance area is
itemizable. Both tops still **meet 500 MHz at slack 0, 0 violations** in this
flow, so the areas are compared at equal timing.

Regenerate: `cd syn && make both-hier && python3 area_breakdown.py`
Reports: `syn/build_{attacc,fugue}_hier/reports_{attacc,fugue}/*_area_hier.rpt`

> Note: unflattened totals differ slightly from the flattened headline
> (less cross-boundary optimization): Fugue **520,015** vs flat 516,310 µm²;
> AttAcc **478,714** vs flat 473,939 µm². The **delta** is stable:
> **+41,300 µm² (+8.6%)** here vs **+42,372 µm² (+8.9%)** flat.

## Stacked-area table

| Block | AttAcc (µm²) | Fugue (µm²) | Δ (µm²) |
|---|---:|---:|---:|
| 4× `gemv_unit` (FP16 GEMV MAC) | 321,301 | 321,163 | −138 |
| `softmax_unit` (FP32) | 140,934 | 140,709 | −225 |
| `accumulator` | 1,905 | 1,928 | +23 |
| `attacc_controller` | 2,396 | 2,783 | **+387** |
| `tlb`  **[Fugue-new]** | — | 6,772 | **+6,772** |
| `rotate_q_unit`  **[Fugue-new]** | — | 28,029 | **+28,029** |
| `diff_decoder`  **[Fugue-new]** | — | 5,017 | **+5,017** |
| top-level glue / routing | 12,178 | 13,614 | +1,435 |
| **TOTAL (unflattened)** | **478,714** | **520,015** | **+41,300 (+8.6%)** |

## Where the added hardware goes

The **three Fugue additions total 39,818 µm² = 96.4% of the +41,300 delta**:

| Added block | Area (µm²) | Cells | Share of additions | What it is |
|---|---:|---:|---:|---|
| `rotate_q_unit` | 28,029 | 21,274 | 70.4% | RoPE: 8 pairs × (4 `fp16_mult` + 2 `fp16_add`) = 32 mult + 16 add |
| `tlb` | 6,772 | 3,507 | 17.0% | 32-entry fully-assoc CAM + FIFO refill + miss FSM (**page-granular `tlb.sv`, removed 2026-08-28 — superseded by `kv_tlb_top`, not yet re-synthesized; see `KV_TLB.md`**) |
| `diff_decoder` | 5,017 | 4,820 | 12.6% | 8×16-bit mask buffer + prefix-popcount scatter + mask gate |
| **sum** | **39,818** | **29,601** | 100% | |

The remaining **+1,482 µm²** of the delta is:
- **+387 µm² `attacc_controller`** — the `PIM_SET_META` decode + `S_META` state
  and the `meta_wr_*` port (the only baseline block that grows; negligible, as
  designed, so the delta isolates the three added blocks).
- **+1,435 µm² top-level glue** — extra routing for the rotate/diff/tlb nets.
- `gemv`/`softmax`/`accumulator` are unchanged within noise (±225 µm²).

**RoPE dominates** the added cost (70%) — it is a wide FP16 datapath (32
multipliers), and it is also Fugue's critical path. TLB and diff_decoder are
comparatively cheap (control/CAM logic, ~6–7k and ~5k µm²).

## Baseline is softmax + GEMV bound (context for the additions)

The two big baseline blocks dwarf the additions:
- **4× `gemv_unit` = 321k µm² (62%)** — the FP16 MAC arrays.
- **`softmax_unit` = 141k µm² (27%)**, itself dominated by its 16 FP32 lanes:

  | Softmax leaf | Area (µm²) | Note |
  |---|---:|---|
  | 16× `fp32_exp` | 52,081 | 37% of softmax — LUT+interp, the dominant term |
  | 16× `fp32_mul` (normalize) | 36,249 | 26% |
  | 31× `fp32_add` (16 subtract + 15-node sum tree) | 19,417 | 14% |
  | `fp32_recip` | 6,571 | 5% |
  | FSM / max-tree / muxing / regs | ~26,391 | remainder |

So in absolute terms Fugue's additions (+40k µm²) are ≈ 28% of one softmax unit,
or ≈ one-eighth of the GEMV array — a small tax on a GEMV+softmax-bound die.
