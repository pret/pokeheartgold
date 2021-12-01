# Use the assembler to build the scripts
# Framework for when we actually get around to script dumping
SCRIPT_DIR  := files/fielddata/script/scr_seq
SCRIPT_NARC := $(SCRIPT_DIR).narc
SCRIPT_SRCS := $(wildcard $(SCRIPT_DIR)/*.s)
SCRIPT_OBJS := $(SCRIPT_SRCS:%.s=%.o)
SCRIPT_BINS := $(SCRIPT_SRCS:%.s=%.bin)

# Delete intermediate object files
.INTERMEDIATE: $(SCRIPT_OBJS)

ifeq ($(NODEP),)
$(SCRIPT_DEPS) := $(SCRIPT_BINS:%.bin=%.d)
$(SCRIPT_DEPS):

$(SCRIPT_BINS): %.bin: %.s
$(SCRIPT_BINS): %.bin: %.s %.d
	$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
	@$(call fixdep,$*.d)

include $(wildcard $(SCRIPT_DEPS))
else
$(SCRIPT_BINS): %.bin: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
endif

$(SCRIPT_NARC): $(SCRIPT_BINS)

# Once this has been reversed, uncomment the below
# FS_CLEAN_TARGETS += $(SCRIPT_NARC) $(SCRIPT_BINS)
