BUILD_DIR    := build
# Because mwldarm expects absolute paths to be WIN32 paths,
# all paths referring up from BUILD_DIR must be relative.
BACK_REL     := ..
TOOLSDIR     := ../tools
ELFNAME      := ichneumon_sub
MWCCVER      := 2.0/sp2p3
PROC         := arm7tdmi
PROC_S       := arm4t
PROC_LD      := v4t
LCF_TEMPLATE := ARM7-TS.lcf.template
OPTFLAGS     := -O4,s
GLB_DEFINES  := -DSDK_ARM7

include ../common.mk

tidy:
	$(RM) -r $(BUILD_DIR)

clean: tidy

all:
	$(MAKE) patch_mwasmarm 
	$(MAKE) target

target: $(SBIN) $(ELF)

compare: COMPARE := 1
compare: all
