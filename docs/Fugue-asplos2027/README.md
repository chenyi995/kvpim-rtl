# Fugue (ASPLOS'27)：in-bank PE 频率–能量平衡点（n=8 最终结果）

本文件夹是论文 claim 的自足证据包：**不增加 SRAM，只提高 in-bank PE 的
时钟频率，在 DRAM 功耗约束下取平衡点**。含全部原始数据
（`raw_data/`）、图（`balance_n8.png/.pdf`）、逐点数字（`data_n8.csv`）
与复现脚本（`plot_balance.py`）。方法的权威口径同
`../README_balance_model.md`；本页把从 AttAcc 出发的整条逻辑写全。
数据与口径日期：2026-08-27（裁决人 chenyi9）。

## 1. 出发点：AttAcc 的 in-bank PE 与功耗地板

AttAcc（ASPLOS'24）把 decode attention 放进 HBM 每个 bank 旁的 PE：
一次列读（32 B，256 bit）把一段 K/V 送进 PE，与**驻留在 512 B GEMV
buffer 里的一条查询向量**做一次 16-lane FP16 MAC。DRAM die 有功耗红线
（JEDEC IDD7 口径，AttAcc Fig.7(a)，116 W/stack）：power-constrained
模式下列命令的最小间隔是 **nCCDAB = 6 tCK**（tCK = 0.769 ns）。
AttAcc 原版一条命令只服务**一条**查询（n=1），PE 时钟 666 MHz 绰绰
有余——瓶颈完全在 DRAM 侧，每 bank 每 6 tCK 出一次 MAC。

**6 tCK 窗口花掉的能量就是功耗约束的能量口径**（仿真器
`attacc_drampim_822/src/config.py::ENERGY_TABLE`，BA 级，FGDRAM 参数）：

```text
E_col = (0.11+0.44) pJ/b × 256 b = 140.8 pJ   （row-buffer 列读）
E_op  = 16×0.32 + 32×0.0034      =   5.23 pJ  （16-lane MAC + 32B SRAM 读）
E₆    = E_col + E_op             = 146.0 pJ   （每 6 tCK 每 bank 的预算）
```

## 2. Fugue 的 MQ 批命令：一次列读服务 n 条查询

Fugue 的多智能体场景里多个请求共享同一份 KV。MQ-MAC 批命令把一次列读
锁存进列 latch，PE 逐 cycle 轮转 n 个驻留查询 slot，各做一次 MAC——
**一份 DRAM 读能量摊给 n 条查询**。关键约束：

- **容量轴（本文不动它）**：一条查询在本 bank 的驻留切片是 64 B
  （d_head=128、BF16、按 bank-group 4-bank 切分），AttAcc 原装 512 B
  buffer 恰好驻 **n=8** 条（`mq_query_capacity`）。**n=8 = 不加任何
  SRAM 的最大批**，这就是论文选 n=8 的原因。
- **速率轴（本文的主角）**：n 次 MAC 要在列命令间隔内做完。666 MHz
  的原版 PE 跑 n=8 需要 `⌈8/(0.666×0.769)⌉ = 16 tCK`——DRAM 明明
  6 tCK 就能供数，PE 却拖慢 2.7×。**提频是自然的想法，但提频涨功耗，
  功耗顶到红线时列命令间隔又得拉长——存在一个平衡点。**

## 3. 平衡点模型

一条 MQ 命令（n 次 MAC）在 PE 频率 f 下的有效间隔（tCK）：

```text
I(n,f) = max( 6,                                    ── DRAM 协议地板
              ⌈ n / (f·0.769) ⌉,                    ── compute 项（∝1/f）
              6 · (E_col + n·E_op·ê(f)) / E₆ )      ── 能量项（超预算按比例拉长）
```

**ê(f) 是 PE 每 op 能量随频率的形状**，来自真实综合：把 `mq_bank_pe`
（16-lane 流水 MAC 树 + 操作数 store + 控制）在 **ASAP7**（7 nm 预测
工艺，TT 0.7 V，RVT+LVT+SLVT，Genus，retiming 开）从 0.4 到 3.3 GHz
逐点综合，取每点 `P_total / f_achieved`（pJ/cycle；满流水时每 cycle
一次 MAC+SRAM 读）。绝对值**锚定**在 666 MHz = 仿真器的 5.23 pJ
（该点 RTL 观测 104.2 pJ/cycle，校准系数 1/19.9——RTL 值含整个 PE 的
控制/时钟/保守翻转率，取形状即消掉系统差），其它频点按形状缩放。

## 4. n=8 结果（图 `balance_n8.png`）

上图：校准后的每 op 能量。0.4→3.0 GHz 从 5.6 pJ 缓慢**降**到
3.7 pJ——动态能量/op 基本平坦，漏电按 1/f 摊薄，retiming 把流水寄存器
分布得足够高效，3 GHz 内没有出现换 VT/加驱动的能量惩罚拐点
（时序全 met；3.3 GHz 目标点收不住，不入图）。

下图：三条线。compute 项从 27 tCK（0.4 GHz）一路降；能量项全程平在
~7.2–7.6 tCK（列读 140.8 pJ 占预算大头，PE 项只有 8×5.23·ê ≈
30–42 pJ）；**交点在 ≈1.5 GHz，I = 7.4 tCK**。之后间隔被功耗预算钳住：
1.5→3.0 GHz 只把 I 从 7.4 压到 7.0（+5% 吞吐，2 倍频率代价），
6 tCK 地板在能量口径下不可达。

| 设计点 | PE 时钟 | 间隔 I | 每 ACT 计算量 | 相对原版 |
|---|---|---|---|---|
| AttAcc 原版（n=1） | 0.67 GHz | 6 tCK（地板） | 64 MAC | 1× |
| 原版 PE 直接跑 MQ n=8 | 0.67 GHz | 16 tCK | 512 MAC | 计算受限 |
| **Fugue 平衡点（n=8）** | **≈1.5 GHz** | **7.4 tCK** | **512 MAC** | **间隔 -54%，吞吐 2.2×** |

（每 ACT：一行 64 列、每 token 2 列 → 32 token × 8 查询 = 512 次
16-lane MAC；行占用 64 × 7.4 ≈ 470 tCK ≈ 0.36 µs。）

**论文 claim 的最终表述**：不增加 SRAM（n=8 恰驻原装 512 B buffer），
只把 PE 从 666 MHz 提到 **~1.5 GHz**，MQ 命令间隔即达功耗约束允许的
平衡值 **7.4 tCK**；再提频被 DRAM 功耗预算钳制、收益 <5%，属于
面积/时序的纯浪费。频率代价温和：13.5k → 14.1k µm²/PE（+3.9%，
0.67→1.5 GHz，ASAP7）；平衡频率对 n 的敏感度低（n=16 时交点在
~3.0 GHz、I=8.25 tCK，见仓库主分析）。

## 5. 复现与文件清单

```sh
python3 plot_balance.py      # 重新解析 raw_data/ → data_n8.csv + 图
```

- `raw_data/mq16x2_<period>ps/` — 14 个频点的 Genus 报告
  （qor/area/power/timing/gates + SDC），top=`mq_pe_16x2_d32`
  （rtl/mq_bank_pe.sv），retiming 开。综合脚本与库配置同目录：
  `run_syn_asap7.tcl`、`asap7_mmmc.tcl`、`filelist_bankpe.f`。
- `data_n8.csv` — 逐点：f/met/P/E/ê/compute 项/能量项/有效间隔
  （含未收敛的 3.3 GHz 目标点，图中剔除）。
- `balance_n8.png / .pdf` — 论文图（PDF 矢量版投稿用）。

## 6. 口径与已知近似（审稿防线）

1. ê(f) 形状取自 VEC_DEPTH=32（1 KiB buffer）的综合配置而非 512 B 的
   `mq_pe_8x1_d16`——buffer 偏大使 ê 偏保守（能量略高估），平衡点只会
   被低估；需要严格版可对 `mq_pe_8x1_d16` 重跑同一扫描交叉验证。
2. Genus 统计功耗（无 VCD）、TT corner、flop 阵列代替 SRAM macro：
   绝对值只经校准锚点进入模型，结论由**比值**（ê、I）承载；真 SRAM
   读能量更低，同样是保守方向。
3. compute 项按满流水 1 MAC/cycle，忽略流水灌入/排空零头（同偏，
   不移动交点）。
4. Fmax 为软约束：收不住的点可加深乘/加子流水（`_mp3/_mp4` 变体，
   吞吐不变）；n=8 的平衡点 1.5 GHz 远在 2/2 流水的收敛范围内，
   不依赖此机制。
5. 能量常数与仿真器（`attacc_drampim_822`）完全同源；对应的仿真器
   preset 建议：n_cap=8 → **1.5 GHz / interval 7.4 tCK**（替代现行
   1.733 GHz / 6 tCK 的"恰好塞满"配平，后者在能量口径下不可达）。
