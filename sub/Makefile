BUILD_DIR    := build
# Because mwldarm expects absolute paths to be WIN32 paths,
# all paths referring up from BUILD_DIR must be relative.
BACK_REL     := ..
TOOLSDIR     := ../tools
NEFNAME      := sub
MWCCVER      := 2.0/sp2p3
PROC         := arm7tdmi
PROC_S       := arm4t
PROC_LD      := v4t
LCF_TEMPLATE := ARM7-TS.lcf.template

include ../common.mk

MWCFLAGS          := -O4,s -inline on,noauto -nodead -enum int -lang c99 -Cpp_exceptions off -gccext,on -nopic -nopid -interworking -proc $(PROC) -gccinc -i ../include -I./lib/include -ipa file
MWASFLAGS         := -proc $(PROC_S) -i ./include
MWLDFLAGS         := -nodead -w off -proc $(PROC) -nopic -nopid -interworking -map closure,unused -symtab sort -m _start -msgstyle gcc
ARFLAGS           := rcS

tidy:
	$(RM) -r $(BUILD_DIR)

clean: tidy

all: $(SBIN)
