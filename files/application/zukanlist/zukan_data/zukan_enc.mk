ZUKAN_ENC_PREF := files/application/zukanlist/zukan_data/zukan_enc
ZUKAN_ENC_NARC := $(ZUKAN_ENC_PREF)_$(shortname).narc
ZUKAN_ENC_JSON := $(ZUKAN_ENC_PREF).json
ZUKAN_ENC_JSON_TXT := $(ZUKAN_ENC_PREF).json.txt

$(ZUKAN_ENC_NARC): %.narc: $(ZUKAN_ENC_JSON) $(ZUKAN_ENC_JSON_TXT)
	$(JSONPROC) -D$(GAME_VERSION)=1 $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $*.s
	$(O2NARC) $*.o $@ -n -p 0x00
	@$(RM) $*.o $*.s

clean-zukan-enc:
	$(RM) $(ZUKAN_ENC_PREF)_gold.narc $(ZUKAN_ENC_PREF)_silver.narc

.PHONY: clean-zukan-enc
clean-filesystem: clean-zukan-enc
