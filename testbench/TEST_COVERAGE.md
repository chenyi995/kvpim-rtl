# RTL verification coverage

Run functional regressions with `./testbench/run_tests.sh` and compilation/elaboration checks with `./testbench/elaborate_all.sh` from the repository root.

| RTL implementation | Verification |
|---|---|
| `fp16_add`, `fp16_mult`, `bf16_add`, `bf16_mult` | `tb_fp16_bf16_arith` |
| `fp32_add`, `fp32_mul`, `fp32_exp`, `fp32_recip` | `tb_fp32_add_mul`, `tb_fp32_exp_recip` |
| `dbuf_16x256`, `dbuf_sram` | `tb_dbuf`, `tb_dbuf_sram` (with behavioral macro models) |
| `sincos_bf16`, `rotate_q_bf16`, `rotate_q_unit` | `tb_sincos_bf16`, `tb_rotate_q_bf16`, `tb_rotate_q_unit` |
| `kv_seg_tlb`, `kv_ptw`, `kv_scan_planner`, `kv_tlb_top` | `tb_kv_tlb` (vectors from drampim's `CacheBlendTLB`: `gen_kv_tlb_vectors.py`); `kv_tlb_e16/e32/e64` elaborated |
| `direct_addr_plan` | via `attacc_logic_die` elaboration |
| `diff_decoder`, `mq_diff_decoder` | `tb_diff_decoder`, `tb_mq_diff_decoder` |
| `accumulator`, `gemv_unit` | `tb_accumulator`, `tb_gemv_unit` |
| `mac_tree16`, `mac_tree16_piped`, variants | `tb_mac_tree16`, `tb_mac_tree16_piped`; variants elaborated |
| `softmax_unit` | `tb_softmax_unit` |
| `mq_bg_reduce`, MQ wrappers | `tb_mq_bg_reduce`; wrappers elaborated |
| `mq_bank_pe`, AttAcc/MQ PE wrappers | `tb_mq_bank_pe`; wrappers elaborated |
| `mq_score_store` | `tb_mq_score_store` |
| `attacc_controller` | `tb_attacc_controller`, `tb_attacc_controller_mac` |
| logic-die tops | `attacc_logic_die`, `fugue2_logic_die`, `fugue_logic_die`, and `fugue_mq_a8` elaborated |
