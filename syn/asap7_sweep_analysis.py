#!/usr/bin/env python3
"""Parse the ASAP7 in-bank PE frequency sweep and find the power/cycle balance.

Model (calibrated to attacc_drampim_822, per the 8/27 discussion):
  * tCK = 0.769 ns; power-constrained preset nCCDAB = 6 tCK.
  * The 6-tCK budget energy is what the ORIGINAL AttAcc op spends per column
    command (simulator ENERGY_TABLE, BA level):
        E_col  = 4.4 pJ/B * 32 B            = 140.8 pJ   (row-buffer read)
        E_op   = 16*0.32 + 32*0.0034        =   5.23 pJ  (PE MAC + SRAM read)
        E_6    = E_col + E_op               = 146.03 pJ
  * A config with n resident queries at PE frequency f spends per command
        E_cmd(f) = E_col + n * E_op * e_hat(f)
    where e_hat(f) = E_rtl(f) / E_rtl(666 MHz) is the SHAPE of the synthesized
    per-cycle energy (Genus TT total power / achieved clock), calibrated so the
    666 MHz point matches the simulator's PE energy (5.23 pJ).
  * Interval (tCK):  I(f) = max(6, ceil(n/(f*tCK)), 6 * E_cmd(f)/E_6)
    - compute term shrinks ~1/f; energy term grows once e_hat(f) turns up
      (bigger drive / LVT+SLVT under timing pressure).  The balance frequency
    minimizes I; beyond it, higher f needs MORE cycles than it saves.
"""
import glob
import math
import os
import re
import sys

TCK_NS = 0.769
FLOOR = 6
E_COL_PJ = 140.8
E_OP_SIM_PJ = 5.2288          # 16*0.32 + 32*0.0034
E_6_PJ = E_COL_PJ + E_OP_SIM_PJ
F_REF_GHZ = 0.666             # AttAcc stock PE clock (calibration anchor)
SYN = os.path.dirname(os.path.abspath(__file__))


def parse_run(bdir, top, tag):
    rep = os.path.join(bdir, f"reports_{tag}")
    out = {}
    try:
        qor = open(os.path.join(rep, f"{top}_qor.rpt")).read()
        area = open(os.path.join(rep, f"{top}_area.rpt")).read()
        power = open(os.path.join(rep, f"{top}_power.rpt")).read()
    except FileNotFoundError:
        return None
    m = re.search(r"TT\.setup_view\s+clk\s+([\d.]+)", qor)
    out["period_ps"] = float(m.group(1))
    m = re.search(r"TT\.setup_view\s+clk\s+(-?[\d.]+)\s+(-?[\d.]+)\s+(\d+)", qor)
    out["slack_ps"] = float(m.group(1))
    m = re.search(r"Leaf Instance Count\s+(\d+)", qor)
    out["insts"] = int(m.group(1))
    m = re.search(rf"^{top}\s+\S+\s+\d+\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)",
                  area, re.M)
    out["area_um2"] = float(m.group(3))
    m = re.search(r"Subtotal\s+([\deE.+-]+)\s+([\deE.+-]+)\s+([\deE.+-]+)\s+([\deE.+-]+)",
                  power)
    out["p_leak_w"] = float(m.group(1))
    out["p_int_w"] = float(m.group(2))
    out["p_sw_w"] = float(m.group(3))
    out["p_total_w"] = float(m.group(4))

    out["f_target_ghz"] = 1000.0 / out["period_ps"]
    ach_ps = out["period_ps"] - min(out["slack_ps"], 0.0)
    out["f_ach_ghz"] = 1000.0 / ach_ps
    out["met"] = out["slack_ps"] >= 0.0
    out["e_pj"] = out["p_total_w"] * 1000.0 / out["f_ach_ghz"]
    return out


def collect(prefix, top):
    rows = []
    for bdir in sorted(glob.glob(os.path.join(SYN, f"build_asap7_{prefix}_*ps"))):
        tag = os.path.basename(bdir).replace("build_asap7_", "")
        r = parse_run(bdir, top, tag)
        if r:
            r["tag"] = tag
            rows.append(r)
    rows.sort(key=lambda r: -r["period_ps"])
    return rows


def interval(n, f_ghz, e_hat):
    i_cp = math.ceil(n / (f_ghz * TCK_NS) - 1e-9)
    e_cmd = E_COL_PJ + n * E_OP_SIM_PJ * e_hat
    i_pw = FLOOR * e_cmd / E_6_PJ
    # a command interval is a whole number of command clocks (same integer-
    # cycle convention as the simulator's mq_interval_cycles)
    return max(FLOOR, i_cp, math.ceil(i_pw)), i_cp, i_pw


def main():
    mq = collect("mq16x2", "mq_pe_16x2_d32")
    base = collect("attaccpe", "attacc_bank_pe")
    if not mq:
        sys.exit("no mq16x2 runs parsed")

    ref = min(mq, key=lambda r: abs(r["f_ach_ghz"] - F_REF_GHZ))
    e_ref = ref["e_pj"]

    print(f"# tCK={TCK_NS} ns, floor={FLOOR} tCK")
    print(f"# budget E_6 = {E_COL_PJ} (col read) + {E_OP_SIM_PJ:.2f} (PE+SRAM) "
          f"= {E_6_PJ:.1f} pJ / 6 tCK")
    print(f"# calibration anchor: E_rtl({ref['f_ach_ghz']:.3f} GHz) = "
          f"{e_ref:.1f} pJ/cyc -> {E_OP_SIM_PJ:.2f} pJ "
          f"(k = 1/{e_ref/E_OP_SIM_PJ:.1f}, tag {ref['tag']})\n")

    for name, rows in (("mq_pe_16x2_d32", mq), ("attacc_bank_pe", base)):
        if not rows:
            continue
        print(f"## {name}")
        print("| period ps | f_tgt GHz | met | f_ach GHz | area um2 | insts |"
              " P mW | leak mW | E pJ/cyc | e_hat |")
        print("|---|---|---|---|---|---|---|---|---|---|")
        for r in rows:
            print(f"| {r['period_ps']:.0f} | {r['f_target_ghz']:.3f} "
                  f"| {'Y' if r['met'] else 'N'} | {r['f_ach_ghz']:.3f} "
                  f"| {r['area_um2']:.0f} | {r['insts']} "
                  f"| {r['p_total_w']*1e3:.2f} | {r['p_leak_w']*1e3:.3f} "
                  f"| {r['e_pj']:.1f} | {r['e_pj']/e_ref:.3f} |")
        print()

    print("## effective interval I (tCK) vs frequency, mq_pe_16x2_d32")
    print("##   I = max(6, ceil(n/(f*tCK)), 6*(E_col + n*E_op*e_hat)/E_6)")
    ns = [1, 4, 8, 16]
    hdr = " | ".join(f"n={n}: I (cp, pw)" for n in ns)
    print(f"| f_ach GHz | e_hat | {hdr} |")
    print("|" + "---|" * (2 + len(ns)))
    best = {n: (None, 1e18) for n in ns}
    for r in mq:
        e_hat = r["e_pj"] / e_ref
        cells = []
        for n in ns:
            i, icp, ipw = interval(n, r["f_ach_ghz"], e_hat)
            cells.append(f"{i:.1f} ({icp}, {ipw:.2f})")
            if i < best[n][1]:
                best[n] = (r, i)
        print(f"| {r['f_ach_ghz']:.3f} | {e_hat:.3f} | " + " | ".join(cells) + " |")
    print()
    for n in ns:
        r, i = best[n]
        thr = n / (i * TCK_NS)
        print(f"balance n={n}: f = {r['f_ach_ghz']:.3f} GHz (tag {r['tag']}), "
              f"I = {i:.2f} tCK, {thr:.3f} MACs/ns per bank "
              f"({thr / (1/(32*TCK_NS)):.1f}x AttAcc-stock n=1 tokens... )")

    # AttAcc-stock reference: n=1, floor-bound at 6 tCK
    print(f"\nreference: AttAcc stock n=1 is floor-bound at {FLOOR} tCK "
          f"(1 MAC / {FLOOR*TCK_NS:.2f} ns per bank)")


if __name__ == "__main__":
    main()
