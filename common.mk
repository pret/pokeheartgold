## Common defines for ARM9 and ARM7 Makefiles ##

# We're not ready for prime time yet, so attempts to make anything will error unconditionally.
$(error This project is not set up to build anything just yet)

# At present this repository only supports US HeartGold 1.0
SUPPORTED_ROMS   := heartgold.us
ifneq ($(filter-out $(buildname),$(SUPPORTED_ROMS)),)
$(error $(buildname) is not supported, choose from: $(SUPPORTED_ROMS))
endif

include platform.mk
include binutils.mk

# NitroSDK tools
MWCC          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwccarm.exe
MWAS          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwasmarm.exe
MWLD          = $(TOOLSDIR)/mwccarm/$(MWCCVER)/mwldarm.exe
MAKEROM      := $(WINE) $(TOOLSDIR)/bin/makerom.exe
MAKELCF      := $(WINE) $(TOOLSDIR)/bin/makelcf.exe

$(LM_LICENSE_FILE) := $(TOOLSDIR)/mwccarm/license.dat

# Native tools
SCANINC      := $(TOOLSDIR)/scaninc/scaninc$(EXE)
JSONPROC     := $(TOOLSDIR)/jsonproc/jsonproc$(EXE)
GFX          := $(TOOLSDIR)/nitrogfx/nitrogfx$(EXE)
NATIVE_TOOLS := \
	$(SCANINC) \
	$(JSONPROC) \
	$(GFX)

# Directories
SRC_SUBDIR    := src
ASM_SUBDIR    := asm
ALL_SUBDIRS   := $(SRC_SUBDIR) $(ASM_SUBDIR)

SRC_BUILDDIR  := $(BUILD_DIR)/$(SRC_SUBDIR)
ASM_BUILDDIR  := $(BUILD_DIR)/$(ASM_SUBDIR)

C_SRCS        := $(wildcard $(SRC_SUBDIR)/*.c)
ASM_SRCS      := $(wildcard $(ASM_SUBDIR)/*.s)
ALL_SRCS      := $(C_SRCS) $(ASM_SRCS)

C_OBJS        := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS      := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
ALL_OBJS      := $(C_OBJS) $(ASM_OBJS)

NEF               := $(BUILD_DIR)/$(NEFNAME).nef
ELF               := $(NEF:%.nef=%.elf)
LCF               := $(NEF:%.nef=%.lcf)
SBIN              := $(NEF:%.nef=%.sbin)
XMAP              := $(NEF).xMAP
MWCFLAGS          := -O4,p -enum int -lang c99 -Cpp_exceptions off -gccext,on -proc $(PROC)
OVERLAYS          :=

LSF               := $(NEFNAME).lsf

$(foreach dir,$(ALL_SUBDIRS),$(shell mkdir -p $(BUILD_DIR)/$(dir)))

$(SRC_BUILDDIR)/%.o: $(SRC_SUBDIR)/%.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $@ $<

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $@ $<

$(NATIVE_TOOLS): tools
tools:
	$(foreach tool,$(NATIVE_TOOLS),$(MAKE) -C $(shell dirname $(tool));)

clean-tools:
	$(foreach tool,$(NATIVE_TOOLS),$(MAKE) -C $(shell dirname $(tool)) clean;)

$(LCF): $(LSF) $(LCF_TEMPLATE)
	$(MAKELCF) $(MAKELCF_FLAGS) $^ $@

$(NEF): $(LCF)
	cd $(BUILD_DIR) && LM_LICENSE_FILE=../../$(LM_LICENSE_FILE) $(WINE) ../../$(MWLD) $(MWLDFLAGS) $(LIBS) -o ../../$(NEF) $(LCF:%(BUILD_DIR)/%=%) $(ALL_OBJS:%(BUILD_DIR)/%=%)
$(SBIN): $(NEF)

$(ELF): $(NEF)
	$(OBJCOPY) $(foreach ov,$(NEFNAME) $(OVERLAYS),--update-section $(ov)=$(BUILD_DIR)/$(ov).sbin -j $(ov)) $< $@ 2>/dev/null
