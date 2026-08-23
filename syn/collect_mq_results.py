#!/usr/bin/env python3
"""Collect the MQ microarchitecture sweep into one table.

Parses build_<tag>/reports_<tag>/<top>_{area,qor,power}.rpt for every tag given
(default: the whole MQ sweep plus the pre-existing attacc/fugue2 anchors) and
prints total area, worst slack, and total power, with deltas vs the matching
baseline (attacc_bank_pe for bank-PE rows, attacc_logic_die for die rows).
"""

import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))

RUNS = [
    # (tag, top, family, label)
    ("attacc",             "attacc_logic_die", "die",    "AttAcc die @500MHz (existing)"),
    ("fugue2",             "fugue2_logic_die", "die",    "Fugue2 die (+TLB+diff) @500MHz (existing)"),
    ("fuguemq_a8_p20",     "fugue_mq_a8",      "die",    "Fugue-MQ die AGENTS=8 @500MHz"),
    ("fuguemq_a16_p20",    "fugue_mq_a16",     "die",    "Fugue-MQ die AGENTS=16 @500MHz"),
    ("fuguemq_a32_p20",    "fugue_mq_a32",     "die",    "Fugue-MQ die AGENTS=32 @500MHz"),
    ("bankpe_attacc_p15",  "attacc_bank_pe",   "bankpe", "AttAcc bank PE @667MHz"),
    ("bankpe_mq8x1_p15",   "mq_pe_8x1_d16",    "bankpe", "MQ PE (8,1) buf x1 @667MHz"),
    ("bankpe_mq16x2_p15",  "mq_pe_16x2_d32",   "bankpe", "MQ PE (16,2) buf x2 @667MHz"),
    ("bankpe_mq16x2_p10",  "mq_pe_16x2_d32",   "bankpe", "MQ PE (16,2) buf x2 @1.0GHz"),
    ("bankpe_mq16x2_p077", "mq_pe_16x2_d32",   "bankpe", "MQ PE (16,2) buf x2 @1.3GHz"),
    ("bankpe_mq32x4_p10",  "mq_pe_32x4_d64",   "bankpe", "MQ PE (32,4) buf x4 @1.0GHz"),
    ("bankpe_mq32x4_p077", "mq_pe_32x4_d64",   "bankpe", "MQ PE (32,4) buf x4 @1.3GHz"),
]


def report(tag, top, kind):
    return os.path.join(HERE, "build_" + tag, "reports_" + tag,
                        "{}_{}.rpt".format(top, kind))


def total_area(tag, top):
    path = report(tag, top, "area")
    if not os.path.exists(path):
        return None
    with open(path) as handle:
        for line in handle:
            fields = line.split()
            if fields and fields[0] == top:
                return float(fields[-1])
    return None


def worst_slack(tag, top):
    path = report(tag, top, "qor")
    if not os.path.exists(path):
        return None
    with open(path) as handle:
        for line in handle:
            if "setup_view" in line:
                match = re.search(r"clk\s+(-?[\d.]+)", line)
                if match:
                    return float(match.group(1))
    return None


def total_power_mw(tag, top):
    path = report(tag, top, "power")
    if not os.path.exists(path):
        return None
    with open(path) as handle:
        for line in handle:
            if line.strip().startswith("Subtotal") or \
               re.match(r"\s*total\b", line, re.IGNORECASE):
                numbers = re.findall(r"[\d.]+e[+-]\d+|[\d.]+", line)
                if len(numbers) >= 4:
                    return float(numbers[3]) * 1e3  # W -> mW
    return None


def main():
    rows = []
    for tag, top, family, label in RUNS:
        rows.append({
            "tag": tag, "family": family, "label": label,
            "area": total_area(tag, top),
            "slack": worst_slack(tag, top),
            "power": total_power_mw(tag, top),
        })
    base = {row["family"]: row["area"] for row in rows
            if row["tag"] in ("attacc", "bankpe_attacc_p15") and row["area"]}
    print("{:<38} {:>12} {:>9} {:>10} {:>9}".format(
        "config", "area um^2", "vs base", "power mW", "slack"))
    for row in rows:
        area = row["area"]
        ratio = ("{:+.1f}%".format(100 * (area / base[row["family"]] - 1))
                 if area and row["family"] in base else "-")
        print("{:<38} {:>12} {:>9} {:>10} {:>9}".format(
            row["label"],
            "{:,.0f}".format(area) if area else "MISSING",
            ratio,
            "{:.1f}".format(row["power"]) if row["power"] else "-",
            "{:.3f}".format(row["slack"]) if row["slack"] is not None else "-"))


if __name__ == "__main__":
    main()
