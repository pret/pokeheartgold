TRDATA_NARC := files/poketool/trainer/trdata.narc
TRPOKE_NARC := files/poketool/trainer/trpoke.narc
TRAINER_JSON := files/poketool/trainer/trainers.json
TRDATA_TEMPLATE := files/poketool/trainer/trdata.json.txt
TRPOKE_TEMPLATE := files/poketool/trainer/trpoke.json.txt

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

$(TRDATA_NARC): MWCFLAGS += -include global.h
$(TRAINER_JSON): | $(WORK_DIR)/include/global.h

clean-trainer:
	$(RM) $(TRDATA_NARC) $(TRPOKE_NARC) \
	$(TRDATA_NARC:%.narc=%.o) $(TRPOKE_NARC:%.narc=%.o) \
	$(TRDATA_NARC:%.narc=%.c) $(TRPOKE_NARC:%.narc=%.s)

.PHONY: clean-trainer
clean-filesystem: clean-trainer
