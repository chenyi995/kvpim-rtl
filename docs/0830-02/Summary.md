# 0830-02 DC Summary

## Run status

The requested commands completed successfully:

```text
cd syn && ./run_dc_0830-02.sh
dc_shell -f syn/run_dc_asap7_0830-02.tcl   # invoked by the driver for each tag
```

Outputs are under `syn/dc_0830-02/`. This is component-level synthesis as defined
by `Hardware_Overhead_Breakdown.md`; no top-level synthesis was requested.

## Component results

| Component/tag | Period | Area (um^2) | Setup slack (ps) | Violating paths |
|---|---:|---:|---:|---:|
| GEMV AttAcc `gemv_attacc_p1501` | 1.5015 ns | 10,615.143822 | +0.41 | 0 |
| GEMV Fugue `gemv_fugue_p769` | 0.769 ns | 11,002.898926 | -510.05 | 496 |
| GEMV flop reference `gemv_flop_p1501` | 1.5015 ns | 6,882.795102 | 0.00 | 0 |
| BG accumulator AttAcc | 1.5015 ns | 252.904680 | +0.06 | 0 |
| BG accumulator Fugue | 0.769 ns | 308.950200 | -335.01 | 48 |
| BG accumulator buffer AttAcc | 1.5015 ns | 249.784556 | +909.22 | 0 |
| BG accumulator buffer Fugue | 0.769 ns | 250.178216 | +385.11 | 0 |
| Logic accumulator | 1.5015 ns | 1,465.552439 | +0.05 | 0 |
| D_i diff decoder/channel | 1.5015 ns | 2,100.467690 | -201.30 | 896 |
| Causal comparator | 1.5015 ns | 92.145599 | +299.55 | 0 |
| RoPE ablation | 1.5015 ns | 7,459.959051 | -209.40 | 1,456 |
| KV TLB | 1.5015 ns | 4,537.850027 | +4.70 | 0 |
| AttAcc HBM controller | 1.5015 ns | 2,248.498431 | +12.71 | 0 |
| Fugue HBM controller | 1.5015 ns | 6,744.095618 | +1.76 | 0 |
| FP32 reciprocal | 0.699 ns | 2,239.560892 | +0.09 | 0 |

Previously validated softmax leaves are reused as specified in the source
breakdown: `softmax_pe=1,836.88 um^2`, `fp32_add=211.51 um^2`.

## Rolled-up overhead

Using `N_gemv=2048`, `N_bg=256`, `N_ch=16`, and the formulas in section 5 of
the breakdown document:

| Level | AttAcc (um^2) | Fugue (um^2) | Fugue + RoPE (um^2) |
|---|---:|---:|---:|
| Bank | 21,739,814.547 | 22,533,937.000 | 22,533,937.000 |
| Bank group | 128,688.444 | 143,136.874 | 143,136.874 |
| Logic die | 802,670.822 | 1,845,718.774 | 1,853,178.733 |
| HBM controller | 2,248.498 | 6,744.096 | 6,744.096 |
| **Stack total** | **22,673,422.313** | **24,529,536.745** | **24,536,996.704** |

Relative to AttAcc, Fugue adds **8.1863%** total area; the on-die RoPE
ablation adds **8.2192%**. Level deltas are: bank **+3.6528%**, BG
**+11.2274%**, logic die **+129.9472%**, and controller **+199.9378%**.

The AttAcc configuration has 16 buffer instances, one per channel. Each holds
32 KiB: `2 contexts x 2048 FP32 values x 2` (score and exp/probability).
Therefore, the 16 buffers hold **512 KiB total**, not 512 KiB each. Fugue has
16 buffers x 256 KiB = 4 MiB total.

| Softmax term | AttAcc (um^2) | Fugue (um^2) |
|---|---:|---:|
| 256 `softmax_pe` macro instances | 470,240.219 | 470,240.219 |
| Reduction, reciprocal, FSM, and other glue | 120,244.132 | 120,244.132 |
| 16 channel buffers | 188,737.633 (512 KiB total) | 1,196,703.772 (4 MiB total) |
| **Softmax + buffer, whole logic die** | **779,221.983** | **1,787,188.123** |

The AttAcc total comes directly from the existing integrated
`softmax_array_256` report, which instantiates 16 `softmax_unit` channel
engines x 16 PE/channel and already includes all 16 AttAcc buffers:
`779,221.983194 um^2`. Its area report attributes `188,737.632608 um^2` to
the 16 integrated AttAcc buffer instances. Fugue replaces those 16 32-KiB
buffers with 16 256-KiB buffers:
`779,221.983194 - 188,737.632608 + 16 x 74,793.985749`
`= 1,787,188.122570 um^2`.

Thus a single `softmax_pe` is `1,836.88 um^2`; `35,013.801 um^2` is a
per-channel arithmetic estimate containing 16 PE, 16 adders, and one
reciprocal, not a per-PE value. The prior component roll-up omitted the
integrated array's control glue; this revision uses the direct integrated
AttAcc breakdown and does not double-count the buffer.

## Timing disposition

DC completed for every requested tag, but not every frequency constraint closed.
The negative paths are concentrated in the single-cycle FP16 arithmetic and
wide combinational decoder/rotation logic: Fugue GEMV, Fugue BG accumulator,
the diff decoder, and the RoPE ablation remain negative. Inserting registers in
these blocks would change the documented GEMV pass protocol and controller
latency, so no speculative RTL pipeline was committed after the complete
matrix run. The reports preserve the measured violations for architectural
review rather than hiding them by relaxing constraints.

## Verification note

`testbench/0830-02/run_tests.sh` could not start on this host because
`iverilog` is not installed (`iverilog: command not found`).

Xinyao:
Timing明天修；这个Area困得有点无法理解为什么对不上，明天再看。