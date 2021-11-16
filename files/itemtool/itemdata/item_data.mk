ITEMDATA_NARC  := files/itemtool/itemdata/item_data.narc

$(ITEMDATA_NARC): MANIFEST = $(patsubst %.narc,%.txt,$@)
$(ITEMDATA_NARC): CSV2BINFLAGS += --pad 0xFF

$(ITEMDATA_NARC): %.narc: %.csv $(MANIFEST) $$(csvdep)
	$(CSV2BIN) compile $< $@ $(MANIFEST) $(CSV2BINFLAGS)

FS_CLEAN_TARGETS += $(ITEMDATA_NARC)
