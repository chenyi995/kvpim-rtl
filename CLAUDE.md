# CLAUDE.md — kvpim-rtl 操作守则

Claude 在本仓库工作时遵守的规则与约定。风格与姊妹仓
`/data2/chenyi9/KV-PIM/attacc_drampim_822`（仿真器）的守则一致。

## 0. 这个仓库是什么

Fugue（多智能体共享 KV 的 DRAM-PIM attention）的 **RTL 与综合**仓库：
AttAcc 式 logic-die datapath、MQ in-bank PE、N28 与 ASAP7 两套 Genus 综合
流程、频率-功耗扫描与"功耗约束下的频率平衡点"分析。项目总览读
`README.md`，交接状态读 `HANDOFF.md`，逐次变更与讨论读 `ChangeNotes.md`，
公式与方法读 `docs/`。

## 1. 文档与记录约定

- **docs/ 用中文**，目标读者是"有计算机背景但不了解本项目细节的人"：
  概念首次出现即解释，关键术语标英文，每页自足。RTL 注释与代码一律英文，
  风格对齐所在文件。
- **ChangeNotes.md 是对话式台账**：每轮实质性变更追加一节，格式
  `## <账户名> 更新（YYYY-MM-DD）：<标题>`。**记名规则：写账户名
  （cy / wxy / chenyi9），不写真名。** 裁决（口径、参数、方法的拍板）必须
  记下裁决人与日期。
- 结论要**定量**：改了什么，之前多少、之后多少、在哪个文件/commit。
  作废的结果要显式标注作废原因，不要静默删除；过时文档移 `docs/archived/`
  （git 历史自然保留）。
- 公式、能量常数、口径**必须写来源**（文件:行 或 commit），尤其是从
  attacc_drampim_822 取的数——两仓口径必须能互相对账。

## 2. 验证规则

- **机器上没有 iverilog**（`run_tests.sh` 的 iverilog 行是给有它的环境
  的）；本机用 **VCS**（在 PATH：`/data/eda_tools/synopsys/tools/vcs/`）。
  单个 TB：`vcs -full64 -sverilog -timescale=1ns/1ps -top <tb> -o simv
  <files...> testbench/<tb>.sv && ./simv`。VCS 比 iverilog 严格
  （位宽/enum），报错优先修 TB/RTL 而不是绕过。
- **改了 RTL 就要跑受影响的 TB**；新模块/新数据流要配 TB 并登记进
  `testbench/run_tests.sh`。顶层改动至少过一遍 Genus elaboration
  （快、能抓 latch/blackbox/宽度问题；注意 elaborate 前要先 `read_libs`
  或 read_mmmc，否则报无关的 LBR-163）。
- 数值检查优先构造**精确可表示**的用例（如等值 score → P=1/32）；
  `fp32_exp`/`fp32_recip` 是 LUT 近似，对它们的输出用容差判定，
  但换算到 FP16 后往往仍可位精确核对。

## 3. 综合流程约定

- 两套流程，**时钟单位不同，不要搞混**：
  - **N28**（`run_syn.tcl` + `tsmcn28_mmmc.tcl`）：`FUGUE_PERIOD_NS`，
    单位 **ns**；SS 0.72V 125C signoff 口径。
  - **ASAP7**（`run_syn_asap7.tcl` + `asap7_mmmc.tcl`）：
    `FUGUE_PERIOD_PS`，单位 **ps**（ASAP7 liberty `time_unit=1ps`，SDC
    数值全部按 ps）；TT 0.7V 25C，RVT+LVT+SLVT 全给，driving cell
    `BUFx4_ASAP7_75t_R`。详见 `docs/README_asap7_flow.md`。
- **retime 规则**：`*_piped` 单元（`fp16_mult_piped` 等）的流水寄存器
  挂在组合云末端、**依赖 retiming 分布**。凡综合含 `mac_tree16_piped`
  的设计（MQ PE 高频点），必须 `retime=true`（ASAP7 脚本默认开，
  `FUGUE_RETIME=0` 关）。retime=false 跑出的高频失败是假失败。
- **Fmax 是软约束**（chenyi9 2026-08-27 裁决）：某频点收不住就加深
  MPIPE/APIPE（`mq_pe_16x2_d32_mp3/_mp4`），吞吐不变（每 cycle 1 MAC），
  只加延迟；不要把"综合不过"当成频率上限的结论。
- 每个综合点用独立 `build_<tag>/` 目录（脚本自动 cp 进去），报告落
  `reports_<tag>/`；同名 tag 会覆盖。ASAP7 扫描 tag 约定
  `mq16x2_<period>ps` / `attaccpe_<period>ps` / `mq16x2mp4_<period>ps`，
  分析脚本 `asap7_sweep_analysis.py` 按这个 glob 收集。
- 归档而非删除：换 recipe 重跑前，把旧结果目录改名（如 `noretime_*`）
  留对照。

## 4. 机器礼仪（血泪教训，都真实发生过）

- **杀进程只按 PID**，绝不 `pkill -f <串>`——若该串出现在启动 shell 的
  命令行里会把自己/并行任务一起杀掉（HANDOFF §7 记录的事故）。
- **开并行任务前先看机器**：`free -g` + `ps aux --sort=-rss | head`。
  本机 754 GB RAM 常被仿真进程占到 90%+（2026-08-27 实测 19 个
  ramulator 仿真占 723 GB，而 4 个 Genus 才 9 GB）——内存压力大时先
  确认元凶是谁，不要想当然砍自己的任务。
- 并行综合默认 **≤16 核**（4 个 Genus × `FUGUE_CPUS=4`），除非另有指示。
  Genus license 池实测可支撑 ≥6 并发。
- 长任务放后台、写日志、定期查 `reports_*` 是否落盘，别阻塞等待。

## 5. 公式与口径的唯一出处

频率-功耗平衡点的全部公式、常数、校准方法在
**`docs/README_balance_model.md`**；与仿真器的对账关系（ENERGY_TABLE、
`mq_interval_cycles`、`MQ_POWER_BUDGET_W`）也在那里。改模型先改文档，
再改 `syn/asap7_sweep_analysis.py`，两处必须一致。

## 6. 跨仓指针

- 仿真器（能量表、MQ 命令 C 模型、A1–A6 阶梯）：
  `/data2/chenyi9/KV-PIM/attacc_drampim_822`（守则/台账/每日裁决在其
  `docs/`）。
- 旧 ASAP7 流程参考（单点、RVT-TT）：
  `/data2/chenyi9/KV-PIM/archived/kvpim-rtl/syn/`。
- PDK：N28 `/data2/tools-additional/pdk/N28`；ASAP7
  `/data2/tools-additional/pdk/asap7/asap7sc7p5t_27`（NLDM 201020 版）。
- 论文：`KV-PIM/sections/03-design.tex`；AttAcc `KV-PIM/ref/attacc.pdf`；
  RoPIM `ref/RoPIM.pdf`。
