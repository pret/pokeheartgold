PMTEL_BOOK_DAT := files/tel/pmtel_book.dat
PMTEL_BOOK_JSON := files/tel/pmtel_book.json
PMTEL_BOOK_TEMPLATE := files/tel/pmtel_book.json.txt

$(PMTEL_BOOK_DAT): %.dat: $(PMTEL_BOOK_JSON) $(PMTEL_BOOK_TEMPLATE)
	$(JSONPROC) $^ $*.s
	$(WINE) $(MWAS) $(MWASFLAGS) -c -o $*.o $*.s
	$(OBJCOPY) -O binary $*.o $@
	@$(RM) $*.o $*.s

FS_RULE_OVERRIDES += $(PMTEL_BOOK_DAT)

clean-pmtel-book:
	$(RM) $(PMTEL_BOOK_DAT) $(PMTEL_BOOK_DAT:%.dat=%.c) $(PMTEL_BOOK_DAT:%.dat=%.o)

.PHONY: clean-pmtel-book
clean-filesystem: clean-pmtel-book
