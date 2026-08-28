# xinyao_0828 ASAP7 synthesis snapshot (rough / debug baseline)

This directory records the 2026-08-28 ASAP7 DC matrix after adding the
single-buffer GEMV SRAM wrapper, the 512-KiB softmax-buffer wrapper, TLB and
diff-decoder integration.  It is an intermediate debugging baseline, **not a
sign-off or final PPA result**.

## Matrix

All logic-die/Fugue auxiliary blocks use a 0.769-ns clock period; the AttAcc
bank PE uses 1.500 ns.  `SUMMARY.md` is generated from the individual reports.
The committed artifacts are QoR, area, reference, timing, power and shell logs;
generated mapped Verilog, SDC and `WORK/` databases are deliberately omitted.

## Known invalid/incomplete points

1. `softmax_buffer_sram` fails DC elaboration: DC interprets a part-select on
   the packed two-dimensional `score_wr_data`/`exp_wr_data` ports as an index
   outside `[15:0]` (`ELAB-298`).  It remains an unresolved black box with zero
   area.  Consequently the standalone Fugue softmax-buffer result (`0 um^2`),
   and all logic-die totals that include it, are invalid/incomplete.
2. The intended 512-KiB softmax implementation is 64 instances of
   `srambank_256x4x64_6t122`, whose expected macro-only area is approximately
   `151031.07 um^2`; this is absent from the current top-level totals.
3. GEMV SRAM macros are linked in the SRAM logic-die profiles (eight logical
   buffers total, `31890.31 um^2`).  However each 512-B logical buffer uses
   sixteen 256x16 macros and therefore allocates 8 KiB physically: a 16x depth
   over-provision that needs a more suitable macro/banking plan.
4. The isolated `bankpe` profiles still select the portable flop-buffer source;
   they do not measure the SRAM GEMV implementation.
5. Timing is not closed: AttAcc logic die is -481.66 ps; Fugue2/Fugue logic die
   are -3598.79/-3591.14 ps at 0.769 ns.  Only the 1.500-ns AttAcc PE and the
   isolated TLB meet the current setup target.

## ASAP7 SRAM Liberty compatibility patch

The upstream SRAM Liberty files reference `default_VDD_VSS_output` without
defining it, which causes Synopsys Library Compiler `LBDB-235`.  The local
ASAP7 SRAM worktree adds the standard 0/0.7-V `output_voltage` group to the two
used macro views before `compile_asap7_sram_libs.tcl` creates their `.db` files.
This is a local compatibility patch pending upstream/toolflow validation.
