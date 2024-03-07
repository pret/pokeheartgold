#Use the assembler to build the effect scripts
MOVE_SCRIPT_DIR   := files/battledata/script/move_script
MOVE_SCRIPT_NARC  := $(MOVE_SCRIPT_DIR).narc
MOVE_SCRIPT_SRCS  := $(wildcard $(MOVE_SCRIPT_DIR)/*.s)
MOVE_SCRIPT_OBJS  := $(MOVE_SCRIPT_SRCS:%.s=%.o)
MOVE_SCRIPT_BINS  := $(MOVE_SCRIPT_SRCS:%.s=%.bin)
MOVE_SCRIPT_HEADS := $(MOVE_SCRIPT_SRCS:%.s=%.h)

$(MOVE_SCRIPT_BINS): MWASFLAGS += -DPM_ASM
ifeq ($(NODEP),)
MOVE_SCRIPT_DEPS := $(MOVE_SCRIPT_BINS:%.bin=%.d)
$(MOVE_SCRIPT_DEPS):

$(MOVE_SCRIPT_BINS): %.bin: %.s
$(MOVE_SCRIPT_BINS): %.bin: %.s %.d
	$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $<
	@$(call fixdep,$*.d)
	@$(SED) -i 's/\.o/.bin/' $*.d
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
include $(wildcard $(MOVE_SCRIPT_DEPS))
else
$(MOVE_SCRIPT_BINS): %.bin: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
endif

$(MOVE_SCRIPT_NARC): $(MOVE_SCRIPT_BINS)

FS_CLEAN_TARGETS += $(MOVE_SCRIPT_NARC) $(MOVE_SCRIPT_BINS) $(MOVE_SCRIPT_OBJS) $(MOVE_SCRIPT_DEPS)
