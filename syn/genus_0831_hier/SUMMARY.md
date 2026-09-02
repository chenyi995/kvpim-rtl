# genus_0831_hier — Genus/ASAP7 leaf-as-macro matrix

| tag | top | period ps | area um^2 | slack ps | viol | P mW |
|---|---|---:|---:|---:|---:|---:|
| **-- flow inputs: leaf macros (tight clock, frozen netlists) --** | | | | | | |
| fp16_mult_p700 | fp16_mult | 700.0 | 67.0 | +0.00 | 0 | 0.51 |
| fp16_add_p700 | fp16_add | 700.0 | 70.8 | +0.00 | 0 | 0.57 |
| fp16_mult_p1350 | fp16_mult | 1350.0 | 55.7 | +0.10 | 0 | 0.31 |
| fp16_add_p1350 | fp16_add | 1350.0 | 41.8 | +0.10 | 0 | 0.28 |
| fp32_add_p630 | fp32_add | 630.0 | 145.0 | +0.00 | 0 | 2.32 |
| fp32_mul_p630 | fp32_mul | 630.0 | 499.6 | +0.20 | 0 | 5.87 |
| sfmpe_p699 | softmax_pe | 699.0 | 1188.9 | +0.00 | 0 | 12.66 |
| **-- bank --** | | | | | | |
| gemv_flop_p1501 | gemv_unit | 1502.0 | 5844.2 | +65.70 | 0 | 30.77 |
| gemv_flop_p769 | gemv_unit | 769.0 | 6478.1 | +0.50 | 0 | 55.15 |
| **-- bank group --** | | | | | | |
| accbg_attacc_p1501 | accumulator_bg | 1502.0 | 163.2 | +313.90 | 0 | 1.11 |
| accbg_fugue_p769 | accumulator_bg | 769.0 | 249.8 | +146.50 | 0 | 2.25 |
| accbuf_attacc_p1501 | accum_buffer_bg_attacc | 1502.0 | 62.0 | +960.10 | 0 | 0.33 |
| accbuf_fugue_p769 | accum_buffer_bg_fugue | 769.0 | 250.7 | +182.50 | 0 | 48.57 |
| **-- logic die --** | | | | | | |
| acclogic_p1501 | accumulator_logic | 1502.0 | 967.4 | +49.60 | 0 | 6.52 |
| diffdec_p1501 | diff_decoder_channel_dc_top | 1502.0 | 1543.3 | +0.20 | 0 | 4.75 |
| causal_p1501 | causal_comparator | 1502.0 | 29.3 | +798.80 | 0 | 0.11 |
| sfmarray_attacc_p769 | sfm_array_attacc | 769.0 | 573089.6 | +0.00 | 0 | 50991.20 |
| sfmarray_fugue_p769 | sfm_array_fugue | 769.0 | 1578384.7 | +0.00 | 0 | 99208.20 |
| **-- HBM controller --** | | | | | | |
| ctrl_attacc_p1501 | attacc_hbm_ctrl_top | 1502.0 | 2086.9 | +0.00 | 0 | 7.21 |
| ctrl_fugue_p1501 | fugue_hbm_ctrl_top | 1502.0 | 5773.8 | +0.00 | 0 | 18.24 |

## Roll-up (N_gemv=1024, N_bg=256, N_ch=16) — ASAP7 logic-process areas

| Level | AttAcc um^2 | Fugue um^2 | delta |
|---|---:|---:|---:|
| Bank | 5,984,450 | 6,633,588 | +10.85% |
| Bank group | 57,652 | 128,125 | +122.24% |
| Logic die | 588,567 | 1,619,024 | +175.08% |
| HBM controller | 2,087 | 5,774 | +176.67% |
| Stack total | 6,632,756 | 8,386,510 | +26.44% |

## Roll-up, DRAM-process equivalent (bank/BG x10; die & ctrl on the logic die x1)

| Level | AttAcc um^2 | Fugue um^2 | delta |
|---|---:|---:|---:|
| Bank | 59,844,495 | 66,335,877 | +10.85% |
| Bank group | 576,517 | 1,281,249 | +122.24% |
| Logic die | 588,567 | 1,619,024 | +175.08% |
| HBM controller | 2,087 | 5,774 | +176.67% |
| Stack total | 61,011,667 | 69,241,924 | +13.49% |

Anchor notes: with the flop-optimal bank buffer the AttAcc DRAM-side total is 7.55 mm^2/die — below the paper's 13.12 mm^2/die (Sec 7.7) because the over-provisioned macro buffer is gone; the macro-buffer reference (archived run gemv_attacc_p1501, 10,193.1 um^2) reproduces the paper's number (13.12 mm^2/die).
