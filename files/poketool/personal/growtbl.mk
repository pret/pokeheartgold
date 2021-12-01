GROWTBL_NARC  := files/poketool/personal/growtbl.narc

$(GROWTBL_NARC): MANIFEST = $(patsubst %.narc,%.txt,$@)\

$(GROWTBL_NARC): %.narc: %.csv $(MANIFEST) $$(csvdep)
	$(CSV2BIN) compile $< $@ $(MANIFEST) $(CSV2BINFLAGS)

FS_CLEAN_TARGETS += $(GROWTBL_NARC)
