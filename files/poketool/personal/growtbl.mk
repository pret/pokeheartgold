GROWTBL_NARC  := files/poketool/personal/growtbl.narc

$(GROWTBL_NARC): MANIFEST = $(patsubst %.narc,%.txt,$@)\

$(GROWTBL_NARC): %.narc: %.csv $(MANIFEST) $$(csvdep)
	$(CSV2BIN) compile $< $@ $(MANIFEST) $(CSV2BINFLAGS)

clean-growtbl:
	$(RM) $(GROWTBL_NARC)

.PHONY: clean-growtbl
clean-filesystem: clean-growtbl
