#!/usr/bin/env python3
"""Fugue ASPLOS'27 figure: in-bank PE frequency vs command interval, n=8.

Reads the ASAP7 sweep raw data (raw_data/<tag>/*.rpt), rebuilds the calibrated
energy model of docs/README_balance_model.md, and renders the balance-point
figure + a CSV of every number on it.  Run from this directory:
    python3 plot_balance.py
"""
import csv
import glob
import math
import os
import re

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

TCK_NS = 0.769
FLOOR = 6
E_COL_PJ = 140.8              # one 32-B row-buffer column read (BA, FGDRAM)
E_OP_SIM_PJ = 5.2288          # one 16-lane MAC + 32-B SRAM read (simulator)
E_6_PJ = E_COL_PJ + E_OP_SIM_PJ
F_REF_GHZ = 0.666             # AttAcc stock PE clock = calibration anchor
N = 8                         # paper configuration: fits the stock 512-B buffer

HERE = os.path.dirname(os.path.abspath(__file__))
TOP = "mq_pe_16x2_d32"

# palette (dataviz reference instance, fixed categorical order)
C_COMPUTE = "#2a78d6"   # slot 1 blue
C_POWER = "#eb6834"     # slot 2 orange
C_EFF = "#1baf7a"       # slot 3 aqua
INK = "#1a1a19"
MUTED = "#8a897f"


def parse_point(d):
    tag = os.path.basename(d)
    qor = open(os.path.join(d, f"{TOP}_qor.rpt")).read()
    power = open(os.path.join(d, f"{TOP}_power.rpt")).read()
    period = float(re.search(r"TT\.setup_view\s+clk\s+([\d.]+)", qor).group(1))
    slack = float(re.search(
        r"TT\.setup_view\s+clk\s+(-?[\d.]+)\s+(-?[\d.]+)\s+\d+", qor).group(1))
    p_total = float(re.search(
        r"Subtotal\s+[\deE.+-]+\s+[\deE.+-]+\s+[\deE.+-]+\s+([\deE.+-]+)",
        power).group(1))
    f_ach = 1000.0 / (period - min(slack, 0.0))
    return dict(tag=tag, period_ps=period, met=slack >= 0, f_ghz=f_ach,
                p_mw=p_total * 1e3, e_pj=p_total * 1000.0 / f_ach)


def main():
    allpts = sorted((parse_point(d) for d in glob.glob(
        os.path.join(HERE, "raw_data", "mq16x2_*ps"))), key=lambda p: p["f_ghz"])
    # the figure carries timing-met points only; the CSV keeps everything
    pts = [p for p in allpts if p["met"]]
    e_ref = min(pts, key=lambda p: abs(p["f_ghz"] - F_REF_GHZ))["e_pj"]

    for p in pts:
        p["e_hat"] = p["e_pj"] / e_ref
        p["e_op_cal"] = E_OP_SIM_PJ * p["e_hat"]
        p["i_cp"] = math.ceil(N / (p["f_ghz"] * TCK_NS) - 1e-9)
        p["i_pw"] = FLOOR * (E_COL_PJ + N * E_OP_SIM_PJ * p["e_hat"]) / E_6_PJ
        # the issued interval is a whole number of command clocks: ceil the
        # power term (the fractional line stays on the plot for readability)
        p["i_eff"] = max(FLOOR, p["i_cp"], math.ceil(p["i_pw"]))

    for p in allpts:
        if "e_hat" not in p:
            p["e_hat"] = p["e_pj"] / e_ref
            p["e_op_cal"] = E_OP_SIM_PJ * p["e_hat"]
            p["i_cp"] = math.ceil(N / (p["f_ghz"] * TCK_NS) - 1e-9)
            p["i_pw"] = FLOOR * (E_COL_PJ + N * E_OP_SIM_PJ * p["e_hat"]) / E_6_PJ
            p["i_eff"] = max(FLOOR, p["i_cp"], math.ceil(p["i_pw"]))
    with open(os.path.join(HERE, "data_n8.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(allpts[0].keys()))
        w.writeheader()
        w.writerows(allpts)

    # balance = the SLOWEST (cheapest) point already at the plateau minimum
    i_min = min(p["i_eff"] for p in pts)
    knee = next(p for p in pts if p["i_eff"] == i_min)
    print(f"balance: f={knee['f_ghz']:.3f} GHz  I={knee['i_eff']:.2f} tCK  "
          f"(exact threshold: f* = {1.0/TCK_NS:.4f} GHz)")

    power_figure(pts)


def power_figure(pts):
    """Main paper figure: per-bank average power vs PE frequency (one axis).

    Power rises with frequency in steps (each step = the command interval
    dropping by one tCK as the PE keeps up with a faster pace); the step that
    would cross the DRAM power budget is forbidden, so the interval pins at
    8 tCK — the balance frequency is where that last admissible step begins:
    f* = 8 MACs / 8 tCK = 1.30 GHz.
    """
    budget_mw = E_6_PJ / (FLOOR * TCK_NS)          # 146.03 pJ / 4.614 ns
    fgrid = [0.4 + 0.002 * i for i in range(int((3.05 - 0.4) / 0.002) + 1)]
    fm = [p["f_ghz"] for p in pts]
    em = [p["e_hat"] for p in pts]

    def ehat(x):                                    # linear interp, clamped
        if x <= fm[0]:
            return em[0]
        for a, b, ea, eb in zip(fm, fm[1:], em, em[1:]):
            if x <= b:
                return ea + (eb - ea) * (x - a) / (b - a)
        return em[-1]

    def pavg(x, icp):                               # mW per bank at pace icp
        return (E_COL_PJ + N * E_OP_SIM_PJ * ehat(x)) / (icp * TCK_NS) * 1e-3 * 1e3

    unc, act = [], []
    for x in fgrid:
        icp = max(FLOOR, math.ceil(N / (x * TCK_NS) - 1e-12))
        ipw = math.ceil(FLOOR * (E_COL_PJ + N * E_OP_SIM_PJ * ehat(x)) / E_6_PJ)
        unc.append(pavg(x, icp))
        act.append(pavg(x, max(icp, ipw)))          # interval pinned at 8 tCK

    f_bal = 1.0 / TCK_NS                            # 8 MACs in 8 tCK

    fig, ax = plt.subplots(figsize=(6.0, 4.0))
    ax.grid(True, color="#e8e6dc", linewidth=0.8)
    ax.set_axisbelow(True)
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)
    for s in ("left", "bottom"):
        ax.spines[s].set_color(MUTED)
    ax.tick_params(colors=INK, labelsize=9)

    ax.axhline(budget_mw, color="#e34948", linewidth=1.6,
               linestyle=(0, (5, 3)))
    ax.text(0.42, budget_mw + 0.7, "DRAM power budget: 31.7 mW/bank",
            fontsize=8.5, color="#e34948")

    ax.plot(fgrid, unc, color=C_COMPUTE, linewidth=2, linestyle=(0, (4, 2)),
            label="if issued at the PE's pace  (interval = ⌈n/(f·tCK)⌉)")
    ax.plot(fgrid, act, color=C_POWER, linewidth=2.6, alpha=0.9,
            label="actual: interval pinned at 8 tCK past f*")

    ax.axvline(f_bal, color=MUTED, linewidth=1, linestyle=(0, (2, 2)))
    ax.plot([f_bal], [pavg(f_bal, 8)], "o", color=INK, markersize=8,
            markerfacecolor="white", markeredgewidth=2, zorder=5)
    ax.annotate("balance  f* = 1.30 GHz\n"
                "(8 MACs in 8 tCK, 29.4 mW)",
                xy=(f_bal, pavg(f_bal, 8)), xytext=(1.52, 22.5), fontsize=9,
                color=INK, arrowprops=dict(arrowstyle="->", color=INK, lw=1.2))
    ax.annotate("next step (7 tCK) would\ncross the budget → forbidden",
                xy=(1.55, pavg(1.55, 7)), xytext=(1.9, 36.5), fontsize=8.5,
                color=INK, arrowprops=dict(arrowstyle="->", color=MUTED, lw=1))
    ax.annotate("AttAcc stock\n0.67 GHz, 16 tCK",
                xy=(0.667, pavg(0.667, 16)), xytext=(0.45, 21), fontsize=8.5,
                color=INK, arrowprops=dict(arrowstyle="->", color=MUTED, lw=1))

    ax.set_xlabel("PE clock frequency (GHz)", fontsize=10)
    ax.set_ylabel("per-bank average power (mW)\ncolumn read + n=8 MAC+SRAM,"
                  " calibrated", fontsize=9)
    ax.set_xlim(0.4, 3.05)
    ax.set_ylim(8, 42)
    ax.legend(fontsize=8.5, loc="lower right", frameon=False)
    fig.suptitle("Power rises with PE frequency until the DRAM budget "
                 "pins the pace (n=8)", fontsize=10.5, y=0.97)
    for ext in ("png", "pdf"):
        fig.savefig(os.path.join(HERE, f"power_vs_freq_n8.{ext}"),
                    dpi=200, bbox_inches="tight", facecolor="white")
    print(f"power figure: budget={budget_mw:.2f} mW, "
          f"f*={f_bal:.4f} GHz, P(f*)={pavg(f_bal, 8):.1f} mW")


if __name__ == "__main__":
    main()
