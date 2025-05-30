# TODO: reverse the bins to more primitive types
MMODEL_ROOT := $(WORK_DIR)/files/data/mmodel/mmodel
MMODEL_JSONS := $(wildcard $(MMODEL_ROOT)/*.json)
MMODEL_BINS := $(MMODEL_JSONS:%.json=%.bin)
MMODEL_NSBMD := $(wildcard $(MMODEL_ROOT)/*.NSBMD)
MMODEL_NSBTX := $(wildcard $(MMODEL_ROOT)/*.NSBTX)
MMODEL_NARC := $(MMODEL_ROOT).narc

$(MMODEL_NARC): $(MMODEL_BINS) $(MMODEL_NSBTX) $(MMODEL_NSBMD)

$(MMODEL_BINS): %.bin: %.json $(MMODEL_ROOT).json.txt
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -c -o $*.o $*.s
	$(OBJCOPY) -O binary $*.o $@
	@$(RM) $*.o $*.s

clean-mmodel:
	$(RM) $(MMODEL_NARC) $(MMODEL_BINS)

.PHONY: clean-mmodel
clean-filesystem: clean-mmodel
