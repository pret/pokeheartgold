
# Encounter data
ENCDATA_NARCS := \
	files/fielddata/encountdata/g_enc_data.narc \
	files/fielddata/encountdata/s_enc_data.narc

ENCDATA_DIRS := $(ENCDATA_NARCS:%.narc=%)
ENCDATA_CSVS := $(ENCDATA_NARCS:%.narc=%.csv)
ENCDATA_BINS := $(foreach csv,$(ENCDATA_CSVS),$(addprefix $(csv:%.csv=%/),$(patsubst %,bin_%.bin,$(shell cut -d, -f1 $(csv) | tail -n+2))))

# Delete intermediate bin files
.INTERMEDIATE: $(ENCDATA_BINS)

$(ENCDATA_NARCS): %.narc: %.csv include/constants/species.h
	$(ENCDATA_GS) $^ $*
	$(KNARC) -d $* -p $@ -i
	@$(RM) $*/*.bin

FS_CLEAN_TARGETS += $(ENCDATA_NARCS)
