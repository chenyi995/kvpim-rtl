# DATA README — 给写论文/画图 agent 的快速取数指南

本页 + 同目录两个 CSV 就是画图所需的全部；不需要读综合报告原文。
数字口径的裁决与来龙去脉见同目录 `README.md`；逐 run 原始报告在
`syn/genus_0831_hier/<tag>/`（复核用）。

## 文件

| 文件 | 内容 | 每行 |
|---|---|---|
| `components.csv` | 29 个综合点 | tag, top, level(leaf/bank/bg/logic_die/hbm_ctrl), config, **in_rollup**, period_ps, f_ghz, area_um2, slack_ps, violations, power_mw |
| `rollup.csv` | 四层级 + stack 合计 ×2 视图 | view(asap7_raw / dram_equivalent), level, attacc_um2, fugue_um2, delta_pct |
| `export_csv.py` | 从原始报告重新生成上面两个 CSV | 矩阵重跑后执行一次即可 |

## 画图直接可用的口径

- **主图（论文 §6.2 area 部分）**：`rollup.csv` 里 `view=dram_equivalent`
  的五行 → AttAcc vs Fugue 分层条形图（log y 轴，bank 与 controller 差
  四个量级）或堆叠条 + 右侧 delta 标注。**头条数字：stack_total
  delta = +12.60%**（DRAM 等效）；ASAP7 原值视图 +25.53% 放 methodology
  或附录。
- **分层增量图**：delta_pct 列（+10.85 / +21.0 / +175.1 / +176.7）——
  讲"增量集中在 logic die（softmax buffer 512 KiB→4 MiB）与 controller
  （TLB），bank 侧只 +10.85%"的故事。
- **组件散点/表**：`components.csv` 过滤 `in_rollup=True` 得 roll-up 的
  11 个成分；`in_rollup=False` 是参考点（macro-buffer GEMV、单测 dbuf、
  TLB 单体、RoPE ablation、叶子）。所有点 slack ≥ 0、violations = 0，
  可以在表格里加一列 "timing" 全写 met。

## 单位与换算

- 面积 µm²；mm² = ÷1e6。功率 mW（Genus 统计值，无 VCD，**只作
  AttAcc-vs-Fugue 相对比较，不要引用绝对瓦数**）。
- `dram_equivalent` 视图 = bank 与 bank_group 面积 ×10（DRAM 工艺密度
  惩罚，AttAcc §4.1 口径），logic_die 与 hbm_controller 不乘（在 buffer
  die，真 logic 工艺）。
- 频率：1501.5 ps = 666 MHz（AttAcc 档）、769 ps = 1.3 GHz（Fugue 档，
  即平衡点研究的 f*）、699 ps = softmax 档。

## 写作可直接引用的锚点句（已验证）

1. 校准锚：macro 参考配置下 AttAcc DRAM 侧 = **13.18 mm²/die** vs
   原文发表值 13.12（§7.7）——方法学可信度句。
2. flop 最优 bank buffer 下 AttAcc DRAM 侧 = 7.61 mm²/die（低于原文，
   因消除 16× macro 超配——优化贡献句）。
3. 整合 softmax fabric（16 通道 + 全部 SRAM buffer）**1.3 GHz 时序收敛**
   （slack 0，AttAcc 573k / Fugue 1,578k µm²）。
4. GEMV 提频到 1.3 GHz 的面积代价 **+10.85%**（flop 版 5,844→6,478 µm²）
   ——与平衡点论文包（xinyao_0825 分支 `docs/Fugue-asplos2027/`，
   n=8、8 tCK、+4.3% 那套 mq_bank_pe 口径）**不是同一个 RTL**，引用时
   注意区分：那边是 MQ bank PE（含驻留轮转），这边是 AttAcc 原版
   gemv_unit 组件；两个数都真，各配各的 claim。

## 已知 caveat（审稿防线，图注/正文提前声明）

- 综合级数据（无布线/CTS）；TT 0.7 V 单角；功率为统计值。
- bank/BG 的 ×10 是 AttAcc 引用的文献口径，非我们实测。
- logic die 的 Fugue 版 buffer 按每通道 256 KiB（4 MiB/die）配置；
  若采用调度压缩方案（分批扫 pCH）可回落到原装 512 KiB——见
  `docs/ASAP7_SRAM_AREA_COMPARISON.md` 的价格表。
