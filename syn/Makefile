# Fugue logic die — N28 Genus synthesis driver (full flatten, T-cube recipe).
GENUS      ?= /data/eda_tools/cadence/DDI251/GENUS251/tools.lnx86/bin/genus
PERIOD_NS  ?= 2.0

.PHONY: syn attacc fugue both attacc-hier fugue-hier both-hier clean

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

# ---- ASAP7 flow (period in PS — the ASAP7 liberty time unit) ----
# Single point: make asap7run TOP=mq_pe_16x2_d32 FL=filelist_bankpe.f TAG=t PERIOD_PS=1000
# Frequency sweep (16 cores): ./run_asap7_bankpe_sweep.sh ; analysis:
# python3 asap7_sweep_analysis.py
PERIOD_PS ?= 1500
asap7run:
	mkdir -p build_asap7_$(TAG) && cp run_syn_asap7.tcl asap7_mmmc.tcl build_asap7_$(TAG)/
	cd build_asap7_$(TAG) && FUGUE_TOP=$(TOP) FUGUE_FILELIST=$(abspath $(FL)) \
		FUGUE_PERIOD_PS=$(PERIOD_PS) FUGUE_TAG=$(TAG) \
		$(GENUS) -no_gui -overwrite -f run_syn_asap7.tcl -log genus_$(TAG)

# ---- MQ microarchitecture study (in-bank PE + AGENTS logic-die sweep) ----
# Generic parameterized run: make mqrun TOP=<top> FL=<filelist> TAG=<tag> PERIOD_NS=<ns>
mqrun:
	mkdir -p build_$(TAG) && cp run_syn.tcl tsmcn28_mmmc.tcl build_$(TAG)/
	cd build_$(TAG) && FUGUE_TOP=$(TOP) FUGUE_FILELIST=$(abspath $(FL)) \
		FUGUE_PERIOD_NS=$(PERIOD_NS) FUGUE_TAG=$(TAG) \
		$(GENUS) -no_gui -overwrite -f run_syn.tcl -log genus_$(TAG)
