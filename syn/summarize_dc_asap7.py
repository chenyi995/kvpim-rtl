#!/usr/bin/env python3
"""Summarize completed ASAP7/DC reports without third-party packages."""
import pathlib
import re
import sys


def first(pattern: str, text: str) -> str:
    match = re.search(pattern, text, re.MULTILINE)
    return match.group(1) if match else "N/A"


def main() -> int:
    root = pathlib.Path(sys.argv[1] if len(sys.argv) == 2 else "dc_asap7")
    rows = []
    for report in sorted(root.glob("*/*_qor.rpt")):
        tag = report.parent.name
        top = report.name[:-len("_qor.rpt")]
        qor = report.read_text(errors="replace")
        area_path = report.with_name(f"{top}_area.rpt")
        power_path = report.with_name(f"{top}_power.rpt")
        area = area_path.read_text(errors="replace") if area_path.exists() else ""
        power = power_path.read_text(errors="replace") if power_path.exists() else ""
        # Skip incomplete reports emitted after a failed elaborate/link.
        if "Current design is not defined" in qor or "Total cell area:" not in area:
            continue
        rows.append((
            tag,
            top,
            first(r"Total cell area:\s+([0-9.]+)", area),
            first(r"Total Dynamic Power\s+=\s+([0-9.]+\s+[munp]?W)", power),
            first(r"Cell Leakage Power\s+=\s+([0-9.]+\s+[munp]?W)", power),
            first(r"Critical Path Slack:\s+(-?[0-9.]+)", qor),
        ))
    print("| Tag (period encoded in ns) | Top | Cell area (um^2) | Dynamic power | Leakage | Setup slack (ps) |")
    print("|---|---|---:|---:|---:|---:|")
    for row in rows:
        print("| " + " | ".join(row) + " |")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
