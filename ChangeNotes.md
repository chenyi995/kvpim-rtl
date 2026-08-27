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

---

## cy 回复（2026-08-25）：softmax 不用 stream，只有 P 是 stream

宸逸问的"softmax 要不要 streaming、512KB buffer 是不是太糙"——结论是：
**softmax 本体就是 buffer 式，不用 stream；真正 stream 的只有 P。**
和 AttAcc 原文对齐后的口径（论文 `audit/2026-08-25_bank_dataflow_reuse.md`）：

1. **softmax 天生要 buffer。** 它要先拿到整条长度 `L` 的 score 才能算
   `max` / `sum` / 归一，做不到不存就出结果（除非上 flash/online 那套带
   running-max 的 rescale，我们不用）。所以 `score_bank + exp_bank` 存整条
   是**必需**的，不是糙——AttAcc 那个 512 KB buffer 就是这个 input+output
   buffer，本身没问题。**我们和 AttAcc 的唯一区别是容量按 `n_q` 放大**：
   AttAcc 存 1 条 context，Fugue 的 MQ 要存 `n_q` 条 per-agent 向量
   （`CONTEXTS=16` → 256 KiB，正是你算的那个数，< 512 KiB）。

2. **真正流式的是 P，依据是复用次数（AttAcc 是一 head 一 channel=64 banks，
   一个 head 的 L 个 token 摊在该 channel 的 16 个 bank group 上）：**
   - **Q 复用 = `L/16`**：一段 `d_head/4` 的 Q 片，本 bank 那 `L/16` 个
     token 每个都要用它扫一遍 → 复用极高 → **驻留在 GEMV buffer 里**。
   - **P 复用 = 2**：一个 `P[t]` 对应 `d_head/4 = 32` 个输出维，但一拍只算
     16 个 lane，32/16 = **2 拍**就用完 → `P[t]` 只被用 2 次 → 复用近零 →
     **驻留买不到东西 → 从 die 流给 bank 的乘法器（stream）**。
   MQ 批 `n_q` 个 agent 时更不该驻留 `n_q` 份 P，所以 P 一律流式。

3. **所以 `streaming_softmax_unit` 里的 "streaming" 名字有点误导。** 它其实是
   (a) 16-lane tile 逐块扫这条 score，(b) normalize 阶段把算出的 P **流给**
   context GEMV——softmax core（`score_mem` + `exp_mem` 两块 SRAM）**仍然是
   buffer**，就是 AttAcc 那 512 KB 的东西。它**不是**不存整条的 flash/online
   流式。改天要不把模块改名叫 `tiled_softmax_unit` 之类，省得读的人以为
   softmax 本身不缓存。

4. **落地口径：** die 上 softmax = **一个按 `n_q` 放大的 buffer**
   （`CONTEXTS=16` → 256 KiB，容量口径没问题，别误用 AttAcc 的 1-context 容量）；
   **只有 P 是 stream**（走 TSV，容量轴只约束 Q）。后续接入项 1/2 照这个来就对。




---

## cy 更新（2026-08-27）：顶层链接已实现（接入项 1/2）

**接入项 1 — AttAcc 顶层（`attacc_logic_die`）完整数据流已链接**：

```text
score MAC_AB 流 → accumulator 标量 score（FP16）
  → score collector（fp16→fp32，凑 16-lane word，按 token 计数）
  → streaming_softmax_unit（CONTEXTS=1，score/exp 两 bank buffer）
  → P word（FP32）→ fp32→fp16 → 回写 GEMV vec buffer（P 是 stream）
  → context MAC_AB（OP_CONTEXT，per-lane 累加）→ ctx_out[255:0]
```

实现要点：
- `attacc_controller` 新增 `mac_done` 一拍脉冲（`S_MAC_DONE`）。score 模式下
  每条 MAC_AB 退休 = 一个 token score 完成；顶层把该脉冲延迟 12 拍
  （覆盖 buffer 读 + mult + 4 级 tree + 跨 unit accumulator 的流水延迟）后
  提交 accumulator 的最新值到 collect word。下一条 MAC 的首个结果最早在
  `mac_done+17` 才会落地，12 拍提交点安全（TB 实测验证）。
- 新增 `rtl/fp_convert.sv`：`fp16_to_fp32`（精确加宽）/ `fp32_to_fp16`
  （RNE + FTZ，上溢→inf），风格与库内 fp16 单元一致。
- P 回写占用 vec 写口（内部优先，外部 host 填充让路），地址 =
  softmax `out_word_idx`。vec buffer 16 word ⇒ 一次驻留 context 相位覆盖
  L≤256（`SM_MAX_TOKENS` 顶层参数，默认 256，flop 模型防面积爆炸；
  2048-token 的完整容量走 `softmax_buffer` SRAM wrapper，口径不变）。
- `gemv_unit` 的 `context_result` 首次接到顶层：`ctx_out`/`ctx_out_valid`
  输出 unit0 的 16 lane，其余 unit 经 parity fold（`ctx_chk`）保持可观测。
- 旧的单 tile `softmax_unit` 从 AttAcc 顶层移除（fugue/fugue2 顶层暂保留原状）。

**接入项 2 — MQ 顶层（`fugue_mq_logic_die`）**：`softmax_unit` 换成
`streaming_softmax_unit`（`CONTEXTS=AGENTS`，per-agent score/exp bank）。
`mq_score_store` 读口比合并写晚一拍，把"master 被 diff 覆写后"的 assembled
word 依序喂入 softmax；反向 P 流经 `mq_diff_decoder` 的 rev 口按
`out_word_idx` 做 master/diff 拆分。约定：一个 agent 的整行连续流入
（word 0..n-1，agent 在 word 0 锁存），per-agent 状态住在 CONTEXTS 维的
bank 里。

**验证**：新增 `testbench/tb_attacc_top_link.sv`（已入 `run_tests.sh`），
端到端：32 token 等值 score → P=1/32（`fp32_recip` LUT 近似差 ~1ULP，
容差判定；fp16 narrowing 后精确 0x2800）→ P 回写 → context MAC →
`ctx_out` 全 lane 精确 = 2.0。VCS 实测 PASS。四个 top（attacc/fugue/
fugue2/fugue_mq_a16）Genus elaboration 通过。
