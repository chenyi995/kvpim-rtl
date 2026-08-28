#!/usr/bin/env python3
"""Build the page-table image and the expected vectors of tb_kv_tlb from
attacc_drampim's own CacheBlendTLB (testbench/gen_kv_tlb_vectors.py).

The scenario mirrors experiments/end_to_end_20260818/supervisor (5 contexts:
a supervisor and 4 workers; per worker/layer 4 master blocks + diff blocks,
i.e. ~27 descriptors per layer, cf. 19 blocks/layer in the recorded run):

    worker w, layer l, consumer positions
        [0,400)    sys0      reused master of `sup` (k_sys corrected rows -> diff)
        [400,550)  out-sup   reused master of `sup` (k_out corrected rows -> diff)
        [550,700)  i-w       own master (fresh prefill)
        [700,850)  w::output own master (decode output rows)
    sup, layer l: [0,400) sys0, [400,550) i-sup, [550,700) out-sup (all own).

Placement, physical addresses, shadow (read-and-mask) rows and the expected
runs come from CacheBlendTLB.reserve/finalize/locate/scan_runs and
_physical_reads — nothing physical is re-implemented here.  The only
hardware-side re-implementation is the planner's *logical-order* coalescing,
which is checked against scan_runs for identical row coverage.

Outputs (default testbench/vectors/kv_tlb/):
    table.hex     $readmemh image, 256-bit words, word address = byte/32
    lookups.txt   ctx layer pool pos exp_fault exp_key exp_count exp_ch exp_chc
    plans.txt     "ctx layer lo hi pools nruns" then nruns x "key count ch chc kind"
"""
import argparse
import os
import random
import sys
from dataclasses import replace

HERE = os.path.dirname(os.path.abspath(__file__))
STRIDE = 256
L_SYS, L_OUT, L_IN, L_GEN = 400, 150, 150, 150
DIR_BASE = 0x0
SEG_REGION = 0x4000
LAYER_W, CTX_SHIFT = 7, 8


def pack_desc(key, vs, ve, cnt, ctx, layer, chb, chc, kind):
    assert key < (1 << 34) and vs < (1 << 16) and ve < (1 << 16) and cnt < (1 << 16)
    return (1 | (kind << 1) | (chc << 2) | (chb << 7) | (layer << 11) | (ctx << 18) |
            (cnt << 26) | (ve << 42) | (vs << 58) | (key << 74))


def pack_dir(seg_base, seg_count):
    assert seg_base % 32 == 0 and seg_count < 256
    return 1 | (seg_count << 1) | (seg_base << 9)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--drampim", default=os.path.normpath(os.path.join(HERE, "..", "..", "attacc_drampim")))
    ap.add_argument("--out", default=os.path.join(HERE, "vectors", "kv_tlb"))
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--layers", type=int, default=2)
    ap.add_argument("--workers", type=int, default=4)
    ap.add_argument("--k-sys", type=int, default=16)
    ap.add_argument("--k-out", type=int, default=24)
    args = ap.parse_args()
    sys.path.insert(0, args.drampim)
    from src.workload_runner import CacheBlendTLB, _physical_reads  # noqa: E402

    rng = random.Random(args.seed)
    workers = ["t1w%d" % i for i in range(args.workers)]
    ctx_id = {"sup": 0}
    for i, w in enumerate(workers):
        ctx_id[w] = i + 1
    layers = list(range(args.layers))

    # ---------------- drampim reservations ----------------
    tlb = CacheBlendTLB(STRIDE)
    corr_sys, corr_out = {}, {}
    for l in layers:
        for r in range(L_SYS):
            tlb.reserve(l, "sup", "sys0", r, "master")
        for r in range(L_IN):
            tlb.reserve(l, "sup", "i-sup", r, "master")
        for r in range(L_OUT):
            tlb.reserve(l, "sup", "out-sup", r, "master")
        for w in workers:
            corr_sys[w, l] = sorted(rng.sample(range(L_SYS), args.k_sys))
            corr_out[w, l] = sorted(rng.sample(range(L_OUT), args.k_out))
            for p in corr_sys[w, l]:
                tlb.reserve(l, w, "sys0", p, "diff")            # owner_row = consumer position
            for r in corr_out[w, l]:
                tlb.reserve(l, w, "out-sup", L_SYS + r, "diff")
            for r in range(L_IN):
                tlb.reserve(l, w, "i-" + w, r, "master")
            for r in range(L_GEN):
                tlb.reserve(l, w, w + "::output", r, "master")
    tlb.finalize()

    def total_len(ctx):
        return L_SYS + L_IN + L_OUT if ctx == "sup" else L_SYS + L_OUT + L_IN + L_GEN

    def consumer_locations(ctx, l):
        """Consumer-visible KV rows exactly as _cacheblend_tlb_rows binds them."""
        locs = []
        if ctx == "sup":
            for p in range(L_SYS):
                locs.append(tlb.locate(l, "sup", "sys0", p, "master"))
            for r in range(L_IN):
                locs.append(tlb.locate(l, "sup", "i-sup", r, "master"))
            for r in range(L_OUT):
                locs.append(tlb.locate(l, "sup", "out-sup", r, "master"))
            return locs
        w = ctx
        cs, co = set(corr_sys[w, l]), set(corr_out[w, l])
        for p in range(L_SYS):
            base = tlb.locate(l, "sup", "sys0", p, "master")
            if p in cs:
                locs.append(replace(tlb.locate(l, w, "sys0", p, "diff"), shadow=base))
            else:
                locs.append(base)
        for r in range(L_OUT):
            base = tlb.locate(l, "sup", "out-sup", r, "master")
            if r in co:
                locs.append(replace(tlb.locate(l, w, "out-sup", L_SYS + r, "diff"), shadow=base))
            else:
                locs.append(base)
        for r in range(L_IN):
            locs.append(tlb.locate(l, w, "i-" + w, r, "master"))
        for r in range(L_GEN):
            locs.append(tlb.locate(l, w, w + "::output", r, "master"))
        return locs

    # ---------------- hardware descriptors ----------------
    # master: (vs, ve, key_base, chb, chc); diff: (vs, ve, count, key_base, chb, chc)
    descs = {}   # (ctx_id, layer, kind) -> list sorted by vs
    master_rows = {}  # (ctx, l) -> per-position master location (shadow for corrected rows)
    for l in layers:
        for ctx in ["sup"] + workers:
            locs = consumer_locations(ctx, l)
            mrows = [loc.shadow if loc.shadow is not None else loc for loc in locs]
            master_rows[ctx, l] = mrows
            segs = []
            start = 0
            for p in range(1, len(mrows) + 1):
                if (p == len(mrows) or mrows[p].block_id != mrows[start].block_id or
                        mrows[p].key_address != mrows[start].key_address + (p - start) * STRIDE):
                    m = mrows[start]
                    segs.append((start, p, m.key_address, m.channel_base, m.channel_count))
                    start = p
            descs[ctx_id[ctx], l, 0] = segs
            dsegs = []
            if ctx != "sup":
                for fp, positions in (("sys0", corr_sys[ctx, l]),
                                      ("out-sup", [L_SYS + r for r in corr_out[ctx, l]])):
                    first = tlb.locate(l, ctx, fp, positions[0], "diff")
                    assert first.token_offset == 0
                    dsegs.append((positions[0], positions[-1] + 1, len(positions),
                                  first.key_address, first.channel_base, first.channel_count))
                dsegs.sort()
            descs[ctx_id[ctx], l, 1] = dsegs

    # ---------------- memory image ----------------
    words = {}

    def put(byte_addr, width_bits, value):
        w = byte_addr // 32
        shift = (byte_addr % 32) * 8
        words[w] = words.get(w, 0) | (value << shift)

    cursor = SEG_REGION
    max_per_layer = {}
    for (cid, l, kind), segs in sorted(descs.items()):
        if not segs:
            continue
        seg_base = cursor
        for k, seg in enumerate(segs):
            if kind == 0:
                vs, ve, key, chb, chc = seg
                cnt = ve - vs
            else:
                vs, ve, cnt, key, chb, chc = seg
            put(seg_base + 16 * k, 128, pack_desc(key, vs, ve, cnt, cid, l, chb, chc, kind))
        cursor = (seg_base + 16 * len(segs) + 31) // 32 * 32
        idx = (cid << CTX_SHIFT) | (l << 1) | kind
        put(DIR_BASE + 8 * idx, 64, pack_dir(seg_base, len(segs)))
        max_per_layer[l] = max_per_layer.get(l, 0) + len(segs)
    assert DIR_BASE + 8 * ((max(ctx_id.values()) << CTX_SHIFT) | 0xFF) < SEG_REGION

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "table.hex"), "w") as f:
        for w in sorted(words):
            f.write("@%x\n%064x\n" % (w, words[w]))

    # ---------------- expected lookups ----------------
    lookups = []
    for l in layers:
        for ctx in ["sup"] + workers:
            cid = ctx_id[ctx]
            n = total_len(ctx)
            for pos in sorted({0, L_SYS - 1, L_SYS, L_SYS + L_OUT - 1, L_SYS + L_OUT, n - 1}):
                m = master_rows[ctx, l][pos]
                lookups.append((cid, l, 1, pos, 0, m.key_address, 1, m.channel_base, m.channel_count))
            for seg in descs[cid, l, 1]:
                vs, ve, cnt, key, chb, chc = seg
                lookups.append((cid, l, 2, vs, 0, key, cnt, chb, chc))
                lookups.append((cid, l, 2, ve - 1, 0, key, cnt, chb, chc))
            lookups.append((cid, l, 1, n, 1, 0, 0, 0, 0))            # unmapped -> fault
    with open(os.path.join(args.out, "lookups.txt"), "w") as f:
        for v in lookups:
            f.write("%d %d %d %d %d %x %d %d %d\n" % v)

    # ---------------- expected plans ----------------
    def hw_runs(cid, l, lo, hi, pools):
        """Replica of kv_scan_planner: cover [lo,hi) with master segments
        (fault on a hole), then emit the selected descriptors in ascending
        key_base order, clipped to the range, merging physically adjacent
        same-pool runs — CacheBlendTLB.scan_runs on segments."""
        if pools & 1:
            pos = lo
            while pos < hi:
                seg = next(s for s in descs[cid, l, 0] if s[0] <= pos < s[1])
                pos = min(seg[1], hi)
        cands = []
        if pools & 1:
            for vs, ve, key, chb, chc in descs[cid, l, 0]:
                if vs < hi and ve > lo:
                    start, end = max(vs, lo), min(ve, hi)
                    cands.append((key + (start - vs) * STRIDE, end - start, chb, chc, 0))
        if pools & 2:
            for vs, ve, cnt, key, chb, chc in descs[cid, l, 1]:
                if vs < hi and ve > lo:
                    cands.append((key, cnt, chb, chc, 1))
        runs = []
        for run in sorted(cands):
            if runs and runs[-1][4] == run[4] and runs[-1][2] == run[2] and runs[-1][3] == run[3] \
                    and run[0] == runs[-1][0] + runs[-1][1] * STRIDE:
                runs[-1] = (runs[-1][0], runs[-1][1] + run[1], run[2], run[3], run[4])
            else:
                runs.append(run)
        return runs

    def rows_of(runs):
        return {(k + i * STRIDE, chb, chc) for k, n, chb, chc, _ in runs for i in range(n)}

    plans = []
    summary = []
    for l in layers:
        for ctx in ["sup"] + workers:
            cid = ctx_id[ctx]
            n = total_len(ctx)
            locs = consumer_locations(ctx, l)
            reads, masked = _physical_reads(locs)
            for pools, name in ((1, "master"), (3, "master+diff")):
                sel = reads if pools == 3 else [r for r in reads if r.kind == "master"]
                ref = tlb.scan_runs(sel)
                ref_runs = [(k, cnt, chb, chc) for k, v, cnt, chb, chc in ref]
                hw = hw_runs(cid, l, 0, n, pools)
                assert [(k, c, b, n_) for k, c, b, n_, _ in hw] == ref_runs, \
                    "runs differ from drampim scan_runs for %s L%d %s" % (ctx, l, name)
                assert sum(r[1] for r in hw) == len(sel)
                plans.append((cid, l, 0, n, pools, hw))
                summary.append((ctx, l, name, len(ref), len(hw), len(sel), len(masked)))
            # a decode-style window: last 64 rows only (master pool)
            hw = hw_runs(cid, l, n - 64, n, 1)
            ref = tlb.scan_runs([r for r in reads if r.kind == "master"][-64:])
            assert [(k, c, b, n_) for k, c, b, n_, _ in hw] == [(k, c, b, n_) for k, v, c, b, n_ in ref]
            plans.append((cid, l, n - 64, n, 1, hw))
    with open(os.path.join(args.out, "plans.txt"), "w") as f:
        for cid, l, lo, hi, pools, hw in plans:
            f.write("%d %d %d %d %d %d\n" % (cid, l, lo, hi, pools, len(hw)))
            for k, cnt, chb, chc, kind in hw:
                f.write("%x %d %d %d %d\n" % (k, cnt, chb, chc, kind))

    print("descriptors per layer:", max_per_layer)
    print("%-6s %-2s %-12s %8s %8s %6s %6s" % ("ctx", "L", "pools", "drampim", "hw", "rows", "masked"))
    for ctx, l, name, nref, nhw, nrows, nmask in summary:
        print("%-6s %-2d %-12s %8d %8d %6d %6d" % (ctx, l, name, nref, nhw, nrows, nmask))
    print("wrote", args.out, ":", len(words), "memory words,", len(lookups), "lookups,", len(plans), "plans")


if __name__ == "__main__":
    main()
