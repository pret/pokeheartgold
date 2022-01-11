TRDATA_NARC := files/poketool/trainer/trdata.narc
TRPOKE_NARC := files/poketool/trainer/trpoke.narc
TRNAME_GMM := files/msgdata/msg/msg_0729.gmm
TRAINER_JSON := files/poketool/trainer/trainers.json
TRDATA_TEMPLATE := files/poketool/trainer/trdata.json.txt
TRPOKE_TEMPLATE := files/poketool/trainer/trpoke.json.txt
TRNAME_TEMPLATE := files/poketool/trainer/trname.json.txt

$(TRDATA_NARC): %.narc: $(TRAINER_JSON) $(TRDATA_TEMPLATE)
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -n
	@$(RM) $*.o $*.c

$(TRPOKE_NARC): %.narc: $(TRAINER_JSON) $(TRPOKE_TEMPLATE)
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $*.s
	$(O2NARC) $*.o $@ -n -p 0x00
	@$(RM) $*.o $*.s

$(TRNAME_GMM): $(TRAINER_JSON) $(TRNAME_TEMPLATE)
	$(JSONPROC) $^ $@
	$(SED) -i 's/&/&amp;/g' $@

$(TRDATA_NARC): MWCFLAGS += -include global.h
$(TRAINER_JSON): | $(WORK_DIR)/include/global.h

FS_CLEAN_TARGETS += $(TRNAME_GMM) $(TRDATA_NARC) $(TRPOKE_NARC)
