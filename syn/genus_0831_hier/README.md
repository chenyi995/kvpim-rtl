# genus_0831_hier — Genus/ASAP7 层次化（leaf-as-macro）综合矩阵

对 `rtl/0830-02` 组件集的独立复跑（与 `syn/dc_0830-02` 的 DC 矩阵同口径），
外加两个整合 softmax array top（"整体"）。全部脚本、转换器与各 run 的
qor/area/power/timing/gates 报告都在本文件夹；mapped 网表、fv/、genus
运行日志为可再生大件，不入库（与 dc_0830-02 的惯例一致，重跑
`./run_all.sh` 即可复现）。

## 方法学

- **Leaf-as-macro（冻结网表）**：乘法器/加法器叶子（fp16/bf16/fp32 的
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
   `rtl/0830-02`）：`srambank_*_6t122` 是 latch 型 macro，读数据在时钟
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

矩阵内容：phase 1 叶子 8 个；phase 2 组件 17 个（bank/BG/logic die/HBM
controller，对齐 dc_0830-02 的 top 与频率）；phase 3 整合
`softmax_array_256`（AttAcc CONTEXTS=2 / Fugue CONTEXTS=16，
`sfm_array_tops.sv` 包装，softmax_pe 冻结为 macro）。层级 roll-up 公式与
计数（N_gemv=2048、N_bg=256、N_ch=16）沿用
`docs/0830-02/Hardware_Overhead_Breakdown.md`。
