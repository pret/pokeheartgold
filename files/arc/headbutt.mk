HEADBUTT_DIR := files/arc/headbutt
HEADBUTT_NARC := $(HEADBUTT_DIR).$(buildname).narc

.SECONDARY: $(HEADBUTT_DIR).o $(HEADBUTT_DIR).c

$(HEADBUTT_NARC): %.$(buildname).narc: %.json %.json.txt
	$(JSONPROC) -D$(GAME_VERSION) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $*.s
	$(O2NARC) $*.o $@ -n

FS_CLEAN_TARGETS += $(HEADBUTT_DIR).d
