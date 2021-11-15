
# Encounter data
ENCDATA_NARCS := \
	files/fielddata/encountdata/g_enc_data.narc \
	files/fielddata/encountdata/s_enc_data.narc

ENCDATA_DIRS := $(ENCDATA_NARCS:%.narc=%)
ENCDATA_CSVS := $(ENCDATA_NARCS:%.narc=%.csv)

$(ENCDATA_NARCS): MANIFEST = files/fielddata/encountdata/enc_data.txt
$(ENCDATA_NARCS): %.narc: %.csv $(MANIFEST) include/constants/species.h
	$(CSV2BIN) compile $< $@ $(MANIFEST) -i $(WORK_DIR)/include --naix

FS_CLEAN_TARGETS += $(ENCDATA_NARCS)
