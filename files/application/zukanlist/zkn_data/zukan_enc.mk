ZUKAN_ENC_PREF := files/application/zukanlist/zkn_data/zukan_enc
ZUKAN_ENC_NARC := $(ZUKAN_ENC_PREF)_$(shortname).narc
ZUKAN_ENC_NAIX := $(ZUKAN_ENC_PREF).naix
ZUKAN_ENC_JSON := $(ZUKAN_ENC_PREF).json
ZUKAN_ENC_JSON_TXT := $(ZUKAN_ENC_PREF).json.txt

# Normalize the NAIX to version-agnostic enums
$(ZUKAN_ENC_NAIX): %.naix: %_$(shortname).naix
	$(SED) 's/_$(shortname)//g' $< > $@
filesystem: $(ZUKAN_ENC_NAIX)

# This explicit dependency is required for multi-core builds
$(ZUKAN_ENC_NARC:%.narc=%.naix): $(ZUKAN_ENC_NARC) ;

$(ZUKAN_ENC_NARC): %.narc: $(ZUKAN_ENC_JSON) $(ZUKAN_ENC_JSON_TXT)
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $*.s
	$(O2NARC) $*.o $@ -n -p 0x00
	@$(RM) $*.o $*.s

clean-zukan-enc:
	$(RM) $(ZUKAN_ENC_PREF)_gold.narc $(ZUKAN_ENC_PREF)_silver.narc $(ZUKAN_ENC_NAIX)

.PHONY: clean-zukan-enc
clean-filesystem: clean-zukan-enc
