PGEAR_GRA_DIR := files/application/pokegear/pgear_gra
PGEAR_GRA_NARC := $(PGEAR_GRA_DIR).narc

PGEAR_GRA_FILES := \
	pgear_gra_00000000.NCLR \
	pgear_gra_00000001.NCLR \
	pgear_gra_00000002.NCLR \
	pgear_gra_00000003.NCLR \
	pgear_gra_00000004.NCLR \
	pgear_gra_00000005.NCLR \
	pgear_gra_00000006.NCGR \
	pgear_gra_00000007.NCGR \
	pgear_gra_00000008.NCGR \
	pgear_gra_00000009.NCGR \
	pgear_gra_00000010.NCGR \
	pgear_gra_00000011.NCGR \
	pgear_gra_00000012.NCER \
	pgear_gra_00000013.NANR \
	pgear_gra_00000014.NCER \
	pgear_gra_00000015.NANR \
	pgear_gra_00000016.NCER \
	pgear_gra_00000017.NANR \
	pgear_gra_00000018.NCER \
	pgear_gra_00000019.NANR \
	pgear_gra_00000020.NCER \
	pgear_gra_00000021.NANR \
	pgear_gra_00000022.NCER \
	pgear_gra_00000023.NANR \
	pgear_gra_00000024.NCLR \
	pgear_gra_00000025.NCLR \
	pgear_gra_00000026.NCLR \
	pgear_gra_00000027.NCLR \
	pgear_gra_00000028.NCLR \
	pgear_gra_00000029.NCLR \
	pgear_gra_00000030.NCLR \
	pgear_gra_00000031.NCLR \
	pgear_gra_00000032.NCLR \
	pgear_gra_00000033.NCLR \
	pgear_gra_00000034.NCLR \
	pgear_gra_00000035.NCLR \
	pgear_gra_00000036.NCGR \
	pgear_gra_00000037.NCGR \
	pgear_gra_00000038.NCGR \
	pgear_gra_00000039.NCGR \
	pgear_gra_00000040.NCGR \
	pgear_gra_00000041.NCGR \
	pgear_gra_00000042.NSCR \
	pgear_gra_00000043.NSCR \
	pgear_gra_00000044.NSCR \
	pgear_gra_00000045.NSCR \
	pgear_gra_00000046.NSCR \
	pgear_gra_00000047.NSCR \
	pgear_gra_00000048.NCGR \
	pgear_gra_00000049.NCGR \
	pgear_gra_00000050.NCGR \
	pgear_gra_00000051.NCGR \
	pgear_gra_00000052.NCGR \
	pgear_gra_00000053.NCGR \
	pgear_gra_00000054.NSCR \
	pgear_gra_00000055.NSCR \
	pgear_gra_00000056.NSCR \
	pgear_gra_00000057.NSCR \
	pgear_gra_00000058.NSCR \
	pgear_gra_00000059.NSCR

$(PGEAR_GRA_NARC): $(addprefix $(PGEAR_GRA_DIR)/,$(PGEAR_GRA_FILES))
	$(KNARC) -p $@ -d $(PGEAR_GRA_DIR) -i

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(PGEAR_GRA_DIR)/pgear_gra_00000006.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000007.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000008.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000009.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000010.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000011.NCGR

VERSION101_SOPC_NCGR_FILES += \
	$(PGEAR_GRA_DIR)/pgear_gra_00000036.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000037.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000038.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000039.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000040.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000041.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000048.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000049.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000050.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000051.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000052.NCGR \
	$(PGEAR_GRA_DIR)/pgear_gra_00000053.NCGR

clean-pgear-gra:
	$(RM) $(PGEAR_GRA_NARC)

.PHONY: clean-pgear-gra
clean-filesystem: clean-pgear-gra
