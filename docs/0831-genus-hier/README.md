# 0831 Genus 层次化综合战役：结果、过程与全部改动（记录页）

目标读者：接手人/审稿人，可据此**手动复核每一个数字**。
战役日期 2026-08-31 ~ 09-01；分支 `xinyao_0831`。
画图/引用数字请直接用同目录的 **`DATA_README.md` + 两个 CSV**。

## 1. 做了什么（一句话）

把 `rtl/0830-02` 组件集（bank GEMV / BG accumulator / logic-die 单元 /
HBM controller）在 **Genus/ASAP7 上以 leaf-as-macro 层次化流程完整重综合**
（29 个 run 全部时序收敛、零违例），修掉三个上游问题，产出四层级
hardware-overhead roll-up 的权威数字。

## 2. 最终结果

| 层级 | AttAcc | Fugue | 增量 |
|---|---:|---:|---:|
| Bank（1024×GEMV，flop buffer） | 5.98 mm² | 6.63 mm² | +10.85% |
| Bank group（256×acc+buf） | 0.106 mm² | 0.128 mm² | +21.00% |
| Logic die（整合 softmax array + per-ch 单元） | 0.589 mm² | 1.619 mm² | +175.08% |
| HBM controller | 2,087 µm² | 5,774 µm² | +176.67% |
| **Stack 合计（ASAP7 原值）** | 6.68 mm² | 8.39 mm² | **+25.53%** |
| **Stack 合计（DRAM 等效，bank/BG ×10）** | 61.5 mm² | 69.2 mm² | **+12.60%** |

关键单点：GEMV（flop buffer）@666 MHz / @1.3 GHz met（+65.7 / +0.5 ps）；
整合 softmax array @1.3 GHz met（AttAcc 573k / Fugue 1,578k µm²，slack 0）。

## 3. 过程中发现并修复的问题（按时间序）

1. **叶子 retime 边界失衡**（流程）：叶子紧时钟 + retime 会把输出寄存器
   移进内部，冻结后上层边界组合路径爆炸 → 叶子改不 retime + 25% 输入
   预算；上层保持 retime（单拍乘/加 1.3 GHz 收敛的必要条件）。
2. **SRAM liberty 内部单位混写**（上游 lib）：ns/pF 声明下混有 ps/fF
   量级的表 → dataout arc 被读成 ~71 ns。`convert_sram_libs.py` 按块
   自适应转换 + 从 LEF `SIZE` 注入 macro 面积（原 `area:0`）。
   **附带警示：DC 把该非法 arc 静默丢弃，dc_0830-02 的 SRAM 路径
   "met" 是未约束的假阳性。**
3. **SRAM 出口缺流水寄存器**（RTL，裁决 2026-08-31）：latch 型
   srambank 低相位出数，裸接乘法器只剩半周期（666 MHz 即 -430 ps）→
   出口打一拍（读延迟 2 拍），gemv 对齐链 +1；VCS 功能验证通过。
   评估过的时钟反相替代方案按裁决弃用。
   `softmax_buffer_sram` 经整合 array 验证**无需**此修复（FSM WAIT 吸收）。
4. **N_gemv 计数口径**（裁决 2026-09-01）：AttAcc Fig.9(b) 两 bank 共享
   2 个 GEMV → **1024/stack**（原 2048 作废）；bank/BG 需 ×10 DRAM 工艺
   等效才能与原文对表（macro 参考配置复现 13.12 → 我们 13.18 mm²/die）。
5. **bank buffer 选型**（裁决 2026-09-01）：规格 256b 带宽 × 1 MiB/stack
   下，**flop 阵列最优**（3.8k µm²/unit，物理容量恰好；macro 最优组合
   3×80b+1×16b/份 = 6.0k 且 16 MiB 超配）。盈亏平衡 ~1 KiB/份，macro
   组合留作 n_cap≥16 扩展档。

## 4. 全部改动文件（按 commit）

| Commit | 文件 | 内容 |
|---|---|---|
| `a17696d` | `rtl/0830-02/dbuf_16x256_asap7.sv`、`dbuf_16x256.sv`、`gemv_unit.sv` | SRAM 出口寄存器修复 + 对齐链 |
| `65f4650` | `syn/genus_0831_hier/`（脚本 + libs_ps + 首批报告） | 矩阵基础设施 |
| `c424041` | `docs/README.md`（新建）、`docs/0830-02/Summary.md`（勘误节）、根 `README.md`（导航横幅） | 总导航与 DC 勘误 |
| `1f6dc52` | `syn/genus_0831_hier/`（array 报告 + SUMMARY） | 28/28 met |
| `7627ff1` | `rerun3.log` | 驱动日志收尾 |
| `1273725` | `collect.py`、`SUMMARY.md`、`Hardware_Overhead_Breakdown.md`、README×2 | N_gemv=1024 + ×10 双表 |
| `f71956f` | `gemv_flop_p769/`、`collect.py`、`SUMMARY.md`、README×2 | flop 裁决 + 最终 roll-up |
| （本次） | `docs/0831-genus-hier/` | 本记录页 + DATA_README + CSV |

## 5. 原始数据路径（手动复核指南）

- **每个 run 的报告**：`syn/genus_0831_hier/<tag>/<top>_{qor,area,power,timing,gates}.rpt`
  - slack/违例：`*_qor.rpt` 的 `TT.setup_view clk` 行（Genus 无 mmmc 时为 `clk` 行）
  - 面积：`*_area.rpt` 首行（`<top> ... Total-Area` 列，µm²，SRAM run 含 LEF 注入的 macro 面积）
  - 功耗：`*_power.rpt` 的 `Subtotal` 行（W；统计功耗，只作相对比较）
- **汇总表**：`syn/genus_0831_hier/SUMMARY.md`（`collect.py` 重生成）
- **修复后的 SRAM lib**：`syn/genus_0831_hier/libs_ps/`（对照原始：
  `/data2/tools-additional/pdk/asap7/asap7_sram_0p0/generated/{LIB,LEF}`）
- **复现**：`cd syn/genus_0831_hier && ./run_all.sh`（断点续跑，8×4=32 核）
- **功能验证**：`tb_gemv_unit_0830_02`（VCS，flop 与 SRAM 模型两配置），
  命令模板见根 `CLAUDE.md` §2（xinyao_0825 分支）
