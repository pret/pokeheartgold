DATA_RESDAT_DIR = files/data/resdat
DATA_RESDAT_NARC = $(DATA_RESDAT_DIR).narc

DATA_RESDAT_JSON = $(wildcard $(DATA_RESDAT_DIR)/*.json)
DATA_RESDAT_BIN = $(DATA_RESDAT_JSON:%.json=%.bin)

$(DATA_RESDAT_BIN): %.bin: %.json $(DATA_RESDAT_DIR).json.txt
	$(JSONPROC) $^ $*.c
	$(WINE) $(MWCC) $(MWCFLAGS) -c -o $*.o $*.c
	$(O2NARC) $*.o $@ -f

$(DATA_RESDAT_NARC): $(DATA_RESDAT_BIN)
	$(KNARC) -d $(DATA_RESDAT_DIR) -p $@ -i

FS_CLEAN_TARGETS += $(DATA_RESDAT_NARC) $(DATA_RESDAT_BIN:%.bin=%.c) $(DATA_RESDAT_BIN:%.bin=%.o)
