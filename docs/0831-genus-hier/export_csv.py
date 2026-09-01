#!/usr/bin/env python3
"""Export the genus_0831_hier matrix to plotting-ready CSVs.

Reads the raw reports under syn/genus_0831_hier/ (single source of truth)
and writes components.csv + rollup.csv next to this script.  Re-run any time
the matrix is re-synthesized.
"""
import csv
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SYN = os.path.normpath(os.path.join(HERE, "..", "..", "syn", "genus_0831_hier"))
sys.path.insert(0, SYN)
import collect  # noqa: E402  (the matrix's own parser)

# tag -> (level, config, in_rollup)
META = {
    "fp16_mult_p700":  ("leaf", "fugue-clock leaf", False),
    "fp16_add_p700":   ("leaf", "fugue-clock leaf", False),
    "fp16_mult_p1350": ("leaf", "attacc-clock leaf", False),
    "fp16_add_p1350":  ("leaf", "attacc-clock leaf", False),
    "fp32_add_p630":   ("leaf", "softmax leaf", False),
    "fp32_mul_p630":   ("leaf", "softmax leaf", False),
    "bf16_mult_p1350": ("leaf", "rope leaf", False),
    "bf16_add_p1350":  ("leaf", "rope leaf", False),
    "gemv_flop_p1501": ("bank", "attacc (flop buffer, ROLLUP)", True),
    "gemv_flop_p769":  ("bank", "fugue (flop buffer, ROLLUP)", True),
    "gemv_attacc_p1501": ("bank", "attacc (macro buffer, reference)", False),
    "gemv_fugue_p769":   ("bank", "fugue (macro buffer, reference)", False),
    "dbuf_p1501": ("bank", "macro buffer alone, reference", False),
    "dbuf_p769":  ("bank", "macro buffer alone, reference", False),
    "accbg_attacc_p1501":  ("bg", "attacc (ROLLUP)", True),
    "accbg_fugue_p769":    ("bg", "fugue (ROLLUP)", True),
    "accbuf_attacc_p1501": ("bg", "attacc buffer (ROLLUP)", True),
    "accbuf_fugue_p769":   ("bg", "fugue buffer (ROLLUP)", True),
    "acclogic_p1501": ("logic_die", "both (ROLLUP x16)", True),
    "diffdec_p1501":  ("logic_die", "fugue-only (ROLLUP x16)", True),
    "causal_p1501":   ("logic_die", "fugue-only (ROLLUP x16)", True),
    "rope_p1501":     ("logic_die", "fugue RoPE ablation only", False),
    "recip_p699":     ("logic_die", "softmax leaf, inside array", False),
    "sfmpe_p699":     ("logic_die", "softmax PE macro, inside array", False),
    "sfmarray_attacc_p769": ("logic_die", "attacc integrated array (ROLLUP)", True),
    "sfmarray_fugue_p769":  ("logic_die", "fugue integrated array (ROLLUP)", True),
    "kvtlb_p1501":       ("hbm_ctrl", "fugue TLB alone, reference", False),
    "ctrl_attacc_p1501": ("hbm_ctrl", "attacc (ROLLUP)", True),
    "ctrl_fugue_p1501":  ("hbm_ctrl", "fugue (ROLLUP)", True),
}


def main():
    rows = []
    for tag, top in collect.ORDER:
        if top is None:
            continue
        r = collect.parse(tag, top)
        if r is None:
            continue
        level, config, roll = META.get(tag, ("?", "?", False))
        rows.append(dict(tag=tag, top=top, level=level, config=config,
                         in_rollup=roll, period_ps=r["period"],
                         f_ghz=round(1000.0 / r["period"], 3),
                         area_um2=r["area"], slack_ps=r["slack"],
                         violations=r["viol"], power_mw=r["p_mw"]))
    with open(os.path.join(HERE, "components.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    a = {r["tag"]: r["area_um2"] for r in rows}
    N_GEMV, N_BG, N_CH, DRAM_X = 1024, 256, 16, 10.0
    bank = (N_GEMV * a["gemv_flop_p1501"], N_GEMV * a["gemv_flop_p769"])
    bg = (N_BG * (a["accbg_attacc_p1501"] + a["accbuf_attacc_p1501"]),
          N_BG * (a["accbg_fugue_p769"] + a["accbuf_fugue_p769"]))
    die = (a["sfmarray_attacc_p769"] + N_CH * a["acclogic_p1501"],
           a["sfmarray_fugue_p769"] + N_CH * (a["acclogic_p1501"]
           + a["diffdec_p1501"] + a["causal_p1501"]))
    ctl = (a["ctrl_attacc_p1501"], a["ctrl_fugue_p1501"])
    out = []
    for view, fb in (("asap7_raw", 1.0), ("dram_equivalent", DRAM_X)):
        lv = {"bank": (fb * bank[0], fb * bank[1]),
              "bank_group": (fb * bg[0], fb * bg[1]),
              "logic_die": die, "hbm_controller": ctl}
        tot = tuple(sum(x[i] for x in lv.values()) for i in (0, 1))
        lv["stack_total"] = tot
        for name, (x, y) in lv.items():
            out.append(dict(view=view, level=name,
                            attacc_um2=round(x, 1), fugue_um2=round(y, 1),
                            delta_pct=round(100 * (y - x) / x, 2)))
    with open(os.path.join(HERE, "rollup.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(out[0].keys()))
        w.writeheader()
        w.writerows(out)
    print(f"wrote {len(rows)} component rows, {len(out)} rollup rows")


if __name__ == "__main__":
    main()
