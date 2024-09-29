POKEGRA_DIR := files/poketool/pokegra
OTHERPOKE_SPRITES_DIR := $(POKEGRA_DIR)/otherpoke
OTHERPOKE_BUILD_DIR := $(POKEGRA_DIR)/build-otherpoke
OTHERPOKE_NARC := $(POKEGRA_DIR)/otherpoke.narc

OTHERPOKE_MAP_TXT := $(POKEGRA_DIR)/otherpoke.txt

OTHERPOKE_PIC_FILES := $(find $(OTHERPOKE_SPRITES_DIR) -name '*.png')

$(OTHERPOKE_NARC): %.narc: $(OTHERPOKE_PIC_FILES)
	mkdir -p $(OTHERPOKE_BUILD_DIR)
	while read -r line; do $(GFX) $$line; done < $(OTHERPOKE_MAP_TXT)
	$(KNARC) -d $(OTHERPOKE_BUILD_DIR) -p $@ -i

clean-otherpoke:
	$(RM) -r $(OTHERPOKE_NARC) $(OTHERPOKE_BUILD_DIR)

.PHONY: clean-otherpoke
clean-filesystem: clean-otherpoke
