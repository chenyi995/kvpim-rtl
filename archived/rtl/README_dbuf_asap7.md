# dbuf_16x256_asap7.sv — GEMV 双缓冲的 SRAM 宏实现（2026-09-02 归档）

原路径 `rtl/dbuf_16x256_asap7.sv`。bank buffer 裁决（2026-09-01）选用 flop
阵列 `rtl/dbuf_16x256.sv` 后，宏版只剩两个用途，均在归档流程内：

- `archived/syn/genus_0831_hier_reference/run_reference.sh` 的 `gemv_attacc_p1501`
  / `gemv_fugue_p769`（AttAcc 原文 macro-buffer 配置，13.12 mm²/die 对表锚点）
  与 `dbuf_p1501` / `dbuf_p769`。
- 功能验证（VCS，仓库根目录执行）：
  `vcs -full64 -sverilog rtl/fp16_add.sv rtl/fp16_mult.sv testbench/asap7_srambank_models.sv archived/rtl/dbuf_16x256_asap7.sv rtl/gemv_unit.sv testbench/tb_gemv_unit_0830_02.sv`

文件内含 commit `a17696d` 的 SRAM 出口流水寄存器修复（latch 型宏低相位出数，
出口打一拍，读延迟 2 拍），flop 版 `rtl/dbuf_16x256.sv` 的第二级读寄存器即为
与之对齐的口径。
