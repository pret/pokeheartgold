# Use the assembler to build the scripts
# Framework for when we actually get around to script dumping
SCRIPT_DIR  := files/fielddata/script/scr_seq
SCRIPT_NARC := $(SCRIPT_DIR).narc
SCRIPT_SRCS := $(wildcard $(SCRIPT_DIR)/*.s)
SCRIPT_OBJS := $(SCRIPT_SRCS:%.s=%.o)
SCRIPT_BINS := $(SCRIPT_SRCS:%.s=%.bin)
SCRIPT_HEADS := $(SCRIPT_SRCS:%.s=%.h)

$(SCRIPT_BINS): MWASFLAGS += -DPM_ASM
ifeq ($(NODEP),)
SCRIPT_DEPS := $(SCRIPT_BINS:%.bin=%.d)
$(SCRIPT_DEPS):

$(SCRIPT_BINS): %.bin: %.s
$(SCRIPT_BINS): %.bin: %.s %.d
	@echo $(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $<
	@$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $< || { rm -f $*.d; exit 1; }
	@$(call fixdep,$*.d)
	@$(SED) -i 's/\.o/.bin/' $*.d
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@

include $(wildcard $(SCRIPT_DEPS))
else
$(SCRIPT_BINS): %.bin: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
endif

$(SCRIPT_NARC): $(SCRIPT_BINS) check_scripts

check_scripts: $(SCRIPT_BINS)
ifeq ($(COMPARE),1)
	@$(SHA1SUM) --quiet -c $(PROJECT_ROOT)/scr_seq.sha1
endif

clean-scr-seq:
	$(RM) $(SCRIPT_NARC) $(SCRIPT_BINS) $(SCRIPT_OBJS) $(SCRIPT_DEPS)

.PHONY: clean-scr-seq
clean-filesystem: clean-scr-seq
