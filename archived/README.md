# archived/ — 已归档材料（2026-09-02 整理，分支 `chenyi-genus-0902`）

本目录存放**不进论文、但保留以备追溯**的旧代码、旧脚本与旧结果。
全部通过 `git mv` 移入，历史可用 `git log --follow` 追溯；**没有删除任何文件**。
正式（进论文）的代码与结果在仓库根：`rtl/`、`syn/genus_0831_hier/`、
`docs/0831-genus-hier/`，导航见根 `README.md`。

## 目录对照（原路径 → 现路径）

| 现路径 | 原路径 | 内容 | 为什么归档 |
|---|---|---|---|
| `root/README.md`、`root/HANDOFF.md`、`root/KV_TLB.md`、`root/ChangeNotes.md` | 仓库根 | TSMC N28 logic-die 时代的说明、交接与变更记录 | 描述的是 `rtl/`（旧外层文件）与 N28 full-flatten 流程，已被 ASAP7 组件线取代 |
| `rtl/*.sv` | `rtl/*.sv`（外层） | N28 logic-die 整体 RTL（`fugue_logic_die`、`attacc_logic_die`、MQ bank PE、mac_tree 等） | 组件线不再使用；同名文件（如 `gemv_unit.sv`）与正式 `rtl/` 的**不是同一版本** |
| `rtl/dc_synth_tops/` | `rtl/0830-02/`（现 `rtl/`） | `softmax_buffer_dc_tops.sv`、`softmax_pe_blackbox.sv`：仅 DC 流程用的综合 top / 黑盒声明 | Genus 权威矩阵与 testbench 均不引用（见该目录 README） |
| `syn/dc_0830-02/` | `syn/dc_0830-02/` | Synopsys DC/ASAP7 组件级矩阵（309 个报告） | **部分失效**：未开 retime；DC 静默丢弃了上游 SRAM lib 的非法 clk→dataout arc，所有经 SRAM 的 "met" 是假阳性；GEMV 行对应 SRAM 出口寄存器修复前的 RTL。勘误见 `docs/0830-02/Summary.md` 末尾 |
| `syn/genus_0831_hier_reference/` | `syn/genus_0831_hier/` | 六个不进三类配置的参考 run（macro-buffer GEMV ×2、单体 dbuf ×2、单体 TLB、单体 recip）+ BG buffer 未选用的实现组合（`accbuf_attacc_p1501_macro`、`accbuf_fugue_p769_flop`、旧 `accbuf_fugue_p769_macro`）+ 驱动日志 `rerun*.log` | 见该目录 README；`gemv_attacc_p1501` 仍被 `collect.py` 读取算 13.18 mm²/die 锚点 |
| `syn/xinyao_0828/` | `syn/xinyao_0828/` | 更早的 DC/SRAM 基线 | 自述 rough/debug |
| `syn/run_dc_*.sh`、`syn/run_dc_asap7*.tcl`、`syn/summarize_dc_asap7.py` | `syn/` | DC 驱动脚本 | 与 DC 矩阵一起归档 |
| `syn/run_syn*.tcl`、`syn/tsmcn28_mmmc.tcl`、`syn/Makefile`、`syn/filelist_*.f`、`syn/chip_*.sdc` | `syn/` | N28 Genus full-flatten 与各专题（bank PE、mactree、rotate、softmax）的文件列表与脚本 | N28 时代；部分 filelist 指向仓库外路径 |
| `syn/*.md`（AREA_BREAKDOWN、MACTREE_FMAX、ROTATE_M2_BF16、SRAM_MACRO_PLAN） | `syn/` | N28 时代的专题结论 | 历史参考 |
| `syn/reports_full/`、`syn/softmax_pe.db`、`syn/softmax_pe_macro.lib`、`syn/sram_macros_needed.txt`、`syn/compile_asap7_sram_libs.tcl` 等 | `syn/` | 零散产物 | 历史参考 |
| `syn/build_*/`、`syn/outputs_*/`、`syn/noretime_*/`、`syn/fv/`、`syn/*.log/.cmd/.out` | `syn/` | **本机未入库**的综合产物（约 2.5 GB，.gitignore 忽略） | 仅在磁盘上一并移入，保持 `syn/` 干净；clone 里不会出现 |
| `testbench/tb_*.sv`、`*.vvp`、`build/`、`vectors/`、`run_tests.sh`、`elaborate_all.sh`、`TEST_COVERAGE.md`、`gen_kv_tlb_vectors.py`、`sram_macro_models.sv` | `testbench/` | 旧 RTL 的 testbench | 对应 `archived/rtl/`，与正式 `rtl/` 接口不一致 |
| `docs/0830-02/Summary.md` | `docs/0830-02/` | DC 矩阵结果与勘误节 | 数字已被 Genus 权威结果取代 |
| `docs/0830-02/Hardware_Overhead_Breakdown.md` | `docs/0830-02/` | 0830-01→0830-02 RTL 审查结论 + 四层级 roll-up 公式（N_gemv=2048 旧口径） | 公式已由 `syn/genus_0831_hier/collect.py` 实现并按 2026-09-01 裁决改为 N_gemv=1024、bank/BG ×10；本文的表格数字未刷新 |

## 使用注意

- 归档脚本内的相对路径（如 `rtl/0830-02`、`syn/dc_0830-02`）**未改写**，按原路径书写；要重跑需自行调整。
- 若需引用 DC 数字，先看 `docs/0830-02/Summary.md` 末尾勘误，避免引用已知假阳性。
