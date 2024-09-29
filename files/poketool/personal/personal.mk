PERSONAL_DIR := files/poketool/personal/personal
PERSONAL_NARC := $(PERSONAL_DIR).narc

$(PERSONAL_JSON): lib/include/nitro/fx/fx_const.h

$(PERSONAL_NARC): %.narc: %.json %.json.txt | include/global.h
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) -n $*.o $@ -p 0
	@$(RM) $*.o $*.c

clean-personal:
	$(RM) $(PERSONAL_NARC)

.PHONY: clean-personal
clean-filesystem: clean-personal
