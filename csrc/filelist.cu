LDVERSION= $(shell $(PIC_LD) -v | grep -q 2.3 ;echo $$?)
ifeq ($(LDVERSION), 0)
     LD_NORELAX_FLAG= --no-relax
endif

ARCHIVE_OBJS=
ARCHIVE_OBJS += _1547666_archive_1.so
_1547666_archive_1.so : archive.3/_1547666_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../../../../../tmp/claude-1581920/-data2-chenyi9-KV-PIM-kvpim-rtl/d7296adf-cd6e-4e09-bb35-13fabc8a9600/scratchpad/vcs_all/tb_acc.daidir//_1547666_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../../../../../tmp/claude-1581920/-data2-chenyi9-KV-PIM-kvpim-rtl/d7296adf-cd6e-4e09-bb35-13fabc8a9600/scratchpad/vcs_all/tb_acc.daidir//_1547666_archive_1.so $@


ARCHIVE_OBJS += _prev_archive_1.so
_prev_archive_1.so : archive.3/_prev_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../../../../../tmp/claude-1581920/-data2-chenyi9-KV-PIM-kvpim-rtl/d7296adf-cd6e-4e09-bb35-13fabc8a9600/scratchpad/vcs_all/tb_acc.daidir//_prev_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../../../../../tmp/claude-1581920/-data2-chenyi9-KV-PIM-kvpim-rtl/d7296adf-cd6e-4e09-bb35-13fabc8a9600/scratchpad/vcs_all/tb_acc.daidir//_prev_archive_1.so $@




VCS_CU_ARC_OBJS = 


O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<


%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<

CU_UDP_OBJS = \


CU_UDP_OBJS += 
CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

