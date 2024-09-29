HEADBUTT_DIR := files/arc/headbutt
HEADBUTT_NARC := $(HEADBUTT_DIR).$(buildname).narc

$(HEADBUTT_NARC): %.$(buildname).narc: %.json %.json.txt
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -o $*.o $*.s
	$(O2NARC) $*.o $@ -n
	@$(RM) -f $*.s $*.o

clean-headbutt:
	$(RM) $(HEADBUTT_DIR).d \
	$(foreach bn,$(SUPPORTED_ROMS),$(HEADBUTT_DIR).$(bn).na{rc,ix})

.PHONY: clean-headbutt
clean-filesystem: clean-headbutt
