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
        p["i_cp"] = math.ceil(N / (p["f_ghz"] * TCK_NS))
        p["i_pw"] = FLOOR * (E_COL_PJ + N * E_OP_SIM_PJ * p["e_hat"]) / E_6_PJ
        p["i_eff"] = max(FLOOR, p["i_cp"], p["i_pw"])

    for p in allpts:
        if "e_hat" not in p:
            p["e_hat"] = p["e_pj"] / e_ref
            p["e_op_cal"] = E_OP_SIM_PJ * p["e_hat"]
            p["i_cp"] = math.ceil(N / (p["f_ghz"] * TCK_NS))
            p["i_pw"] = FLOOR * (E_COL_PJ + N * E_OP_SIM_PJ * p["e_hat"]) / E_6_PJ
            p["i_eff"] = max(FLOOR, p["i_cp"], p["i_pw"])
    with open(os.path.join(HERE, "data_n8.csv"), "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=list(allpts[0].keys()))
        w.writeheader()
        w.writerows(allpts)

    best = min(pts, key=lambda p: p["i_eff"])
    # the knee: the slowest point whose effective interval is power-limited
    knee = next(p for p in pts if p["i_pw"] >= p["i_cp"])

    f = [p["f_ghz"] for p in pts]
    fig, (ax1, ax2) = plt.subplots(
        2, 1, figsize=(6.4, 6.4), sharex=True,
        gridspec_kw=dict(height_ratios=[1, 1.6], hspace=0.12))
    for ax in (ax1, ax2):
        ax.grid(True, color="#e8e6dc", linewidth=0.8)
        ax.set_axisbelow(True)
        for s in ("top", "right"):
            ax.spines[s].set_visible(False)
        for s in ("left", "bottom"):
            ax.spines[s].set_color(MUTED)
        ax.tick_params(colors=INK, labelsize=9)

    # -- panel A: calibrated per-op energy ------------------------------
    ax1.plot(f, [p["e_op_cal"] for p in pts], "-o", color=C_COMPUTE,
             linewidth=2, markersize=4.5)
    ax1.set_ylabel("PE energy per MAC+SRAM op\n(pJ, calibrated)", fontsize=9)
    ax1.annotate(f"anchor: {E_OP_SIM_PJ:.2f} pJ @ 0.67 GHz\n(AttAcc stock PE)",
                 xy=(0.667, E_OP_SIM_PJ), xytext=(1.05, 5.45), fontsize=8,
                 color=INK, arrowprops=dict(arrowstyle="-", color=MUTED, lw=1))
    ax1.set_ylim(3.4, 6.0)

    # -- panel B: command interval --------------------------------------
    ax2.step(f, [p["i_cp"] for p in pts], where="post", color=C_COMPUTE,
             linewidth=2, label=f"compute-limited  ⌈n/(f·tCK)⌉")
    ax2.plot(f, [p["i_pw"] for p in pts], "-o", color=C_POWER, linewidth=2,
             markersize=4.5, label="power-limited  6·E_cmd(f)/E₆")
    ax2.plot(f, [p["i_eff"] for p in pts], color=C_EFF, linewidth=3.2,
             alpha=0.55, label="effective  I(f) = max(·)", zorder=1)
    ax2.axhline(FLOOR, color=MUTED, linewidth=1.2, linestyle=(0, (4, 3)))
    ax2.text(0.33, FLOOR - 1.3, "DRAM floor nCCDAB = 6", fontsize=8,
             color=MUTED, ha="left")

    ax2.plot([knee["f_ghz"]], [knee["i_eff"]], "o", color=INK, markersize=8,
             markerfacecolor="white", markeredgewidth=2, zorder=5)
    ax2.annotate(
        f"balance ≈ {knee['f_ghz']:.1f} GHz, {knee['i_eff']:.1f} tCK\n"
        f"(beyond: pinned by the power budget)",
        xy=(knee["f_ghz"], knee["i_eff"]), xytext=(1.7, 13.5), fontsize=9,
        color=INK, arrowprops=dict(arrowstyle="->", color=INK, lw=1.2))
    ax2.annotate(
        f"AttAcc stock PE: 0.67 GHz → {math.ceil(N/(0.667*TCK_NS))} tCK",
        xy=(0.667, math.ceil(N / (0.667 * TCK_NS))), xytext=(0.85, 22),
        fontsize=8, color=INK,
        arrowprops=dict(arrowstyle="->", color=MUTED, lw=1))

    ax2.set_xlabel("PE clock frequency (GHz, ASAP7 TT achieved)", fontsize=10)
    ax2.set_ylabel(f"column-command interval (tCK)\nn = {N} resident queries",
                   fontsize=9)
    ax2.set_ylim(0, 28)
    ax2.set_xlim(0.3, 3.15)
    ax2.legend(fontsize=8.5, loc="upper right", frameon=False)

    fig.suptitle("In-bank MQ PE: frequency vs. power-constrained command "
                 "interval (no SRAM growth, n=8)", fontsize=10.5, y=0.945)
    for ext in ("png", "pdf"):
        fig.savefig(os.path.join(HERE, f"balance_n8.{ext}"),
                    dpi=200, bbox_inches="tight", facecolor="white")
    print(f"balance: f={knee['f_ghz']:.3f} GHz  I={knee['i_eff']:.2f} tCK  "
          f"(min over sweep: {best['i_eff']:.2f} @ {best['f_ghz']:.2f} GHz)")


if __name__ == "__main__":
    main()
