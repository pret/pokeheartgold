GAME_VERSION       ?= HEARTGOLD
GAME_REMASTER      ?= 0
GAME_LANGUAGE      ?= ENGLISH

ifeq ($(GAME_VERSION),HEARTGOLD)
buildname     := heartgold
TITLE_NAME    := POKEMON HG
GAME_CODE     := IPK
else
ifeq ($(GAME_VERSION),SOULSILVER)
buildname := soulsilver
TITLE_NAME    := POKEMON SS
GAME_CODE     := IPG
else
$(error Unrecognized game version: $(GAME_VERSION))
endif
endif

ifneq ($(GAME_REMASTER),0)
buildname := $(buildname).rev$(GAME_REMASTER)
endif

ifeq ($(GAME_LANGUAGE),ENGLISH)
buildname := $(buildname).us
GAME_CODE := $(GAME_CODE)E
else
$(error Unsupported game language: $(GAME_LANGUAGE))
endif

BUILD_DIR         := build/$(buildname)
NEFNAME           := main
