MUSHI_DIR         := files/data/mushi
MUSHI_TRAINER     := $(MUSHI_DIR)/mushi_trainer
MUSHI_ENCOUNT     := $(MUSHI_DIR)/mushi_encount
MUSHI_PREFIX      := $(MUSHI_TRAINER) $(MUSHI_ENCOUNT)
MUSHI_BIN         := $(addsuffix .bin,$(MUSHI_PREFIX))
MUSHI_CSV         := $(addsuffix .csv,$(MUSHI_PREFIX))
MUSHI_TXT         := $(addsuffix .txt,$(MUSHI_PREFIX))

$(MUSHI_BIN): CSV2BINFLAGS = -i $(WORK_DIR)/include
$(MUSHI_BIN): %.bin: %.csv %.txt
	$(CSV2BIN) compile $< $@ $*.txt $(CSV2BINFLAGS)

FS_RULE_OVERRIDES += $(MUSHI_BIN)

clean-mushi:
	$(RM) $(MUSHI_BIN)

.PHONY: clean-mushi
clean-filesystem: clean-mushi
