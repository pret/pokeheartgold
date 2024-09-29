TP_PARAM_DIR  := files/fielddata/tsurepoke
TP_PARAM_CSV  := $(TP_PARAM_DIR)/tp_param.csv
TP_PARAM_NARC := $(TP_PARAM_CSV:%.csv=%.narc)
TP_PARAM_SPEC := $(TP_PARAM_CSV).txt

$(TP_PARAM_NARC): $(TP_PARAM_CSV) $(TP_PARAM_SPEC) include/constants/follow_mon_idx.h
	$(CSV2BIN) $(CSV2BINFLAGS) compile $< $@ $<.txt

clean-tp-param:
	$(RM) $(TP_PARAM_NARC)

.PHONY: clean-tp-param
clean-filesystem: clean-tp-param
