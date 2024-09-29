WAZA_OSHIE_DIR              := files/fielddata/wazaoshie
WAZA_OSHIE_BIN              := $(WAZA_OSHIE_DIR)/waza_oshie.bin
WAZA_OSHIE_JSON             := $(WAZA_OSHIE_DIR)/waza_oshie.json
WAZA_OSHIE_TEMPLATE         := $(WAZA_OSHIE_DIR)/waza_oshie.json.txt
WAZA_OSHIE_S                := $(WAZA_OSHIE_DIR)/waza_oshie.s
WAZA_OSHIE_O                := $(WAZA_OSHIE_DIR)/waza_oshie.o

$(WAZA_OSHIE_BIN): %.bin: %.json %.json.txt
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) -DPM_ASM $(MWASFLAGS) -o $*.o $*.s
	$(OBJCOPY) -O binary $*.o $@

clean-waza-oshie:
	$(RM) $(WAZA_OSHIE_BIN) $(WAZA_OSHIE_S) $(WAZA_OSHIE_O)
FS_RULE_OVERRIDES += $(WAZA_OSHIE_BIN)

.PHONY: clean-waza-oshie
clean-filesystem: clean-waza-oshie
