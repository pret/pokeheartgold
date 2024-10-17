DATA_NAMEIN_DIR := files/data/namein
DATA_NAMEIN_NARC := $(DATA_NAMEIN_DIR).narc
DATA_NAMEIN_FILES := \
	namein_00000000.NCLR \
	namein_00000001.NCLR \
	namein_00000002.NCGR.lz \
	namein_00000003.NCGR.lz \
	namein_00000004.NSCR.lz \
	namein_00000005.NSCR.lz \
	namein_00000006.NSCR.lz \
	namein_00000007.NSCR.lz \
	namein_00000008.NSCR.lz \
	namein_00000009.NSCR.lz \
	namein_00000010.NCGR.lz \
	namein_00000011.NCGR.lz \
	namein_00000012.NCER.lz \
	namein_00000013.NCER.lz \
	namein_00000014.NANR.lz \
	namein_00000015.NANR.lz \
	namein_00000016.NCGR.lz \
	namein_00000017.NSCR.lz \
	namein_00000018.NSCR.lz

$(DATA_NAMEIN_NARC): $(addprefix $(DATA_NAMEIN_DIR)/,$(DATA_NAMEIN_FILES))

clean-data-namein:
	$(RM) $(filter %.lz,$(addprefix $(DATA_NAMEIN_DIR)/,$(DATA_NAMEIN_FILES)))

.PHONY: clean-data-namein
clean-filesystem: clean-data-namein
