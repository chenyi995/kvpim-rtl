# genus_0831_hier_reference — 三类配置之外的参考 run（2026-09-02 归档）

原路径 `syn/genus_0831_hier/<tag>/`。这些 run 属于同一次 Genus/ASAP7 战役、
同一脚本 `run_genus_0831.tcl`，但**不进论文的 AttAcc / Fugue / Fugue+RoPE
三类 roll-up**，所以移出正式目录。报告文件（qor/area/power/timing/gates）
完整保留，mapped 网表与日志按原惯例不入库。

| run | top | 周期 | 用途 | 现在谁还用它 |
|---|---|---:|---|---|
| `gemv_attacc_p1501` | gemv_unit + `dbuf_16x256_asap7`（SRAM macro buffer），IEEE 叶子（2026-09-02 重跑） | 1501.5 ps | AttAcc 原文 macro-buffer 配置，10,557 µm² | `syn/genus_0831_hier/collect.py` 读它算校准锚：**13.85 mm²/die vs 原文 13.12** |
| `gemv_fugue_p769` | 同上 | 769 ps | 同配置 1.3 GHz，11,703 µm² | 无（bank buffer 裁决后被 flop 版取代） |
| `gemv_attacc_p1501_ftz` / `gemv_fugue_p769_ftz` | 同上，flush-to-zero 叶子（IEEE 改造前） | 1501.5 / 769 ps | 10,193 / 10,846 µm²（当时锚点 13.18 → BG flop 后 13.12） | 历史 |
| `dbuf_p1501` / `dbuf_p769` | `dbuf_16x256_asap7` 单体 | 1501.5 / 769 ps | macro buffer 单体面积 8,123 µm²，支撑 flop-vs-macro 裁决 | `docs/ASAP7_SRAM_AREA_COMPARISON.md` 的讨论 |
| `kvtlb_p1501` | `kv_tlb_top` 单体 | 1501.5 ps | TLB 单体 3,463 µm²（controller 增量的解释） | 无，`ctrl_fugue_p1501` 已含 TLB |
| `recip_p699` | `fp32_recip` 单体 | 699 ps | 1,140 µm²，早期 softmax 拼装口径的补项 | 无，整合 array run 已含 recip |
| `accbuf_attacc_p1501_macro` | AttAcc 16 B BG buffer，SRAM 宏实现 | 1501.5 ps | 250.5 µm²（正式选用 flop 62.0） | 2026-09-02 裁决「各取最优」的对照点；重跑用 `accum_buffer_bg_ref_tops.sv` |
| `accbuf_fugue_p769_flop` | Fugue 128 B BG buffer，flop 阵列实现 | 769 ps | 448.3 µm²（正式选用宏 250.7） | 同上 |
| `accbuf_fugue_p769_macro` | Fugue 128 B，宏实现，整理前的原 run | 769 ps | 250.7 µm²，与正式 `accbuf_fugue_p769` 重跑结果相同 | 历史 |
| `rope_p1501` | `rotate_q_bf16`（`archived/rtl/rope/`） | 1501.5 ps | 4,393 µm²，met；Fugue+RoPE 消融时 die 上加 1 个 | 裁决 2026-09-02：RoPE 不进正式结果 |
| `bf16_mult_p1350` / `bf16_add_p1350` | RoPE 用的 BF16 叶子，紧时钟冻结网表 | 1350 ps | 39.6 / 35.4 µm² | 仅 `rope_p1501` 读取 |
| `rerun*.log` | — | — | 战役驱动脚本三次续跑的 stdout | 历史 |

重跑：`./run_reference.sh`（使用正式目录的 tcl、`libs_ps/` 与叶子网表，结果写回本目录）。
