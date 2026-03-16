PGPHONE_GRA_DIR := files/application/pokegear/phone/pgphone_gra
PGPHONE_GRA_NARC := $(PGPHONE_GRA_DIR).narc

PGPHONE_GRA_FILES := \
	pgphone_gra_00000000.NCLR \
	pgphone_gra_00000001.NCGR \
	pgphone_gra_00000002.NCER \
	pgphone_gra_00000003.NANR \
	pgphone_gra_00000004.NCLR \
	pgphone_gra_00000005.NCLR \
	pgphone_gra_00000006.NCLR \
	pgphone_gra_00000007.NCLR \
	pgphone_gra_00000008.NCLR \
	pgphone_gra_00000009.NCLR \
	pgphone_gra_00000010.NCLR \
	pgphone_gra_00000011.NCLR \
	pgphone_gra_00000012.NCLR \
	pgphone_gra_00000013.NCLR \
	pgphone_gra_00000014.NCLR \
	pgphone_gra_00000015.NCLR \
	pgphone_gra_00000016.NCGR \
	pgphone_gra_00000017.NCGR \
	pgphone_gra_00000018.NCGR \
	pgphone_gra_00000019.NCGR \
	pgphone_gra_00000020.NCGR \
	pgphone_gra_00000021.NCGR \
	pgphone_gra_00000022.NSCR \
	pgphone_gra_00000023.NSCR \
	pgphone_gra_00000024.NSCR \
	pgphone_gra_00000025.NSCR \
	pgphone_gra_00000026.NSCR \
	pgphone_gra_00000027.NSCR \
	pgphone_gra_00000028.NCGR \
	pgphone_gra_00000029.NCGR \
	pgphone_gra_00000030.NCGR \
	pgphone_gra_00000031.NCGR \
	pgphone_gra_00000032.NCGR \
	pgphone_gra_00000033.NCGR \
	pgphone_gra_00000034.NSCR \
	pgphone_gra_00000035.NSCR \
	pgphone_gra_00000036.NSCR \
	pgphone_gra_00000037.NSCR \
	pgphone_gra_00000038.NSCR \
	pgphone_gra_00000039.NSCR \
	pgphone_gra_00000040.NCGR \
	pgphone_gra_00000041.NCGR \
	pgphone_gra_00000042.NCGR \
	pgphone_gra_00000043.NCGR \
	pgphone_gra_00000044.NCGR \
	pgphone_gra_00000045.NCGR \
	pgphone_gra_00000046.NSCR \
	pgphone_gra_00000047.NSCR \
	pgphone_gra_00000048.NSCR \
	pgphone_gra_00000049.NSCR \
	pgphone_gra_00000050.NSCR \
	pgphone_gra_00000051.NSCR

$(PGPHONE_GRA_NARC): $(addprefix $(PGPHONE_GRA_DIR)/,$(PGPHONE_GRA_FILES))
	$(KNARC) -p $@ -d $(PGPHONE_GRA_DIR) -i

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000001.NCGR

VERSION101_SOPC_NCGR_FILES += \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000016.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000017.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000018.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000019.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000020.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000021.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000028.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000029.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000030.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000031.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000032.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000033.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000040.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000041.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000042.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000043.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000044.NCGR \
	$(PGPHONE_GRA_DIR)/pgphone_gra_00000045.NCGR

clean-pgphone-gra:
	$(RM) $(PGPHONE_GRA_NARC)

.PHONY: clean-pgphone-gra
clean-filesystem: clean-pgphone-gra
