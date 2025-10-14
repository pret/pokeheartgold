VOLTORB_FLIP_DIR := files/application/voltorb_flip
VOLTORB_FLIP_FILES := \
	voltorb_flip_00000000.NCLR \
	voltorb_flip_00000001.NCLR \
	voltorb_flip_00000002.NCGR.lz \
	voltorb_flip_00000003.NCGR.lz \
	voltorb_flip_00000004.NSCR.lz \
	voltorb_flip_00000005.NSCR.lz \
	voltorb_flip_00000006.NSCR.lz \
	voltorb_flip_00000007.NSCR.lz \
	voltorb_flip_00000008.NSCR.lz \
	voltorb_flip_00000009.NSCR.lz \
	voltorb_flip_00000010.NCLR \
	voltorb_flip_00000011.NCGR.lz \
	voltorb_flip_00000012.NCER.lz \
	voltorb_flip_00000013.NANR.lz \
	voltorb_flip_00000014.NCLR \
	voltorb_flip_00000015.NCGR.lz \
	voltorb_flip_00000016.NCER.lz \
	voltorb_flip_00000017.NANR.lz

EXTFMT_LZ_FILES += $(addprefix $(VOLTORB_FLIP_DIR)/,$(filter %.lz,$(VOLTORB_FLIP_FILES)))

VERSION101_SOPC_NCGR_FILES += \
	$(VOLTORB_FLIP_DIR)/voltorb_flip_00000002.NCGR \
	$(VOLTORB_FLIP_DIR)/voltorb_flip_00000003.NCGR

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(VOLTORB_FLIP_DIR)/voltorb_flip_00000011.NCGR \
	$(VOLTORB_FLIP_DIR)/voltorb_flip_00000015.NCGR

$(VOLTORB_FLIP_DIR).narc: $(addprefix $(VOLTORB_FLIP_DIR)/,$(VOLTORB_FLIP_FILES))
	$(KNARC) -p $@ -d $(VOLTORB_FLIP_DIR) -i

clean-voltorb-flip:
	$(RM) $(VOLTORB_FLIP_DIR).narc $(VOLTORB_FLIP_DIR)/*.lz

.PHONY: clean-voltorb-flip
clean-filesystem: clean-voltorb-flip
