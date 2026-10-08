.PHONY:     		\
	all 			\
	check			\
	heartgold		\
	meson   		\
	release 		\
	rom 			\
	setup_heartgold \
	setup_release 	\
	setup_soulsilver\
	skrew			\
	soulsilver		\
	skrewrm 		\
	skrewup 		\
	target  		\
	update

GAME_VERSION ?= HEARTGOLD
GAME_LANGUAGE ?= ENGLISH

# Target-specific config
ifeq ($(GAME_VERSION),SOULSILVER)
  target_name := soulsilver
else
  ifeq ($(GAME_VERSION),HEARTGOLD)
    target_name := heartgold
  else
    $(error invalid GAME_VERSION=$(GAME_VERSION))
  endif
endif
ifeq ($(GAME_LANGUAGE),ENGLISH)
  target_region := us
else
  $(error unsupported GAME_LANGUAGE=$(GAME_LANGUAGE))
endif

SUBPROJ_DIR := subprojects

MESON_VER := 1.12.0
MESON_DIR := $(SUBPROJ_DIR)/meson-$(MESON_VER)
MESON_SUB := $(MESON_DIR)/meson.py

MESON ?= $(MESON_SUB)
NINJA ?= ninja
GIT ?= git

BUILD ?= build

UNAME_R := $(shell uname -r)
UNAME_S := $(shell uname -s)
CWD := $(shell pwd)

# Check for Windows-drive access
ifneq (,$(findstring Microsoft,$(UNAME_R)))
  ifneq (,$(filter /mnt/%,$(realpath $(CWD))))
    WSL_ACCESSING_WINDOWS := 0
  else
    WSL_ACCESSING_WINDOWS := 1
  endif
else
  WSL_ACCESSING_WINDOWS := 1
endif

# Set up the compiler toolchain dependency
SKREW_GET := tools/devtools/get_metroskrew.sh
SKREW_VER := 0.1.3
SKREW_DIR := tools/metroskrew

ifneq (,$(findstring Linux,$(UNAME_S)))
  ifeq (0,$(WSL_ACCESSING_WINDOWS))
    NATIVE := native.ini
    CROSS := cross.ini
    SKREW_SYS := windows
    SKREW_EXE := $(SKREW_DIR)/bin/skrewrap.exe
  else
    NATIVE := native.ini
    CROSS := cross_unix.ini
    SKREW_SYS := linux
    SKREW_EXE := $(SKREW_DIR)/bin/skrewrap
  endif
else
  ifneq (,$(findstring Darwin,$(UNAME_S)))
    NATIVE := native_macos.ini
    CROSS := cross_unix.ini
    SKREW_SYS := wine
    SKREW_EXE := $(SKREW_DIR)/bin/skrewrap
  else
    ifneq (,$(findstring BSD, $(UNAME_S)))
      NATIVE := native.ini
      CROSS := cross_unix.ini
      SKREW_SYS := linux
      SKREW_EXE := $(SKREW_DIR)/bin/skrewrap
    else
      NATIVE := native.ini
      CROSS := cross.ini
      SKREW_SYS := windows
      SKREW_EXE := $(SKREW_DIR)/bin/skrewrap.exe
    endif
  endif
endif

export NINJA_STATUS := [%p %f/%t]

# Modders can delete the `check` dependency here after their first build.
all: release check

.NOTPARALLEL: release
release: rom

.NOTPARALLEL: heartgold
heartgold: setup_heartgold
	$(NINJA) -C $(BUILD) pokeheartgold.us.nds
	$(MESON) test -C $(BUILD) --verbose

.NOTPARALLEL: soulsilver
soulsilver: setup_soulsilver
	$(NINJA) -C $(BUILD) pokesoulsilver.us.nds
	$(MESON) test -C $(BUILD) --verbose

check: rom
	$(MESON) test -C $(BUILD) --verbose

rom: setup_$(target_name)
	$(NINJA) -C $(BUILD) poke$(target_name).$(target_region).nds

target: $(BUILD)/build.ninja
	@echo $(SKREW_EXE)
	$(MESON) compile -C $(BUILD)

clean: $(BUILD)/build.ninja
	$(MESON) compile -C $(BUILD) --clean

setup_heartgold: $(BUILD)/build.ninja
	$(MESON) configure $(BUILD) -Dgame_version=HEARTGOLD

setup_soulsilver: $(BUILD)/build.ninja
	$(MESON) configure $(BUILD) -Dgame_version=SOULSILVER

$(BUILD)/build.ninja: | $(BUILD) $(SKREW_EXE) meson
	$(MESON) setup \
		-Dgame_version=$(GAME_VERSION) \
		--wrap-mode=nopromote \
		--native-file=meson/$(NATIVE) \
		--cross-file=meson/$(CROSS) \
		-- $(BUILD)

$(BUILD):
	mkdir -p -- $(BUILD)

update: meson skrewup
	$(MESON) subprojects update || true

meson: ;
ifeq ($(MESON),$(MESON_SUB))
meson: $(MESON_SUB)
endif

$(MESON_SUB):
	$(GIT) clone --depth=1 -b $(MESON_VER) https://github.com/mesonbuild/meson $(@D)

skrew: $(SKREW_EXE)

skrewrm:
	rm -rf $(SKREW_DIR)

skrewup: skrewrm skrew


$(SKREW_EXE):
	SKREW_SYS=$(SKREW_SYS) SKREW_VER=$(SKREW_VER) SKREW_DIR=$(SKREW_DIR) $(SKREW_GET)
