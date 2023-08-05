TRDATA_NARC := files/poketool/trainer/trdata.narc
TRPOKE_NARC := files/poketool/trainer/trpoke.narc
TRAINER_JSON := files/poketool/trainer/trainers.json
TRDATA_TEMPLATE := files/poketool/trainer/trdata.json.txt
TRPOKE_TEMPLATE := files/poketool/trainer/trpoke.json.txt

$(TRDATA_NARC): %.narc: $(TRAINER_JSON) $(TRDATA_TEMPLATE)
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -n

$(TRPOKE_NARC): %.narc: $(TRAINER_JSON) $(TRPOKE_TEMPLATE)
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -DPM_ASM -o $*.o $*.s
	$(O2NARC) $*.o $@ -n -p 0x00

$(TRDATA_NARC): MWCFLAGS += -include global.h
$(TRAINER_JSON): | $(WORK_DIR)/include/global.h

FS_CLEAN_TARGETS += $(TRDATA_NARC) $(TRPOKE_NARC)
