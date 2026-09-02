# kvpim-rtl — Fugue 硬件 overhead：组件 RTL + Genus/ASAP7 权威结果

分支 `chenyi-genus-0902`（2026-09-02 整理）。本分支只把**最终进论文**的代码与
结果放在正式目录；其余历史材料全部在 `archived/`（见 `archived/README.md`）。

## 目录

| 目录 | 内容 |
|---|---|
| `rtl/` | 正式组件 RTL（原 `rtl/0830-02/`，含 commit `a17696d` 的 SRAM 出口寄存器修复；FP16 乘/加为完整 IEEE-754（含 subnormal）、BG 累加器 16 lane、BG buffer 各取最优实现，裁决 2026-09-02；29 个文件恰为 `run_all.sh` 读入的集合）：bank GEMV、BG accumulator/buffer、logic-die 单元、softmax array、HBM controller + KV TLB |
| `syn/genus_0831_hier/` | **权威综合结果**：Genus 25.1 / ASAP7 TT 0.7 V，层次化 leaf-as-macro 流程。脚本 `run_genus_0831.tcl` + 驱动 `run_all.sh`，修复后的 SRAM lib `libs_ps/`，每个 run 的 `<top>_{qor,area,power,timing,gates}.rpt`，汇总 `SUMMARY.md`（`collect.py` 生成） |
| `docs/0831-genus-hier/` | 论文数据包（只含 AttAcc baseline 与 Fugue 两类配置）：`DATA_README.md` + `components.csv` + `rollup.csv`，以及战役记录页 `README.md` |
| `docs/README.md` | 导航、方法学要点、三条关键结论与待办 |
| `docs/Hardware Overhead.md` | 组件线任务规格（四层级定义与频率契约） |
| `docs/ASAP7_SRAM_AREA_COMPARISON.md` | SRAM macro 面积比较（bank buffer 选型的支撑） |
| `testbench/` | `rtl/` 的 iverilog 单元测试（原 `testbench/0830-02/`），`run_tests.sh` |
| `archived/` | 旧 N28 logic-die RTL/文档、DC 矩阵、0828 基线、旧 testbench、本机综合产物、RoPE 单元与消融 run、未选用的 buffer 实现 |

## 最终结果（Genus/ASAP7；2026-09-02 IEEE FP16 + 16-lane BG 累加器裁决后重跑）

| 层级 | AttAcc | Fugue | 增量 |
|---|---:|---:|---:|
| Bank（1024×GEMV，IEEE FP16，flop buffer） | 6.35 mm² | 7.52 mm² | +18.34% |
| Bank group（256×16-lane acc + buf，buffer 各取最优） | 0.273 mm² | 0.421 mm² | +54.36% |
| Logic die（整合 softmax array + per-ch 单元） | 0.589 mm² | 1.620 mm² | +174.91% |
| HBM controller | 2,087 µm² | 5,774 µm² | +176.67% |
| Stack 合计（ASAP7 原值） | 7.22 mm² | 9.57 mm² | **+32.53%** |
| Stack 合计（DRAM 等效，bank/BG ×10） | 66.9 mm² | 81.0 mm² | **+21.19%** |

来源：`syn/genus_0831_hier/SUMMARY.md`；每个数字的复核路径见 `docs/0831-genus-hier/README.md` §5。

## Bank level 用的是什么

- RTL：`rtl/gemv_unit.sv` + `rtl/dbuf_16x256.sv`（flop 阵列 buffer，2026-09-01 裁决）+ 冻结的 `fp16_mult`/`fp16_add` 叶子网表（完整 IEEE-754 binary16，`tb_fp16_ieee` 对 numpy 黄金向量 2×28,576 条零失配）。
- run：`gemv_flop_p1501`（AttAcc，666 MHz）与 `gemv_flop_p769`（Fugue，1.3 GHz）。
- `gemv_attacc_p1501` / `gemv_fugue_p769`（`dbuf_16x256_asap7.sv` + SRAM macro，已归档）只作对表 AttAcc 原文 13.12 mm²/die 的参考配置（我们 13.85），不进 roll-up。
- 已知点：`fp16_mult_p700` 叶子在单独综合（25% 输入预算）下 slack −15.2 ps；集成后的 `gemv_flop_p769` 由上层 retiming 平衡后 met（slack +0.5 ps），以集成结果为准。

## 复现

```sh
cd syn/genus_0831_hier && ./run_all.sh      # 断点续跑，JOBS x CPUS 默认 8x4
python3 collect.py                          # 重生成 SUMMARY.md
cd ../../docs/0831-genus-hier && python3 export_csv.py   # 重生成 CSV
testbench/run_tests.sh                      # iverilog 单元测试
```

`run_all.sh` 在整理时补上了 `gemv_flop_p769` 这一行（该 run 原为手动补跑），
现在一次跑完即得 SUMMARY 中的全部 29 行。
