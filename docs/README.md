# kvpim-rtl 总导航（2026-08-31 版，xinyao_0831 分支）

一页指路：现在**哪些东西是权威的、哪些过时了、东西都在哪**。
仓库同时活跃着两条线，先分清：

| 线 | 分支 | 内容 |
|---|---|---|
| **组件级 overhead 线（本分支）** | `xinyao_0831` | `rtl/0830-02` 组件集 + DC/Genus 两套综合矩阵 + 层级 roll-up |
| 平衡点/论文线 | `xinyao_0825` | in-bank PE 频率-能量平衡点（1.3 GHz / 8 tCK）、论文证据包 `docs/Fugue-asplos2027/`、`docs/README_balance_model.md`、`CLAUDE.md` 操作守则 |

仓库根的 `README.md` 是早期 N28 logic-die 时代的文档，只作历史参考。

## RTL：哪套是现行的

- **`rtl/0830-02/`（现行）**：按 `docs/Hardware Overhead.md` 规格重写的
  组件集（bank GEMV / BG accumulator / logic-die 单元 / HBM controller +
  TLB）。**2026-08-31 起含 SRAM 出口流水寄存器修复**（commit `a17696d`：
  `dbuf_16x256_asap7.sv`、`dbuf_16x256.sv`、`gemv_unit.sv`，读延迟 2 拍，
  裁决记录见 `syn/genus_0831_hier/README.md`）。
- `rtl/*.sv`（外层旧文件）：logic-die 时代的实现，组件线不再使用。

## 综合结果：信谁

| 目录 | 工具 | 状态 |
|---|---|---|
| **`syn/genus_0831_hier/`** | Genus/ASAP7，层次化 leaf-as-macro | **权威**。修复后 RTL、诚实的 SRAM arc、retiming 开。方法学与两项上游修复见其 `README.md`，结果表 `SUMMARY.md` |
| `syn/dc_0830-02/` + `docs/0830-02/Summary.md` | DC/ASAP7，组件级 | **部分过时**，见 Summary 末尾勘误：①四个 timing 失败其实 retiming 能收；②所有经 SRAM 的 "met" 是假阳性（DC 丢弃了 lib 的非法 clk→dataout arc）；③GEMV 各行对应修复前 RTL |
| `syn/xinyao_0828/` | DC，早期 SRAM 基线 | 自述 rough/debug，已知无效点见其 README |

## docs/ 里各文件

- **`0831-genus-hier/`** — 0831 Genus 战役的记录页（结果/过程/全部改动/
  原始数据路径）+ **`DATA_README.md` 与两个 CSV（写论文画图直接用）**

- `Hardware Overhead.md` — 组件线的任务规格（xinyao 手写，四层级定义与频率契约）
- `0830-02/Hardware_Overhead_Breakdown.md` — 层级 roll-up 公式与计数（N_gemv=2048、N_bg=256、N_ch=16），Genus 的 `collect.py` 沿用同一套
- `0830-02/Summary.md` — DC 矩阵结果 + 勘误节
- `ASAP7_SRAM_AREA_COMPARISON.md` — SRAM macro 面积比较（16 KiB vs 128 KiB × 32 实例，die buffer 扩容的价格）

## 三条关键结论（2026-08-31）

1. **Retiming 是必需项**：单拍 FP16 乘/加在 1.3 GHz 靠 retiming 收敛；
   DC 侧对应 `compile_ultra -retime`。
2. **上游 SRAM liberty 有两处坑**：内部数值尺度混写（ns 声明下混有
   ps/fF 量级表）与 `area:0`；`genus_0831_hier/convert_sram_libs.py`
   修复并从 LEF 注入面积。DC 用原始 lib 的 SRAM 路径时序等于未约束。
3. **latch 型 srambank 低相位出数 → 出口必须打一拍**（标准做法）：
   修复后 GEMV 在 666 MHz / 1.3 GHz 双双 met（+0.7 / +1.1 ps）。
   `softmax_buffer_sram` 出口是否需要同样修法，以整合 array
   （`sfmarray_*`）的报告为准。

## 待办（接手即看）

- [x] 整合 softmax array：双双 @1.3 GHz met（AttAcc 573k / Fugue
      1,578k µm²）；**`softmax_buffer_sram` 无需出口寄存器**（FSM WAIT
      吸收半周期）
- [x] roll-up 口径修正（三项裁决 chenyi9 2026-09-01）：**N_gemv=1024**
      （AttAcc Fig.9(b) 两 bank 共享 2 GEMV）+ bank/BG **×10** DRAM 工艺
      等效 + **bank buffer 用 flop 阵列**（512 B/份时 flop 3.8k µm² <
      macro 最优 6.0k，物理容量恰 1 MiB；盈亏平衡 ~1 KiB/份）。
      stack 合计 Fugue vs AttAcc：ASAP7 **+25.53%**、DRAM 等效
      **+12.60%**；macro 参考配置对表 13.18 vs 原文 13.12 mm²/die
- [ ] DC 矩阵按勘误复核（开 retime、换 `libs_ps/`、用修复后 RTL）
- [ ] `docs/0830-02` 的 roll-up 表用 Genus 权威数字刷新
