# kvpim-rtl docs：总览与索引

目标读者：有计算机背景、但不了解本项目/DRAM-PIM 细节的人。概念首次
出现即解释，关键术语标英文；各专题另有独立 README（见文末索引）。

## 1. 这个仓库是什么

**Fugue** 研究多智能体 (multi-agent) LLM 服务里多个请求**共享**同一份
KV cache 时，attention 怎么下沉进 HBM 内存执行（存内计算，PIM）。
系统级仿真在姊妹仓 `/data2/chenyi9/KV-PIM/attacc_drampim_822`；
**本仓库负责硬件本体**：可综合的 RTL + 两套工艺的综合流程，回答
"这些硬件多大、多快、多费电"。

三层硬件，对应仓库里三组 top：

1. **Logic die（buffer die）顶层**：AttAcc 式 GEMV/softmax/控制器
   基座，加 Fugue 三件新硬件（KV TLB、RoPE rotate、master-diff
   diff_decoder）。tops：`attacc_logic_die`（基线）、`fugue_logic_die`、
   `fugue2_logic_die`、`fugue_mq_logic_die`（多 agent 批处理版）。
   2026-08-27 起 AttAcc 顶层已把 score→softmax→P 回写→context 的
   完整数据流在顶层链接（`ChangeNotes.md` 当日小节）。
2. **In-bank PE**：bank 旁的 16-lane FP16 GEMV 单元。`attacc_bank_pe`
   （原版：单驻留向量）与 `mq_bank_pe`（MQ 版：一次列读服务 n 条驻留
   查询，n=8/16/32 配置 top）。
3. **BG（bank-group）归约**：`mq_bg_reduce` 系列。

## 2. 两套综合流程

| 工艺 | 用途 | 入口 |
|---|---|---|
| TSMC N28（SS 0.72V 125C） | logic-die 面积/功耗 A/B 对比（Fugue 增量硬件成本） | `syn/run_syn.tcl`，`make attacc / fugue / both`，周期单位 **ns** |
| ASAP7（TT 0.7V 25C） | in-bank PE 频率-功耗扫描 → 平衡点 | `syn/run_syn_asap7.tcl`，`./run_asap7_bankpe_sweep.sh`，周期单位 **ps** |

N28 的结论快照（细节见根 `README.md`/`HANDOFF.md`）：Fugue 三件新
硬件对 AttAcc 基线 = **+8.9% 面积 / +3.4% 功耗，时序中性**；其中
RoPE 占新增的 ~70%。

## 3. 当前主线问题：功耗约束下的 PE 频率平衡点

HBM 功耗红线下每 bank 每 6 tCK 只许读一列；提高 PE 频率能更快扫完
n 条查询的 MAC，但能量涨了间隔就得拉长——存在一个**平衡频率**。
公式、能量常数（与仿真器同源）、校准方法、结论口径全部在
**`README_balance_model.md`**；扫描怎么跑在 **`README_asap7_flow.md`**。

## 4. 验证

`testbench/` 一个模块一个 TB（覆盖清单 `TEST_COVERAGE.md`），顶层
数据流有端到端 TB（`tb_attacc_top_link`）。本机用 VCS 跑（无
iverilog）；命令模板与规则见根 `CLAUDE.md` §2。

## 5. 索引

- `README_balance_model.md` — 平衡点公式与方法（唯一权威口径）
- `README_asap7_flow.md` — ASAP7 流程/扫描/分析操作手册
- 根 `README.md` — 仓库结构与 N28 结果参考
- 根 `HANDOFF.md` — 交接：状态、设计决策、环境坑
- 根 `ChangeNotes.md` — 对话式变更台账（记名+日期）
- 根 `CLAUDE.md` — Claude/协作者操作守则
- `syn/AREA_BREAKDOWN.md`、`syn/ROTATE_M2_BF16.md` — 专题结果
