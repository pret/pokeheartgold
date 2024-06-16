PLIST_GRA_DIR := files/graphic/plist_gra
PLIST_GRA_NARC := $(PLIST_GRA_DIR).narc

PLIST_GRA_FILES := \
	plist_gra_00000000.NANR \
	plist_gra_00000001.NCER \
	plist_gra_00000002.NCGR \
	plist_gra_00000003.NCGR \
	plist_gra_00000004.NCLR \
	plist_gra_00000005.NANR \
	plist_gra_00000006.NCER \
	plist_gra_00000007.NCGR \
	plist_gra_00000008.NCLR \
	plist_gra_00000009.NANR \
	plist_gra_00000010.NCER \
	plist_gra_00000011.NCGR \
	plist_gra_00000012.NCGR \
	plist_gra_00000013.NCLR \
	plist_gra_00000014.NSCR \
	plist_gra_00000015.NCGR \
	plist_gra_00000016.NCLR \
	plist_gra_00000017.NSCR \
	plist_gra_00000018.NANR \
	plist_gra_00000019.NCER \
	plist_gra_00000020.NCGR \
	plist_gra_00000021.NCLR \
	plist_gra_00000022.NSCR \
	plist_gra_00000023.NCLR \
	plist_gra_00000024.NCGR \
	plist_gra_00000025.NSCR \
	plist_gra_00000026.NCGR

$(PLIST_GRA_NARC): $(addprefix $(PLIST_GRA_DIR)/,$(PLIST_GRAPFILES))

FS_CLEAN_TARGETS += $(PLIST_GRA_NARC)
