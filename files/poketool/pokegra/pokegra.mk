POKEGRA_DIR := files/poketool/pokegra
POKEGRA_SPRITES_DIR := $(POKEGRA_DIR)/pokegra
POKEGRA_BUILD_DIR := $(POKEGRA_DIR)/build-pokegra
POKEGRA_NARC := $(POKEGRA_DIR)/pokegra.narc

POKEGRA_GFX_FLAGS_SPRITE := -scanfronttoback -handleempty
POKEGRA_GFX_FLAGS_PAL := -bitdepth 8 -nopad -comp 10

POKEGRA_PIC_FILES := $(find $(POKEGRA_SPRITES_DIR) -name '*.png')

$(POKEGRA_NARC): %.narc: $(POKEGRA_PIC_FILES)
	mkdir -p $(POKEGRA_BUILD_DIR)
	for a in $$(seq -w 0000 $$(printf "%04d" $$(expr $$(ls $(POKEGRA_SPRITES_DIR) | wc -l) - 1))); do \
		$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/female/back.png $(POKEGRA_BUILD_DIR)/$$a-00.NCGR $(POKEGRA_GFX_FLAGS_SPRITE); \
		$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/male/back.png $(POKEGRA_BUILD_DIR)/$$a-01.NCGR $(POKEGRA_GFX_FLAGS_SPRITE); \
		$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/female/front.png $(POKEGRA_BUILD_DIR)/$$a-02.NCGR $(POKEGRA_GFX_FLAGS_SPRITE); \
		$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/male/front.png $(POKEGRA_BUILD_DIR)/$$a-03.NCGR $(POKEGRA_GFX_FLAGS_SPRITE); \
		if test -s $(POKEGRA_SPRITES_DIR)/$$a/male/front.png; then \
			$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/male/front.png $(POKEGRA_BUILD_DIR)/$$a-04.NCLR $(POKEGRA_GFX_FLAGS_PAL); \
			$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/male/back.png $(POKEGRA_BUILD_DIR)/$$a-05.NCLR $(POKEGRA_GFX_FLAGS_PAL); \
		elif test -s $(POKEGRA_SPRITES_DIR)/$$a/female/front.png; then \
			$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/female/front.png $(POKEGRA_BUILD_DIR)/$$a-04.NCLR $(POKEGRA_GFX_FLAGS_PAL); \
			$(GFX) $(POKEGRA_SPRITES_DIR)/$$a/female/back.png $(POKEGRA_BUILD_DIR)/$$a-05.NCLR $(POKEGRA_GFX_FLAGS_PAL); \
		fi \
	done
	cp $(POKEGRA_SPRITES_DIR)/0000/4_0004.NCLR $(POKEGRA_BUILD_DIR)/0000-04.NCLR
	cp $(POKEGRA_SPRITES_DIR)/0000/4_0005.NCLR $(POKEGRA_BUILD_DIR)/0000-05.NCLR
	$(KNARC) -d $(POKEGRA_BUILD_DIR) -p $@ -i

FS_CLEAN_TARGETS += $(POKEGRA_NARC) $(POKEGRA_BUILD_DIR)
