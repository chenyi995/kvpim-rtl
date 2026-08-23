# Fugue logic-die RTL — Handoff

Handoff/onboarding notes for the Fugue HBM logic-die RTL + N28 synthesis in
this folder. Pair with `README.md` (reference) — this doc covers *why*, *state*,
*gotchas*, and *what's next*.

---

## 1. TL;DR / status

- **Goal:** an RTL model of the Fugue logic die (AttAcc buffer-die logic + three
  Fugue additions) that **synthesizes on TSMC N28** so we can quantify the
  **added-hardware area/power/timing overhead** vs. an AttAcc-original baseline.
- **State:** ✅ complete and synthesizing cleanly. Both tops elaborate with no
  errors/latches and meet 500 MHz at the worst-case (SS) corner in full-flatten.
- **Result:** Fugue's additions cost **+8.9% area / +3.4% power, timing-neutral**
  (details in §3).
- **Everything runs headless** (`genus -no_gui`), reproducible via `make both`.

---

## 2. Context & goal

Fugue serves **master-diff KV** attention on an HBM logic die: 7 master channels
hold one dense reference-aligned KV copy, 1 diff channel holds each agent's diff
tokens (compacted). Per decode step the die scores every agent over the shared
master, **overwrites** the diff-token positions with diff-channel scores, runs
softmax, then **splits** the recirculated probabilities back to master/diff
sides (paper: `KV-PIM/sections/03-design.tex`, §Execution).

This RTL captures the **logic-die datapath + control** for that flow, plus the
AttAcc GEMV/softmax substrate it sits on, targeted purely at **area/timing/power
exploration** (not a cycle-accurate functional model — see §8).

---

## 3. Results (N28, SS/0.72 V/125 °C, full-flatten, high effort, 500 MHz)

| Metric | AttAcc baseline | Fugue | Δ = added hardware |
|---|---:|---:|---:|
| Total area | 473,939 µm² | 516,310 µm² | **+42,372 (+8.9%)** |
| — cell / net area | 339,894 / 134,045 | 368,043 / 148,268 | +28,149 / +14,223 |
| Std-cell instances | 270,772 | 299,896 | +29,124 (+10.8%) |
| Total power | 285.8 mW | 295.4 mW | +9.7 (+3.4%) |
| — leak / int / sw | 95.2 / 143.6 / 47.0 | 102.4 / 143.9 / 49.1 | +7.3 / +0.3 / +2.0 |
| Timing (0 viol) | 500 MHz met (slack 0) | 500 MHz met (slack 0) | timing-neutral |
| Critical path | GEMV buf → FP16 mult | `rotate_q_unit` RoPE MAC | moves into RoPE |

Approx Δ split (from an intermediate Fugue run *without* `diff_decoder` =
508,517 µm²): `rotate_q_unit`+`tlb` ≈ **+34.6k µm²**, `diff_decoder` ≈ **+7.8k µm²**.

Reports: `syn/build_{attacc,fugue}/reports_{attacc,fugue}/*_{area,timing,power,gates,qor}.rpt`.
Caveats: power is Genus' statistical estimate (no VCD) — trust the **delta**, not
the absolute. "500 MHz met, slack 0" = ≥500 MHz, not the true Fmax (see §9).

> **Update — on-die RoPE coefficients + config sweep.** The table above is the
> original Fugue with an FP16 rotate that *streams* cos/sin. Two newer configs
> (full-flatten, 500 MHz, slack 0; details `syn/ROTATE_M2_BF16.md`, §9 item 4):
> - **Fugue 2** (RoPE done on the GPU; die = baseline +TLB +diff_decoder only):
>   **488,120 µm² / 292.4 mW = +3.0% vs AttAcc** (`build_fugue2/`).
> - **Fugue** (on-die **BF16** RoPE w/ generated sin/cos, `rotate_q_bf16`; die
>   takes only the angle upstream): **523,585 µm² / 304.5 mW = +10.5% vs AttAcc**
>   (`build_fugue_m2/`).
>
> So the Fugue overhead splits: TLB+diff (拼接) = **+3.0%**, on-die BF16 RoPE =
> **+7.5%** (RoPE ≈ 70% of the added hardware).

---

## 4. Module map

New = written here; Reuse = copied from `../KV-rtl/gemv_n28/rtl`; Agent = authored
by a workflow agent (style-matched to the FP16 units).

| File | Origin | Role | Notes |
|---|---|---|---|
| `fugue_pkg.sv` | New | params, `opcode_e` (incl. `PIM_SET_META`), `instr_t`, dram/cfg types | single source of truth for widths |
| `fp16_mult/add.sv` | Reuse | IEEE754 binary16 mul/add | 1-cyc, RNE, FTZ |
| `dbuf_16x256.sv` | Reuse | double-buffered 16×256b store | flop-based, no SRAM macro |
| `gemv_unit.sv` | Reuse | 16-lane FP16 GEMV MAC | 16 mul + 8+4+2+1 tree + acc |
| `fp32_add/mul/exp/recip.sv` | Agent | FP32 leaves for softmax | exp = 3-cyc LUT+interp; recip = 4-cyc LUT+NR |
| `rotate_q_unit.sv` | New | RoPE rotate (RoPIM-style) | adjacent-pair, 2-cyc, reuses fp16 units |
| `accumulator.sv` | New | cross-GEMV FP16 reduce | N=NUM_GEMV=4 tree + acc |
| `softmax_unit.sv` | New | FP32 max→exp→sum→recip→norm | valid-driven FSM, LANES=16 |
| `diff_decoder.sv` | New | bidirectional master-diff merge | `diff_mask[]` + scatter + mask-gate |
| `tlb.sv` | New | KV VPN→PPN, fully-assoc | 32 entries, FIFO refill, linear page table |
| `attacc_controller.sv` | New | instr FIFO + decode + cfg + addr-gen + DRAM FSM | drives TLB + `PIM_SET_META` |
| `fugue_logic_die.sv` | New | Fugue top | baseline + 3 additions |
| `attacc_logic_die.sv` | New | AttAcc baseline top | direct addressing, no rotate/diff |

---

## 5. The Fugue additions in detail

**`rotate_q_unit`** (RoPE). Order **separate → negate → multiply → add**,
adjacent-pair `(x[2i], x[2i+1])`:
`y[2i]=x[2i]·cos − x[2i+1]·sin`, `y[2i+1]=x[2i]·sin + x[2i+1]·cos`. The subtract
is a **sign-bit flip** on the FP16 operand before the multiply (RoPIM's negate;
no carry for floats). cos/sin are streamed operand words (per-agent registers /
DRAM rows), not CORDIC or an on-die trig ROM. Verified against the RoPE math +
the paper's P4 and an adversarial check (adjacent-pair chosen over half-split for
cheap stride-1 partner wiring).

**`tlb`**. Fully-associative CAM, 32 entries, FIFO replacement. Hit → PPN in 1
cyc; miss → `MISS_LAT`-cycle walk filling from a **linear** page table
(`PPN = base + VPN`). Single outstanding request; `busy` stalls the controller.

**`diff_decoder`** (bidirectional). Registered `diff_mask[SM_WORDS]`, one 16-bit
mask per score word, loaded by `PIM_SET_META`. Combinational data paths over the
registered mask:
- forward: compact `diff_stream` scattered to lanes by mask prefix-popcount rank,
  overwriting `master_score` → `corrected_score` → softmax.
- reverse: `to_master[l] = mask[l]?0:prob[l]`, `to_diff[l] = mask[l]?prob[l]:0`.

**`PIM_SET_META` encoding** (reuses `instr_t`, mirrors `PIM_SET_CONFIG`):
`op=PIM_SET_META(0xA)`, `imm[SM_WIDX_W-1:0]=word_idx`, `vaddr[SM_LANES-1:0]=mask16`.
Controller decodes → `S_META` → drives `meta_wr_en/idx/mask` into `diff_decoder`
(same shape as the `cfg[]` write port).

---

## 6. Design decisions & rationale

- **Reuse the proven FP16 GEMV set** (`gemv_unit`+`fp16_*`+`dbuf`) rather than
  re-derive — they're IEEE-clean, 1-cyc, already wired. RoPE/accumulator build on
  the same fp16 primitives (negate via sign-flip avoids needing a subtract unit).
- **FP32 softmax** (per AttAcc). The 4 FP32 leaves were fanned out to agents with
  a pinned interface + the FP16 files as a style reference; `add`/`mul` are exact
  width-widenings, `exp`/`recip` are LUT-based (documented approximations).
- **Softmax processes one LANES-wide tile.** Wider L (paper: 256) is the same
  per-lane arithmetic time-multiplexed; SM_LANES=16 keeps the run tractable.
  This is the dominant area term (16× FP32 `exp`).
- **AttAcc baseline = Fugue minus {TLB, rotate, diff_decoder}**, TLB replaced by a
  1-cycle direct add (no CAM). Same controller in both (the `PIM_SET_META` decode
  is negligible), so the delta isolates exactly the three added blocks.
- **diff_decoder is its own module** (not folded into `tlb`) — matches the paper's
  "diff decoder w/ metadata buffer"; TLB stays address-translation-only.
- **Full flatten** (`ungroup -all -flatten`) per request / the T-cube recipe.

---

## 7. Environment & how to run

- **Tool:** Genus `/data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus`
  (25.1). Runs headless with `-no_gui` (warns about DISPLAY, reverts to shell — fine).
- **PDK:** TSMC N28 (CLN28HPC+, `tcbn28hpcplusbwp30p140`) at
  `/data2/tools-additional/pdk/N28`. MMMC (SS/FF/TT) is self-contained in
  `syn/tsmcn28_mmmc.tcl` (copied from `fracturableT3/T-cube`).
- **Run:** `cd syn && make both` (parallel A/B) — or `make attacc` / `make fugue`
  / `make fugue PERIOD_NS=1.5`. Each isolated in `build_<tag>/`.
- **Gotchas / lessons:**
  - **Do NOT `pkill -f <string>` where `<string>` also appears in the launching
    command line** — it kills the launching shell too (this happened; a rotate-job
    `pkill -f genus_rotate` killed the concurrent full-synth shell → exit 144,
    empty logs). Kill by PID or a pattern absent from the runner.
  - No SV linter (verilator/slang/iverilog) on PATH — **Genus elaboration is the
    check**. Elaboration fails fast (~1 min) on syntax/latch/blackbox issues.
  - Two concurrent Genus runs share the license pool fine here; each uses up to 8
    threads + pbs workers. Isolated `build_*` dirs avoid output collisions.
  - `run_syn.tcl` honors env `FUGUE_TOP` / `FUGUE_FILELIST` / `FUGUE_PERIOD_NS` /
    `FUGUE_TAG`; it generates `chip_<tag>.sdc` inline and reads `tsmcn28_mmmc.tcl`
    from cwd (hence the copy into each build dir).

---

## 8. Known limitations (representative stand-ins, not bugs)

These are deliberate — the target is area/timing, not functional sign-off:
- **TLB page table is linear** (`PPN=base+VPN`), not a real DRAM walk.
- **GEMV fills are broadcast** to all NUM_GEMV units (same data); the accumulator
  reduces them. Real per-unit data would change activity, not gate count much.
- **Softmax is single-tile** (LANES-wide); no online/streaming L>LANES wrapper.
- **`fp32_exp`/`fp32_recip` are LUT approximations** (area-representative).
- **diff_decoder score-collection is port-fed** (top inputs) rather than built
  from a live 16-score collector off the GEMV path — see next steps.
- **Power is a statistical estimate** (no switching-activity VCD).

---

## 9. Next-step work (prioritized)

1. **✅ DONE — Per-block area breakdown.** Deliverable: **`syn/AREA_BREAKDOWN.md`**
   (stacked-area table + where the added hardware goes). Done via the recommended
   hierarchical re-synth: **`syn/run_syn_hier.tcl`** (drops `ungroup -all -flatten`,
   sets `auto_ungroup none`, adds `report_area -depth 5`) with Makefile targets
   `make attacc-hier / fugue-hier / both-hier` and a parser `syn/area_breakdown.py`.
   Reports in `syn/build_{attacc,fugue}_hier/reports_*/*_area_hier.rpt`.
   **Result:** the +41.3k µm² delta (unflattened; +42.4k flat) is **96.4% the three
   added blocks** — `rotate_q_unit` **28.0k** (70%), `tlb` **6.8k** (17%),
   `diff_decoder` **5.0k** (13%) — plus +0.4k controller (`PIM_SET_META` decode)
   and +1.4k top glue; GEMV/softmax unchanged within noise. This refines §3's rough
   estimate (rotate+tlb≈34.6k→**34.8k**; diff≈7.8k→**5.0k**). Both tops still meet
   500 MHz at slack 0 in the hierarchical flow. RoPE (32 FP16 mults) dominates the
   added cost and is also Fugue's critical path; baseline stays GEMV(62%)+softmax(27%)
   bound (softmax's 16× `fp32_exp` = 37% of softmax).
2. **Fmax sweep** — both tops meet 500 MHz at slack 0; sweep `PERIOD_NS`
   (e.g. 2.0/1.6/1.3/1.1) to find each design's true Fmax at SS and whether the
   RoPE unit (Fugue's critical path) or softmax gates it.
3. **Functional verification** — no testbench yet. Add TBs for `rotate_q_unit`
   (vs a golden RoPE), `diff_decoder` (overwrite + mask-split), `softmax_unit`
   (vs float), and a top-level smoke test driving the PIM instruction stream.
4. **Tighten the integration** — build the 16-score collector off the GEMV path so
   `diff_decoder.master_score` comes from real scores; add the context adder that
   sums master+diff context partials (paper step 5). **On-die RoPE coefficient
   generation is now synthesized AND integrated** (BF16, LUT+interp sincos): see
   `syn/ROTATE_M2_BF16.md`. Standalone: sincos = **3,018 µm²/lane**, full 8-pair
   BF16 rotate w/ on-die sincos = **44.8k µm² @ 500 MHz** (`make rotbf16`).
   Integrated into `fugue_logic_die` (cos/sin ports removed; takes query + angles):
   the whole Fugue die is **523,585 µm² @ 500 MHz slack 0** (`build_fugue_m2/`),
   i.e. **+10.5% vs AttAcc** — only +7.3k over the earlier streamed-cos/sin Fugue,
   because BF16 shrinks the rotate MAC (~28k→17.8k) and the 512-bit cos/sin input
   ports are gone. The die now takes only the angle upstream. Next: drive
   `rope_phase` from an on-die `p·θ` generator seeded by `CFG_ROPEBASE`.
5. **Scale + sensitivity** — sweep `SM_LANES` (→256), `NUM_GEMV`, `TLB_ENTRIES`,
   `SM_WORDS` to chart area/power vs the paper's configuration.
6. **PnR** — take a mapped netlist through Innovus (the shared N28 flow at
   `/data/eda_tools/script/pnr/tsmcn28`) for post-layout area/timing/power.

---

## 10. Provenance & references

- **AttAcc:** `KV-PIM/ref/attacc.pdf` (ASPLOS '24). Logic-die microarch = §5.1,
  Fig 9 (GEMV unit, softmax unit, accumulator, controller).
- **RoPIM:** Jeon et al., *"RoPIM: A PIM Architecture for Accelerating Rotary
  Positional Embedding,"* IEEE CAL vol. 24(1) 2025 (DOI 10.1109/LCA.2025.3535470).
- **Fugue master-diff / split-channel / diff decoder:** `KV-PIM/sections/03-design.tex`
  (§Split-Channel Serving, §Execution, §Position Independence).
- **Reused RTL:** `../KV-rtl/gemv_n28/rtl/`. **Synth recipe / MMMC:** `../../fracturableT3/T-cube/syn/`.
