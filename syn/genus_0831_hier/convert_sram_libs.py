#!/usr/bin/env python3
"""Convert ASAP7 srambank liberty views from ns/pF to ps/fF.

The stock asap7_sram_0p0 .lib files declare time_unit 1ns and
capacitive_load_unit (1,pf) while the ASAP7 standard-cell NLDMs use 1ps/1fF;
reading both into one Genus session mis-scales the SRAM arcs by 1000x
(observed: a 71 ps clk->dataout arc timed as 71 ns).  ns->ps and pF->fF are
both exactly x1000, and liberty internal-power values are energy tied to the
cap unit, so the conversion is: scale every number inside index_*()/values()
tables and every time/cap-typed scalar attribute by 1000, swap the two unit
declarations, and leave area / voltages / thresholds / leakage (which has its
own absolute unit) untouched.
"""
import os
import re
import sys

SRC = "/data2/tools-additional/pdk/asap7/asap7_sram_0p0/generated/LIB"
LEF = "/data2/tools-additional/pdk/asap7/asap7_sram_0p0/generated/LEF"
DST = os.path.join(os.path.dirname(os.path.abspath(__file__)), "libs_ps")
MACROS = ["srambank_64x4x16_6t122", "srambank_64x4x32_6t122",
          "srambank_64x4x80_6t122", "srambank_256x4x32_6t122",
          "srambank_256x4x64_6t122", "srambank_256x4x80_6t122"]

SCALAR_ATTRS = re.compile(
    r"^(\s*(?:capacitance|rise_capacitance|fall_capacitance|max_capacitance|"
    r"min_capacitance|max_transition|min_period|min_pulse_width_high|"
    r"min_pulse_width_low)\s*:\s*)([0-9.eE+-]+)(\s*;)")
NUM = re.compile(r"[0-9]*\.?[0-9]+(?:[eE][+-]?[0-9]+)?")


def scale_numbers(text):
    """Scale a numeric block ns/pF -> ps/fF, but only if it is actually
    ns/pF-scale: the stock libs MIX scales internally (dataout delay tables
    are already ps/fF-valued while setup/hold tables are ns-valued), so a
    block whose maximum magnitude is >= 5 is taken as already-converted."""
    nums = [float(m) for m in NUM.findall(text)]
    if not nums or max(nums) >= 5.0:
        return text
    return NUM.sub(lambda m: repr(float(m.group(0)) * 1000.0), text)


def lef_area(name):
    """Macro area from the LEF SIZE statement (the .lib declares area:0)."""
    txt = open(os.path.join(LEF, name + ".lef")).read()
    m = re.search(r"SIZE\s+([\d.]+)\s+BY\s+([\d.]+)", txt)
    return float(m.group(1)) * float(m.group(2))


def convert(src, dst):
    area = lef_area(os.path.basename(src)[:-4])
    out = []
    in_values = False
    for line in open(src):
        if re.match(r"\s*area\s*:\s*0\s*;", line):
            out.append(line.replace(": 0", f": {area}"))
            continue
        if re.search(r'time_unit\s*:', line):
            out.append(re.sub(r'"1ns"', '"1ps"', line))
            continue
        if re.search(r'capacitive_load_unit', line):
            out.append(re.sub(r"\(\s*1\s*,\s*pf\s*\)", "(1,ff)", line))
            continue
        m = SCALAR_ATTRS.match(line)
        if m:
            v = float(m.group(2))
            if v < 5.0:
                v *= 1000.0
            out.append(f"{m.group(1)}{v}{m.group(3)}\n")
            continue
        if re.match(r"\s*index_[123]\s*\(", line):
            head, _, tail = line.partition("(")
            body, _, rest = tail.rpartition(")")
            out.append(head + "(" + scale_numbers(body) + ")" + rest)
            continue
        if re.match(r"\s*values\s*\(", line):
            in_values = True
        if in_values:
            head = ""
            body = line
            if "values" in line:
                head, _, body = line.partition("(")
                head += "("
            out.append(head + scale_numbers(body))
            if ");" in line:
                in_values = False
            continue
        out.append(line)
    open(dst, "w").write("".join(out))


def main():
    os.makedirs(DST, exist_ok=True)
    for m in MACROS:
        convert(os.path.join(SRC, m + ".lib"), os.path.join(DST, m + ".lib"))
        print("converted", m)


if __name__ == "__main__":
    main()
