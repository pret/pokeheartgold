
# Encounter data
ENCDATA_NARCS := \
	files/fielddata/encountdata/g_enc_data.narc \
	files/fielddata/encountdata/s_enc_data.narc

$(ENCDATA_NARCS): MANIFEST = files/fielddata/encountdata/enc_data.txt

$(ENCDATA_NARCS): %.narc: %.csv $(MANIFEST) $$(csvdep)
	$(CSV2BIN) compile $< $@ $(MANIFEST) $(CSV2BINFLAGS)

clean-gs-enc-data:
	$(RM) $(ENCDATA_NARCS)

.PHONY: clean-gs-enc-data
clean-filesystem: clean-gs-enc-data
