ITEMDATA_NARC  := files/itemtool/itemdata/item_data.narc
ITEMICON_NARC  := files/itemtool/itemdata/item_icon.narc

$(ITEMDATA_NARC): MANIFEST = $(patsubst %.narc,%.txt,$@)
$(ITEMDATA_NARC): CSV2BINFLAGS += --pad 0xFF

$(ITEMDATA_NARC): %.narc: %.csv $(MANIFEST) $$(csvdep)
	$(CSV2BIN) compile $< $@ $(MANIFEST) $(CSV2BINFLAGS)

$(ITEMICON_NARC): $(wildcard files/itemtool/itemdata/item_icon/*.{NANR,NCLR,NCGR,NCER})

clean-itemdata:
	$(RM) $(ITEMDATA_NARC) $(ITEMICON_NARC)

.PHONY: clean-itemdata
clean-filesystem: clean-itemdata
