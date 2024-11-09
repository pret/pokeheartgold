SBOX_GRA_DIR := files/data/sbox_gra
SBOX_GRA_NARC := $(SBOX_GRA_DIR).narc

SBOX_GRA_FILES := \
	sbox_gra_00000000.NCLR \
	sbox_gra_00000001.NCGR

VERSION101_SOPC_NCGR_FILES += $(SBOX_GRA_DIR)/sbox_gra_00000001.NCGR

$(SBOX_GRA_NARC): $(addprefix $(SBOX_GRA_DIR)/,$(SBOX_GRA_FILES))

clean-sbox-gra:
	$(RM) $(SBOX_GRA_NARC) $(addprefix $(SBOX_GRA_DIR)/,$(SBOX_GRA_FILES))

.PHONY: clean-sbox-gra
clean-filesystem: clean-sbox-gra

