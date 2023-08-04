POKEGRA_DIR := files/poketool/pokegra
POKEGRA_SPRITES_DIR := $(POKEGRA_DIR)/pokegra
POKEGRA_BUILD_DIR := $(POKEGRA_DIR)/build-pokegra
POKEGRA_NARC := $(POKEGRA_DIR)/pokegra.narc

POKEGRA_GFX_FLAGS_SPRITE := -scanfronttoback -handleempty
POKEGRA_GFX_FLAGS_PAL := -bitdepth 8 -nopad -comp 10


# data/graphics/number/female/back.png
POKEGRA_FEMALE_BACK_FILES := $(wildcard $(POKEGRA_SPRITES_DIR)/*/female/back.png)
POKEGRA_FEMALE_BACK_OBJS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/female/back.png,$(POKEGRA_BUILD_DIR)/%-00.NCGR,$(POKEGRA_FEMALE_BACK_FILES))
# data/graphics/number/male/back.png
POKEGRA_MALE_BACK_FILES := $(wildcard $(POKEGRA_SPRITES_DIR)/*/male/back.png)
POKEGRA_MALE_BACK_OBJS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/back.png,$(POKEGRA_BUILD_DIR)/%-01.NCGR,$(POKEGRA_MALE_BACK_FILES))
# data/graphics/number/female/front.png
POKEGRA_FEMALE_FRONT_FILES := $(wildcard $(POKEGRA_SPRITES_DIR)/*/female/front.png)
POKEGRA_FEMALE_FRONT_OBJS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/female/front.png,$(POKEGRA_BUILD_DIR)/%-02.NCGR,$(POKEGRA_FEMALE_FRONT_FILES))
# data/graphics/number/male/front.png
POKEGRA_MALE_FRONT_FILES := $(wildcard $(POKEGRA_SPRITES_DIR)/*/male/front.png)
POKEGRA_MALE_FRONT_OBJS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/front.png,$(POKEGRA_BUILD_DIR)/%-03.NCGR,$(POKEGRA_MALE_FRONT_FILES))
# palettes
POKEGRA_NORMAL_PALS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/female/back.png,$(POKEGRA_BUILD_DIR)/%-04.NCLR,$(POKEGRA_FEMALE_BACK_FILES))
POKEGRA_SHINY_PALS := $(patsubst $(POKEGRA_SPRITES_DIR)/%/female/back.png,$(POKEGRA_BUILD_DIR)/%-05.NCLR,$(POKEGRA_FEMALE_BACK_FILES))

$(POKEGRA_BUILD_DIR)/%-00.NCGR: $(POKEGRA_SPRITES_DIR)/%/female/back.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_SPRITE)

$(POKEGRA_BUILD_DIR)/%-01.NCGR: $(POKEGRA_SPRITES_DIR)/%/male/back.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_SPRITE)

$(POKEGRA_BUILD_DIR)/%-02.NCGR: $(POKEGRA_SPRITES_DIR)/%/female/front.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_SPRITE)

$(POKEGRA_BUILD_DIR)/%-03.NCGR: $(POKEGRA_SPRITES_DIR)/%/male/front.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_SPRITE)

$(POKEGRA_BUILD_DIR)/%-04.NCLR: $(POKEGRA_SPRITES_DIR)/%/male/front.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	if test -s $<; then \
		$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_PAL); \
	elif test -s $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/front.png,$(POKEGRA_SPRITES_DIR)/%/female/front.png,$<); then \
		$(GFX) $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/front.png,$(POKEGRA_SPRITES_DIR)/%/female/front.png,$<) $@ $(POKEGRA_GFX_FLAGS_PAL); \
	fi

$(POKEGRA_BUILD_DIR)/%-05.NCLR: $(POKEGRA_SPRITES_DIR)/%/male/back.png
	@mkdir -p $(POKEGRA_BUILD_DIR)
	if test -s $<; then \
		$(GFX) $< $@ $(POKEGRA_GFX_FLAGS_PAL); \
	elif test -s $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/back.png,$(POKEGRA_SPRITES_DIR)/%/female/back.png,$<); then \
		$(GFX) $(patsubst $(POKEGRA_SPRITES_DIR)/%/male/back.png,$(POKEGRA_SPRITES_DIR)/%/female/back.png,$<) $@ $(POKEGRA_GFX_FLAGS_PAL); \
	fi


$(POKEGRA_NARC): %.narc: $(POKEGRA_FEMALE_BACK_OBJS) $(POKEGRA_MALE_BACK_OBJS) $(POKEGRA_FEMALE_FRONT_OBJS) $(POKEGRA_MALE_FRONT_OBJS) $(POKEGRA_NORMAL_PALS) $(POKEGRA_SHINY_PALS)
	cp $(POKEGRA_SPRITES_DIR)/0000/4_0004.NCLR $(POKEGRA_BUILD_DIR)/0000-04.NCLR
	cp $(POKEGRA_SPRITES_DIR)/0000/4_0005.NCLR $(POKEGRA_BUILD_DIR)/0000-05.NCLR
	$(KNARC) -d $(POKEGRA_BUILD_DIR) -p $@ -i

FS_CLEAN_TARGETS += $(POKEGRA_NARC) $(POKEGRA_BUILD_DIR)
