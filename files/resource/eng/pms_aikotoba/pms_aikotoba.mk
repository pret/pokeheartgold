PMS_AIKOTOBA_S    := files/resource/eng/pms_aikotoba/pms_aikotoba.s
PMS_AIKOTOBA_NARC := $(PMS_AIKOTOBA_S:%.s=%.narc)

FS_CLEAN_TARGETS += $(PMS_AIKOTOBA_NARC) $(PMS_AIKOTOBA_S:%.s=%.o) $(PMS_AIKOTOBA_S:%.s=%)


ifeq ($(NODEP),)
PMS_AIKOTOBA_DEP  := $(PMS_AIKOTOBA_S:%.s=%.d)
$(PMS_AIKOTOBA_NARC): %.narc: %.s
$(PMS_AIKOTOBA_NARC): %.narc: %.s %.d
	@echo gen  $@
	@mkdir -p $*
	@$(RM) $*/*
	@$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -DPM_ASM -o $*.o $<
	@$(call fixdep,$*.d)
	@$(OBJCOPY) -O binary $*.o $*/tmp.bin
	@$(KNARC) -p $@ -d $*

$(PMS_AIKOTOBA_DEP):

include $(wildcard $(PMS_AIKOTOBA_DEP))
FS_CLEAN_TARGETS += $(PMS_AIKOTOBA_DEP)
else
$(PMS_AIKOTOBA_NARC): %.narc: %.s
	@echo gen  $@
	@mkdir -p $*
	@$(RM) $*/*
	@$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $<
	@$(call fixdep,$*.d)
	@$(OBJCOPY) -O binary $*.o $*/tmp.bin
	@$(KNARC) -p $@ -d $*
endif
