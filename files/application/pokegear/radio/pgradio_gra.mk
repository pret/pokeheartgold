PGRADIO_GRA_DIR := files/application/pokegear/radio/pgradio_gra
PGRADIO_GRA_NARC := $(PGRADIO_GRA_DIR).narc

PGRADIO_GRA_FILES := \
	pgradio_gra_00000000.NCLR \
	pgradio_gra_00000001.NCGR \
	pgradio_gra_00000002.NCER \
	pgradio_gra_00000003.NANR \
	pgradio_gra_00000004.NCLR \
	pgradio_gra_00000005.NCLR \
	pgradio_gra_00000006.NCLR \
	pgradio_gra_00000007.NCLR \
	pgradio_gra_00000008.NCLR \
	pgradio_gra_00000009.NCLR \
	pgradio_gra_00000010.NCLR \
	pgradio_gra_00000011.NCLR \
	pgradio_gra_00000012.NCLR \
	pgradio_gra_00000013.NCLR \
	pgradio_gra_00000014.NCLR \
	pgradio_gra_00000015.NCLR \
	pgradio_gra_00000016.NCGR \
	pgradio_gra_00000017.NCGR \
	pgradio_gra_00000018.NCGR \
	pgradio_gra_00000019.NCGR \
	pgradio_gra_00000020.NCGR \
	pgradio_gra_00000021.NCGR \
	pgradio_gra_00000022.NSCR \
	pgradio_gra_00000023.NSCR \
	pgradio_gra_00000024.NSCR \
	pgradio_gra_00000025.NSCR \
	pgradio_gra_00000026.NSCR \
	pgradio_gra_00000027.NSCR \
	pgradio_gra_00000028.NSCR \
	pgradio_gra_00000029.NSCR \
	pgradio_gra_00000030.NSCR \
	pgradio_gra_00000031.NSCR \
	pgradio_gra_00000032.NSCR \
	pgradio_gra_00000033.NSCR \
	pgradio_gra_00000034.NCGR \
	pgradio_gra_00000035.NCGR \
	pgradio_gra_00000036.NCGR \
	pgradio_gra_00000037.NCGR \
	pgradio_gra_00000038.NCGR \
	pgradio_gra_00000039.NCGR \
	pgradio_gra_00000040.NSCR \
	pgradio_gra_00000041.NSCR \
	pgradio_gra_00000042.NSCR \
	pgradio_gra_00000043.NSCR \
	pgradio_gra_00000044.NSCR \
	pgradio_gra_00000045.NSCR

$(PGRADIO_GRA_NARC): $(addprefix $(PGRADIO_GRA_DIR)/,$(PGRADIO_GRA_FILES))
	$(KNARC) -p $@ -d $(PGRADIO_GRA_DIR) -i

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000001.NCGR

VERSION101_SOPC_NCGR_FILES += \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000016.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000017.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000018.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000019.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000020.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000021.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000034.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000035.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000036.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000037.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000038.NCGR \
	$(PGRADIO_GRA_DIR)/pgradio_gra_00000039.NCGR

clean-pgradio-gra:
	$(RM) $(PGRADIO_GRA_NARC)

.PHONY: clean-pgradio-gra
clean-filesystem: clean-pgradio-gra
