#Use the assembler to build the effect scripts
EFFECT_SCRIPT_DIR   := files/battledata/script/effect_script
EFFECT_SCRIPT_NARC  := $(EFFECT_SCRIPT_DIR).narc
EFFECT_SCRIPT_SRCS  := $(wildcard $(EFFECT_SCRIPT_DIR)/*.s)
EFFECT_SCRIPT_OBJS  := $(EFFECT_SCRIPT_SRCS:%.s=%.o)
EFFECT_SCRIPT_BINS  := $(EFFECT_SCRIPT_SRCS:%.s=%.bin)
EFFECT_SCRIPT_HEADS := $(EFFECT_SCRIPT_SRCS:%.s=%.h)

$(EFFECT_SCRIPT_BINS): MWASFLAGS += -DPM_ASM
ifeq ($(NODEP),)
EFFECT_SCRIPT_DEPS := $(EFFECT_SCRIPT_BINS:%.bin=%.d)
$(EFFECT_SCRIPT_DEPS):

$(EFFECT_SCRIPT_BINS): %.bin: %.s
$(EFFECT_SCRIPT_BINS): %.bin: %.s %.d
	$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $<
	@$(call fixdep,$*.d)
	@$(SED) -i 's/\.o/.bin/' $*.d
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
include $(wildcard $(EFFECT_SCRIPT_DEPS))
else
$(EFFECT_SCRIPT_BINS): %.bin: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
endif

$(EFFECT_SCRIPT_NARC): $(EFFECT_SCRIPT_BINS)

FS_CLEAN_TARGETS += $(EFFECT_SCRIPT_NARC) $(EFFECT_SCRIPT_BINS) $(EFFECT_SCRIPT_OBJS) $(EFFECT_SCRIPT_DEPS)
