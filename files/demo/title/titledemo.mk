TITLEDEMO_DIR := $(PROJECT_ROOT)/files/demo/title/titledemo
TITLEDEMO_NARC := $(TITLEDEMO_DIR).narc

TITLEDEMO_DEPS := \
	titledemo_00000000.bin \
	titledemo_00000001.bin \
	titledemo_00000002.bin \
	titledemo_00000003.bin \
	titledemo_00000004.bin \
	titledemo_00000005.bin \
	titledemo_00000006.bin \
	titledemo_00000007.bin \
	titledemo_00000008.bin \
	titledemo_00000009.bin \
	titledemo_00000010.bin \
	titledemo_00000011.bin \
	titledemo_00000012.bin \
	titledemo_00000013.bin \
	titledemo_00000014.bin \
	titledemo_00000015.bin \
	titledemo_00000016.bin \
	titledemo_00000017.bin \
	titledemo_00000018.bin \
	titledemo_00000019.bin \
	titledemo_00000020.bin \
	titledemo_00000021.bin \
	titledemo_00000022.bin \
	titledemo_00000023.bin \
	titledemo_00000024.bin \
	titledemo_00000025.bin \
	titledemo_00000026.bin \
	titledemo_00000027.bin \
	titledemo_00000028.bin \
	titledemo_00000029.bin \
	titledemo_00000030.bin \
	titledemo_00000031.bin \
	titledemo_00000032.bin \
	titledemo_00000033.bin \
	titledemo_00000034.bin \
	titledemo_00000035.bin \
	titledemo_00000036.bin \
	titledemo_00000037.bin \
	titledemo_00000038.bin \
	titledemo_00000039.bin \
	titledemo_00000040.bin \
	titledemo_00000041.bin \
	titledemo_00000042.bin \
	titledemo_00000043.bin

$(TITLEDEMO_NARC): $(addprefix $(TITLEDEMO_DIR)/,$(TITLEDEMO_DEPS))
	$(KNARC) -d $(TITLEDEMO_DIR) -p $@ -i

FS_CLEAN_TARGETS += $(TITLEDEMO_NARC)
