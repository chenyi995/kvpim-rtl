# genus_0831_hier — Genus/ASAP7 leaf-as-macro matrix

| tag | top | period ps | area um^2 | slack ps | viol | P mW |
|---|---|---:|---:|---:|---:|---:|
| **-- flow inputs: leaf macros (tight clock, frozen netlists) --** | | | | | | |
| fp16_mult_p700 | fp16_mult | 700.0 | 123.1 | -15.20 | 15 | 0.87 |
| fp16_add_p700 | fp16_add | 700.0 | 68.2 | +0.00 | 0 | 0.59 |
| fp16_mult_p1350 | fp16_mult | 1350.0 | 76.0 | +0.00 | 0 | 0.41 |
| fp16_add_p1350 | fp16_add | 1350.0 | 44.0 | +0.00 | 0 | 0.28 |
| fp32_add_p630 | fp32_add | 630.0 | 145.0 | +0.00 | 0 | 2.32 |
| fp32_mul_p630 | fp32_mul | 630.0 | 499.6 | +0.20 | 0 | 5.87 |
| sfmpe_p699 | softmax_pe | 699.0 | 1188.9 | +0.00 | 0 | 12.66 |
| **-- bank --** | | | | | | |
| gemv_flop_p1501 | gemv_unit | 1502.0 | 6205.1 | +11.80 | 0 | 31.46 |
| gemv_flop_p769 | gemv_unit | 769.0 | 7343.1 | +0.50 | 0 | 61.90 |
| **-- bank group --** | | | | | | |
| accbg_attacc_p1501 | accumulator_bg | 1502.0 | 1003.2 | +201.20 | 0 | 6.41 |
| accbg_fugue_p769 | accumulator_bg | 769.0 | 1393.6 | +3.70 | 0 | 13.70 |
| accbuf_attacc_p1501 | accum_buffer_bg_attacc | 1502.0 | 62.0 | +960.10 | 0 | 0.33 |
| accbuf_fugue_p769 | accum_buffer_bg_fugue | 769.0 | 250.7 | +182.50 | 0 | 48.57 |
| **-- logic die --** | | | | | | |
| acclogic_p1501 | accumulator_logic | 1502.0 | 1003.2 | +201.20 | 0 | 6.41 |
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
| Bank | 6,354,010 | 7,519,379 | +18.34% |
| Bank group | 272,710 | 420,945 | +54.36% |
| Logic die | 589,142 | 1,619,598 | +174.91% |
| HBM controller | 2,087 | 5,774 | +176.67% |
| Stack total | 7,217,948 | 9,565,696 | +32.53% |

## Roll-up, DRAM-process equivalent (bank/BG x10; die & ctrl on the logic die x1)

| Level | AttAcc um^2 | Fugue um^2 | delta |
|---|---:|---:|---:|
| Bank | 63,540,101 | 75,193,795 | +18.34% |
| Bank group | 2,727,099 | 4,209,454 | +54.36% |
| Logic die | 589,142 | 1,619,598 | +174.91% |
| HBM controller | 2,087 | 5,774 | +176.67% |
| Stack total | 66,858,428 | 81,028,620 | +21.19% |

Anchor notes: with the flop-optimal bank buffer the AttAcc DRAM-side total is 8.28 mm^2/die — below the paper's 13.12 mm^2/die (Sec 7.7) because the over-provisioned macro buffer is gone; the macro-buffer reference (archived run gemv_attacc_p1501, 10,557.5 um^2) lands at 13.85 mm^2/die against the paper's 13.12.
