VOLTORB_FLIP_DIR := files/application/voltorb_flip
VOLTORB_FLIP_FILES := \
	voltorb_flip_00000000.bin \
	voltorb_flip_00000001.bin \
	voltorb_flip_00000002.bin \
	voltorb_flip_00000003.bin \
	voltorb_flip_00000004.bin \
	voltorb_flip_00000005.bin \
	voltorb_flip_00000006.bin \
	voltorb_flip_00000007.bin \
	voltorb_flip_00000008.bin \
	voltorb_flip_00000009.bin \
	voltorb_flip_00000010.bin \
	voltorb_flip_00000011.bin \
	voltorb_flip_00000012.bin \
	voltorb_flip_00000013.bin \
	voltorb_flip_00000014.bin \
	voltorb_flip_00000015.bin \
	voltorb_flip_00000016.bin \
	voltorb_flip_00000017.bin

$(VOLTORB_FLIP_DIR).narc: $(addprefix $(VOLTORB_FLIP_DIR)/,$(VOLTORB_FLIP_FILES))
	$(KNARC) -p $@ -d $(VOLTORB_FLIP_DIR) -i

FS_CLEAN_TARGETS += $(VOLTORB_FLIP_DIR).narc
