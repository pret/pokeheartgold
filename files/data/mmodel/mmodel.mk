# TODO: reverse the bins to more primitive types
MMODEL_ROOT := $(WORK_DIR)/files/data/mmodel/mmodel
MMODEL_BINS := $(wildcard $(MMODEL_ROOT)/*.bin)
MMODEL_NARC := $(MMODEL_ROOT).narc

$(MMODEL_NARC): $(MMODEL_BINS)

FS_CLEAN_TARGETS += $(MMODEL_NARC)
