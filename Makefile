MWCCVER        := 2.0/sp2p3
PROC           := arm946e
PROC_S         := arm5te
PROC_LD        := v5te
LCF_TEMPLATE   := ARM9-TS.lcf.template
LIBS           := -L+lib -l+syscall -nostdlib
ALL_BUILDDIRS  := $(BUILD_DIR)/lib

include config.mk
include common.mk
include graphics_files_rules.mk
include filesystem.mk

ROM            := $(BUILD_DIR)/poke$(buildname).nds
BANNER         := $(ROM:%.nds=%.bnr)
BANNER_SPEC    := $(buildname)/banner.bsf
ICON_PNG       := $(buildname)/icon.png

MWCFLAGS  += -ipa file $(DEFINES)
MWASFLAGS += $(DEFINES)

.PHONY: main sub libsyscall

MAKEFLAGS += --no-print-directory

all: $(ROM)

tidy:
	@$(MAKE) -C sub tidy
	$(RM) -r $(BUILD_DIR)
	$(RM) $(ROM)

clean: tidy clean-tools
	@$(MAKE) -C lib/syscall clean
	@$(MAKE) -C sub clean

main: $(SBIN)
sub: ; @$(MAKE) -C sub

ROMSPEC        := rom.rsf
MAKEROM_FLAGS  := $(DEFINES)

$(NEF): libsyscall

libsyscall:
	$(MAKE) -C lib/syscall all install INSTALL_PREFIX=$(PROJECT_ROOT)/$(BUILD_DIR) GAME_CODE=$(GAME_CODE)

SBIN_LZ        := $(SBIN)_LZ

$(SBIN_LZ): $(BUILD_DIR)/component.files
	$(WINE) $(COMPSTATIC) -9 -c -f $<

$(BUILD_DIR)/component.files: main ;

$(ROM): $(ROMSPEC) $(NITROFS_FILES) $(SBIN_LZ) sub $(BANNER)
	$(WINE) $(MAKEROM) $(MAKEROM_FLAGS) -DNITROFS_FILES="$(NITROFS_FILES)" -DTITLE_NAME="$(TITLE_NAME)" -DBNR="$(BANNER)" $< $@
	$(FIXROM) $@ --secure-crc $(SECURE_CRC) --game-code $(GAME_CODE)
ifeq ($(COMPARE),1)
	$(SHASUM) -c $(buildname)/rom.sha1
endif

$(BANNER): $(BANNER_SPEC) $(ICON_PNG:%.png=%.nbfp) $(ICON_PNG:%.png=%.nbfc)
	$(WINE) $(MAKEBNR) $< $@
