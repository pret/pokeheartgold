SBOX_GRA_DIR := files/data/sbox_gra
SBOX_GRA_NARC := $(SBOX_GRA_DIR).narc

SBOX_GRA_FILES := \
	sbox_gra.NCLR \
	sbox_gra.NCGR

4BPP_NOPAD_PCMP_NCLR_FILES += $(SBOX_GRA_DIR)/sbox_gra.NCLR
VERSION101_SOPC_NCGR_FILES += $(SBOX_GRA_DIR)/sbox_gra.NCGR

$(SBOX_GRA_NARC): $(addprefix $(SBOX_GRA_DIR)/,$(SBOX_GRA_FILES))

clean-sbox-gra:
	$(RM) $(SBOX_GRA_NARC) $(addprefix $(SBOX_GRA_DIR)/,$(SBOX_GRA_FILES))

.PHONY: clean-sbox-gra
clean-filesystem: clean-sbox-gra

