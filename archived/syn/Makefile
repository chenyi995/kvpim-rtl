# Fugue logic die — N28 Genus synthesis driver (full flatten, T-cube recipe).
GENUS      ?= /data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus
# AttAcc-DRAMPIM models HBM3 at tCK=0.769 ns (ramulator_wrapper.py).
# PE macros are closed at 10% higher frequency: 0.769 / 1.10 = 0.699 ns.
PERIOD_NS     ?= 0.769
PE_PERIOD_NS  ?= 0.699

.PHONY: syn attacc fugue both attacc-hier fugue-hier both-hier softmax-pe softmax-channel-macro kvtlb kvtlb-hier kvtlb-sweep dc-kvtlb-asap7 clean

# Generic single run (default top = fugue_logic_die, filelist.f).
syn:
	FUGUE_TOP=fugue_logic_die FUGUE_FILELIST=filelist.f FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=run \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_run

# AttAcc-original baseline logic die (isolated build dir).
attacc:
	mkdir -p build_attacc && cp run_syn.tcl tsmcn28_mmmc.tcl build_attacc/
	cd build_attacc && FUGUE_TOP=attacc_logic_die FUGUE_FILELIST=$(abspath filelist_attacc.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=attacc \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_attacc

# Fugue logic die (isolated build dir).
fugue:
	mkdir -p build_fugue && cp run_syn.tcl tsmcn28_mmmc.tcl build_fugue/
	cd build_fugue && FUGUE_TOP=fugue_logic_die FUGUE_FILELIST=$(abspath filelist_fugue.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=fugue \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_fugue

# Both A/B runs in parallel (reports land in build_*/reports_*/).
both:
	$(MAKE) attacc & $(MAKE) fugue & wait

# ---- hierarchy-preserving runs (per-block area breakdown, phase 2) ----
# No full flatten; produces reports_<tag>/<top>_area_hier.rpt with per-instance
# area (u_tlb, u_rotate, u_diff, u_sfm, g_gemv[*], u_ctrl, ...).
attacc-hier:
	mkdir -p build_attacc_hier && cp run_syn_hier.tcl tsmcn28_mmmc.tcl build_attacc_hier/
	cd build_attacc_hier && FUGUE_TOP=attacc_logic_die FUGUE_FILELIST=$(abspath filelist_attacc.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=attacc \
		$(GENUS) -no_gui -overwrite -f run_syn_hier.tcl -log genus_attacc_hier

fugue-hier:
	mkdir -p build_fugue_hier && cp run_syn_hier.tcl tsmcn28_mmmc.tcl build_fugue_hier/
	cd build_fugue_hier && FUGUE_TOP=fugue_logic_die FUGUE_FILELIST=$(abspath filelist_fugue.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=fugue \
		$(GENUS) -no_gui -overwrite -f run_syn_hier.tcl -log genus_fugue_hier

both-hier:
	$(MAKE) attacc-hier & $(MAKE) fugue-hier & wait

# ---- AttAcc softmax leaf-macro flow ---------------------------------------
# First characterize/synthesize one FP32 softmax PE.  Then compile the
# 16-lane channel engine with softmax_pe_blackbox.sv (or replace that stub by
# the mapped macro model) so its sixteen PE leaves are not re-expanded.
softmax-pe:
	mkdir -p build_softmax_pe && cp run_syn.tcl tsmcn28_mmmc.tcl build_softmax_pe/
	cd build_softmax_pe && FUGUE_TOP=softmax_pe FUGUE_FILELIST=$(abspath filelist_softmax_pe.f) \
		FUGUE_PERIOD_NS=$(PE_PERIOD_NS) FUGUE_TAG=softmax_pe \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_softmax_pe

softmax-channel-macro:
	mkdir -p build_softmax_channel_macro && cp run_syn.tcl tsmcn28_mmmc.tcl build_softmax_channel_macro/
	cd build_softmax_channel_macro && FUGUE_TOP=softmax_unit FUGUE_FILELIST=$(abspath filelist_softmax_channel_macro.f) \
		FUGUE_ALLOW_BLACKBOX=1 FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=softmax_channel_macro \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_softmax_channel_macro

# ---- BF16 M2 RoPE rotate unit (on-die sin/cos generation), standalone ----
# Hierarchy-preserving so the sincos_bf16 sub-block area is itemized separately
# from the BF16 rotate MAC. reports_rotbf16/rotate_q_bf16_area_hier.rpt.
rotbf16:
	mkdir -p build_rotbf16 && cp run_syn_hier.tcl tsmcn28_mmmc.tcl build_rotbf16/
	cd build_rotbf16 && FUGUE_TOP=rotate_q_bf16 FUGUE_FILELIST=$(abspath filelist_rotbf16.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=rotbf16 \
		$(GENUS) -no_gui -overwrite -f run_syn_hier.tcl -log genus_rotbf16

clean:
	rm -rf outputs_* reports_* fv .cadence genus_*.log genus_*.cmd chip_*.sdc \
	       build_attacc build_fugue build_attacc_hier build_fugue_hier build_rotbf16 *.rc.log syn_*.out

# ---- MQ microarchitecture study (in-bank PE + AGENTS logic-die sweep) ----
# Generic parameterized run: make mqrun TOP=<top> FL=<filelist> TAG=<tag> PERIOD_NS=<ns>
mqrun:
	mkdir -p build_$(TAG) && cp run_syn.tcl tsmcn28_mmmc.tcl build_$(TAG)/
	cd build_$(TAG) && FUGUE_TOP=$(TOP) FUGUE_FILELIST=$(abspath $(FL)) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=$(TAG) \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_$(TAG)

# ---- KV segment TLB standalone (drampim CacheBlendTLB in hardware; see KV_TLB.md) ----
# Isolated tops kv_tlb_e16/e32/e64 (filelist_kvtlb.f) for the TLB/PTW logic
# latency + area; ENTRIES sweep via the fixed wrappers in kv_tlb_variants.sv.
define KVTLB_RUN
	mkdir -p build_$(1) && cp $(2) tsmcn28_mmmc.tcl build_$(1)/
	cd build_$(1) && FUGUE_TOP=$(3) FUGUE_FILELIST=$(abspath filelist_kvtlb.f) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=$(1) \
		$(GENUS) -no_gui -overwrite -f $(2) -log genus_$(1)
endef
kvtlb:
	$(call KVTLB_RUN,kvtlb_e32,run_syn.tcl,kv_tlb_e32)
kvtlb-hier:
	$(call KVTLB_RUN,kvtlb_e32_hier,run_syn_hier.tcl,kv_tlb_e32)
kvtlb-sweep:
	$(call KVTLB_RUN,kvtlb_e16,run_syn.tcl,kv_tlb_e16) & \
	$(call KVTLB_RUN,kvtlb_e32,run_syn.tcl,kv_tlb_e32) & \
	$(call KVTLB_RUN,kvtlb_e64,run_syn.tcl,kv_tlb_e64) & wait

# Open ASAP7 RVT/TT library + Synopsys Design Compiler flow (default e32).
dc-kvtlb-asap7:
	. /home/common/profile_synopsys && lc_shell -f compile_asap7_libs.tcl && dc_shell -f run_dc_kvtlb_asap7.tcl | tee dc_kvtlb_asap7.log
