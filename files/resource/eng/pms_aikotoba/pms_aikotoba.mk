PMS_AIKOTOBA_STEM := files/resource/eng/pms_aikotoba/pms_aikotoba
PMS_AIKOTOBA_S    := $(PMS_AIKOTOBA_STEM).s
PMS_AIKOTOBA_O    := $(PMS_AIKOTOBA_STEM).o
PMS_AIKOTOBA_NARC := $(PMS_AIKOTOBA_STEM).narc

PMS_AIKOTOBA_DEP  := $(PMS_AIKOTOBA_S:%.s=%.d)

clean-pms-aikotoba:
	$(RM) $(PMS_AIKOTOBA_NARC) $(PMS_AIKOTOBA_O) $(PMS_AIKOTOBA_DEP)

.PHONY: clean-pms-aikotoba
clean-filesystem: clean-pms-aikotoba

ifeq ($(NODEP),)
$(PMS_AIKOTOBA_NARC): %.narc: %.s
$(PMS_AIKOTOBA_NARC): %.narc: %.s %.d
	@echo gen  $@
	@mkdir -p $*
	@$(RM) $*/*
	@$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -DPM_ASM -o $*.o $< || { rm -f $*.d; exit 1; }
	@$(call fixdep,$*.d)
	@$(OBJCOPY) -O binary $*.o $*/tmp.bin
	@$(KNARC) -p $@ -d $*
	@$(RM) -r $*

$(PMS_AIKOTOBA_DEP):

include $(wildcard $(PMS_AIKOTOBA_DEP))
else
$(PMS_AIKOTOBA_NARC): %.narc: %.s
	@echo gen  $@
	@mkdir -p $*
	@$(RM) $*/*
	@$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $<
	@$(OBJCOPY) -O binary $*.o $*/tmp.bin
	@$(KNARC) -p $@ -d $*
	@$(RM) -r $*
endif
