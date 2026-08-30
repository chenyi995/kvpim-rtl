# 0830-01 RTL 综合总结

## 范围

本轮对象是 `rtl/0830-01` 的 softmax 数据通路重构及其 DC/ASAP7
综合试验。RTL 快照包含 45 个 SystemVerilog 文件（共 6,995 行）；其中新增
`softmax_pe`、`softmax_tile_unit` 和 `softmax_array_256`，将 softmax 计算组织为
可复用 PE、16-PE channel 和 16-channel（共 256 PE）三级结构。`softmax_buffer_sram`
使用 ASAP7 SRAM 宏；全阵列顶层预期以 `softmax_pe` 的 `.db` 宏视图连接，避免在
channel/array 层重复展开 PE。

## 综合设置

- 工具/库：Design Compiler，bundled ASAP7 RVT/TT NLDM standard-cell 库；涉及
  buffer 的配置另链接 generated ASAP7 SRAM `.db`。
- 目标周期：699 ps（约 1.431 GHz）；对应 HBM3 的 769 ps tCK 再提高 10% 的 PE
  时钟目标。
- 约束：输入、输出延迟均为周期的 30%，输出负载 0.005，`rst_n` 为 false path。
- 流程：`compile -map_effort low -area_effort low`；带 `_hold` 的试验额外执行
  `set_fix_hold` 与 `compile -incremental -only_hold_time`。因此以下数字是早期
  PPA/架构比较结果，不是 sign-off。

相关脚本在 `syn/run_dc_asap7.tcl`；结果保存在 `syn/dc_0830-01/`。PE 的已编译
宏视图为 `syn/softmax_pe.db` / `syn/softmax_pe_macro.lib`。

## 已闭合的 699 ps 叶级结果

|配置（结果目录）|关键路径 (ps)|setup slack (ps)|hold WNS (ps)|单元面积|结论|
|---|---:|---:|---:|---:|---|
|FP32 add，3 stage + I/O + hold (`fp32_add_s3_p699_io0_hold`)|631.33|+0.32|0.00|211.51|setup/hold 均满足|
|FP32 exp，11 stage + I/O + hold (`fp32_exp_s11h_p699_io0_hold`)|633.94|+1.07|0.00|1013.19|setup/hold 均满足|
|FP32 mul，2 stage + I/O + hold (`fp32_mul_s2_p699_io0_hold`)|643.95|+0.15|0.00|602.02|setup/hold 均满足|
|softmax PE，I/O + hold (`softmax_pe_s0_p699_io0_hold`)|635.14|+0.28|0.00|1836.88|作为宏的叶级实例可用|

面积单位为 DC 在 ASAP7 库下报告的 cell area；不含布线寄生，因此只适合同一
库/约束下横向比较。三项算术单元及 PE 的 TNS、违反路径数均为 0，且 hold 违反数为 0。

## 已选管线配置

本次只归档用于后续集成的最终配置，不保存中间流水深度搜索的综合目录：
`fp32_add` 采用 3 stage，`fp32_mul` 采用 2 stage，`fp32_exp` 采用 11 stage 并作
hold 修复。各自的最终 QoR 已列于上表；中间候选是一次性架构探索，不作为可复现基线。

## 顶层状态与后续工作


下一步应在同一约束下完成并保留`softmax_array_256`（16 channel）的完整 QoR/area/timing 报告，确认 `.db` 宏链接、
SRAM 宏实例数量以及顶层 setup/hold；之后再把层级面积与 16/256 倍数估算进行对照。
