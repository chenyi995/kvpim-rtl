# Change Notes

## 背景与范围

本次变更修正了原 RTL 中两个数据流层面的缺口：

1. 原 `gemv_unit` 无论操作类型都将 16 个 lane 归并为一个标量，不能表达 `S × V` 的 16 维 context 输出。
2. 原 `softmax_unit` 只处理外部直接输入的一组 16-score tile，没有保存长度为 `L` 的 score，不能执行完整 attention softmax。

本次实现提供可综合、可单独验证的存储、dual-mode GEMV 与 streaming softmax 基础模块。

## GEMV：score 与 context 两种累加轴

`rtl/gemv_unit.sv` 现在依据 `op_is_score` 选择数据路径：

| 模式 | 运算 | 输出 | 累加语义 |
| --- | --- | --- | --- |
| `op_is_score=1` | `Q × K^T` | `result[15:0]` | 16 个 lane 的乘积经过 8+4+2+1 adder tree 归并为一个 score；该标量可跨 `d_head` chunk 累加。|
| `op_is_score=0` | `S × V` | `context_result[255:0]` | 16 个 product lane 不归并；每 lane 有独立 FP16 accumulator，沿 token/score chunk 累加。|

score 路径与 context 路径有独立 valid：`result_valid` 和 `context_result_valid`。context 路径加入了最近一次 FP16 加法结果的 bypass，因此连续 `start` 时，不会读到尚未写回的旧 accumulator。

此前 `result = acc ^ op_tag` 会在 score mode 改写数值最低位；现已改为直接输出 `acc`。

注意：logic-die 顶层还没有将 `context_result` 接到跨 GEMV/pCH/BG 的真实 context 数据流。当前修改完成了 unit 内的正确粒度，顶层 dual-mode partition controller 是后续工作。

## Softmax Buffer

新增 `rtl/softmax_buffer.sv`。它由两块独立、同步单端口 SRAM 行为模型组成：

```text
score_bank: score collect 写入；exp/sum phase 读取
exp_bank:   exp/sum phase 写入；normalization phase 读取
```

这样在 exp/sum 阶段可以同 cycle 从 `score_bank` 读一个 16-lane word、向 `exp_bank` 写一个 16-lane word，无需假设单端口 SRAM 支持同 bank read/write。

默认 `SEQ_LEN=2048`、`LANES=16`：

```text
每 bank = 2048 × FP32 = 8 KiB
AttAcc buffer = score_bank + exp_bank = 16 KiB
Fugue 16-Q buffer = 16 × 16 KiB = 256 KiB
```

提供的封装：

| 模块 | 配置 | 用途 |
| --- | --- | --- |
| `softmax_buffer_attacc` | 1 context，2×8 KiB | 单个 AttAcc attention context。|
| `softmax_buffer_fugue` | 默认 16 contexts，2×8 KiB/context | 16 个 resident Fugue Q 的 score/exp state。|

一条完整 softmax 控制流应为：

```text
score collect：GEMV score → score_bank，并行更新 global_max
exp/sum：      score_bank → exp(score-max) → exp_bank，并行更新 global_sum
normalize：    exp_bank → exp × reciprocal(global_sum) → context GEMV
```

`softmax_buffer` 具有 RAM inference hint；后续工艺实现可将其替换为具体 SRAM macro wrapper，而不改变端口协议。

## Streaming Softmax RTL（已实现、尚未接入 logic-die）

新增 `rtl/streaming_softmax_unit.sv`，以 `LANES=16` 流式接收 score word，支持 `MAX_TOKENS=2048`（可参数化扩展）与不满 16 token 的末 tile mask。模块内部保留与上述 buffer 相同的两物理 bank：`score_mem` 与 `exp_mem`；`valid_mem` 保存末 tile 的有效 lane。当前实现独立推导 RAM，以便单元验证；后续顶层接入时可替换为/复用 `softmax_buffer` 的 SRAM wrapper，而不改变数据流。

控制流为数值稳定的三遍扫描：

```text
1. collect：输入 score 写入 score_mem，同时跨全部 tile 求 global_max
2. exp/sum：读 score_mem，计算 exp(score-global_max)，写 exp_mem，并累加 global_sum
3. normalize：计算 reciprocal(global_sum)，读 exp_mem，输出 exp/global_sum
```

接口协议：`in_valid && in_ready` 接收一个 16-lane score word；`seq_len=0` 表示参数 `MAX_TOKENS`；输出以 `out_valid` 标记，每拍一个 16-lane probability word，并携带 `out_context`、`out_word_idx`、`out_lane_valid`。`CONTEXTS=1` 对应 AttAcc；`CONTEXTS=16` 对应 Fugue 的 16 个独立 Q context，容量仍严格为 16 KiB/context、合计 256 KiB。

注意 word index 与 word count 必须分离：2048/16=128 个 word，index 为 7 bit（0–127），count 需要 8 bit 才能表达数值 128。该实现已按此处理，避免 128 word 边界回卷。

### 周期结果

当前无跨 tile overlap 的控制器在 testbench 中实测：

```text
latency = 18 × ceil(seq_len / 16) + 6 cycles
2048 token = 128 tile = 2310 cycles
```

其中包括 collect、每 tile 的 exp/tree-sum/accumulate、一次 reciprocal，以及逐 tile normalization。

## 验证

新增并纳入 `testbench/run_tests.sh`：

| Testbench | 覆盖内容 |
| --- | --- |
| `tb_gemv_unit_modes.sv` | score mode 的 16→1 reduction；context mode 的 16 独立 accumulator；两次 context 累加。|
| `tb_softmax_buffer.sv` | score/exp 两 bank、同步读延迟、不同 context 的地址隔离。|
| `tb_streaming_softmax.sv` | 16-lane streaming collect、跨 tile global max/sum、输出 word 顺序与 lane mask；默认覆盖 2048 token。|

同时保留并更新 `tb_gemv_unit.sv`，使其明确以 score mode 验证 16 个 `1.0×1.0` 的归并结果为 `16.0`。

本次已运行通过：

```text
PASS tb_softmax_buffer
PASS tb_streaming_softmax (32 tokens): global 1/32，而非每 tile 的 1/16
PASS tb_streaming_softmax (48 tokens, 60 cycles): global approximately 1/48
PASS tb_streaming_softmax (2048 tokens, 2310 cycles): global approximately 1/2048
PASS tb_gemv_unit
PASS tb_gemv_unit_modes
PASS elaborate attacc_logic_die / fugue2_logic_die / fugue_logic_die / fugue_mq_a8
```

## 后续接入项

1. 在 AttAcc 顶层将 score GEMV 的结果按 `{context, word_idx}` 接入 `streaming_softmax_unit`，并将 probability 接入 PV/context GEMV。
2. 在 Fugue 顶层增加 Q-group ownership、ping-pong buffer 与同一 K block 的多 Q 调度；实例配置为 `CONTEXTS=16`，不可误用 AttAcc 的 1-context 容量。
3. 用 `softmax_buffer` 的 SRAM macro wrapper 替代 engine 内部行为数组，并完成读写端口、backpressure 与 reset/clear 策略。
4. 将 `18×ceil(L/16)+6` 的 RTL 延迟/可重叠关系注入 AttAcc–DRAMPIM 的 `PIM_SFM` 建模，得到端到端结果。

wxy：
1.除了上层logic die/control logic，其他RTL都somehow有对应的 testbench，至少可以先保证各计算单元本身的正确性。
2.考虑到综合面积占比主体是GEMV和softmax，我先把这两块缺的功能补了下。Softmax(Streaming? 我现在单纯用ai搓了个生草版)这块我现在想得还不太好，感觉需要找个大家都有空的时间和你讨论一下,我自己也找个神智清醒的时候重新捋一遍(原版直接放512KB Buffer也太糙了hhh)

等我回国登老贾的服务器，再康康28nm macro(希望我账号还在)





## 2026-08-28：段式 KV TLB 取代页级 `tlb.sv`

`rtl/tlb.sv`（32 × 2 KiB 页、VPN→PPN 全相联 CAM、线性页表 `PPN=base+VPN`）与 `tb_tlb` 已删除。
取而代之的是按 `attacc_drampim` 的 `CacheBlendTLB` 规模与功能实现的段式 TLB（`rtl/kv_*.sv`，设计说明与实测拍数见 `KV_TLB.md`）：

| 文件 | 作用 |
| --- | --- |
| `kv_tlb_pkg.sv` | drampim 几何常量（34-bit HBM 字节地址、256 B/向量、V = K + 8 MiB、master/diff 池）、`seg_desc_t`、`run_t`、`OP_*` |
| `kv_seg_tlb.sv` | 32 条全相联**区间** CAM（`vpos_start ≤ pos < vpos_end`），2 拍查表；按 `key_base` 最小优先迭代（两级锦标赛树）|
| `kv_ptw.sv` | 目录 `{ctx, layer, kind}` → 已排序段数组；demand miss 二分查找，`ATTACH` 整层装载 |
| `kv_scan_planner.sv` | 覆盖 `[lo,hi)` + 物理地址序合并，与 drampim `scan_runs` 逐 run 相等 |
| `kv_tlb_top.sv` | LOOKUP / PLAN / ATTACH / FLUSH 命令口 + run 流 + 单发 32 B 页表读口 |
| `direct_addr_plan.sv` | AttAcc 基线：同一端口，一条仿射 run，无表 |

接入方式：`attacc_controller` 的 TLB 逐列查表接口改为**地址规划口**——`PIM_MAC_AB` 的 `vaddr[15:0]` 是起始逻辑 token 位置、`len` 是行数，控制器发 `OP_PLAN`（ctx/layer/pools 来自新配置寄存器 `CFG_KVCTX`），逐 run、逐行、每行 8 个 32 B 列发 RD，仅在 DRAM 行变化时发 ACT；新增指令 `PIM_ATTACH`（`imm[0]=1` 为 flush）。Fugue / Fugue 2 / Fugue-MQ 的 `u_tlb` 为 `kv_tlb_top`，页表读口暴露为 die 端口 `pt_mem_*`；AttAcc die 用 `direct_addr_plan`。`CFG_KVBASE` 在 Fugue 中是页表目录基址（32 B 单位），在 AttAcc 中是 KV 向量基址。

验证：`testbench/gen_kv_tlb_vectors.py` 直接 import drampim 的 `CacheBlendTLB` 生成页表镜像与期望的 `locate` 地址 / `scan_runs` 列表；`tb_kv_tlb`（102 次查表 + 30 个 plan）、重写后的 `tb_attacc_controller` / `tb_attacc_controller_mac` 及全部既有回归通过，四个 die top 与 `kv_tlb_e16/e32/e64` 均可 elaborate。综合 filelist 已同步（`filelist_kvtlb.f` 与 `make kvtlb / kvtlb-hier / kvtlb-sweep`）；`AREA_BREAKDOWN.md` 中的 6,772 µm² 仍是旧页级 TLB 的数据，待重新综合。

附：`rtl/mq_bank_pe.sv` 的综合包装 `attacc_bank_pe` 补上了 `gemv_unit` 双模式改动后新增的 `context_result / context_result_valid` 输出端口（此前 `.*` 找不到匹配信号，`elaborate_all.sh` 在此中断），现在 `elaborate_all.sh` 17 个 top 全部通过。

## 2026-08-31:0830-02 —— 按 docs/Hardware Overhead.md 与论文 §4.3 的组件化重构

`rtl/0830-02` 为按层级严格定义重整后的快照(35 文件)。要点:
`gemv_unit` 重写为 16 乘法器 + **同一组** 16 加法器双模式切换(树/并行累加)
+ 单个双缓冲 16×256b 向量 buffer + 内置 pass 控制,矩阵操作数改为 DRAM 列读
流式输入;`dbuf_16x256` 恢复真双缓冲;新增 `accumulator_bg`(4→1,bypass/sum)、
`accum_buffer_bg`(8×FP16)、`accumulator_logic`(16-lane×4 字,bypass/sum)、
`causal_comparator`(论文 §4.4.2)、`dma_engine`;`attacc_controller` 升级
(batch/L 表、16-bank open-row 表 + 自动 PRE/ACT、tRCD/tRP/tRAS/tCCD 计数器、
run buffer + score/context 双遍历);controller 综合顶 `attacc_hbm_ctrl_top` /
`fugue_hbm_ctrl_top`(含 kv_tlb_top)。Logic die 按论文修正:softmax 不变,
**RoPE 移出 die(GPU 做,仅留消融点)**,增 per-channel diff decoder 与
causal comparator。删除 mac_tree16*/piped fp16/rotate_q_unit/mq_*/三个 die 顶层/
单副本 dbuf 宏实现/softmax_tile_unit/softmax_comparator_tree/kv_tlb_variants。
综合:`syn/run_dc_0830-02.sh`(逐组件,666 MHz 与 1.3 GHz 双频点,无自顶);
softmax 叶沿用 dc_0830-01 @699ps 结果(已覆盖 1.3 GHz,补跑 fp32_recip)。
文档:`docs/0830-02/Hardware_Overhead_Breakdown.md`(审查结论 + 滚加公式)。
验证:`testbench/0830-02/run_tests.sh` 6 组全过(GEMV 双模式/两级累加器/DMA/
两个 controller 顶层含 TLB 全流程/softmax_unit 功能 + causal + fp32 叶)。
iverilog-11 三个坑记录在 Breakdown §4(assign 读 unpacked 数组、二维数组端口、
循环头 genvar)。

## 2026-08-31(其二):0830-02 buffer 全部换 ASAP7 SRAM 宏 + Fugue accumulator buffer 扩容

- `dbuf_16x256_asap7.sv`(新):双缓冲 GEMV 向量 buffer 的宏实现,每副本
  16×`srambank_64x4x16`(256×16),fill/compute 各占一组宏避免单口冲突;
  与触发器版同名同口,DC profile `gemv`/`dbuf` 用宏版,`gemv_flop` 为参考点。
- `accum_buffer_bg.sv` 重写为单颗 `srambank_64x4x16` 宏(单口、写优先),
  容量参数化并给出两个综合顶:AttAcc `accum_buffer_bg_attacc`(8×FP16)、
  Fugue `accum_buffer_bg_fugue`(**64×FP16**)。扩容依据(论文 §4.3.1):
  MQ 命令下一次列读服务全部 n_cap=S/64=8 个驻留 query(多 Q × 同 K),每
  token 产出 8 个分数,按 query 复制 AttAcc 的 8 深暂存 → 8×8=64×FP16
  (128 B/BG,8×;整 stack 32 KiB vs 4 KiB)。context 侧流式/bypass,不扩容。
  注:两档同装一颗 256×16 宏,宏面积相同,容量差在位利用率(3.1%→25%)。
- softmax buffer 本就是宏(`softmax_buffer_sram`);diff decoder 的 D_i 表
  需 fwd/rev 双读口,保留触发器。测试套增补:宏版 dbuf 的 GEMV 全测、
  8/64 两档 buffer 读写,全部通过。
