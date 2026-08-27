# Fugue (ASPLOS'27)：in-bank PE 频率–能量平衡点（n=8 最终结果）

本文件夹是论文 claim 的自足证据包：**不增加 SRAM，只提高 in-bank PE 的
时钟频率，在 DRAM 功耗约束下取平衡点**。含全部原始数据
（`raw_data/`）、图（`power_vs_freq_n8.png/.pdf`）、逐点数字（`data_n8.csv`）
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
I(n,f) = max( 6,                                      ── DRAM 协议地板
              ⌈ n / (f·0.769) ⌉,                      ── compute 项（∝1/f）
              ⌈ 6 · (E_col + n·E_op·ê(f)) / E₆ ⌉ )    ── 能量项（超预算按比例拉长）
```

列命令间隔是**整数个 tCK**（DRAM 命令调度无分数拍，与仿真器
`mq_interval_cycles` 的整数 cycle 口径一致），故两项都取 ceiling。

**ê(f) 是 PE 每 op 能量随频率的形状**，来自真实综合：把 `mq_bank_pe`
（16-lane 流水 MAC 树 + 操作数 store + 控制）在 **ASAP7**（7 nm 预测
工艺，TT 0.7 V，RVT+LVT+SLVT，Genus，retiming 开）从 0.4 到 3.3 GHz
逐点综合，取每点 `P_total / f_achieved`（pJ/cycle；满流水时每 cycle
一次 MAC+SRAM 读）。绝对值**锚定**在 666 MHz = 仿真器的 5.23 pJ
（该点 RTL 观测 104.2 pJ/cycle，校准系数 1/19.9——RTL 值含整个 PE 的
控制/时钟/保守翻转率，取形状即消掉系统差），其它频点按形状缩放。

## 4. n=8 结果（图 `power_vs_freq_n8.png`）

**图（功率 vs PE 频率，单轴）**：每 bank 平均功率（列读 + 8 次
MAC+SRAM，校准到仿真器能量口径）随频率台阶式上升——每上一个台阶 =
PE 跟上更快的节奏、命令间隔缩短 1 tCK。台阶爬到 **29.4 mW @ 1.30 GHz**
（8 tCK 档）后，**下一档（7 tCK，33.4 mW）会越过 31.7 mW/bank 的
DRAM 预算红线（= E₆/6·tCK）→ 被禁止**，间隔从此钉在 8 tCK，实际功率
不再上升。这就是"功率随频率增加、直到预算钳住节奏"的完整故事。

**8 tCK 需要的精确频率**：compute 项 ⌈8/(f·tCK)⌉ ≤ 8 ⟺
**f\* = 8/(8·tCK) = 1/tCK = 1.3004 GHz**——一个干净的设计点：
**PE 时钟 = DRAM 命令时钟（769 ps），每个 tCK 恰好一次 MAC，8 个 tCK
恰好扫完 8 条驻留查询**。扫描网格上 769 ps 频点正好落在此处且时序
满足（13,961 µm²，较 667 MHz 点 +3.2%）；该点 compute 恰好 8.000 tCK
零裕度，工程上可取稍高时钟（如网格上的 1.5 GHz 点，14,057 µm²）留
margin，间隔不变仍为 8。

每 op 能量的走势（逐点数值在 `data_n8.csv` 的 `e_op_cal` 列）：
0.4→3.0 GHz 从 5.6 pJ 缓慢**降**到 3.7 pJ——动态能量/op 基本平坦，
漏电按 1/f 摊薄，retiming 把流水寄存器分布得足够高效，3 GHz 内没有
出现换 VT/加驱动的能量惩罚拐点（时序全 met；3.3 GHz 目标点收不住，
CSV 中标 met=False）。

### 4.1 物理口径：频率变高，到底什么变多了？

这是本设计最容易被误读的一点，分清两个量（电压固定 0.7 V，无 DVFS）：

- **单位时间的能量（功率）随 f 变大**——P ≈ α·C·V²·f，近似线性，
  逼近电路极限后超线性。**DRAM 红线约束的正是它**，这是"提频要付
  功耗代价"成立的地方（主图的上升台阶）。
- **一次计算的能量基本不随 f 变**——一次 MAC 翻转的电容就是 α·C·V²，
  里面没有 f。实测呈浴缸形：低频端因漏电等按时间烧的成分摊薄而略降
  （实测 P(f) ≈ 17 mW + 69 pJ·f，常数项摊薄即全部降幅），中段平，
  **逼近电路速度极限才升**（加大驱动/换 LVT/SLVT/深流水的代价；实测
  在 3 GHz 之后出现——3.3 GHz 失败点 E 反弹至 85 pJ、面积 +20%）。

"频率越高一次能量越高"的直觉来自 **DVFS**（提频必升压，E ∝ V²）或
**逼近极限区**；在固定电压、0.4–3.0 GHz 的窗口内它不成立。**结论对此
鲁棒**：即使把每 op 能量当完全平的（保守取 ê=1，去掉全部下降尾巴），
n=8 间隔仍是 ⌈6×182.6/146⌉ = 8 tCK，平衡点不动。

**那综合是不是多余的？不是。** 公式只给平衡点位置；综合钉死的是三件
公式给不了的事：① 能量惩罚区从哪开始（实测 >3 GHz，故 1.3 GHz 平衡点
安全地位于其内侧——论文的承重句）；② 1.3 GHz 可综合、代价 +3.2% 面积
（Fmax 与面积只能测）；③ "每 op 能量在此区间平坦"本身是需要证据的
测量结论，不是能拍脑袋的假设。

下图：三条线。compute 项从 27 tCK（0.4 GHz）一路降；能量项（分数值
~7.2–7.6，列读 140.8 pJ 占预算大头，PE 项只有 8×5.23·ê ≈ 30–42 pJ）
按整 tCK 取整后全程 = **8 tCK**；compute 项降到 ≤8 需要
**f\* = 1/tCK = 1.3004 GHz**（见 §4 开头的精确推导）。**平衡点
1.30 GHz，I = 8 tCK**。之后间隔被功耗预算精确钉死在 8：1.3→3.0 GHz
收益为 **0**；6 tCK 地板在能量口径下不可达（要到 ~3.3 GHz、ê≤0.71
才降到 7 tCK——为 1 tCK 付 2.5× 频率，不值）。

| 设计点 | PE 时钟 | 间隔 I | 每 ACT 计算量 | 相对原版 |
|---|---|---|---|---|
| AttAcc 原版（n=1） | 0.67 GHz | 6 tCK（地板） | 64 MAC | 1× |
| 原版 PE 直接跑 MQ n=8 | 0.67 GHz | 16 tCK | 512 MAC | 计算受限 |
| **Fugue 平衡点（n=8）** | **1.30 GHz（=1/tCK；留裕度 1.5） ** | **8 tCK** | **512 MAC** | **间隔 -50%，吞吐 2.0×** |

（每 ACT：一行 64 列、每 token 2 列 → 32 token × 8 查询 = 512 次
16-lane MAC；行占用 64 × 8 = 512 tCK ≈ 0.39 µs。）

**论文 claim 的最终表述**：不增加 SRAM（n=8 恰驻原装 512 B buffer），
只把 PE 从 666 MHz 提到 **1.30 GHz（= DRAM 命令时钟 1/tCK，每 tCK 一次
MAC）**，MQ 命令间隔即达功耗约束允许的平衡值 **8 tCK**（每 8 tCK 一次
列读、8 次 16-lane MAC）；再提频被 DRAM 功耗预算精确钳在 8 tCK、收益
为零，属于面积/时序的纯浪费。频率代价温和：13.5k → 14.0k µm²/PE
（+3.2%，0.67→1.30 GHz，ASAP7；留裕度的 1.5 GHz 点 +3.9%）；
n=16 时平衡点在 ~2.6 GHz、9 tCK（见仓库主分析）。

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
- `power_vs_freq_n8.png / .pdf` — 论文图（PDF 矢量版投稿用）。

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
5. 能量常数与仿真器（`attacc_drampim_822`）完全同源，间隔取整口径也
   与 `mq_interval_cycles` 一致；对应的仿真器 preset 建议：
   n_cap=8 → **1.3 GHz（=1/tCK）/ interval 8 tCK**（替代现行
   1.733 GHz / 6 tCK 的"恰好塞满"配平，后者在能量口径下不可达）；
   n_cap=16 → 2.6 GHz / 9 tCK。
