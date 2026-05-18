POKEFOOT_DIR := files/poketool/pokefoot/pokefoot
POKEFOOT_NARC := $(POKEFOOT_DIR).narc

POKEFOOT_PNGS := $(wildcard $(POKEFOOT_DIR)/pokefoot_*.png)
POKEFOOT_NCGRS := $(POKEFOOT_PNGS:%.png=%.NCGR)
POKEFOOT_FILES := \
	pokefoot_00000000.NCLR \
	pokefoot_00000001.NANR.lz \
	pokefoot_00000002.NCER.lz \
	$(notdir $(POKEFOOT_NCGRS:%=%.lz))

CLOBBER_SIZE_VERSION101_128K_NCGR_FILES += $(POKEFOOT_NCGRS)
$(POKEFOOT_NARC): $(addprefix $(POKEFOOT_DIR)/,$(POKEFOOT_FILES))

.PHONY: clean-pokefoot
clean-filesystem: clean-pokefoot

clean-pokefoot:
	$(RM) $(POKEFOOT_NCGRS) $(POKEFOOT_NARC)
