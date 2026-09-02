# archived/rtl/rope — RoPE 单元（2026-09-02 归档）

原路径 `rtl/`。裁决（chenyi9 2026-09-02）：论文口径的 Fugue 在 GPU 上做 RoPE，
logic die 无旋转逻辑；"Fugue+RoPE" 消融不再作为正式配置，相关 RTL、run 与
roll-up 列全部移出正式目录。

| 文件 | 作用 |
|---|---|
| `rotate_q_bf16.sv` | BF16 RoPE 旋转单元（片上生成 sin/cos，输入只要角度） |
| `sincos_bf16.sv` | LUT + 插值的 BF16 sin/cos |
| `bf16_mult.sv`、`bf16_add.sv` | RoPE 用的 BF16 乘/加叶子（Genus 流程中作为冻结宏） |

对应的综合 run：`archived/syn/genus_0831_hier_reference/{bf16_mult_p1350, bf16_add_p1350, rope_p1501}/`
（`rotate_q_bf16` @666 MHz = 4,393 µm²，met）。重跑：该目录的 `run_reference.sh`。
