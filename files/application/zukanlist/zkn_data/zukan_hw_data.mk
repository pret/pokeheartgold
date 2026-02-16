ZUKAN_HW_DATA_DIR := files/application/zukanlist/zkn_data/zukan_hw_data
ZUKAN_HW_DATA_NARC := $(ZUKAN_HW_DATA_DIR)_$(shortname).narc
ZUKAN_HW_DATA_NAIX := $(ZUKAN_HW_DATA_DIR).naix

$(ZUKAN_HW_DATA_NARC): \
	$(ZUKAN_HW_DATA_DIR)/zukan_hw_data_0.bin \
	$(ZUKAN_HW_DATA_DIR)/zukan_hw_data_1_$(shortname).bin
	grep -v $(shortname) $(ZUKAN_HW_DATA_DIR)/.knarcignore-template > $(ZUKAN_HW_DATA_DIR)/.knarcignore
	$(KNARC) -p $@ -d $(ZUKAN_HW_DATA_DIR) -i

# Normalize the NAIX to version-agnostic enums
$(ZUKAN_HW_DATA_NAIX): %.naix: %_$(shortname).naix
	$(SED) 's/_$(shortname)//g' $< > $@
filesystem: $(ZUKAN_HW_DATA_NAIX)

clean-zukan-hw-data:
	$(RM) $(ZUKAN_HW_DATA_NARC) $(ZUKAN_HW_DATA_DIR)/.knarcignore $(ZUKAN_HW_DATA_NAIX)

.PHONY: clean-zukan-hw-data
clean-filesystem: clean-zukan-hw-data
