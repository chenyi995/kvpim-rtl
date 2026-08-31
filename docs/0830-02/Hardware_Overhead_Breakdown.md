# 0830-02:RTL 审查结论、DC 脚本与各层级硬件 overhead 计算

对象:`rtl/0830-01` → `rtl/0830-02`,依据 `docs/Hardware Overhead.md` 与 Fugue
论文 §4.3(bank / bank group / logic die 三级微架构、Fig. 5)。评估三类设计
(AttAcc、Fugue 无 RoPE、Fugue 有 RoPE 消融版)在 bank、BG、logic die、
HBM controller 四个层面的硬件 overhead。综合脚本:
`syn/run_dc_0830-02.sh` + `syn/run_dc_asap7_0830-02.tcl`,逐组件出面积,
**不做自顶综合**;各层 overhead 用本文第 5 节的公式由组件面积滚加。

---

## 1. 0830-01 审查结论

### 1.1 正确、直接沿用(不重写、不重综合)

| 文件 | 判定依据 |
|---|---|
| `fp16_add/mult.sv`、`bf16_add/mult.sv` | 1 拍寄存输出算术叶,回归通过(`tb_fp16_bf16_arith`) |
| `fp32_add/mul/exp/recip.sv` | softmax 叶;见 §1.2 的时序核查 |
| `softmax_pe/unit/array_256/buffer_sram/buffer_dc_tops/pe_blackbox.sv` | 文档明示"softmax 不变";`softmax_buffer_sram` 仅做了仿真兼容性微调(读出数组改 packed 向量、genvar 提升到模块级),综合语义不变 |
| `kv_tlb_pkg/kv_seg_tlb/kv_ptw/kv_scan_planner/kv_tlb_top.sv` | drampim `CacheBlendTLB` 的硬件化,已对拍验证(`tb_kv_tlb`,102 lookups/30 plans 逐 run 相等);本轮 `tb_fugue_ctrl_0830_02` 里再次全流程(ATTACH→PLAN→合并 run)通过 |
| `direct_addr_plan.sv` | AttAcc 基线仿射地址路径,接口不变 |
| `diff_decoder.sv` + `diff_decoder_channel_dc_top.sv` | 论文 §4.3.3 的 D_i map(元数据缓冲 + 前缀 popcount 散射 + mask gate),`tb_diff_decoder` 通过 |
| `rotate_q_bf16.sv`、`sincos_bf16.sv` | 文档要求 RoPE RTL 不改;仅用于"有 RoPE 版"消融(见 §3) |
| `fugue_pkg.sv` | 修正两处:`PIM_MV_SB/MV_GB` 注释方向按原始 attacc_drampim 代码约定纠正(MV_SB=搬去 softmax buffer);新增 `CFG_BATCH` 与 `REQ_TABLE_DEPTH`(论文 config memory 的 batch size / per-request L 表) |

### 1.2 softmax 既有综合结果核查(文档要求)

`syn/dc_0830-01` 四项 @699 ps(≈1.431 GHz,比 1.3 GHz 的 769 ps 更严):

| 结果目录 | setup slack (ps) | hold 违例 | cell area (µm²) |
|---|---:|---:|---:|
| `fp32_add_s3_p699_io0_hold` | +0.32 | 0 | 211.51 |
| `fp32_exp_s11h_p699_io0_hold` | +1.07 | 0 | 1013.19 |
| `fp32_mul_s2_p699_io0_hold` | +0.15 | 0 | 602.02 |
| `softmax_pe_s0_p699_io0_hold` | +0.28 | 0 | 1836.88 |

四项 TNS=0、违例路径=0、hold=0 → **699 ps 闭合即已覆盖 1.3 GHz 要求,
softmax 无需重综合**。缺口:`fp32_recip`(每 channel 引擎 1 个)当时未归档,
新矩阵补跑一项 `recip_p699`。

### 1.3 重写(不符合文档/论文的严格定义)

| 新文件 | 原因与新定义 |
|---|---|
| `gemv_unit.sv` | 旧版用 15+1 树加法器 **另加** 16 个独立 context 加法器(共 32 个),且矩阵、向量各配一个 buffer。新版严格按 AttAcc §5.1/文档:**16 乘法器 + 同一组 16 加法器在树模式(0..14 树 + 15 标量累加)与 16 路并行累加模式间切换**;只保留**一个双缓冲 16×256b 向量 buffer**(PIM_WR_GB/MV_GB 写入侧),矩阵操作数由 DRAM 列读流式进入(PIM_MAC_AB "reads … from DRAM cells and GEMV buffers");内置控制单元(pass 协议:`pass_start{op,num_beats,acc_clr}` + 逐拍 `mat_valid`,score 每 token 一个树 pass,context 每 16 维 chunk 一个并行累加 pass,`acc_clr=0` 支持跨 run 链式累加) |
| `dbuf_16x256.sv` / `dbuf_16x256_asap7.sv` | 旧版退化为单副本;恢复**真双缓冲**(2×16×256b,`swap` 交换 fill/compute 角色),每 256b 表项存 16×FP16。两个实现同名同口:`dbuf_16x256.sv` 触发器版(可移植仿真),`dbuf_16x256_asap7.sv` **ASAP7 SRAM 宏版**(每副本 16×`srambank_64x4x16`,fill/compute 各占一组宏,单口无冲突;DC 用此版) |
| `accumulator_bg.sv` | 旧 `accumulator.sv` 是参数化 N 树 + 常开累加,且 `accumulator_bg_dc_top` 用 N=8。新版按文档:**并行输入 4×FP16 → 输出其和 1×FP16(3 个 fp16_add 两级树,延迟 2)**;**bypass 模式**把 4 个输入逐拍串行直通(列切分时各 bank 结果已完整) |
| `accum_buffer_bg.sv` | 新增:BG 级 accumulator buffer,**ASAP7 SRAM 宏**(1×`srambank_64x4x16`,单口、写优先、1 拍读)。容量参数化:**AttAcc DEPTH=8(8×FP16)/ Fugue DEPTH=64(64×FP16)**,扩容依据见 §2.5;综合顶 `accum_buffer_bg_attacc` / `accum_buffer_bg_fugue` |
| `accumulator_logic.sv` | 新增:logic die 每 channel 一个的 context 累加器,**每拍输入 1 个 16×FP16 字,4 个字后输出 lane-wise 和**;bypass 模式逐字直通。16 lane 各配 fp16_add + 保持寄存器(fp16_add 输出寄存器自由运行,累加反馈必须走 valid 门控的保持寄存器 + 前递,详见代码注释) |
| `causal_comparator.sv` | 新增(论文 §4.3.3/§4.4.2):bank 侧 prefill 全范围扫描时,丢弃位置在 query 之后的 key 分数;16 lane 位置比较 → keep mask,寄存输出 |
| `attacc_controller.sv` | 按论文 controller 结构与 attacc_drampim 源码升级:指令 FIFO+译码器;config memory 补齐 **batch size + per-request L 表(32×16b,PIM_SET_CONFIG cfg_idx=CFG_BATCH、imm[15]=1 写表)**;**16 bank open-row 表** + 自动 PRE/ACT 插入(preq 语义);**tRCD/tRP/tRAS/tCCD 计数器**门控命令发射(HBM3-5.2Gbps 换算到 666 MHz 拍);**run buffer(16 项)** 缓存 plan 结果,score 按 token 逐 pass、context 按 d_head chunk 重放 run;对接新 GEMV pass 协议;MV_SB/RD_SB/WR_GB/ACT_AB 各自成脉冲 |
| `dma_engine.sv` | 新增(论文:"data transfer is supported by the DMA engine"):描述符驱动的 256b 搬运引擎,4 深 staging FIFO,读侧可超前于写侧 |
| `attacc_hbm_ctrl_top.sv` | AttAcc controller 综合顶层 = controller 核 + `direct_addr_plan` + DMA |
| `fugue_hbm_ctrl_top.sv` | Fugue controller 综合顶层 = controller 核 + `kv_tlb_top`(diff 块地址管理)+ DMA,页表口 `pt_mem_*` 外露 |

### 1.4 删除(无效 / 超出定义 / 被取代)

| 文件 | 原因 |
|---|---|
| `mac_tree16.sv`、`mac_tree16_piped.sv`、`mac_tree16_variants.sv` | Fmax 实验件,是 gemv_unit 算术的子集,不是文档定义的组件 |
| `fp16_add_piped.sv`、`fp16_mult_piped.sv` | 文档明确"不改 GEMV RTL、只改 dc 频率约束",深流水变体不再需要 |
| `rotate_q_unit.sv` | FP16 流式系数旧版,被 `rotate_q_bf16`(片上 sincos)取代 |
| `mq_bank_pe.sv`、`mq_bg_reduce.sv`、`mq_diff_decoder.sv`、`fugue_mq_logic_die.sv` | MQ 结构探索件,不在文档四层定义内 |
| `attacc_logic_die.sv`、`fugue_logic_die.sv`、`fugue2_logic_die.sv` | 不做自顶综合;各层 overhead 由组件面积滚加(§5),且其 gemv/controller 接口已换代 |
| 旧 `dbuf_16x256_asap7.sv`、`dbuf_sram.sv` | 0830-01 的宏实现是**单副本**,与"双缓冲"定义冲突;0830-02 重写为双宏组双缓冲版(见 §1.3),TSMC N28 版 `dbuf_sram.sv` 弃用 |
| `softmax_tile_unit.sv` | 无 buffer 的旧 tile 版;`softmax_array_256` 实际实例化的是带 SRAM 的 `softmax_unit` |
| `softmax_comparator_tree.sv` | 无实例引用(softmax_unit 内联了自己的 max 树) |
| `kv_tlb_variants.sv` | e16/e32/e64 sweep 包装,非组件 |

---

## 2. Logic Die 层修正(依论文 §4.3.3 / Fig. 5,用户指示)

softmax 不变;其余按论文增删:

- **删:RoPE 不在 die 上。** 论文 §4.2:"the GPU … rotates the query it is
  about to send … the die needs no rotation logic" —— per-agent RoPE 在
  GPU 上完成,logic die **零旋转逻辑**。`rotate_q_bf16` 仅保留为
  `docs/Hardware Overhead.md` 要求的"Fugue 有 RoPE 版"消融点单独综合
  (tag `rope_p1501`),不计入论文口径的 Fugue die。
- **保留:每 channel 1 个 Accumulator(共 16 个)。** Fig. 5b "Per channel:
  Accumulator, D_i map, Softmax unit, Buffers";即 §4.3.3 的 context adder
  ("sums the partial contexts across the banks, the channels, and the two
  sides"),对应 `accumulator_logic`(16-lane×4 字,bypass/sum)。
- **增:每 channel 1 个 D_i map / diff decoder(Fugue)。** 元数据缓冲
  (每 score word 一个 16b bitmap)+ 写过滤(master 分数进 softmax buffer
  的 filter)+ 回流 mask gate + 紧凑 diff 流散射,即 `diff_decoder`
  (综合顶 `diff_decoder_channel_dc_top`),16 实例。
- **增:每 channel 1 个 causal comparator(Fugue)。** §4.4.2 bank 侧
  prefill 的因果丢弃,`causal_comparator`,16 实例。
- TLB 按用户裁决维持在 **HBM Controller 层**(与 Fig. 5c 一致:TLB 在
  memory-system controller 内)。

### 2.5 Buffer 宏化与 accumulator buffer 容量评估

**驻留 query 数**(论文 §4.3.1):每 bank 持有每个 key 的 d/4=32 维切片,
一个 query 切片 = 32×2B = 64B;GEMV buffer S=512B →
**n_cap = S/64 = 8 个驻留 query**("eight in AttAcc's 512-B buffer",
GEMV buffer 本身不扩容,"adds nothing")。

**BG accumulator buffer**:
- AttAcc:每次 scan 1 个 query 在飞,8×FP16 = 16B 是 8 个 token 分数在
  MV_SB 上传前的暂存深度(攒批走 TSV,避免逐分数付总线换向)。
- Fugue:MQ 命令下**一次列读服务全部 8 个驻留 query**(多 Q × 同 K),
  每个 token 产出 8 个分数——每个暂存位需要按 query 复制。保持与
  AttAcc 相同的每 query 暂存深度(8):
  **容量 = n_cap × 8 = 64×FP16 = 128 B/BG,放大 8×**;
  整 stack:256 BG × 128B = 32 KiB(AttAcc 为 4 KiB)。
  下界是 8×FP16(每 query 1 slot、逐 token 立即上传),但会把 MV 流量打散
  到 token 粒度、反复吃 TSV 读写换向(nRTW/nWTRL),不取。
- context 侧概率流式、partial context bypass 直通(§4.3.2),不随驻留数
  扩容 → 容量由 score 侧决定。

**宏映射**(可用编译宏最小 256×16,`srambank_64x4x16_6t122`):

| Buffer | 实现 | 宏用量 | 位利用率 |
|---|---|---|---|
| GEMV 向量 buffer(双缓冲 2×16×256b=1 KiB) | `dbuf_16x256_asap7` | 2 组 × 16 宏/GEMV unit | 6.25% |
| BG accum buffer,AttAcc 8×FP16 | `accum_buffer_bg_attacc` | 1 宏/BG | 3.1% |
| BG accum buffer,Fugue 64×FP16 | `accum_buffer_bg_fugue` | 1 宏/BG | 25% |
| softmax buffer(已是宏) | `softmax_buffer_sram` | AttAcc 14 宏/channel,Fugue 28 宏/channel | — |

注意:8 与 64 项都装进同一颗 256×16 宏 → **换宏后两档 BG buffer 的宏面积
相同**,架构差异体现在容量位数(16B vs 128B);报告两个口径都给。
diff decoder 的 D_i 元数据表(128×16b/channel)每拍要为 fwd/rev 两个不同
word 索引各出一个读口,单口 SRAM 无法满足,保留触发器实现;controller 的
指令 FIFO / run buffer 属控制寄存器,不宏化。

---

## 3. 三类设计的组件构成

| 层级 | AttAcc | Fugue(无 RoPE,论文口径) | Fugue(有 RoPE 消融) |
|---|---|---|---|
| Bank | 2×gemv_unit @666 MHz | 2×gemv_unit @1.3 GHz(同 RTL) | 同 Fugue |
| BG | accumulator_bg + accum_buffer_bg @666 MHz | 同左 @1.3 GHz | 同 Fugue |
| Logic die | 16×accumulator_logic + softmax | + 16×diff_decoder + 16×causal_comparator | 再 + 1×rotate_q_bf16 @666 MHz |
| Controller | attacc_hbm_ctrl_top(instr Q/译码/config/addr FSM + DMA + direct_addr_plan) | fugue_hbm_ctrl_top(同核 + DMA + kv_tlb_top) | 同 Fugue |

---

## 4. 功能验证(iverilog,全部通过)

`testbench/0830-02/run_tests.sh`:

| TB | 覆盖 |
|---|---|
| `tb_gemv_unit_0830_02` | score 树模式(逐 lane 不同值,8 拍 d_head 累加=1088)、背靠背两 pass、context 广播选 lane(S=[1,2,1,2]×V[l]=l+1)、`acc_clr=0` 链式累加 |
| `tb_accumulators_0830_02` | BG 4→1 求和/4 拍 bypass 串出、8×FP16 buffer 读写、logic 级 4 字 lane-wise 求和×2 组背靠背、bypass 直通 |
| `tb_dma_engine_0830_02` | 16 拍搬运,读/写侧随机延迟与停顿,目的端逐字对比 |
| `tb_attacc_ctrl_0830_02` | config(含 batch/L 表回读)、WR_GB/swap 脉冲、MAC score(2 token→2 pass/16 列读)、MAC context(4 行×8 chunk→8 pass/32 列读)、PRE/ACT/timing 门控下不挂死 |
| `tb_fugue_ctrl_0830_02` | 手工页表镜像(目录+2 个物理相邻 master 段)→ ATTACH 装载 → MAC [0,8) 由 planner 合并为 1 个 run → 8 pass/64 列读,无 fault |
| `tb_logic_die_units_0830_02` | buffered softmax_unit 全流程(16 等分 → 概率≈1/16)、causal_comparator 三种位置关系、流水化 fp32_add/mul 定值检查 |

另:`tb_fp16_bf16_arith / tb_sincos_bf16 / tb_rotate_q_bf16 / tb_diff_decoder`
对 0830-02 副本直接通过。注意旧 `tb_fp32_add_mul / tb_fp32_exp_recip` 是
单拍时代写的,对 s3/s2/s11 流水化叶单元会误报(0830-01 同样误报),已由
`tb_logic_die_units_0830_02` 中延迟容忍的检查替代。

iverilog-11 兼容性记录(不影响 DC):① 多模块设计里
`assign out = unpacked_array[idx];` 会让输出黏死在 X,controller 中此类读
全部改为 `always_comb`;② 输出端口绑定二维 unpacked 数组元素不支持,
`softmax_buffer_sram` 读出改 packed 向量;③ 循环头内声明的 genvar 与
always_comb 的同名 int 混淆,genvar 提升至模块级。

---

## 5. 各层级 overhead 计算方法

### 5.1 结构常数(8-Hi HBM3 stack,`kv_tlb_pkg`/drampim 几何)

| 常数 | 值 | 说明 |
|---|---:|---|
| N_ch | 16 | channel/stack |
| N_bank | 1024 | 16 ch × (2 pCH × 2 rank × 4 BG × 4 bank) |
| N_bg | 256 | 4 bank/组 |
| N_gemv | 2048 | 文档:每 bank 2 个 GEMV unit |

### 5.2 逐层公式(A(x) = 对应 tag 的 `*_qor.rpt` Design Area)

**Bank 级(整 stack)**

    A_bank_total(design) = N_gemv × A(gemv_unit @ f_design)
      AttAcc: tag gemv_attacc_p1501;Fugue: tag gemv_fugue_p769
    (gemv_unit 已含 SRAM 宏双缓冲向量 buffer(2×16 颗 256×16 宏);
     buffer 单独占比用 dbuf_p* 对账,触发器参考点用 profile gemv_flop)

**BG 级(整 stack)**

    A_bg_total(design) = N_bg × [ A(accumulator_bg @ f) + A(accum_buffer @ f) ]
      AttAcc: accbg_attacc_p1501 + accbuf_attacc_p1501 (top accum_buffer_bg_attacc, 8×FP16)
      Fugue : accbg_fugue_p769   + accbuf_fugue_p769   (top accum_buffer_bg_fugue, 64×FP16)
    (两档共用同一颗 256×16 宏 → 宏面积同;容量差异 16B vs 128B 见 §2.5)

**Logic die 级**

    A_softmax = 16 × A_channel_engine + A_buffers
      A_channel_engine = 16×A(softmax_pe) + 16×A(fp32_add) + A(fp32_recip) + A_glue
        = 16×1836.88 + 16×211.51 + A(recip_p699) + A_glue        (µm², dc_0830-01/新表)
        (每 channel:16 PE + 求和树 15 个 fp32_add + 1 个总累加 fp32_add
         + 1 个 recip;A_glue = FSM/寄存器,可选做一次 softmax_pe 黑盒的
         softmax_unit 综合获得,量级远小于 PE 项)
      A_buffers:softmax SRAM 宏,AttAcc 2 contexts = 32 KiB/channel
        (每 channel 14 个 64x4x80/64x4x32 宏),Fugue 16 contexts =
        256 KiB/channel(每 channel 28 个 256x4x80/256x4x32 宏);
        宏面积取编译宏 .lib 值 × 宏数
    A_logic(AttAcc)      = 16 × A(accumulator_logic) + A_softmax
    A_logic(Fugue)       = A_logic(AttAcc)
                           + 16 × A(diff_decoder_channel_dc_top)
                           + 16 × A(causal_comparator)
    A_logic(Fugue+RoPE)  = A_logic(Fugue) + A(rotate_q_bf16)      (消融口径)

**HBM Controller 级(每 HBM 一个)**

    A_ctrl(AttAcc) = A(attacc_hbm_ctrl_top)         tag ctrl_attacc_p1501
    A_ctrl(Fugue)  = A(fugue_hbm_ctrl_top)          tag ctrl_fugue_p1501
    TLB 单独对账:A(kv_tlb_top) = tag kvtlb_p1501;
    A_ctrl(Fugue) − A_ctrl(AttAcc) ≈ A(kv_tlb_top) − A(direct_addr_plan)

**整 stack 合计与 overhead**

    A_stack(design) = A_bank_total + A_bg_total + A_logic + A_ctrl
    Fugue 相对 AttAcc 的 overhead
      = [A_stack(Fugue) − A_stack(AttAcc)] / A_stack(AttAcc)
    其中 bank/BG 项的差异只来自 666 MHz vs 1.3 GHz 的综合结果
    (RTL 相同),logic die 项来自 diff decoder + causal comparator,
    controller 项来自 TLB。

### 5.3 频率约定(与 attacc_drampim 时序契约一致)

| 组件 | AttAcc | Fugue |
|---|---|---|
| gemv_unit / accumulator_bg / accum_buffer_bg | 666 MHz (1.5015015 ns) | 1.3 GHz (0.769 ns) |
| accumulator_logic / diff_decoder / causal_comparator / rotate(消融) | 666 MHz | 666 MHz |
| softmax(叶已 @699 ps 闭合,免重综合) | — | 1.3 GHz 已覆盖 |
| controller(含 TLB)/ DMA | 666 MHz | 666 MHz |

### 5.4 运行

    cd kvpim-rtl/syn && ./run_dc_0830-02.sh          # 结果 → syn/dc_0830-02/<tag>/

本机(此工作区)无 dc_shell,矩阵需在有 Synopsys license 的机器上执行
(与 `dc_0830-01` 相同环境;脚本已带 `profile_synopsys` + license 覆盖)。
若 `gemv_fugue_p769` 在 ASAP7/TT 下 setup 不闭合:按文档约定**不改 RTL**,
在报告中记录负 slack 与达成的 Fmax 即可(fp16_add 单拍路径是限制项)。
