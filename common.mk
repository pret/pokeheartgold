## Common defines for ARM9 and ARM7 Makefiles ##

default: all

include platform.mk
include binutils.mk

# NitroSDK tools
MWCC          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwccarm.exe
MWAS          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwasmarm.exe
MWLD          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwldarm.exe
MAKEROM      := $(TOOLSDIR)/bin/makerom.exe
MAKELCF      := $(TOOLSDIR)/bin/makelcf.exe
MAKEBNR      := $(TOOLSDIR)/bin/makebanner.exe
NTRCOMP      := $(TOOLSDIR)/bin/ntrcomp.exe
COMPSTATIC   := $(TOOLSDIR)/bin/compstatic.exe

LM_LICENSE_FILE := $(TOOLSDIR)/mwccarm/license.dat

# Native tools
SCANINC      := $(TOOLSDIR)/scaninc/scaninc$(EXE)
JSONPROC     := $(TOOLSDIR)/jsonproc/jsonproc$(EXE)
GFX          := $(TOOLSDIR)/nitrogfx/nitrogfx$(EXE)
FIXROM       := $(TOOLSDIR)/fixrom/fixrom$(EXE)
KNARC        := $(TOOLSDIR)/knarc/knarc$(EXE)
O2NARC       := $(TOOLSDIR)/o2narc/o2narc$(EXE)

NATIVE_TOOLS := \
	$(SCANINC) \
	$(JSONPROC) \
	$(GFX) \
	$(FIXROM) \
	$(KNARC) \
	$(O2NARC)

TOOLDIRS := $(foreach tool,$(NATIVE_TOOLS),$(dir $(tool)))

# Directories
SRC_SUBDIR                := src
ASM_SUBDIR                := asm
LIB_SRC_SUBDIR            := lib/src
LIB_ASM_SUBDIR            := lib/asm
ALL_SUBDIRS               := $(SRC_SUBDIR) $(ASM_SUBDIR) $(LIB_SRC_SUBDIR) $(LIB_ASM_SUBDIR)

SRC_BUILDDIR              := $(BUILD_DIR)/$(SRC_SUBDIR)
ASM_BUILDDIR              := $(BUILD_DIR)/$(ASM_SUBDIR)
LIB_SRC_BUILDDIR          := $(BUILD_DIR)/$(LIB_SRC_SUBDIR)
LIB_ASM_BUILDDIR          := $(BUILD_DIR)/$(LIB_ASM_SUBDIR)

C_SRCS                    := $(foreach dname,$(SRC_SUBDIR),$(wildcard $(dname)/*.c))
ASM_SRCS                  := $(foreach dname,$(ASM_SUBDIR),$(wildcard $(dname)/*.s))
LIB_C_SRCS                := $(foreach dname,$(LIB_SRC_SUBDIR),$(wildcard $(dname)/*.c))
LIB_ASM_SRCS              := $(foreach dname,$(LIB_ASM_SUBDIR),$(wildcard $(dname)/*.s))
ALL_SRCS                  := $(C_SRCS) $(ASM_SRCS) $(LIB_C_SRCS) $(LIB_ASM_SRCS)

C_OBJS                    := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS                  := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
LIB_C_OBJS                := $(LIB_C_SRCS:%.c=$(BUILD_DIR)/%.o)
LIB_ASM_OBJS              := $(LIB_ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
ALL_GAME_OBJS             := $(C_OBJS) $(ASM_OBJS)
ALL_LIB_OBJS              := $(LIB_C_OBJS) $(LIB_ASM_OBJS)
ALL_OBJS                  := $(ALL_GAME_OBJS) $(ALL_LIB_OBJS)

ALL_BUILDDIRS             := $(sort $(foreach obj,$(ALL_OBJS),$(dir $(obj))))

NEF               := $(BUILD_DIR)/$(NEFNAME).nef
ELF               := $(NEF:%.nef=%.elf)
LCF               := $(NEF:%.nef=%.lcf)
SBIN              := $(NEF:%.nef=%.sbin)
XMAP              := $(NEF).xMAP

MWCFLAGS          := -O4,p -enum int -lang c99 -Cpp_exceptions off -gccext,on -proc $(PROC) -gccinc -i ./include -I./lib/include
MWASFLAGS         := -proc $(PROC_S)
MWLDFLAGS         := -nodead -w off -proc $(PROC_LD) -interwork -map closure,unused -symtab sort -m _start
ARFLAGS           := rcS

export MWCIncludes := lib/include

LSF               := $(NEFNAME).lsf
OVERLAYS          := $(shell $(GREP) -o "^Overlay \w+" $(LSF) | cut -d' ' -f2)

# Make sure build directories exist before compiling anything
DUMMY != mkdir -p $(ALL_BUILDDIRS)

.SECONDARY:
.SECONDEXPANSION:
.DELETE_ON_ERROR:
.PHONY: all tidy clean tools clean-tools $(TOOLDIRS)

$(BUILD_DIR)/%.o: %.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $@ $<

$(NATIVE_TOOLS): tools

tools: $(TOOLDIRS)

$(TOOLDIRS):
	$(MAKE) -C $@

clean-tools:
	$(foreach tool,$(TOOLDIRS),$(MAKE) -C $(tool) clean;)

$(LCF): $(LSF) $(LCF_TEMPLATE)
	$(WINE) $(MAKELCF) $(MAKELCF_FLAGS) $^ $@

$(NEF): $(LCF) $(ALL_OBJS)
	cd $(BUILD_DIR) && LM_LICENSE_FILE=../../$(LM_LICENSE_FILE) $(WINE) ../../$(MWLD) $(MWLDFLAGS) $(LIBS) -o ../../$(NEF) $(LCF:%(BUILD_DIR)/%=%) $(ALL_OBJS:%(BUILD_DIR)/%=%)
$(SBIN): $(NEF)

$(ELF): $(NEF)
	@$(OBJCOPY) $(foreach ov,$(NEFNAME) $(OVERLAYS),--update-section $(ov)=$(BUILD_DIR)/$(ov).sbin -j $(ov)) $< $@ 2>/dev/null

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
