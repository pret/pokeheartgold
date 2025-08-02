PGMAP_GRA_DIR := files/application/pokegear/map/pgmap_gra
PGMAP_GRA_NARC := $(PGMAP_GRA_DIR).narc

PGMAP_GRA_FILES := \
	pgmap_gra_00000000.NCLR \
	pgmap_gra_00000001.NCGR \
	pgmap_gra_00000002.NCER \
	pgmap_gra_00000003.NANR \
	pgmap_gra_00000004.NCGR \
	pgmap_gra_00000005.NCER \
	pgmap_gra_00000006.NANR \
	pgmap_gra_00000007.NCGR \
	pgmap_gra_00000008.NCER \
	pgmap_gra_00000009.NANR \
	pgmap_gra_00000010.NCGR \
	pgmap_gra_00000011.NSCR \
	pgmap_gra_00000012.NCGR \
	pgmap_gra_00000013.NSCR \
	pgmap_gra_00000014.NCLR \
	pgmap_gra_00000015.NCLR \
	pgmap_gra_00000016.NCLR \
	pgmap_gra_00000017.NCLR \
	pgmap_gra_00000018.NCLR \
	pgmap_gra_00000019.NCLR \
	pgmap_gra_00000020.NCLR \
	pgmap_gra_00000021.NCLR \
	pgmap_gra_00000022.NCLR \
	pgmap_gra_00000023.NCLR \
	pgmap_gra_00000024.NCLR \
	pgmap_gra_00000025.NCLR \
	pgmap_gra_00000026.NCGR \
	pgmap_gra_00000027.NCGR \
	pgmap_gra_00000028.NCGR \
	pgmap_gra_00000029.NCGR \
	pgmap_gra_00000030.NCGR \
	pgmap_gra_00000031.NCGR \
	pgmap_gra_00000032.NSCR \
	pgmap_gra_00000033.NSCR \
	pgmap_gra_00000034.NSCR \
	pgmap_gra_00000035.NSCR \
	pgmap_gra_00000036.NSCR \
	pgmap_gra_00000037.NSCR \
	pgmap_gra_00000038.NSCR \
	pgmap_gra_00000039.NSCR \
	pgmap_gra_00000040.NSCR \
	pgmap_gra_00000041.NSCR \
	pgmap_gra_00000042.NSCR \
	pgmap_gra_00000043.NSCR \
	pgmap_gra_00000044.NSCR \
	pgmap_gra_00000045.NSCR \
	pgmap_gra_00000046.NSCR \
	pgmap_gra_00000047.NSCR \
	pgmap_gra_00000048.NSCR \
	pgmap_gra_00000049.NSCR \
	pgmap_gra_00000050.NCGR \
	pgmap_gra_00000051.NCGR \
	pgmap_gra_00000052.NCGR \
	pgmap_gra_00000053.NCGR \
	pgmap_gra_00000054.NCGR \
	pgmap_gra_00000055.NCGR \
	pgmap_gra_00000056.NSCR \
	pgmap_gra_00000057.NSCR \
	pgmap_gra_00000058.NSCR \
	pgmap_gra_00000059.NSCR \
	pgmap_gra_00000060.NSCR \
	pgmap_gra_00000061.NSCR \
	pgmap_gra_00000062.NCLR \
	pgmap_gra_00000063.NCLR \
	pgmap_gra_00000064.NCGR \
	pgmap_gra_00000065.NSCR \
	pgmap_gra_00000066.NCGR \
	pgmap_gra_00000067.NSCR \
	pgmap_gra_00000068.NCGR \
	pgmap_gra_00000069.NSCR

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000001.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000004.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000007.NCGR

VERSION101_SOPC_8BPP_NCGR_FILES += \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000010.NCGR

VERSION101_SOPC_NCGR_FILES += \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000012.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000026.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000027.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000028.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000029.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000030.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000031.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000050.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000051.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000052.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000053.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000054.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000055.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000064.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000066.NCGR \
	$(PGMAP_GRA_DIR)/pgmap_gra_00000068.NCGR

$(PGMAP_GRA_NARC): $(addprefix $(PGMAP_GRA_DIR)/,$(PGMAP_GRA_FILES))
	$(KNARC) -p $@ -d $(PGMAP_GRA_DIR) -i

clean-pgmap-gra:
	$(RM) $(PGMAP_GRA_NARC)

.PHONY: clean-pgmap-gra
clean-filesystem: clean-pgmap-gra
