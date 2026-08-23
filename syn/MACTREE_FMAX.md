# AttAcc bank-level MAC tree — pipelining & Fmax on N28

Small standalone experiment: how fast can AttAcc's bank-level GEMV arithmetic —
the **16 FP16 multipliers + FP16 adder tree** — run on TSMC N28 when fully
pipelined, and in how many stages. All numbers **MEASURED** (Genus, SS / 0.72 V /
125 °C worst-case corner). Reproduce: see bottom.

## Format (from the AttAcc paper)

`ref/attacc.pdf` §5.1: *"each GEMV unit consists of **16 FP16 multipliers, 16 FP16
adders**, double-buffered 16×256-bit buffers, and a control unit."* So the
datapath is **FP16 (IEEE binary16)** — matching `rtl/fp16_mult.sv` / `fp16_add.sv`.

## What was synthesized

`rtl/mac_tree16.sv` — the dot-product core only: 16 FP16 multiplies + a 4-level
adder tree (8+4+2+1). **Feed-forward, no accumulator feedback loop and no
buffers/control**, so the clock can reach the arithmetic's real limit. This
isolates exactly the "乘法 + 加法树" of the GEMV unit.

## Pipeline = 5 stages (each stage one FP16 op)

| Stage | Work |
|---|---|
| 1 | 16× FP16 multiply (parallel) |
| 2 | 8× FP16 add (tree level 1) |
| 3 | 4× FP16 add (tree level 2) |
| 4 | 2× FP16 add (tree level 3) |
| 5 | 1× FP16 add (tree level 4) → scalar dot product |

The `fp16_*` units are 1-cycle registered, so the tree is 5 registered stages;
Fmax is set by the slowest single FP16 stage.

## Fmax sweep (SS corner, measured setup slack)

| Period | Freq | Slack | Meets? |
|---:|---:|---:|:--:|
| 1.00 ns | 1.00 GHz | 0 ps | ✅ |
| **0.80 ns** | **1.25 GHz** | **0 ps** | ✅ |
| 0.75 ns | 1.33 GHz | −22 ps | ❌ (misses by 22 ps) |
| 0.70 ns | 1.43 GHz | −111 ps | ❌ |
| 0.65 ns | 1.54 GHz | −146 ps | ❌ |
| 0.60 ns | 1.67 GHz | −186 ps | ❌ |

**Fmax ≈ 1.30 GHz** at the SS worst-case corner (0.80 ns meets cleanly; 0.75 ns
misses by only 22 ps → min period ≈ 772 ps). Area ≈ **44,900 µm²** (31 FP16 units
+ pipeline registers, ~27.9k cells).

## Limiting stage = the FP16 adder

The critical path is register→register **through one `fp16_add`** (multiplier
output reg → adder-tree level-1 reg; and adder→adder at tighter targets). FP16
addition (align → add → leading-zero normalize → round) is a longer path than the
FP16 multiply (fixed 11×11 + normalize), so the **adder** sets Fmax.

## Pipelining the FP16 adder (T-cube / CVFPU retiming)

Following T-cube (which uses CVFPU: a combinational FP op + `NumPipeRegs`
registers spread by **register retiming**), the adder and multiplier were given
internally-pipelined variants — `fp16_add_piped` / `fp16_mult_piped`: one
combinational cloud + `NUM_PIPE` registers — synthesized with **`retime true` +
`retime_effort_level high`** (`syn/run_syn_retime.tcl`) so Genus distributes the
registers across the align/add/normalize/round (and multiply) logic.
`mac_tree16_piped` (wrappers `mac_tree16_p22`/`p33`) rebuilds the tree from them.

| Config | sub-stages / op | total tree stages | clean-met | **Fmax (SS)** |
|---|---:|---:|---:|---:|
| baseline (`mac_tree16`) | 1 | 5 | 0.80 ns / 1.25 GHz | **~1.30 GHz** |
| `mac_tree16_p22` | 2 | 10 | 0.50 ns / 2.00 GHz | **~2.16 GHz** |
| `mac_tree16_p33` | 3 | 15 | 0.40 ns / 2.50 GHz | **~2.67 GHz** |

(total tree stages = MPIPE + 4·APIPE.)

- Pipelining the adder **~1.7× the Fmax** (1.30 → 2.16 GHz at 2 sub-stages);
  a 3rd sub-stage reaches 2.67 GHz.
- **Diminishing returns** (×1.7 then ×1.24): retiming cannot split the FP-add
  serial chain (align-shift → add → leading-zero count → normalize-shift → round)
  evenly — the LZ-count+shift chunk becomes the floor.
- Retiming confirmed: the critical path runs between tool-inserted `retime_*`
  registers (a fraction of a full FP op), not reg→full-op→reg.
- Files: `rtl/fp16_add_piped.sv`, `rtl/fp16_mult_piped.sv`,
  `rtl/mac_tree16_piped.sv`, `rtl/mac_tree16_variants.sv`,
  `syn/run_syn_retime.tcl`, `syn/filelist_mactree_piped.f`, `syn/build_p{22,33}_*/`.

## Notes

- SS/0.72 V/125 °C is the slow corner; typical/fast corners run higher.
- The full logic die closes only 500 MHz because of long paths through buffers +
  control; the **isolated MAC arithmetic reaches ~1.30 GHz single-stage, ~2.7 GHz
  with the FP ops sub-pipelined** — the arithmetic is far from the 500 MHz floor.

## Reproduce

```sh
cd syn
# single point (period in ns):
mkdir -p build_mt && cp run_syn.tcl tsmcn28_mmmc.tcl build_mt/
cd build_mt && FUGUE_TOP=mac_tree16 FUGUE_FILELIST=$(readlink -f ../filelist_mactree.f) \
  FUGUE_PERIOD_NS=0.80 FUGUE_TAG=mt <genus> -no_gui -overwrite -f run_syn.tcl -log g
# slack: reports_mt/mac_tree16_qor.rpt  (SS.setup_view clk <slack ps> ...)
```
Files: `rtl/mac_tree16.sv`, `syn/filelist_mactree.f`, per-period dirs `syn/build_mt*/`.
