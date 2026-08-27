# ASAP7 综合流程与频率扫描方法

目标读者：要复跑/扩展扫描的人。本页自足；平衡点公式在
`README_balance_model.md`，N28 流程在仓库根 `README.md`/`HANDOFF.md`。

## 1. 与 N28 流程的差异（易错点）

| 项 | N28（`run_syn.tcl`） | ASAP7（`run_syn_asap7.tcl`） |
|---|---|---|
| 时钟环境变量 | `FUGUE_PERIOD_NS`，**ns** | `FUGUE_PERIOD_PS`，**ps**（liberty `time_unit=1ps`，SDC 全按 ps） |
| MMMC | `tsmcn28_mmmc.tcl`，SS/FF/TT 三角 | `asap7_mmmc.tcl`，**TT 0.7 V 25 C 单角**（setup=hold；扫描要的是能量/面积趋势，非 signoff） |
| 库 | BWP30P140 base/HVT/LVT | `asap7sc7p5t_27` NLDM 201020：AO/OA/INVBUF/SEQ/SIMPLE × **RVT+LVT+SLVT** 全给（高频点换 VT 的能量代价要如实体现） |
| driving cell | BUFFD4BWP30P140 | `BUFx4_ASAP7_75t_R`；输出 load 5 fF（cap 单位 fF） |
| retime | false | **默认 true**（见 §2；`FUGUE_RETIME=0` 关） |
| 其余 | 同：full-flatten（`ungroup -all -flatten`）、syn_generic/map/opt 全 high effort、独立 build 目录 | 同左；`FUGUE_CPUS` 控线程（默认 4） |

PDK 路径：`/data2/tools-additional/pdk/asap7/asap7sc7p5t_27/LIB/NLDM`。
面积口径：Genus 用 liberty cell area（真实 7 nm µm²，不是 4x-scaled
LEF 口径）。

## 2. 为什么必须开 retiming

`fp16_mult_piped`/`fp16_add_piped`（组成 `mac_tree16_piped`）的实现是
**一团组合逻辑 + 末端 NUM_PIPE 级寄存器**，设计意图就是让综合器
retiming 把寄存器分布进乘法器/加法器内部（见各文件头注释）。
`retime=false` 时寄存器全堆在输出端，关键路径仍是完整单级运算——
高频点必然假失败。因此 ASAP7 脚本默认
`set_db [current_design] .retime true` + `retime_effort_level high`。
2026-08-27 前按 retime=false 跑的 5 个低频点已归档在
`syn/noretime_mq16x2_*`（留作 retime 影响对照，分析脚本不收集它们）。

## 3. Fmax 软约束：深流水变体

某频点 2+2 级流水收不住 → 用更深配置重跑该点（吞吐不变，每 cycle
1 次 MAC，只加延迟级数）：

| top | MPIPE/APIPE | 用途 |
|---|---|---|
| `mq_pe_16x2_d32` | 2/2 | 主扫描全频段 |
| `mq_pe_16x2_d32_mp3` | 3/3 | 备用档 |
| `mq_pe_16x2_d32_mp4` | 4/4 | 2.0–3.3 GHz 段与 2/2 对照 |

同一频点两种深度都收敛时，取**能量低**者进平衡点分析（多付的寄存器
功耗是真实代价，由数据说话）。

## 4. 扫描与分析

```sh
cd syn
MAXJOBS=4 CPUS=4 ./run_asap7_bankpe_sweep.sh   # 后台跑数小时
python3 asap7_sweep_analysis.py                # 随时可跑，只统计已完成点
```

- 扫描点：`mq_pe_16x2_d32` × {2500,2000,1500,1250,1000,833,769,667,
  588,500,435,385,333,300} ps；`mq_pe_16x2_d32_mp4` × {500,435,385,
  333,300} ps；`attacc_bank_pe`（原版 gemv_unit 基线）×
  {2500,1500,1000,769,500,333} ps。
- 并发约定：`MAXJOBS × CPUS ≤ 16` 核（chenyi9 限定）；Genus license
  实测支持 ≥6 并发。**开跑前先 `free -g` 看机器**（CLAUDE.md §4）。
- 目录/тag：`build_asap7_<tag>/reports_<tag>/<top>_{qor,area,power,
  timing,gates}.rpt`；tag = `mq16x2_<ps>ps` 等。单点补跑：
  `make asap7run TOP=<top> FL=filelist_bankpe.f TAG=<tag> PERIOD_PS=<ps>`。
- 分析脚本输出：每点 `f_target / met / f_achieved（=1/(period−slack)，
  失败点按此折算）/ area / P / E_rtl / ê`，再按
  `README_balance_model.md` §4 的公式打出 I(n,f) 表与各 n 的平衡点。

## 5. 已知结果快照（2026-08-27，retime 扫描进行中）

- 锚点（667 MHz，2/2，retime 前数据）：13.5 k µm² / 98.3 k inst /
  65.6 mW / 98.4 pJ/cycle，slack 0。
- no-retime 低频段（0.4–1.0 GHz）：E_rtl 105→90 pJ/cycle 单调降
  （漏电摊薄区），面积基本平（13.45–13.77 k µm²）。
- 待 retime 全量数据落盘后，最终表与平衡点写入 `ChangeNotes.md`。
