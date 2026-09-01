#!/usr/bin/env python3
"""Collect the genus_0831_hier matrix into SUMMARY.md (timing + area) and
roll the levels up with the Hardware_Overhead_Breakdown counts."""
import glob
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))

ORDER = [
    ("-- leaf macros (tight clock) --", None),
    ("fp16_mult_p700", "fp16_mult"), ("fp16_add_p700", "fp16_add"),
    ("fp16_mult_p1350", "fp16_mult"), ("fp16_add_p1350", "fp16_add"),
    ("fp32_add_p630", "fp32_add"), ("fp32_mul_p630", "fp32_mul"),
    ("bf16_mult_p1350", "bf16_mult"), ("bf16_add_p1350", "bf16_add"),
    ("-- bank --", None),
    ("gemv_attacc_p1501", "gemv_unit"), ("gemv_fugue_p769", "gemv_unit"),
    ("gemv_flop_p1501", "gemv_unit"),
    ("dbuf_p1501", "dbuf_16x256"), ("dbuf_p769", "dbuf_16x256"),
    ("-- bank group --", None),
    ("accbg_attacc_p1501", "accumulator_bg"), ("accbg_fugue_p769", "accumulator_bg"),
    ("accbuf_attacc_p1501", "accum_buffer_bg_attacc"),
    ("accbuf_fugue_p769", "accum_buffer_bg_fugue"),
    ("-- logic die --", None),
    ("acclogic_p1501", "accumulator_logic"),
    ("diffdec_p1501", "diff_decoder_channel_dc_top"),
    ("causal_p1501", "causal_comparator"),
    ("rope_p1501", "rotate_q_bf16"),
    ("recip_p699", "fp32_recip"), ("sfmpe_p699", "softmax_pe"),
    ("sfmarray_attacc_p769", "sfm_array_attacc"),
    ("sfmarray_fugue_p769", "sfm_array_fugue"),
    ("-- HBM controller --", None),
    ("kvtlb_p1501", "kv_tlb_top"),
    ("ctrl_attacc_p1501", "attacc_hbm_ctrl_top"),
    ("ctrl_fugue_p1501", "fugue_hbm_ctrl_top"),
]


def parse(tag, top):
    rep = os.path.join(HERE, tag)
    try:
        qor = open(os.path.join(rep, f"{top}_qor.rpt")).read()
        area = open(os.path.join(rep, f"{top}_area.rpt")).read()
        power = open(os.path.join(rep, f"{top}_power.rpt")).read()
    except FileNotFoundError:
        return None
    out = {}
    m = re.search(r"clk\s+([\d.]+)\s*$", qor, re.M)
    m = re.search(r"(?:clk|vclk)\s+([\d.]+)", qor)
    out["period"] = float(m.group(1)) if m else float("nan")
    m = re.search(r"(?:clk|vclk)\s+(-?[\d.]+)\s+(-?[\d.]+)\s+(\d+)", qor)
    out["slack"] = float(m.group(1)) if m else float("nan")
    out["viol"] = int(m.group(3)) if m else -1
    m = re.search(rf"^{re.escape(top)}\s+\S*\s*\d+\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)",
                  area, re.M)
    out["area"] = float(m.group(3)) if m else float("nan")
    m = re.search(r"Subtotal\s+([\deE.+-]+)\s+([\deE.+-]+)\s+([\deE.+-]+)\s+([\deE.+-]+)",
                  power)
    out["p_mw"] = float(m.group(4)) * 1e3 if m else float("nan")
    return out


def main():
    rows = {}
    lines = ["# genus_0831_hier — Genus/ASAP7 leaf-as-macro matrix", "",
             "| tag | top | period ps | area um^2 | slack ps | viol | P mW |",
             "|---|---|---:|---:|---:|---:|---:|"]
    for tag, top in ORDER:
        if top is None:
            lines.append(f"| **{tag}** | | | | | | |")
            continue
        r = parse(tag, top)
        if r is None:
            lines.append(f"| {tag} | {top} | — | MISSING | | | |")
            continue
        rows[tag] = r
        lines.append(
            f"| {tag} | {top} | {r['period']:.1f} | {r['area']:.1f} "
            f"| {r['slack']:+.2f} | {r['viol']} | {r['p_mw']:.2f} |")

    # roll-up per Hardware_Overhead_Breakdown: N_gemv=2048, N_bg=256, N_ch=16
    def a(t):
        return rows[t]["area"] if t in rows else float("nan")

    # N_GEMV = 1024: ruling chenyi9 2026-09-01 — AttAcc Fig. 9(b) shares
    # "2 GEMV units" between a bank PAIR (1/bank effective); with 1024 the
    # x10 DRAM-equivalent bank+BG total reproduces the paper's 13.12 mm2/die
    # x 8 dies almost exactly.
    N_GEMV, N_BG, N_CH = 1024, 256, 16
    DRAM_X = 10.0   # DRAM process ~10x less dense than logic (AttAcc Sec 4.1)
    bank_att = N_GEMV * a("gemv_attacc_p1501")
    bank_fug = N_GEMV * a("gemv_fugue_p769")
    bg_att = N_BG * (a("accbg_attacc_p1501") + a("accbuf_attacc_p1501"))
    bg_fug = N_BG * (a("accbg_fugue_p769") + a("accbuf_fugue_p769"))
    die_att = a("sfmarray_attacc_p769") + N_CH * a("acclogic_p1501")
    die_fug = (a("sfmarray_fugue_p769") + N_CH * (a("acclogic_p1501")
               + a("diffdec_p1501") + a("causal_p1501")))
    die_fug_rope = die_fug + a("rope_p1501")
    ctl_att = a("ctrl_attacc_p1501")
    ctl_fug = a("ctrl_fugue_p1501")
    tot_att = bank_att + bg_att + die_att + ctl_att
    tot_fug = bank_fug + bg_fug + die_fug + ctl_fug

    lines += ["", "## Roll-up (N_gemv=1024, N_bg=256, N_ch=16) — ASAP7 logic-process areas", "",
              "| Level | AttAcc um^2 | Fugue um^2 | delta |",
              "|---|---:|---:|---:|"]
    for name, x, y in (("Bank", bank_att, bank_fug),
                       ("Bank group", bg_att, bg_fug),
                       ("Logic die", die_att, die_fug),
                       ("HBM controller", ctl_att, ctl_fug),
                       ("Stack total", tot_att, tot_fug)):
        lines.append(f"| {name} | {x:,.0f} | {y:,.0f} "
                     f"| {100*(y-x)/x if x else 0:+.2f}% |")
    lines.append(f"| Logic die (+RoPE ablation) | | {die_fug_rope:,.0f} | |")

    lines += ["", "## Roll-up, DRAM-process equivalent (bank/BG x10; die & ctrl on the logic die x1)", "",
              "| Level | AttAcc um^2 | Fugue um^2 | delta |",
              "|---|---:|---:|---:|"]
    for name, x, y in (("Bank", DRAM_X*bank_att, DRAM_X*bank_fug),
                       ("Bank group", DRAM_X*bg_att, DRAM_X*bg_fug),
                       ("Logic die", die_att, die_fug),
                       ("HBM controller", ctl_att, ctl_fug),
                       ("Stack total", DRAM_X*(bank_att+bg_att)+die_att+ctl_att,
                                        DRAM_X*(bank_fug+bg_fug)+die_fug+ctl_fug)):
        lines.append(f"| {name} | {x:,.0f} | {y:,.0f} "
                     f"| {100*(y-x)/x if x else 0:+.2f}% |")
    lines.append("")
    lines.append("Cross-check: AttAcc DRAM-side total "
                 f"{(DRAM_X*(bank_att+bg_att))/8/1e6:.2f} mm^2/die vs the "
                 "paper's 13.12 mm^2/die (Sec 7.7).")
    open(os.path.join(HERE, "SUMMARY.md"), "w").write("\n".join(lines) + "\n")
    print("\n".join(lines))


if __name__ == "__main__":
    main()
