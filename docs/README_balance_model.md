# 功耗约束下的 in-bank PE 频率平衡点：公式与方法

目标读者：接手人/审稿人。概念首现即释，本页自足。
本页是平衡点模型的**唯一权威口径**；实现在 `syn/asap7_sweep_analysis.py`，
两处必须一致。口径裁决：chenyi9，2026-08-27（本页 §3 的归一化方式、
§6 的"不考虑 SRAM 容量"与"Fmax 软约束"均为当日裁决）。

## 1. 问题

HBM 的 DRAM die 有功耗红线（JEDEC IDD7 口径，AttAcc Fig.7(a) 读数
116 W/stack，见仿真器 `src/ramulator_wrapper.py::MQ_POWER_BUDGET_W`）。
power-constrained 模式下，每 bank 每 **6 个 tCK**（命令时钟周期，
tCK = 0.769 ns，`_MQ_TCK_NS`）允许发一条 all-bank 列读（nCCDAB 地板
= 6，`_MQ_NCCDAB_PC`）。in-bank PE（bank 旁的 16-lane FP16 GEMV 单元）
每锁存一列要对 n 条驻留查询各做一次 MAC（MQ-MAC 批命令）。

**问题：PE 时钟 f 提多高最划算？** 提频让 n 次 MAC 更快扫完（列命令
间隔的 compute 项 ∝ 1/f 缩短），但功耗上升；预算不变时能量涨多少、
命令间隔就得按比例拉长多少。两个效应的交点 = **平衡频率**，越过它
提频反而增加 cycle。

## 2. 基准能量：6 tCK 窗口允许花多少

全部取自仿真器 `src/config.py::ENERGY_TABLE`（FGDRAM, MICRO'17 口径，
pJ/byte）在 **BA（bank 级）** 的数值：

| 项 | 计算 | 数值 | 含义 |
|---|---|---|---|
| E_col | (0.11 + 0.44) pJ/b × 8 × 32 B | **140.8 pJ** | 一次 row-buffer 列读（cell ACT/PRE + RD，32 B 到 PE） |
| E_alu | 16 lane × 0.32 pJ | 5.12 pJ | 一次 16-lane FP16 MAC |
| E_sram | 32 B × 0.0034 pJ/B | 0.109 pJ | 一次 32 B 操作数 SRAM 读 |
| E_op = E_alu + E_sram | — | **5.23 pJ** | 一次"计算+SRAM"（= 仿真器 `_MQ_E_Q_PJ`） |
| **E₆ = E_col + E_op** | — | **146.0 pJ** | **6 tCK 预算能量**：原版 AttAcc（n=1）一个列命令窗口内实际花的能量 |

即：**功耗红线折算成能量口径 = 每 6 tCK 每 bank 允许花 146 pJ**。

## 3. RTL 校准：只取形状，绝对值锚到仿真器

Genus 统计功耗（无 VCD，默认翻转率）的绝对值不可直接比对仿真器的
微观能量，所以：

- ASAP7 TT 扫描给出每频点的 **E_rtl(f) = P_total(f) / f_achieved**
  （pJ/cycle；PE 满流水时每 cycle 完成一次 MAC+SRAM 读，故它就是
  "每 op 能量"的 RTL 观测）；
- 定义**形状因子** ê(f) = E_rtl(f) / E_rtl(666 MHz)。666 MHz 是 AttAcc
  论文综合出的 PE 时钟（`MQ_DEFAULT_PE_FREQ_GHZ`），作为**校准锚点**：
  该点的 PE 能量规定等于仿真器的 5.23 pJ；
- 任意频点的校准 PE 能量 = **5.23 × ê(f) pJ**。
  （2026-08-27 实测锚点：E_rtl(666 MHz) = 98.4 pJ/cycle，校准系数
  k ≈ 1/18.8——RTL 值偏大是因为它含整个 PE 的控制/寄存器/时钟 pin
  功耗与保守翻转率，而仿真器只记 MAC+SRAM 的微观能量；取形状即消掉
  这一系统差。）

## 4. 间隔公式与平衡点定义

n 条驻留查询、PE 频率 f（GHz）下，一条列命令的有效间隔（单位 tCK）：

```text
I(n, f) = max(  6,                                          # DRAM 协议地板
                ceil( n / (f · 0.769) ),                    # compute 项：n 次 MAC 的耗时
                ceil( 6 · ( E_col + n·E_op·ê(f) ) / E₆ ) )  # 能量项：花超预算按比例拉长
```

命令间隔是**整数个 tCK**（DRAM 无分数拍调度；与仿真器
`mq_interval_cycles` 的整数 cycle 口径一致），两项均取 ceiling
（勘误：chenyi9 2026-08-27 指出，能量项此前未取整）。

- compute 项 ∝ 1/f 单调下降；
- 能量项中列读 E_col 不随 f 变（DRAM 侧），PE 项随 ê(f) 走：低频段
  ê 缓慢**下降**（漏电能量 ∝ 1/f 摊薄），高频段综合器换 LVT/SLVT、
  加大驱动、深流水寄存器变多，ê **上翘**；
- **平衡频率 f\* = argmin I(n, f)**。f < f\* 时提频缩短间隔（纯赚）；
  f > f\* 时间隔被能量项钳住甚至反弹（提频负收益）。

整数口径下能量项在很宽的 ê 区间内是常数（如 n=8 时 7.2–7.6 → 恒 8），
平衡频率即"compute 项降到该整数值"的门槛 f ≥ n/(I·0.769)。
**2026-08-27 扫描定案（ASAP7 TT，retiming）：**

| n | 能量项（取整） | 平衡频率 f\*（门槛 / 实测点） | 对 666 MHz 原版 |
|---|---|---|---|
| 1 | 6 tCK（地板） | 任意 ≥0.22 GHz | 1×（原版即最优） |
| 4 | 7 tCK | ≥0.74 / 0.8 GHz | 1.6×（11→7） |
| 8 | 8 tCK | ≥1.31 / **1.5 GHz** | **2.0×（16→8）** |
| 16 | 9 tCK | ≥2.31 / 2.6 GHz | 3.6×（32→9） |

## 5. 一次激活（ACT）算多少

数据布局决定、与频率无关：一行 = 64 列（`COL_W=6`，2 KB/row）；
d_head=128、BF16、K 片按 bank-group 4-bank 切分 → 每 token 占本 bank
2 列（64 B）。故一次 ACT 覆盖 **32 token × n 查询**；n=16 时为
64 列 × 16 = **1024 次 16-lane MAC**，行占用 = 64 × I(n,f) tCK。

## 6. 口径裁决与已知近似

1. **不考虑 SRAM 容量**（chenyi9 2026-08-27）：本模型只论频率×能量。
   驻留容量（n×64 B）是另一根轴（仿真器 `mq_query_capacity`），综合
   的配置里 buffer 已按 n 配好，其面积/功耗自然进入 ê(f)。
2. **Fmax 是软约束**（同日裁决）：频点收不住 → 加深 MPIPE/APIPE
   （`mq_pe_16x2_d32_mp3/_mp4`，吞吐不变），配合 retiming 重收。
   深流水多出的寄存器功耗如实进入 ê(f)——这正是"提频的能量代价"
   的一部分，不是作弊绕过。
3. compute 项按满流水 1 MAC/cycle 计，忽略流水线灌入/排空的零头
   （n≥8 时 <2 tCK 量级，且各频点同偏，不影响交点位置）。
4. Genus 统计功耗、TT corner、flop 阵列代替 SRAM macro：绝对值仅作
   校准输入；结论以**比值**（ê 与 I）表达。真 SRAM 读能量更低 →
   实际平衡点只会**更高**，方向保守。
5. E_col 取 BA 级 cell 侧能量，不含 TSV/buffer-die 段（in-bank PE
   不经过它们），与仿真器 `_MQ_E_COL_PJ` 完全同源。

## 7. 复现

```sh
cd syn
./run_asap7_bankpe_sweep.sh          # 25 点 ASAP7 扫描（4×Genus，16 核）
python3 asap7_sweep_analysis.py      # 解析报告 → E_rtl/ê/I 表 + 平衡点
```

流程细节（单位、MMMC、retime、深流水变体）见
`README_asap7_flow.md`。扫描数据与最终平衡点结论出来后登记在
`ChangeNotes.md` 对应小节。
