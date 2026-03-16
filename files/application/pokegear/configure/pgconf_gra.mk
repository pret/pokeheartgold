PGCONF_GRA_DIR := files/application/pokegear/configure/pgconf_gra
PGCONF_GRA_NARC := $(PGCONF_GRA_DIR).narc

PGCONF_GRA_FILES := \
	pgconf_gra_00000000.NCLR \
	pgconf_gra_00000001.NCGR \
	pgconf_gra_00000002.NCER \
	pgconf_gra_00000003.NANR \
	pgconf_gra_00000004.NCLR \
	pgconf_gra_00000005.NCLR \
	pgconf_gra_00000006.NCLR \
	pgconf_gra_00000007.NCLR \
	pgconf_gra_00000008.NCLR \
	pgconf_gra_00000009.NCLR \
	pgconf_gra_00000010.NCGR \
	pgconf_gra_00000011.NCGR \
	pgconf_gra_00000012.NCGR \
	pgconf_gra_00000013.NCGR \
	pgconf_gra_00000014.NCGR \
	pgconf_gra_00000015.NCGR \
	pgconf_gra_00000016.NSCR \
	pgconf_gra_00000017.NSCR \
	pgconf_gra_00000018.NSCR \
	pgconf_gra_00000019.NSCR \
	pgconf_gra_00000020.NSCR \
	pgconf_gra_00000021.NSCR \
	pgconf_gra_00000022.NSCR \
	pgconf_gra_00000023.NSCR \
	pgconf_gra_00000024.NSCR \
	pgconf_gra_00000025.NSCR \
	pgconf_gra_00000026.NSCR \
	pgconf_gra_00000027.NSCR

$(PGCONF_GRA_NARC): $(addprefix $(PGCONF_GRA_DIR)/,$(PGCONF_GRA_FILES))
	$(KNARC) -p $@ -d $(PGCONF_GRA_DIR) -i

CLOBBER_SIZE_VERSION101_NCGR_FILES += \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000001.NCGR

VERSION101_SOPC_NCGR_FILES += \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000010.NCGR \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000011.NCGR \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000012.NCGR \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000013.NCGR \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000014.NCGR \
	$(PGCONF_GRA_DIR)/pgconf_gra_00000015.NCGR \

clean-pgconf-gra:
	$(RM) $(PGCONF_GRA_NARC)

.PHONY: clean-pgconf-gra
clean-filesystem: clean-pgconf-gra
