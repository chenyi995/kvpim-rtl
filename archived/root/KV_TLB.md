# KV segment TLB + PTW — drampim's `CacheBlendTLB` in hardware (N28-synthesizable)

Purpose: an RTL model of the **TLB / page-table-walk logic that
`attacc_drampim` assumes** (`src/workload_runner.py::CacheBlendTLB`,
`scan_runs`, `_tlb_plan_cost`), so that synthesis gives a measured
cycle count / Fmax / area for the "TLB lookup and bank plan" that the
simulator currently prices with the unsourced constant
`_TLB_DESCRIPTOR_S = 5 ns` per run (ledger U1).

It replaces the former page-granular `rtl/tlb.sv` of the Fugue die (32 x
2 KiB VPN->PPN CAM, linear page table).  drampim never translates pages: its
table maps **segments** — a contiguous range of a consumer's logical
token positions to one contiguous physical K/V run in a channel pool —
and its hardware cost is per *run descriptor* of a scan.  This block
implements exactly that.

## Mapping to drampim

| drampim (`workload_runner.py`) | here |
|---|---|
| `KVBlock`: `key_base`, `value_base = key + 8 MiB`, `vector_stride = 256`, `channel_base`, `channel_count`, `kind` master/diff, `rows` | `seg_desc_t` (128 b): `key_base[33:0]`, `vpos_start/vpos_end`, `count`, `ctx`, `layer`, `ch_base`, `ch_count`, `kind`; value address derived (`value_base_of`) |
| `KVLocation` for a consumer row (`_cacheblend_tlb_rows` / `bind`) | `OP_LOOKUP` -> `key_base + (pos - vpos_start) * 256`, pool, one run of 1 row |
| diff block whose `rows` are the *sparse* corrected positions; `token_offset = rows.index(pos)` | diff descriptor spans `[first, last+1)`, `count` = rows stored; the position->row map is the D_i bitmap prefix-popcount in `diff_decoder`, not the TLB |
| shadowed master row: streamed in the master run and masked (`shadow_reads`) | master segments are contiguous over the producer block, so the master pass never splits at a corrected row |
| `_KV_CHANNELS` master ch0-14 / diff ch15 (or 8/8), 1 GiB channel, 8 KiB partitions | 34-bit byte address; `ch_base/ch_count` carried per descriptor; no re-implementation of placement — the page table *is* drampim's block table |
| `scan_runs`: sort reads by `(channel_base, channel_count, key, value)`, merge adjacent | planner phase B: TLB returns matching entries in ascending `key_base` (min-key tournament), merge when `key == prev.key + prev.count*256` and same pool |
| `_tlb_plan_cost = len(runs) * 5 ns` (charged per scan on the DIE) | `OP_PLAN` cycles (measured, below) |
| block table materialised at `finalize`; paper: metadata loaded at attach | `OP_ATTACH (ctx, layer)`: PTW streams every descriptor of both pools into the TLB |
| (no demand miss model) | demand miss -> PTW: directory read + binary search over the sorted segment array |

Fields that drampim keeps but the die never needs (`fingerprint`,
`owner` string, `block_id`, `channel_tile`, `partition_offset`) are
resolved by the host when it writes the table.

## Scale (why 32 entries)

Measured from the recorded drampim TLB reports
(`experiments/end_to_end_20260818/supervisor/v3/{cacheblend,epic}_b4.json`,
5 agents, 32 layers):

| quantity | cacheblend b4 | epic b4 | ladder relay LLaMA-7B |
|---|---:|---:|---:|
| blocks per layer (all agents) | 19 | 15 | 640/32 = 20 |
| blocks per (layer, agent) | <= 4 | <= 3 | — |
| diff blocks per layer | 8 (11–24 rows each, sparse) | 4 (1 row each) | — |
| master block length | 150 / 400 rows | 150 / 400 | — |
| runs per scan (`tlb_lookup_and_bank_plan` events) | <= 3 | <= 2 | — |
| physical address span | up to 0x2_00a6_b700 (34 b) | | |

The die serves one layer of the batch at a time, so the working set is
one layer's descriptors: ~20 in the recorded runs, 27 in the testbench
scenario (5 agents x {sys, out, in, output} + 2 diff blocks per worker).
`ENTRIES = 32` (default) holds that with margin; `kv_tlb_e16` thrashes
through the PTW (still correct), `kv_tlb_e64` holds two layers.  Sweep
with `syn/Makefile sweep`.

## Modules (`rtl/`) and die integration

| file | what | pipeline |
|---|---|---|
| `kv_tlb_pkg.sv` | constants (all drampim), `seg_desc_t`, `dir_entry_t`, `run_t`, opcodes | |
| `kv_seg_tlb.sv` | fully-assoc **range** CAM (`vpos_start <= pos < vpos_end`), FIFO fill with dedup, **min-key iterate** (tournament tree, split into 2 stages at `IT_SPLIT`) | lookup 2 cyc, iterate 2 cyc |
| `kv_ptw.sv` | directory `{ctx,layer,kind}` -> `{seg_base, seg_count}`; demand walk = binary search (one 32-B read per probe, 2 descriptors per read); attach = stream both pools | ~3 cyc FSM overhead per memory access |
| `kv_scan_planner.sv` | phase A cover `[lo,hi)` via lookups (miss -> PTW, hole -> fault); phase B emit descriptors in physical order, clip, merge (= `scan_runs`) | |
| `kv_tlb_top.sv` | command port (`OP_LOOKUP / OP_PLAN / OP_ATTACH / OP_FLUSH`), run stream, single-outstanding 32-B memory port | |
| `kv_tlb_variants.sv` | `kv_tlb_e16 / e32 / e64` standalone synthesis tops | |
| `direct_addr_plan.sv` | AttAcc baseline: same command/run port, one affine run `(kv_base + pos) * 256`, no table | |
| `attacc_controller.sv` | `PIM_MAC_AB` → `OP_PLAN` over `[vaddr, vaddr+len)` with `(ctx, layer, pools)` from `CFG_KVCTX`; consumes runs, 8 × 32-B column reads per row, ACT on DRAM-row change; `PIM_ATTACH` → `OP_ATTACH` / `OP_FLUSH` | |

In the dies `u_tlb` is `kv_tlb_top` (Fugue / Fugue 2 / Fugue-MQ) or
`direct_addr_plan` `u_addr` (AttAcc), driven by the same controller;
`CFG_KVBASE` is the page-table directory base (32-B units) for Fugue and the
KV vector base for AttAcc.  The walker's memory port is exposed at the die as
`pt_mem_*` (single outstanding 32-B read).

Page table in memory: directory entry at `dir_base + 8*{ctx, layer, kind}`
(64 b: `seg_base[42:9]`, `seg_count[8:1]`, `valid[0]`); each `(ctx, layer, kind)`
owns a 32-B aligned array of 128-b descriptors sorted by `vpos_start`.
Both are written by the host from drampim's block table
(`testbench/gen_kv_tlb_vectors.py` shows the packing).

## Verification against drampim

`testbench/gen_kv_tlb_vectors.py` **imports `attacc_drampim`'s `CacheBlendTLB`**,
reserves/finalizes a supervisor + 4-worker scenario (reused `sys0` and
`out-sup` blocks with random corrected rows -> diff blocks, own prefill
and output blocks), and derives from drampim itself: the memory image
(`testbench/vectors/kv_tlb/table.hex`), expected `locate()` addresses (`lookups.txt`)
and expected `scan_runs()` run lists (`plans.txt`, including the
shadow-row master stream).  The generator asserts that the planner's
segment-level algorithm reproduces `scan_runs` run-for-run before writing
the vectors.  `testbench/tb_kv_tlb.sv` then checks 102 lookups (hit, miss, fault)
and 30 plans (cold via PTW, warm, attached with diff) and prints cycle
counts.

```
./testbench/run_tests.sh                       # whole regression incl. tb_kv_tlb (from the repo root)
python3 testbench/gen_kv_tlb_vectors.py        # regenerate vectors (needs ../attacc_drampim)
iverilog -g2012 -s tb_kv_tlb -P tb_kv_tlb.MEM_LAT=8 -P tb_kv_tlb.ENTRIES=16 -o /tmp/t.vvp \
    rtl/kv_tlb_pkg.sv rtl/kv_seg_tlb.sv rtl/kv_ptw.sv rtl/kv_scan_planner.sv rtl/kv_tlb_top.sv \
    testbench/tb_kv_tlb.sv && vvp /tmp/t.vvp     # other latencies / sizes
```

## Measured cycles (ENTRIES=32, 500 MHz clock, MEM_LAT=1; logic-only = cycles - MEM_LAT x reads)

| path | cycles | memory reads | note |
|---|---|---|---|
| TLB lookup, request -> response | **2** | 0 | S1 range match + select, S2 34-b address add |
| TLB iterate (min key), request -> response | **2** | 0 | tournament tree, 2 stages |
| PTW demand walk, accept -> done | 8–18 (avg 12.7), logic-only **9.5** | 1 dir + 1–3 probes (<= 4 segments) | ~3 cyc FSM per access |
| PTW attach (both pools of a (ctx, layer)) | 16–22, logic-only **16.4** | 2 dir + 3 data (6 descriptors) | 2 descriptors / read |
| `OP_LOOKUP` hit, command accept -> done | 10–13 | 0 | framing: top 2 + phase A 3 + phase B 2x3 + flush/done |
| `OP_LOOKUP` miss | 25–33, logic-only 25.8 | ~3 | |
| `OP_PLAN` warm, 64-row window (1 seg, 1 run) | **13** | 0 | |
| `OP_PLAN` warm, 700-row ctx (3 segs, 1 run) | 27 | 0 | |
| `OP_PLAN` warm, 850-row ctx master (4 segs, 1–2 runs) | 34–35 | 0 | |
| `OP_PLAN` attached, master+diff (6 descs, 2–3 runs) | 43–44 | 0 | |

Rule of thumb from the plan rows: **~6 cycles fixed + ~3 cycles per
segment (phase A) + ~5 cycles per descriptor (phase B)**, i.e. the
cost scales with *descriptors*, not with the merged run count that
drampim charges (5 ns = 2.5 cycles per run at 500 MHz).  A 6-descriptor
scan is ~88 ns here vs 15 ns in the simulator — consistent with ledger
U1's point that the plan has to be overlapped/incremental to be cheap.
Substitute the synthesized Fmax for 500 MHz to get ns.

## Synthesis

```
cd syn
make kvtlb          # kv_tlb_e32 standalone, full flatten (run_syn.tcl / tsmcn28_mmmc.tcl, filelist_kvtlb.f)
make kvtlb-hier     # per-block area: u_tlb (CAM + min-key tree), u_ptw, u_plan
make kvtlb-sweep    # e16 / e32 / e64
PERIOD_NS=1.6 make kvtlb
make both / both-hier   # the dies: Fugue now carries kv_tlb_top, AttAcc direct_addr_plan
```

Read `report_timing` for the two candidates for the critical path: the
lookup S1 (ENTRIES x 2 x 16-b magnitude compares + priority encode +
128-b ENTRIES:1 mux) and the iterate stage B (34-b compare tree over
`ENTRIES >> IT_SPLIT` candidates).  `IT_SPLIT` is a parameter of
`kv_seg_tlb` if the split needs to move.

## Deliberate differences / limits

- Diff descriptors are reached only through `OP_ATTACH` (phase B
  enumerates resident entries); a demand walk is position-based and
  master-only.  Matches the paper's attach-time metadata load.
- A diff run is the whole diff block, also for a windowed plan; drampim
  reads only the visible corrected rows (identical for full-context scans,
  which is every recorded decode/prefill scan).
- Memory model is one outstanding 32-B read with parameterised latency;
  DRAM timing is Ramulator's job, so report logic-only cycles.
- `ENTRIES` must be a power of two (tournament tree).
- Single command at a time; no overlap of phase A with a previous scan
  (the incremental-update idea of ledger U1 is not implemented).
