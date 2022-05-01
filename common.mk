## Common defines for ARM9 and ARM7 Makefiles ##

COMPARE ?= 1

default: all

PROJECT_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Because mwldarm expects absolute paths to be WIN32 paths,
# all paths referring up from BUILD_DIR must be relative.
WORK_DIR   := $(shell realpath --relative-to $(CURDIR) $(PROJECT_ROOT))
$(shell mkdir -p $(BUILD_DIR))
BACK_REL   := $(shell realpath --relative-to $(BUILD_DIR) $(CURDIR))

TOOLSDIR     := $(WORK_DIR)/tools

include $(WORK_DIR)/platform.mk
include $(WORK_DIR)/binutils.mk

# NitroSDK tools
MWCC          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwccarm.exe
MWAS          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwasmarm.exe
MWLD          = $(BACK_REL)/$(TOOLSDIR)/mwccarm/$(MWCCVER)/mwldarm.exe
MAKEROM      := $(TOOLSDIR)/bin/makerom.exe
MAKELCF      := $(TOOLSDIR)/bin/makelcf.exe
MAKEBNR      := $(TOOLSDIR)/bin/makebanner.exe
NTRCOMP      := $(TOOLSDIR)/bin/ntrcomp.exe

export LM_LICENSE_FILE := $(TOOLSDIR)/mwccarm/license.dat

# Native tools
JSONPROC     := $(TOOLSDIR)/jsonproc/jsonproc$(EXE)
GFX          := $(TOOLSDIR)/nitrogfx/nitrogfx$(EXE)
FIXROM       := $(TOOLSDIR)/fixrom/fixrom$(EXE)
KNARC        := $(TOOLSDIR)/knarc/knarc$(EXE)
O2NARC       := $(TOOLSDIR)/o2narc/o2narc$(EXE)
MSGENC       := $(TOOLSDIR)/msgenc/msgenc$(EXE)
ASPATCH      := $(TOOLSDIR)/mwasmarm_patcher/mwasmarm_patcher$(EXE)
CSV2BIN      := $(TOOLSDIR)/csv2bin/csv2bin$(EXE)
MKFXCONST    := $(TOOLSDIR)/gen_fx_consts/gen_fx_consts$(EXE)

# Decompiled NitroSDK tools
COMPSTATIC   := $(TOOLSDIR)/compstatic/compstatic$(EXE)

NTRMERGE     := $(TOOLSDIR)/ntr_merge_elf/ntr_merge_elf.sh

NATIVE_TOOLS := \
	$(JSONPROC) \
	$(GFX) \
	$(FIXROM) \
	$(KNARC) \
	$(O2NARC) \
	$(MSGENC) \
	$(ASPATCH) \
	$(CSV2BIN) \
	$(MKFXCONST) \
	$(COMPSTATIC)

TOOLDIRS := $(foreach tool,$(NATIVE_TOOLS),$(dir $(tool)))

# Directories
NITROSDK_SRC_SUBDIRS      := os

LIB_SUBDIRS               := cw NitroSDK NitroSystem NitroDWC NitroWiFi libCPS libVCT
SRC_SUBDIR                := src
ASM_SUBDIR                := asm
LIB_SRC_SUBDIR            := lib/src $(LIB_SUBDIRS:%=lib/%/src) $(NITROSDK_SRC_SUBDIRS:%=lib/NitroSDK/src/%)
LIB_ASM_SUBDIR            := lib/asm $(LIB_SUBDIRS:%=lib/%/asm)
ALL_SUBDIRS               := $(SRC_SUBDIR) $(ASM_SUBDIR) $(LIB_SRC_SUBDIR) $(LIB_ASM_SUBDIR)

SRC_BUILDDIR              := $(addprefix $(BUILD_DIR)/,$(SRC_SUBDIR))
ASM_BUILDDIR              := $(addprefix $(BUILD_DIR)/,$(ASM_SUBDIR))
LIB_SRC_BUILDDIR          := $(addprefix $(BUILD_DIR)/,$(LIB_SRC_SUBDIR))
LIB_ASM_BUILDDIR          := $(addprefix $(BUILD_DIR)/,$(LIB_ASM_SUBDIR))

C_SRCS                    := $(foreach dname,$(SRC_SUBDIR),$(wildcard $(dname)/*.c))
ASM_SRCS                  := $(foreach dname,$(ASM_SUBDIR),$(wildcard $(dname)/*.s))
LIB_C_SRCS                := $(foreach dname,$(LIB_SRC_SUBDIR),$(wildcard $(dname)/*.c))
LIB_ASM_SRCS              := $(foreach dname,$(LIB_ASM_SUBDIR),$(wildcard $(dname)/*.s))
ALL_SRCS                  := $(C_SRCS) $(ASM_SRCS) $(LIB_C_SRCS) $(LIB_ASM_SRCS)

C_OBJS                    = $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS                  = $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
LIB_C_OBJS                = $(LIB_C_SRCS:%.c=$(BUILD_DIR)/%.o)
LIB_ASM_OBJS              = $(LIB_ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
ALL_GAME_OBJS             = $(C_OBJS) $(ASM_OBJS)
ALL_LIB_OBJS              = $(LIB_C_OBJS) $(LIB_ASM_OBJS)
ALL_OBJS                  = $(ALL_GAME_OBJS) $(ALL_LIB_OBJS)

$(ALL_LIB_OBJS): DEFINES = $(GLB_DEFINES)

ALL_BUILDDIRS             := $(sort $(ALL_BUILDDIRS) $(foreach obj,$(ALL_OBJS),$(dir $(obj))))

NEF               := $(BUILD_DIR)/$(NEFNAME).nef
ELF               := $(NEF:%.nef=%.elf)
LCF               := $(NEF:%.nef=%.lcf)
RESPONSE          := $(NEF:%.nef=%.response)
SBIN              := $(NEF:%.nef=%.sbin)
XMAP              := $(NEF).xMAP

EXCCFLAGS         := -Cpp_exceptions off

MWCFLAGS           = $(DEFINES) $(OPTFLAGS) -enum int -lang c99 $(EXCCFLAGS) -gccext,on -proc $(PROC) -msgstyle gcc -gccinc -i ./include -i ./include/library -i $(WORK_DIR)/files -I$(WORK_DIR)/lib/include -ipa file -interworking -inline on,noauto -char signed
MWASFLAGS          = $(DEFINES) -proc $(PROC_S) -gccinc -i . -i ./include -i $(WORK_DIR)/files -I$(WORK_DIR)/lib/include -DSDK_ASM
MWLDFLAGS         := -w off -proc $(PROC) -nopic -nopid -interworking -map closure,unused -symtab sort -m _start -msgstyle gcc
ARFLAGS           := rcS

export MWCIncludes := lib/include

LSF               := $(addsuffix .lsf,$(NEFNAME))
ifneq ($(LSF),)
OVERLAYS          := $(shell $(GREP) -o "^Overlay \w+" $(LSF) | cut -d' ' -f2)
else
OVERLAYS          :=
endif

# Make sure build directories exist before compiling anything
DUMMY := $(shell mkdir -p $(ALL_BUILDDIRS))

.SECONDARY:
.SECONDEXPANSION:
.DELETE_ON_ERROR:
.PHONY: all tidy clean tools clean-tools $(TOOLDIRS)
.PRECIOUS: $(SBIN)
.NOTPARALLEL:

.PHONY: $(MWAS)
$(MWAS):
	$(ASPATCH) -q $@

all: tools

ifeq ($(NODEP),)
ifneq ($(WINPATH),)
PROJECT_ROOT_NT := $(shell $(WINPATH) -w $(PROJECT_ROOT) | $(SED) 's/\\/\//g')
define fixdep
$(SED) -i 's/\r//g; s/\\/\//g; s/\/$$/\\/g; s#$(PROJECT_ROOT_NT)#$(PROJECT_ROOT)#g' $(1)
touch -r $(1:%.d=%.o) $(1)
endef
else
define fixdep
$(SED) -i 's/\r//g; s/\\/\//g; s/\/$$/\\/g' $(1)
touch -r $(1:%.d=%.o) $(1)
endef
endif
DEPFLAGS := -gccdep -MD
DEPFILES := $(ALL_OBJS:%.o=%.d)
$(DEPFILES):

$(BUILD_DIR)/lib/NitroSDK/%.o: MWCCVER := 2.0/sp2p3

$(BUILD_DIR)/%.o: %.c
$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)/%.d
	$(WINE) $(MWCC) $(MWCFLAGS) $(DEPFLAGS) -c -o $@ $<
	@$(call fixdep,$(BUILD_DIR)/$*.d)

$(BUILD_DIR)/%.o: %.s
$(BUILD_DIR)/%.o: %.s $(BUILD_DIR)/%.d
	$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $@ $<
	@$(call fixdep,$(BUILD_DIR)/$*.d)

include $(wildcard $(DEPFILES))
else
$(BUILD_DIR)/%.o: %.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: %.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $@ $<
endif

$(NATIVE_TOOLS): tools

tools: $(TOOLDIRS) $(MWAS)

$(TOOLDIRS):
	@$(MAKE) -C $@

clean-tools:
	$(foreach tool,$(TOOLDIRS),$(MAKE) -C $(tool) clean;)

$(LCF): $(LSF) $(LCF_TEMPLATE)
	$(WINE) $(MAKELCF) $(MAKELCF_FLAGS) $^ $@
ifeq ($(PROC),arm946e)
	$(SED) -i '1i KEEP_SECTION\n{\n\t.exceptix\n}' $@
else
	$(SED) -i '/\} > check\.WORKRAM/a SDK_SUBPRIV_ARENA_LO = SDK_SUBPRIV_ARENA_LO + SDK_AUTOLOAD.EXT_WRAM.SIZE + SDK_AUTOLOAD.EXT_WRAM.BSS_SIZE;' $@
endif

RESPONSE_TEMPLATE    := $(PROJECT_ROOT)/mwldarm.response.template
RESPONSE_TEMPLATE_NT := $(PROJECT_ROOT_NT)/mwldarm.response.template

$(RESPONSE): $(LSF) $(RESPONSE_TEMPLATE)
	$(WINE) $(MAKELCF) $(MAKELCF_FLAGS) $< $(RESPONSE_TEMPLATE_NT) $@

# Locate crt0.o
CRT0_OBJ := lib/asm/crt0.o

$(NEF): $(LCF) $(RESPONSE) $(ALL_OBJS)
	cd $(BUILD_DIR) && LM_LICENSE_FILE=$(BACK_REL)/$(LM_LICENSE_FILE) $(WINE) $(MWLD) $(MWLDFLAGS) $(LIBS) -o $(BACK_REL)/$(NEF) $(LCF:$(BUILD_DIR)/%=%) @$(RESPONSE:$(BUILD_DIR)/%=%) $(CRT0_OBJ)

.INTERMEDIATE: $(BUILD_DIR)/obj.list

$(SBIN): build/%.sbin: build/%.nef
ifeq ($(COMPARE),1)
	$(SHA1SUM) --quiet -c $*.sha1
endif

$(ELF): %.elf: %.nef
	$(NTRMERGE) $*

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
