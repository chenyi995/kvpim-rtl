# genus_0831_hier — Genus/ASAP7 层次化（leaf-as-macro）综合矩阵

> 路径说明（2026-09-02 整理）：本目录读取的 RTL 现为仓库根 `rtl/`（原 `rtl/0830-02/`；宏版 `dbuf_16x256_asap7.sv` 已归档）；对照的 DC 矩阵已移至 `archived/syn/dc_0830-02/`。

对 `rtl/` 组件集的独立复跑（与 `archived/syn/dc_0830-02` 的 DC 矩阵同口径），
外加两个整合 softmax array top（"整体"）。全部脚本、转换器与各 run 的
qor/area/power/timing/gates 报告都在本文件夹；mapped 网表、fv/、genus
运行日志为可再生大件，不入库（与 dc_0830-02 的惯例一致，重跑
`./run_all.sh` 即可复现）。

## 方法学

- **Leaf-as-macro（冻结网表）**：乘法器/加法器叶子（fp16/fp32 的
  mult/add）先用**更紧的时钟**单独综合（700/1350/630 ps，约为上层周期的
  90%，输入预算 25% 代表上层胶合逻辑），映射网表交给上层，上层
  `dont_touch/preserve` 冻结、绝不重综合。本机 Genus（25.1 common_ui）
  没有独立 ETM/.lib 导出命令，冻结网表在方法学上等价于 hard macro，
  且上层看到的是**真实时序**而非抽象模型。SRAM macro 走真 .lib。
- **Retiming 规则**：上层开 `retime true`（单拍乘/加数据通路在 1.3 GHz
  收敛靠它——平衡点研究的 mp1 实验已证明）；**叶子不开 retime**，保持
  "组合 → 输出寄存器"的架构边界（叶子若 retime，寄存器被移进内部，
  冻结后上层边界组合路径失衡，这是第一轮 -400~-800 ps 假违例的根因）。
- **周期约定**（ps，ASAP7 liberty 时间单位）：AttAcc 类 1501.5（666 MHz）、
  Fugue 类 769（1.3 GHz）、softmax 类 699，与 DC 矩阵一致。

## 两个上游问题的修复（本次的主要发现）

1. **SRAM liberty 内部单位混乱**（`convert_sram_libs.py`）：上游
   `asap7_sram_0p0` 的 .lib 声明 ns/pF，但**文件内部两种数值尺度混写**
   ——dataout 延迟表已是 ps/fF 量级数字，setup/hold 表是 ns 量级。按声明
   读会把 dataout arc 算成 ~71 ns。转换器按块自适应（数值 <5 判为 ns/pF
   缩放 ×1000，否则保留），统一输出 ps/fF 到 `libs_ps/`，并从 LEF `SIZE`
   注入 macro 面积（原 lib `area:0`）。**警示：DC 对同一批 lib 的
   "timing met" 是把非法 arc 静默丢弃后的假阳性**——dc_0830-02 里所有
   经过 SRAM 的时序结论需要重审。
2. **SRAM 出口缺流水寄存器**（裁决 chenyi9 2026-08-31，修在
   `rtl/`）：`srambank_*_6t122` 是 latch 型 macro，读数据在时钟
   **低相位**出（下降沿 +72 ps）；wrapper 原来把 dataout 裸接乘法器，
   下游只剩半周期（666 MHz 即 -430 ps）。**最终修法 = 出口打一拍**
   （`dbuf_16x256_asap7.sv` 加 `rd_q`；flop 参考版 `dbuf_16x256.sv` 同步
   加一拍保持 A/B 口径一致；`gemv_unit.sv` 对齐链 +1 级）。修复后
   gemv @666 MHz / @1.3 GHz 均 met（+0.7 / +1.1 ps，0 违例），功能由
   `tb_gemv_unit_0830_02` 两种 buffer 配置 VCS 验证通过。曾评估过的
   替代方案（macro 时钟反相，零延迟代价）按裁决弃用。

## 运行

```sh
./run_all.sh                 # JOBS x CPUS 并行（默认 8x4=32 核），断点续跑
python3 collect.py           # 汇总 -> SUMMARY.md（逐组件 + 四层级 roll-up）
```

目录内容（2026-09-02 整理后，只保留 AttAcc / Fugue 两类配置
所需的 run；RoPE 消融已归档）：

| 类别 | run 目录 | 说明 |
|---|---|---|
| 流程输入：叶子宏 | `fp16_{mult,add}_p700`、`fp16_{mult,add}_p1350`、`fp32_{add,mul}_p630`、`sfmpe_p699` | 紧时钟单独综合，mapped 网表被上层读入并冻结；报告证明叶子自身 met |
| bank | `gemv_flop_p1501`（AttAcc）、`gemv_flop_p769`（Fugue） | flop buffer 版 GEMV，IEEE FP16 叶子 |
| bank group | `accbg_*`、`accbuf_*` | 16-lane accumulator + buffer（buffer 各取最优：AttAcc 16 B flop、Fugue 128 B 宏，裁决 2026-09-02；未选组合在 `archived/syn/genus_0831_hier_reference/accbuf_*`） |
| logic die | `sfmarray_attacc_p769`、`sfmarray_fugue_p769`、`acclogic_p1501`、`diffdec_p1501`、`causal_p1501` | 整合 softmax array + per-channel 单元 |
| HBM controller | `ctrl_attacc_p1501`、`ctrl_fugue_p1501` | |
| 脚本/库 | `run_all.sh`、`run_genus_0831.tcl`、`collect.py`、`convert_sram_libs.py`、`libs_ps/`、`sfm_array_tops.sv` | |

两类配置之外的参考 run（macro-buffer GEMV、单体 dbuf/TLB/recip、RoPE 消融与其 bf16 叶子）与驱动日志
已移至 `archived/syn/genus_0831_hier_reference/`；其中 `gemv_attacc_p1501`
仍被 `collect.py` 读取以计算 13.12 mm²/die 校准锚（BG buffer 改 flop 前为 13.18）。

phase 1 叶子 7 个（含 softmax_pe）；phase 2 组件 10 个；phase 3 整合
`softmax_array_256`（AttAcc CONTEXTS=2 / Fugue CONTEXTS=16，
`sfm_array_tops.sv` 包装，softmax_pe 冻结为 macro）。层级 roll-up 计数
N_gemv=1024、N_bg=256、N_ch=16、bank/BG ×10（裁决 2026-09-01），公式来源
`archived/docs/0830-02/Hardware_Overhead_Breakdown.md`。

## 最终结果（2026-08-31 深夜，28/28 全部 met）

- 整合 softmax array @1.3 GHz：AttAcc（512 KiB buffer）**573,090 µm²**、
  Fugue（4 MiB）**1,578,385 µm²**，均 slack 0、0 违例——
  **`softmax_buffer_sram` 不需要出口寄存器修复**（FSM 读后的 WAIT 状态
  天然吸收了 latch 型 macro 的半周期，诚实 arc 下依然收敛）。
- 层级 roll-up（诚实 SRAM arc + 修复后 RTL；三项裁决 chenyi9
  2026-09-01：N_gemv=1024、bank/BG ×10 DRAM 等效、**bank buffer 用
  flop 阵列**——512 B/份的容量点上 256 行 macro 底座摊不平，flop 更小
  且物理容量恰为 1 MiB/stack，盈亏平衡在 ~1 KiB/份，macro 组合
  3×80b+1×16b 留作 n_cap 扩展档）：
  bank +18.34%、BG +54.36%、logic die +174.91%、controller +176.67%；
  **stack 合计 Fugue vs AttAcc：ASAP7 原值 +32.53%，DRAM 工艺等效
  +21.19%**（2026-09-02 IEEE FP16 + 16-lane BG 累加器后）。锚点：macro
  参考配置 13.85 mm²/die vs 原文 13.12；flop 配置 8.28 mm²/die。
- **FP16 叶子改完整 IEEE-754、BG 累加器改 16 lane**（裁决 chenyi9
  2026-09-02）：重跑 4 个 fp16 叶子 + gemv_flop ×2 + accbg ×2 + acclogic。
  `fp16_mult_p700` 单独综合在 25% 输入预算下 −15.2 ps（15 条路径）；集成的
  `gemv_flop_p769` 由上层 retiming 平衡后 met（+0.5 ps），以集成结果为准。
- **BG buffer 各取最优实现**（裁决 chenyi9 2026-09-02）：原宏版把 16 B 与
  128 B 都装进同一颗 512 B `srambank_64x4x16`（两档同为 250 µm²，扩容零
  成本）。四种组合比较后 AttAcc 16 B 用 flop（62.0，宏 250.5），Fugue
  128 B 用宏（250.7，flop 448.3）；两 run 均 met（slack +960 / +182 ps），
  功能由 `tb_accumulators_0830_02`（VCS，含 SRAM 行为模型）验证通过。
- 功率列为 Genus 统计值（无 VCD、满活动率），只作相对比较。
