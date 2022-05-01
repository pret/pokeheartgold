MWCCVER        := 2.0/sp2p2
PROC           := arm946e
PROC_S         := arm5te
PROC_LD        := v5te
LCF_TEMPLATE   := ARM9-TS.lcf.template
LIBS           := -Llib -lsyscall -nostdlib
OPTFLAGS       := -O4,p

include config.mk

ALL_BUILDDIRS  := $(BUILD_DIR)/lib
include common.mk
include filesystem.mk

$(ASM_OBJS): MWASFLAGS += -DPM_ASM -include config.h
$(C_OBJS):   MWCFLAGS  +=          -include global.h

$(BUILD_DIR)/asm/nitrocrypto.o:  MWCCVER := 1.2/sp2p3
$(BUILD_DIR)/lib/msl/src/*.o:    EXCCFLAGS := -Cpp_exceptions on

$(ASM_OBJS): $(WORK_DIR)/include/config.h
$(C_OBJS):   $(WORK_DIR)/include/global.h

ROM             := $(BUILD_DIR)/poke$(buildname).nds
BANNER          := $(ROM:%.nds=%.bnr)
BANNER_SPEC     := $(buildname)/banner.bsf
ICON_PNG        := $(buildname)/icon.png
HEADER_TEMPLATE := $(buildname)/rom_header_template.sbin

.PHONY: main sub libsyscall sdk sdk9 sdk7
.PRECIOUS: $(ROM)

MAKEFLAGS += --no-print-directory

all: $(ROM)

tidy:
	@$(MAKE) -C sub tidy
	$(RM) -r $(BUILD_DIR)
	$(RM) -r $(PROJECT_CLEAN_TARGETS)
	$(RM) $(ROM)

clean: tidy clean-filesystem clean-tools
	@$(MAKE) -C lib/syscall clean
	@$(MAKE) -C sub clean

SBIN_LZ        := $(SBIN)_LZ
.PHONY: main_lz

sdk9 sdk7: sdk
main filesystem: | sdk9
sub: | sdk7

main: $(SBIN) $(ELF)
main_lz: $(SBIN_LZ)
sub: ; @$(MAKE) -C sub

ROMSPEC        := rom.rsf
MAKEROM_FLAGS  := $(DEFINES)

$(NEF): libsyscall

libsyscall:
	$(MAKE) -C lib/syscall all install INSTALL_PREFIX=$(abspath $(WORK_DIR)/$(BUILD_DIR)) GAME_CODE=$(GAME_CODE)

$(SBIN_LZ): $(BUILD_DIR)/component.files
	$(COMPSTATIC) -9 -c -f $<

$(BUILD_DIR)/component.files: main ;

$(HEADER_TEMPLATE): ;

$(ROM): $(ROMSPEC) filesystem main_lz sub $(BANNER)
	$(WINE) $(MAKEROM) $(MAKEROM_FLAGS) -DBUILD_DIR=$(BUILD_DIR) -DNITROFS_FILES="$(NITROFS_FILES:files/%=%)" -DTITLE_NAME="$(TITLE_NAME)" -DBNR="$(BANNER)" -DHEADER_TEMPLATE="$(HEADER_TEMPLATE)" $< $@
	$(FIXROM) $@ --secure-crc $(SECURE_CRC) --game-code $(GAME_CODE)
ifeq ($(COMPARE),1)
	$(SHA1SUM) -c $(buildname)/rom.sha1
endif

$(BANNER): $(BANNER_SPEC) $(ICON_PNG:%.png=%.nbfp) $(ICON_PNG:%.png=%.nbfc)
	$(WINE) $(MAKEBNR) $< $@

# TODO: move to NitroSDK makefile
FX_CONST_H := $(WORK_DIR)/lib/include/nitro/fx/fx_const.h
PROJECT_CLEAN_TARGETS += $(FX_CONST_H)
$(FX_CONST_H): $(TOOLSDIR)/gen_fx_consts/fx_const.csv
	$(MKFXCONST) $@
sdk: $(FX_CONST_H)
$(WORK_DIR)/include/global.h: $(FX_CONST_H) ;

# Convenience targets
heartgold:          ; @$(MAKE) GAME_VERSION=HEARTGOLD
soulsilver:         ; @$(MAKE) GAME_VERSION=SOULSILVER
compare-heartgold:  ; @$(MAKE) GAME_VERSION=HEARTGOLD  COMPARE=1
compare-soulsilver: ; @$(MAKE) GAME_VERSION=SOULSILVER COMPARE=1

compare:             compare-heartgold

.PHONY: heartgold soulsilver compare compare-heartgold compare-soulsilver
