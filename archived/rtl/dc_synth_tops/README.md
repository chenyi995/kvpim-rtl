# archived/rtl/dc_synth_tops — 仅 DC 流程使用的综合 top（2026-09-02 归档）

原路径 `rtl/0830-02/`（整理后为 `rtl/`）。这两个文件不被 Genus 权威矩阵
`syn/genus_0831_hier/run_all.sh` 和 `testbench/run_tests.sh` 引用，只被已归档的
DC 脚本 `archived/syn/run_dc_asap7.tcl`、`archived/syn/filelist_softmax_channel_macro.f` 使用。

| 文件 | 作用 | Genus 流程里的替代 |
|---|---|---|
| `softmax_buffer_dc_tops.sv` | DC 单独综合 softmax buffer 的两个 top（`softmax_buffer_attacc_32kb` / `softmax_buffer_fugue_256kb`） | 整合 array run `sfmarray_*` 直接实例化 `softmax_buffer_sram`，无需单独 top |
| `softmax_pe_blackbox.sv` | `(* black_box *)` 版 `softmax_pe` 声明，DC 把 PE 当宏时替换源文件 | Genus 读入 `sfmpe_p699/softmax_pe_mapped.v` 并 dont_touch，不需要黑盒声明 |
