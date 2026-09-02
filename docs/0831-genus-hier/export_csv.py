#!/usr/bin/env python3
"""Export the paper's three configurations (AttAcc baseline, Fugue, Fugue+RoPE
ablation) from the genus_0831_hier reports to plotting-ready CSVs.

Reads the raw reports under syn/genus_0831_hier/<tag>/ (single source of
truth) and writes components.csv + rollup.csv next to this script.  Only the
runs that enter the three roll-ups are exported; every other run of the
matrix (leaf macros, macro-buffer references, standalone TLB/dbuf, softmax
internals) stays in syn/genus_0831_hier/SUMMARY.md.
"""
import csv
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SYN = os.path.normpath(os.path.join(HERE, "..", "..", "syn", "genus_0831_hier"))
sys.path.insert(0, SYN)
import collect  # noqa: E402  (the matrix's own parser)

CONFIGS = ("attacc", "fugue", "fugue_rope")
N_GEMV, N_BG, N_CH, DRAM_X = 1024, 256, 16, 10.0   # rulings 2026-09-01

# tag, top, level, count per stack, configs that instantiate it
ROWS = [
    ("gemv_flop_p1501",      "gemv_unit",                   "bank",           N_GEMV, ("attacc",)),
    ("gemv_flop_p769",       "gemv_unit",                   "bank",           N_GEMV, ("fugue", "fugue_rope")),
    ("accbg_attacc_p1501",   "accumulator_bg",              "bank_group",     N_BG,   ("attacc",)),
    ("accbuf_attacc_p1501",  "accum_buffer_bg_attacc",      "bank_group",     N_BG,   ("attacc",)),
    ("accbg_fugue_p769",     "accumulator_bg",              "bank_group",     N_BG,   ("fugue", "fugue_rope")),
    ("accbuf_fugue_p769",    "accum_buffer_bg_fugue",       "bank_group",     N_BG,   ("fugue", "fugue_rope")),
    ("sfmarray_attacc_p769", "sfm_array_attacc",            "logic_die",      1,      ("attacc",)),
    ("sfmarray_fugue_p769",  "sfm_array_fugue",             "logic_die",      1,      ("fugue", "fugue_rope")),
    ("acclogic_p1501",       "accumulator_logic",           "logic_die",      N_CH,   CONFIGS),
    ("diffdec_p1501",        "diff_decoder_channel_dc_top", "logic_die",      N_CH,   ("fugue", "fugue_rope")),
    ("causal_p1501",         "causal_comparator",           "logic_die",      N_CH,   ("fugue", "fugue_rope")),
    ("rope_p1501",           "rotate_q_bf16",               "logic_die",      1,      ("fugue_rope",)),
    ("ctrl_attacc_p1501",    "attacc_hbm_ctrl_top",         "hbm_controller", 1,      ("attacc",)),
    ("ctrl_fugue_p1501",     "fugue_hbm_ctrl_top",          "hbm_controller", 1,      ("fugue", "fugue_rope")),
]
LEVELS = ("bank", "bank_group", "logic_die", "hbm_controller")


def main():
    rows = []
    for tag, top, level, n, used in ROWS:
        r = collect.parse(tag, top)
        if r is None:
            sys.exit(f"missing reports for {tag}")
        if r["viol"] != 0 or r["slack"] < 0:
            sys.exit(f"{tag} does not meet timing: slack {r['slack']} viol {r['viol']}")
        rows.append(dict(tag=tag, top=top, level=level, used_by="+".join(used),
                         count_per_stack=n, period_ps=r["period"],
                         f_ghz=round(1000.0 / r["period"], 3),
                         area_um2=r["area"], slack_ps=r["slack"],
                         violations=r["viol"], power_mw=round(r["p_mw"], 4)))
    with open(os.path.join(HERE, "components.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    # roll-up: sum(count x area) per level per config
    lv = {c: {l: 0.0 for l in LEVELS} for c in CONFIGS}
    for tag, top, level, n, used in ROWS:
        a = next(r["area_um2"] for r in rows if r["tag"] == tag)
        for c in used:
            lv[c][level] += n * a
    out = []
    for view, fb in (("asap7_raw", 1.0), ("dram_equivalent", DRAM_X)):
        tot = {c: 0.0 for c in CONFIGS}
        for level in LEVELS:
            f = fb if level in ("bank", "bank_group") else 1.0
            v = {c: f * lv[c][level] for c in CONFIGS}
            for c in CONFIGS:
                tot[c] += v[c]
            out.append(_row(view, level, v))
        out.append(_row(view, "stack_total", tot))
    with open(os.path.join(HERE, "rollup.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(out[0].keys()))
        w.writeheader()
        w.writerows(out)
    print(f"wrote {len(rows)} component rows, {len(out)} rollup rows")


def _row(view, level, v):
    a = v["attacc"]
    return dict(view=view, level=level,
                attacc_um2=round(a, 1),
                fugue_um2=round(v["fugue"], 1),
                fugue_rope_um2=round(v["fugue_rope"], 1),
                fugue_delta_pct=round(100 * (v["fugue"] - a) / a, 2),
                fugue_rope_delta_pct=round(100 * (v["fugue_rope"] - a) / a, 2))


if __name__ == "__main__":
    main()
