TOOLSDIR       := tools
MWCCVER        := 2.0/sp1
PROC           := arm946
PROC_S         := arm5te

include config.mk
include common.mk

ROM               := poke$(buildname).nds

MWCFLAGS += -ipa file -DGAME_VERSION=$(GAME_VERSION) -DGAME_REMASTER=$(GAME_REMASTER) -DGAME_LANGUAGE=$(GAME_LANGUAGE)

.SECONDARY:
.SECONDEXPANSION:
.DELETE_ON_ERROR:
.PHONY: all tidy clean tools clean-tools sub

MAKEFLAGS += --no-print-directory

all: $(ROM)

main: $(SBIN)


$(ROM):
