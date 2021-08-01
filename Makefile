# Because mwldarm expects absolute paths to be WIN32 paths,
# all paths referring up from BUILD_DIR must be relative.
BACK_REL     := ../..
TOOLSDIR       := tools
MWCCVER        := 2.0/sp1
PROC           := arm946e
PROC_S         := arm5te
PROC_LD        := v5te
LCF_TEMPLATE   := ARM9-TS.lcf.template

include config.mk
include common.mk
include graphics_files_rules.mk
include filesystem.mk

ROM            := $(BUILD_DIR)/poke$(buildname).nds
BANNER         := $(ROM:%.nds=%.bnr)
BANNER_SPEC    := $(ROM:%.nds=%.bsf)
ICON_PNG       := $(ROM:$(BUILD_DIR)/%.nds=icon/%.png)

MWCFLAGS  += -ipa file $(DEFINES)
MWASFLAGS += $(DEFINES)

.PHONY: main sub

MAKEFLAGS += --no-print-directory

all: $(ROM) $(NEF) $(ELF) $(SBIN)

tidy:
	$(MAKE) -I $(CURDIR) -C sub tidy
	$(RM) -r $(BUILD_DIR)
	$(RM) $(ROM)

clean: tidy
	$(MAKE) -I $(CURDIR) -C sub clean

main: $(SBIN)
sub: ; $(MAKE) -I $(CURDIR) -C sub

ROMSPEC        := rom.rsf
MAKEROM_FLAGS  := $(DEFINES)

SBIN_LZ        := $(SBIN)_LZ

$(SBIN_LZ): $(BUILD_DIR)/component.files
	$(WINE) $(COMPSTATIC) -9 -c -f $<

$(BUILD_DIR)/component.files: main ;

$(ROM): $(ROMSPEC) $(NITROFS_FILES) $(SBIN_LZ) sub $(BANNER)
	$(WINE) $(MAKEROM) $(MAKEROM_FLAGS) -DNITROFS_FILES="$(NITROFS_FILES)" -DTITLE_NAME="$(TITLE_NAME)" $< $@
	$(FIXROM) $@ --secure-crc $(SECURE_CRC) --game-code $(GAME_CODE)
ifeq ($(COMPARE),1)
	$(SHASUM) -c $(@:$(BUILD_DIR)/%.nds=%.sha1)
endif

$(BANNER): $(BANNER_SPEC) $(ICON_PNG:%.png=%.nbfp) $(ICON_PNG:%.png=%.nbfc)
	$(WINE) $(MAKEBNR) $< $@
