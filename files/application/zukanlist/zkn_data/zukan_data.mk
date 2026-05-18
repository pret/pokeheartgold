ZUKAN_DATA_PREF := files/application/zukanlist/zkn_data/zukan_data
ZUKAN_DATA_NARC := $(ZUKAN_DATA_PREF).narc
ZUKAN_DATA_GIRA_NARC := $(ZUKAN_DATA_PREF)_gira.narc
ZUKAN_DATA_JSON := $(ZUKAN_DATA_PREF).json
ZUKAN_DATA_JSON_TXT := $(ZUKAN_DATA_PREF).json.txt

$(ZUKAN_DATA_GIRA_NARC): %_gira.narc: %.narc ;
$(ZUKAN_DATA_NARC): %.narc: $(ZUKAN_DATA_JSON) $(ZUKAN_DATA_JSON_TXT)
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $*.s
	$(O2NARC) $*.o $@ -N -p 0xFF
	$(WINE) $(MWAS) $(MWASFLAGS) -DGIRA -DPM_ASM -o $*_gira.o $*.s
	$(O2NARC) $*_gira.o $*_gira.narc -N -p 0xFF
	@$(RM) $*.o $*_gira.o $*.s

clean-zukan-data:
	$(RM) $(ZUKAN_DATA_NARC) $(ZUKAN_DATA_GIRA_NARC)
.PHONY: clean-zukan-data
clean-filesystem: clean-zukan-data
