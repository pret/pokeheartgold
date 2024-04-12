HEADBUTT_DIR := files/arc/headbutt
HEADBUTT_NARC := $(HEADBUTT_DIR).$(buildname).narc

$(HEADBUTT_NARC): %.$(buildname).narc: %.json %.json.txt
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $*.s
	$(O2NARC) $*.o $@ -n
	@$(RM) -f $*.s $*.o

FS_CLEAN_TARGETS += $(HEADBUTT_DIR).d
