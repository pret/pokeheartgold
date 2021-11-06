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
$(SCRIPT_DIR)/%.bin: dep = $(shell $(SCANINC) -I . -I ./include -I $(WORK_DIR)/files -I $(WORK_DIR)/lib/include $*.s)
else
$(SCRIPT_DIR)/%.bin: dep :=
endif

$(SCRIPT_BINS): %.bin: %.s $$(dep)
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@

$(SCRIPT_NARC): $(SCRIPT_BINS)

# Once this has been reversed, uncomment the below
# FS_CLEAN_TARGETS += $(SCRIPT_NARC) $(SCRIPT_BINS)
