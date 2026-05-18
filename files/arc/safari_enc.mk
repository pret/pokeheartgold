SAFARI_ENC_JSON := files/arc/safari_enc.json
SAFARI_ENC_NARC := files/arc/safari_enc.narc

$(SAFARI_ENC_NARC): $(SAFARI_ENC_JSON) $(SAFARI_ENC_JSON).txt
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $*.s
	$(O2NARC) $*.o $@
	@$(RM) $*.s $*.o

.PHONY: clean-safari-enc
clean-safari-enc:
	rm -f $(SAFARI_ENC_NARC)
