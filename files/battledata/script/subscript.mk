#Use the assembler to build the effect scripts
BTL_SUBSCRIPT_SCRIPT_DIR   := files/battledata/script/subscript
BTL_SUBSCRIPT_SCRIPT_NARC  := $(BTL_SUBSCRIPT_SCRIPT_DIR).narc
BTL_SUBSCRIPT_SCRIPT_SRCS  := $(wildcard $(BTL_SUBSCRIPT_SCRIPT_DIR)/*.s)
BTL_SUBSCRIPT_SCRIPT_OBJS  := $(BTL_SUBSCRIPT_SCRIPT_SRCS:%.s=%.o)
BTL_SUBSCRIPT_SCRIPT_BINS  := $(BTL_SUBSCRIPT_SCRIPT_SRCS:%.s=%.bin)
BTL_SUBSCRIPT_SCRIPT_HEADS := $(BTL_SUBSCRIPT_SCRIPT_SRCS:%.s=%.h)

$(BTL_SUBSCRIPT_SCRIPT_BINS): MWASFLAGS += -DPM_ASM
ifeq ($(NODEP),)
BTL_SUBSCRIPT_SCRIPT_DEPS := $(BTL_SUBSCRIPT_SCRIPT_BINS:%.bin=%.d)
$(BTL_SUBSCRIPT_SCRIPT_DEPS):

$(BTL_SUBSCRIPT_SCRIPT_BINS): %.bin: %.s
$(BTL_SUBSCRIPT_SCRIPT_BINS): %.bin: %.s %.d
	$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $<
	@$(call fixdep,$*.d)
	@$(SED) -i 's/\.o/.bin/' $*.d
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
include $(wildcard $(BTL_SUBSCRIPT_SCRIPT_DEPS))
else
$(BTL_SUBSCRIPT_SCRIPT_BINS): %.bin: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $<
	$(OBJCOPY) -O binary --file-alignment 4 $*.o $@
endif

$(BTL_SUBSCRIPT_SCRIPT_NARC): $(BTL_SUBSCRIPT_SCRIPT_BINS)

# Once this has been reversed, uncomment the below
FS_CLEAN_TARGETS += $(BTL_SUBSCRIPT_SCRIPT_NARC) $(BTL_SUBSCRIPT_SCRIPT_BINS) $(BTL_SUBSCRIPT_SCRIPT_OBJS) $(BTL_SUBSCRIPT_SCRIPT_DEPS)