GUINNESS_DIR := files/application/guinness
GUINNESS_NARC := $(GUINNESS_DIR).narc

GUINNESS_FILES := \
	guinness_00000000.NCLR \
	guinness_00000001.NCLR \
	guinness_00000002.NCGR.lz \
	guinness_00000003.NCGR.lz \
	guinness_00000004.NSCR.lz \
	guinness_00000005.NSCR.lz \
	guinness_00000006.NCLR \
	guinness_00000007.NANR.lz \
	guinness_00000008.NCER.lz \
	guinness_00000009.NCGR.lz

$(GUINNESS_NARC): $(addprefix $(GUINNESS_DIR)/,$(GUINNESS_FILES))
	$(KNARC) -p $@ -d $(GUINNESS_DIR) -i

clean-guinness:
	$(RM) $(GUINNESS_NARC) \
	$(addprefix $(GUINNESS_DIR)/,$(filter %.lz,$(GUINNESS_FILES)))

.PHONY: clean-guinness
clean-filesystem: clean-guinness
