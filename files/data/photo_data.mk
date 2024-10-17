PHOTO_DATA_NARC := files/data/photo_data.narc
PHOTO_DATA_JSON := files/data/photo_data.json
PHOTO_DATA_TEMPLATE := files/data/photo_data.json.txt

$(PHOTO_DATA_NARC): %.narc: $(PHOTO_DATA_JSON) $(PHOTO_DATA_TEMPLATE)
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -n -p 0x00
	@$(RM) $*.o $*.c

$(PHOTO_DATA_NARC): MWCFLAGS += -include global.h
$(PHOTO_DATA_JSON): | $(WORK_DIR)/include/global.h

clean-photo-data:
	$(RM) $(PHOTO_DATA_NARC) $(PHOTO_DATA_NARC:%.narc=%.c) $(PHOTO_DATA_NARC:%.narc=%.o)

.PHONY: clean-photo-data
clean-filesystem: clean-photo-data
