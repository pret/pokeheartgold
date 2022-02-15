PMS_AIKOTOBA_STEM := files/resource/eng/pms_aikotoba/pms_aikotoba
PMS_AIKOTOBA_S    := $(PMS_AIKOTOBA_STEM).s
PMS_AIKOTOBA_O    := $(PMS_AIKOTOBA_STEM).o
PMS_AIKOTOBA_NARC := $(PMS_AIKOTOBA_STEM).narc

FS_CLEAN_TARGETS += $(PMS_AIKOTOBA_NARC) $(PMS_AIKOTOBA_O)


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
	@$(RM) -r $*

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
	@$(RM) -r $*
endif
