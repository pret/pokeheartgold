ITEMDATA_NARC  := files/itemtool/itemdata/item_data.narc
ITEMDATA_CSV   := $(ITEMDATA_NARC:%.narc=%.csv)
ITEMDATA_MFST  := $(ITEMDATA_NARC:%.narc=%.txt)
ITEMDATA_HEADS := $(addprefix $(WORK_DIR)/include/,$(filter-out bool,$(shell cut -d: -f3 $(ITEMDATA_MFST) | sort -u)))

$(ITEMDATA_NARC): %.narc: %.csv %.txt $(ITEMDATA_HEADS)
	$(CSV2BIN) compile $(ITEMDATA_CSV) $(ITEMDATA_NARC) $(ITEMDATA_MFST) -i $(WORK_DIR)/include --naix --pad 0xff
