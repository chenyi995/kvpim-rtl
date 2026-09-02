# DATA README — 论文取数指南（两类配置）

本目录只包含**进论文的两类配置**的数据：**AttAcc baseline** 与 **Fugue**
（论文口径：RoPE 在 GPU 上做，die 无旋转逻辑；RoPE 消融已归档，见
`archived/rtl/rope/README.md`）。
矩阵里其余 run（叶子宏、macro-buffer 参考、单体 dbuf/TLB、softmax 内部件、
未选用的 BG buffer 实现、RoPE）不在这里，需要时看
`syn/genus_0831_hier/SUMMARY.md` 与 `archived/syn/genus_0831_hier_reference/`。
逐 run 原始报告在 `syn/genus_0831_hier/<tag>/`。

当前口径（2026-09-02 裁决后）：FP16 乘/加为**完整 IEEE-754 binary16**
（含 subnormal），BG 累加器 **16 lane**，bank buffer flop 阵列，BG buffer
各取最优（AttAcc flop / Fugue 宏），N_gemv=1024、N_bg=256、N_ch=16。

## 文件

| 文件 | 内容 | 列 |
|---|---|---|
| `components.csv` | 进 roll-up 的 13 个综合点 | tag, top, level, **used_by**（attacc / fugue / attacc+fugue）, **count_per_stack**（1024 / 256 / 16 / 1）, period_ps, f_ghz, area_um2, slack_ps, violations, power_mw |
| `rollup.csv` | 四层级 + stack 合计 × 2 视图 | view(asap7_raw / dram_equivalent), level, attacc_um2, fugue_um2, fugue_delta_pct |
| `export_csv.py` | 从原始报告重新生成两个 CSV，并校验每个点 slack ≥ 0、violations = 0 | 矩阵重跑后执行一次 |

roll-up 公式：每层 = Σ count_per_stack × area_um2（按 used_by 归入配置）；
`dram_equivalent` 视图对 bank、bank_group 再 ×10。与
`syn/genus_0831_hier/collect.py` 的结果逐数相同（2026-09-02 核对）。

## 结果（µm²）

| 视图 | 层级 | AttAcc | Fugue | Δ |
|---|---|---:|---:|---:|
| ASAP7 原值 | bank | 6,354,010 | 7,519,379 | +18.34% |
| | bank_group | 272,710 | 420,945 | +54.36% |
| | logic_die | 589,142 | 1,619,598 | +174.91% |
| | hbm_controller | 2,087 | 5,774 | +176.67% |
| | **stack_total** | 7,217,948 | 9,565,696 | **+32.53%** |
| DRAM 等效 | bank | 63,540,101 | 75,193,795 | +18.34% |
| | bank_group | 2,727,099 | 4,209,454 | +54.36% |
| | logic_die | 589,142 | 1,619,598 | +174.91% |
| | hbm_controller | 2,087 | 5,774 | +176.67% |
| | **stack_total** | 66,858,428 | 81,028,620 | **+21.19%** |

## 画图口径

- **主图（§6 area）**：`rollup.csv` 中 `view=dram_equivalent` 的五行，
  AttAcc vs Fugue 分层条形图（log y 轴）。头条数字 **+21.19%**；
  ASAP7 原值视图 +32.53% 放 methodology 或附录。
- **分层增量**：`fugue_delta_pct` 列（+18.34 / +54.36 / +174.9 / +176.7）。
  - bank：同一 RTL 从 666 MHz 提到 1.3 GHz 的频率税（5,844→... 现为
    6,205→7,343 µm²），增量全部来自 IEEE fp16 乘/加叶子（mult 76.0→123.1、
    add 44.0→68.2 µm²/个），buffer（3,554 / 3,537）与胶合逻辑不变。
  - BG：16-lane 累加器 1,003→1,394 µm² 是 1.3 GHz 频率税；buffer 62→251 µm²
    是 8×FP16→64×FP16（16 B→128 B）的容量增长，两档各取面积最优实现
    （16 B flop 62.0 vs 宏 250.5；128 B 宏 250.7 vs flop 448.3）。
- **组件表**：`components.csv` 全部 13 行；所有点 slack ≥ 0、violations = 0，
  "timing" 列可全写 met。

## 单位与换算

- 面积 µm²；mm² = ÷1e6。功率 mW（Genus 统计值，无 VCD，**只作相对比较，
  不要引用绝对瓦数**；bank 两行还处于不同时钟，连相对比较也要谨慎）。
- `dram_equivalent` = bank 与 bank_group ×10（AttAcc §4.1 引用的 DRAM 工艺
  密度口径），logic_die 与 hbm_controller 在 buffer die，不乘。
- 频率：1501.5 ps = 666 MHz（AttAcc 档）、769 ps = 1.3 GHz（Fugue 档）。
  `acclogic/diffdec/causal/ctrl` 两类配置均在 666 MHz 综合（规格）。

## 与 AttAcc 原文 §7.7 对表（原文 1z-nm DRAM 工艺，我们 ASAP7 ×10）

| 单元 | 原文 | 我们 | 比值 |
|---|---:|---:|---:|
| GEMV unit，macro buffer 参考配置（`gemv_attacc_p1501`，已归档） | 0.094 mm² | 0.106 mm² | 112% |
| GEMV unit，flop buffer（正式） | 0.094 mm² | 0.062 mm² | 66% |
| BG 累加器 + buffer（AttAcc，16 lane） | 0.036 mm² | 0.0107 mm² | 30% |
| DRAM 侧合计 /die，macro 参考配置 | 13.12 mm² | 13.85 mm² | 106% |
| DRAM 侧合计 /die，flop 配置 | 13.12 mm² | 8.28 mm² | 63% |

原文 GEMV 的算术占 63%（≈5,920 µm² 逻辑等效），我们 IEEE 版 16 乘 + 16 加
= 1,920 µm²，仍小约 3 倍；原文未说明其 FP16 单元实现，差距无法进一步归因。

## 可直接引用的锚点句（已验证）

1. 整合 softmax fabric（16 通道 + 全部 SRAM buffer）1.3 GHz 时序收敛
   （slack 0，AttAcc 573k / Fugue 1,578k µm²）。
2. bank GEMV：**同一 RTL** 从 666 MHz 提到 1.3 GHz 的面积代价 +18.34%
   （6,205→7,343 µm²）。
3. FP16 单元为完整 IEEE-754 binary16，`tb_fp16_ieee` 对 numpy 黄金向量
   （float64 精确结果单次 RNE）2×28,576 条零失配。

## 已知 caveat

- 综合级数据（无布线/CTS）；TT 0.7 V 单角；功率为统计值。
- bank/BG 的 ×10 是 AttAcc 引用的文献口径，非我们实测。
- `fp16_mult_p700` 叶子单独综合（25% 输入预算）slack −15.2 ps、15 条路径；
  集成的 `gemv_flop_p769` 由上层 retiming 平衡后 met（+0.5 ps，累加反馈环
  用满 734 ps）。叶子的单独时序是合成预算下的中间产物，以集成结果为准。
- BG 累加器按 AttAcc 原文规模做成 16 lane，与规格 `Hardware Overhead.md`
  的 4→1 标量归约不同，以 2026-09-02 裁决为准。
- Fugue BG buffer 用的 latch 型宏出口无流水寄存器；目前只单独综合（slack
  +182 ps），集成到算术单元前需像 bank 层一样加一拍。
- logic die 的 Fugue 版 buffer 按每通道 256 KiB（4 MiB/die）配置；
  若采用分批扫描方案可回落到 512 KiB——见 `docs/ASAP7_SRAM_AREA_COMPARISON.md`。
