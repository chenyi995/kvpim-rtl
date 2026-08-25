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



