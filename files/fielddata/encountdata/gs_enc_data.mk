
# Encounter data
ENCDATA_DIR := files/fielddata/encountdata
ENCDATA_NARCS := \
	$(ENCDATA_DIR)/g_enc_data.narc \
	$(ENCDATA_DIR)/s_enc_data.narc
ENCDATA_JSON := $(ENCDATA_DIR)/gs_enc_data.json

$(ENCDATA_DIR)/g_enc_data.narc: GAME_VERSION_S = ENC_HEARTGOLD
$(ENCDATA_DIR)/s_enc_data.narc: GAME_VERSION_S = ENC_SOULSILVER

$(ENCDATA_NARCS): %.narc: $(ENCDATA_JSON) $(ENCDATA_JSON).txt | $(WORK_DIR)/include/global.h
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -D$(GAME_VERSION_S) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -n
	@$(RM) $*.o $*.c

clean-gs-enc-data:
	$(RM) $(ENCDATA_NARCS)

.PHONY: clean-gs-enc-data
clean-filesystem: clean-gs-enc-data
