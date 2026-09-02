# SRAM macro 生成与集成计划(2026-08-23,宸逸裁决版)

目标读者:接手人;概念首现即释。本页是 `sram_macros_needed.txt`(七颗
macro 名单)的配套计划:为什么要、怎么生成、怎么集成、怎么跑、怎么入账。

## 0. 背景与裁决(宸逸,2026-08-23)

此前全部 buffer 用触发器 (flop) 实现(仓库旧惯例),约 105k µm²/KB
(N28 实测差分),**高估**存储面积;本机 PDK 装有 TSMC N28 SRAM
compiler(MC2,`/data2/tools-additional/pdk/N28/installed/memory`)。
裁决三条:**① 存储改用真 SRAM macro;② 不拼 macro(两个小的不等于
一个大的——宽度、深度都要精确规格);③ 全部单口**(逐存储并发论证:
dbuf 与 BG context 队列按半区各配一颗、任意拍单操作;score 收集阵
到达流串行、第 4 份旁路合并,每拍恰一次端口操作)。

## 1. 七颗 macro(名单见 sram_macros_needed.txt)

家族:UHD 单口 `tsn28hpcpuhdspsram_20120200_170a`,CM=1
(范围:深 8–128,宽 16–288;深度下限 8)。**现状:0/7 已生成**
(PDK 内 54 个带完整视图的实例全部 ≥128 深/≤144 宽,与需求错开)。

| macro | 规格 | 用量 | 用途 |
|---|---|---|---|
| ...16X256M1SWBSO | 16×256 | 2/PE @(8,1) | bank PE dbuf 半区(fill/drain 各一) |
| ...32X256M1SWBSO | 32×256 | 2/PE @(16,2) | 同上 |
| ...64X256M1SWBSO | 64×256 | 2/PE @(32,4) | 同上 |
| ...8X256M1SWBSO | 8×256 | 2/BG | BG context 队列两半各一;(16,2)/(8,1) 深度半用(compiler 下限 8) |
| ...8X64M1SWBSO | 8×64 | 1/BG @(8,1) | BG score 收集阵(BWEB 16b 段写,第 4 份旁路) |
| ...16X64M1SWBSO | 16×64 | 1/BG @(16,2) | 同上 |
| ...32X64M1SWBSO | 32×64 | 1/BG @(32,4) | 同上 |

## 2. 生成步骤(MC2)

1. cfg:256 宽系从
   `compilers/tsn28hpcpuhdspsram_20120200_170a/ts1n28hpcpuhdhvtb1024x256m1swbso_DS.cfg`
   改 `NWORD=8/16/32/64` 与 Memory_Name;64 宽系从现成
   `ts1n28hpcpuhdhvtb16x64m1swbso.cfg` 改 `NWORD=8/32`;
2. 运行:`tools/MC2_2012.02.00.d/bin/mc2-eu-64 -c <mco> ...`(七颗可并行);
3. **验收(每颗都要,缺一即重跑)**:NLDM 全 corner(至少
   ssg0p81v125c / ffg0p99vm40c / tt0p9v25c)、VERILOG、LEF、GDS+CDL、
   datasheet——只有 LEF 的实例(历史遗留那批)不算生成完成。

## 3. 集成步骤(本仓库)

1. `rtl/dbuf_sram.sv` **重写**:废除拼宽版;每半区单颗 256 宽 macro
   (16/32/64 深按配置 generate 选型),黑盒实例化,BIST/SLP/SD/镜像口
   tie 死;同名替代 `dbuf_16x256`,filelist 切换 flop/SRAM 口径;
2. `rtl/mq_bg_reduce.sv` 存储改 SRAM:context 两半各一颗 8×256;
   score 收集阵一颗 64 宽(段写 BWEB,凑齐第 4 份旁路进 4:1 树);
   flop 版保留作对照口径;
3. `syn/tsmcn28_mmmc.tcl`:三视图各加七颗的对应 corner lib
   (SS→ssg0p81v125c,FF→ffg0p99vm40c,TT→tt0p9v25c;宏电压档与
   逻辑 0.72/0.88/0.8V 不同,属最近邻近似,报告注明);
4. filelist:`filelist_bankpe_sram.f`、`filelist_bg_sram.f`。

## 4. 综合计划

12 点全并行(宸逸:64 核可用,每点 `max_cpus_per_server 8`):
bank PE SRAM 版 3 配置 × {667 MHz, 1.3 GHz} + BG SRAM 版 3 × 2。
脚本沿 `run_bg_sweep.sh` 的 mqrun 配方。flop 版 BG sweep 已停,
不再单独跑(SRAM 版为准;flop 对照点按需补)。

## 5. 收数与入账

1. `collect_mq_results.py` 增列 SRAM 版 12 点;
2. 与 flop 口径并排对照(buffer 面积差 = macro 收益);
3. 重算 in-bank 面积上限表(kvpim-sim `docs/README_bg_reduction.md`
   的 TBD 项、audit 06 的 die% 账):128×A_bankPE + 32×A_BG ≤ 25% 预算;
4. 数字进论文前口径不变:只报相对 AttAcc 基线的倍数/占比。

## 6. 当前状态(2026-08-23)

- 七颗 macro:待生成(0/7);
- `dbuf_sram.sv`:拼宽版作废待重写;`mq_bg_reduce.sv`:flop 版已可综合,
  SRAM 化待 macro;
- mmmc:已回滚干净;flop 版 BG sweep:已停;
- 下一步动作等宸逸指令:生成七颗 → 验收 → 集成 → 12 点并行综合 → 入账。
