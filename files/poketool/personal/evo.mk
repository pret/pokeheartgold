EVO_NARC := files/poketool/personal/evo.narc
EVO_JSON := files/poketool/personal/evo.json
EVO_TEMPLATE := files/poketool/personal/evo.json.txt

$(EVO_NARC): %.narc: $(EVO_JSON) $(EVO_TEMPLATE)
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -n -p 0x00
	@$(RM) $*.o $*.c

$(EVO_NARC): MWCFLAGS += -include global.h
$(EVO_JSON): | $(WORK_DIR)/include/global.h

clean-evo:
	$(RM) $(EVO_NARC) $(EVO_NARC:%.narc=%.c) $(EVO_NARC:%.narc=%.o)

.PHONY: clean-evo
clean-filesystem: clean-evo
