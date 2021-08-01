TOOLSDIR     := ../tools
BUILD_DIR    := build
NEFNAME      := sub
MWCCVER      := 2.0/sp2p3
PROC         := arm7tdmi
PROC_S       := arm4t
PROC_LD      := v4t
LCF_TEMPLATE := ARM7-TS.lcf.template

include ../common.mk

tidy:
	$(RM) -r $(BUILD_DIR)

clean: tidy

all: $(SBIN)
