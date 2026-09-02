# DATA README — 论文取数指南（三类配置）

本目录只包含**进论文的三类配置**的数据：
**AttAcc baseline**、**Fugue**（论文口径，RoPE 在 GPU 上做，die 无旋转逻辑）、
**Fugue + RoPE**（消融：die 上再加 1 个 `rotate_q_bf16` @666 MHz）。
矩阵里其余 15 个 run（叶子宏、macro-buffer 参考、单体 dbuf/TLB、softmax 内部件）
不在这里，需要时看 `syn/genus_0831_hier/SUMMARY.md`。
逐 run 原始报告在 `syn/genus_0831_hier/<tag>/`。

## 文件

| 文件 | 内容 | 列 |
|---|---|---|
| `components.csv` | 进 roll-up 的 14 个综合点 | tag, top, level, **used_by**（attacc / fugue / fugue_rope，`+` 连接）, **count_per_stack**（1024 / 256 / 16 / 1）, period_ps, f_ghz, area_um2, slack_ps, violations, power_mw |
| `rollup.csv` | 四层级 + stack 合计 × 2 视图 × 3 配置 | view(asap7_raw / dram_equivalent), level, attacc_um2, fugue_um2, fugue_rope_um2, fugue_delta_pct, fugue_rope_delta_pct |
| `export_csv.py` | 从原始报告重新生成两个 CSV，并校验每个点 slack ≥ 0、violations = 0 | 矩阵重跑后执行一次 |

roll-up 公式：每层 = Σ count_per_stack × area_um2（按 used_by 归入配置）；
`dram_equivalent` 视图对 bank、bank_group 再 ×10。与
`syn/genus_0831_hier/collect.py` 的结果逐数相同（2026-09-02 核对；BG buffer 改 flop 阵列后重跑）。

## 结果（µm²）

| 视图 | 层级 | AttAcc | Fugue | Fugue+RoPE | Fugue Δ | Fugue+RoPE Δ |
|---|---|---:|---:|---:|---:|---:|
| ASAP7 原值 | bank | 5,984,450 | 6,633,588 | 6,633,588 | +10.85% | +10.85% |
| | bank_group | 57,652 | 178,711 | 178,711 | +209.98% | +209.98% |
| | logic_die | 588,567 | 1,619,024 | 1,623,417 | +175.08% | +175.83% |
| | hbm_controller | 2,087 | 5,774 | 5,774 | +176.67% | +176.67% |
| | **stack_total** | 6,632,756 | 8,437,096 | 8,441,489 | **+27.20%** | +27.27% |
| DRAM 等效 | bank | 59,844,495 | 66,335,877 | 66,335,877 | +10.85% | +10.85% |
| | bank_group | 576,517 | 1,787,110 | 1,787,110 | +209.98% | +209.98% |
| | logic_die | 588,567 | 1,619,024 | 1,623,417 | +175.08% | +175.83% |
| | hbm_controller | 2,087 | 5,774 | 5,774 | +176.67% | +176.67% |
| | **stack_total** | 61,011,667 | 69,747,785 | 69,752,178 | **+14.32%** | +14.33% |

## 画图口径

- **主图（§6 area）**：`rollup.csv` 中 `view=dram_equivalent` 的五行，
  AttAcc vs Fugue 分层条形图（log y 轴）。头条数字 **+14.32%**；
  ASAP7 原值视图 +27.20% 放 methodology 或附录。
- **分层增量**：`fugue_delta_pct` 列（+10.85 / +210.0 / +175.1 / +176.7）。
  BG 的 +210% 中，累加器 163→250 µm² 是 1.3 GHz 频率税，buffer 62→448 µm²
  是 8×FP16→64×FP16（16 B→128 B）的容量增长（flop 阵列，裁决 2026-09-02）。
- **RoPE 消融**：`fugue_rope_*` 列；RoPE 只影响 logic_die（+4,393 µm²），
  stack 合计从 +14.32% 变为 +14.33%。
- **组件表**：`components.csv` 全部 14 行；所有点 slack ≥ 0、violations = 0，
  "timing" 列可全写 met。

## 单位与换算

- 面积 µm²；mm² = ÷1e6。功率 mW（Genus 统计值，无 VCD，**只作相对比较，
  不要引用绝对瓦数**；bank 两行还处于不同时钟，连相对比较也要谨慎）。
- `dram_equivalent` = bank 与 bank_group ×10（AttAcc §4.1 引用的 DRAM 工艺
  密度口径），logic_die 与 hbm_controller 在 buffer die，不乘。
- 频率：1501.5 ps = 666 MHz（AttAcc 档）、769 ps = 1.3 GHz（Fugue 档）。
  `acclogic/diffdec/causal/rope/ctrl` 三类配置均在 666 MHz 综合（规格）。

## 可直接引用的锚点句（已验证）

1. 校准锚：AttAcc 的 macro-buffer 参考配置下 DRAM 侧 = **13.12 mm²/die**
   vs 原文 13.12（§7.7）（BG buffer 改 flop 后由 13.18 变为 13.12）。该配置的 run（`gemv_attacc_p1501`）已归档在
   `archived/syn/genus_0831_hier_reference/`，`collect.py` 仍读取它，
   数字见 `syn/genus_0831_hier/SUMMARY.md` 的 Anchor notes。
2. flop bank/BG buffer 下 AttAcc DRAM 侧 = 7.55 mm²/die（低于原文，因消除
   16× macro 超配）。
3. 整合 softmax fabric（16 通道 + 全部 SRAM buffer）1.3 GHz 时序收敛
   （slack 0，AttAcc 573k / Fugue 1,578k µm²）。
4. bank GEMV：**同一 RTL** 从 666 MHz 提到 1.3 GHz 的面积代价 +10.85%
   （5,844→6,478 µm²），增量全部来自 fp16 乘/加叶子在紧时钟下的面积
   （adder +69%、mult +20%），buffer 与胶合逻辑不变。

## 已知 caveat

- 综合级数据（无布线/CTS）；TT 0.7 V 单角；功率为统计值。
- bank/BG 的 ×10 是 AttAcc 引用的文献口径，非我们实测。
- gemv_flop_p769 在 1.3 GHz 的 slack 为 0（累加反馈环用满 734 ps）。
- BG 累加器是规格定义的 4→1 标量归约（3 个 fp16_add，163 µm²）；AttAcc 原文
  §7.7 的每 BG 累加器为 0.036 mm²（DRAM 工艺，≈3,600 µm² 逻辑等效），
  比我们的基线大约 9 倍，引用时注意口径不同。
- logic die 的 Fugue 版 buffer 按每通道 256 KiB（4 MiB/die）配置；
  若采用分批扫描方案可回落到 512 KiB——见 `docs/ASAP7_SRAM_AREA_COMPARISON.md`。
