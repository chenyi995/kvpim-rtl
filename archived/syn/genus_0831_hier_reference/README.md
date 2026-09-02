# genus_0831_hier_reference — 三类配置之外的参考 run（2026-09-02 归档）

原路径 `syn/genus_0831_hier/<tag>/`。这些 run 属于同一次 Genus/ASAP7 战役、
同一脚本 `run_genus_0831.tcl`，但**不进论文的 AttAcc / Fugue / Fugue+RoPE
三类 roll-up**，所以移出正式目录。报告文件（qor/area/power/timing/gates）
完整保留，mapped 网表与日志按原惯例不入库。

| run | top | 周期 | 用途 | 现在谁还用它 |
|---|---|---:|---|---|
| `gemv_attacc_p1501` | gemv_unit + `dbuf_16x256_asap7`（SRAM macro buffer） | 1501.5 ps | AttAcc 原文 macro-buffer 配置，10,193 µm² | `syn/genus_0831_hier/collect.py` 读它算 **13.18 mm²/die 校准锚**（论文 §5 方法学引用） |
| `gemv_fugue_p769` | 同上 | 769 ps | 同配置 1.3 GHz，10,846 µm² | 无（bank buffer 裁决后被 flop 版取代） |
| `dbuf_p1501` / `dbuf_p769` | `dbuf_16x256_asap7` 单体 | 1501.5 / 769 ps | macro buffer 单体面积 8,123 µm²，支撑 flop-vs-macro 裁决 | `docs/ASAP7_SRAM_AREA_COMPARISON.md` 的讨论 |
| `kvtlb_p1501` | `kv_tlb_top` 单体 | 1501.5 ps | TLB 单体 3,463 µm²（controller 增量的解释） | 无，`ctrl_fugue_p1501` 已含 TLB |
| `recip_p699` | `fp32_recip` 单体 | 699 ps | 1,140 µm²，早期 softmax 拼装口径的补项 | 无，整合 array run 已含 recip |
| `accbuf_attacc_p1501_macro` / `accbuf_fugue_p769_macro` | `accum_buffer_bg_{attacc,fugue}`，宏版（`archived/rtl/accum_buffer_bg_asap7_macro.sv`） | 1501.5 / 769 ps | 250.5 / 250.7 µm²：16 B 与 128 B 装同一颗 512 B 宏，两档同面积 | 无；2026-09-02 裁决改 flop 阵列（正式 run `accbuf_*` 62.0 / 448.3 µm²） |
| `rerun*.log` | — | — | 战役驱动脚本三次续跑的 stdout | 历史 |

重跑：`./run_reference.sh`（使用正式目录的 tcl、`libs_ps/` 与叶子网表，结果写回本目录）。
