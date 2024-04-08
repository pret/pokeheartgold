ZONE_EVENT_STEM  := files/fielddata/eventdata/zone_event
ZONE_EVENT_NARC  := $(ZONE_EVENT_STEM).narc
ZONE_EVENT_TEMPL := $(ZONE_EVENT_STEM).json.txt
ZONE_EVENT_JSONS := $(sort $(wildcard $(ZONE_EVENT_STEM)/*.json))
ZONE_EVENT_S     := $(ZONE_EVENT_JSONS:%.json=%.s)
ZONE_EVENT_O     := $(ZONE_EVENT_JSONS:%.json=%.o)
ZONE_EVENT_DEPS  := $(ZONE_EVENT_JSONS:%.json=%.d)
ZONE_EVENT_BIN   := $(ZONE_EVENT_JSONS:%.json=%.bin)

$(ZONE_EVENT_NARC): $(ZONE_EVENT_BIN)

$(ZONE_EVENT_TEMPL):

$(ZONE_EVENT_JSON): $(ZONE_EVENT_TEMPL)

FS_CLEAN_TARGETS += $(ZONE_EVENT_NARC) $(ZONE_EVENT_BIN) $(ZONE_EVENT_DEPS)

$(ZONE_EVENT_BIN): MWASFLAGS += -DPM_ASM
$(ZONE_EVENT_BIN): %.bin: %.json
	@echo event_data: gen $@
	@$(JSONPROC) $< $(ZONE_EVENT_TEMPL) $*.s
	@$(WINE) $(MWAS) $(MWASFLAGS) $(DEPFLAGS) -o $*.o $*.s
	@$(OBJCOPY) -O binary $*.o $@
	@$(RM) $*.s $*.o
	@echo event_data: gen $@ done
