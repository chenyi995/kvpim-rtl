#!/usr/bin/env python3
"""Parse the hierarchy-preserving Genus area reports and emit a per-block
stacked-area breakdown (baseline blocks vs the 3 Fugue additions).

Reads:
  build_attacc_hier/reports_attacc/attacc_logic_die_area_hier.rpt
  build_fugue_hier/reports_fugue/fugue_logic_die_area_hier.rpt
Emits a markdown table on stdout.
"""
import re, sys, os

HERE = os.path.dirname(os.path.abspath(__file__))
ATT = os.path.join(HERE, "build_attacc_hier/reports_attacc/attacc_logic_die_area_hier.rpt")
FUG = os.path.join(HERE, "build_fugue_hier/reports_fugue/fugue_logic_die_area_hier.rpt")

# a data row: <indent>Instance  Module  Cell-Count  Cell-Area  Net-Area  Total-Area
ROW = re.compile(r'^(\s*)(\S+)\s+(\S+)\s+(\d+)\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)\s*$')

def parse(path):
    """Return {indent-1 instance name -> (cellcount, total_area)} for the
    top module's direct children, plus the top total."""
    top = None
    children = {}   # name -> [cellcount, total_area]  (sum g_gemv[*] together)
    with open(path) as f:
        for line in f:
            m = ROW.match(line)
            if not m:
                continue
            indent, inst, mod, cc, cell, net, tot = m.groups()
            depth = len(indent)
            cc = int(cc); tot = float(tot)
            if depth == 0:            # top module line
                top = (cc, tot)
            elif depth == 2:          # direct children of the top
                # collapse the 4 GEMV instances into one bucket
                key = "g_gemv[*].u_gemv" if inst.startswith("g_gemv") else inst
                if key not in children:
                    children[key] = [0, 0.0]
                children[key][0] += cc
                children[key][1] += tot
    return top, children

att_top, att = parse(ATT)
fug_top, fug = parse(FUG)

# canonical ordering
ORDER = ["g_gemv[*].u_gemv", "u_sfm", "u_acc", "u_ctrl", "u_tlb", "u_rotate", "u_diff"]
LABEL = {
    "g_gemv[*].u_gemv": "4x gemv_unit (GEMV MAC)",
    "u_sfm":            "softmax_unit (FP32)",
    "u_acc":            "accumulator",
    "u_ctrl":           "attacc_controller",
    "u_tlb":            "tlb  [Fugue-new]",
    "u_rotate":         "rotate_q_unit  [Fugue-new]",
    "u_diff":           "diff_decoder  [Fugue-new]",
}

def area(d, k):   return d.get(k, [0, 0.0])[1]
def cells(d, k):  return d.get(k, [0, 0])[0]

print("| Block | AttAcc area (um^2) | Fugue area (um^2) | delta (um^2) |")
print("|---|---:|---:|---:|")
sum_child_att = sum_child_fug = 0.0
for k in ORDER:
    a = area(att, k); f = area(fug, k)
    sum_child_att += a; sum_child_fug += f
    d = f - a
    astr = f"{a:,.0f}" if a else "--"
    print(f"| {LABEL[k]} | {astr} | {f:,.0f} | {d:+,.0f} |")

# top-level glue = top total - sum of direct children
glue_att = att_top[1] - sum_child_att
glue_fug = fug_top[1] - sum_child_fug
print(f"| top-level glue/routing | {glue_att:,.0f} | {glue_fug:,.0f} | {glue_fug-glue_att:+,.0f} |")
print(f"| **TOTAL (unflattened)** | **{att_top[1]:,.0f}** | **{fug_top[1]:,.0f}** | **{fug_top[1]-att_top[1]:+,.0f}** |")

add = area(fug,"u_tlb") + area(fug,"u_rotate") + area(fug,"u_diff")
print()
print(f"3 Fugue additions (tlb+rotate+diff) = {add:,.0f} um^2 "
      f"({100*add/fug_top[1]:.1f}% of Fugue area)")
print(f"  - rotate_q_unit : {area(fug,'u_rotate'):,.0f}  ({cells(fug,'u_rotate'):,} cells)")
print(f"  - tlb           : {area(fug,'u_tlb'):,.0f}  ({cells(fug,'u_tlb'):,} cells)")
print(f"  - diff_decoder  : {area(fug,'u_diff'):,.0f}  ({cells(fug,'u_diff'):,} cells)")
print(f"total top delta   = {fug_top[1]-att_top[1]:+,.0f} um^2 "
      f"({100*(fug_top[1]-att_top[1])/att_top[1]:+.1f}%)")
