# ===================================================================
# See doc/BUILD_OVERVIEW.TXT for a clearer outline of this build process
# ===================================================================

MAKEFLAGS += --no-print-directory

MWCCVER := 2.0/sp2p3

include ../../common.mk

# Relevant directories
BUILD_DIR  :=  ./build
SRC_DIR    :=  ./src
INC_DIR    :=  ./include
TOOL_DIR   :=  ./tools

ifeq ($(NODEP),)
  DEP_PARAM := -gccdep -MD
  include $(wildcard $(BUILD_DIR)/*.d)
else
  DEP_PARAM := 
endif

$(shell mkdir -p $(BUILD_DIR))

INSTALL_PREFIX ?= $(BUILD_DIR)
INSTALL_LIBDIR := $(INSTALL_PREFIX)/lib

ELFCODER_DIR := $(TOOL_DIR)/elfcoder

# Tools
ELFCODER := $(ELFCODER_DIR)/build/elfcoder$(EXE)

# C / ASM compilation parameters
CC_PARAM   :=  -O4,p -enum int -proc arm946E -gccext,on -fp soft -lang c99 -char signed -inline on,noauto -Cpp_exceptions off -interworking -i $(INC_DIR) -c
ASM_PARAM  :=  -proc arm5TE -i $(INC_DIR)

CC_PARAM   +=  -W all -W pedantic -W noimpl_signedunsigned -W noimplicitconv -W nounusedarg -W nomissingreturn -W error

# Output library file
LIBRARY_NAME := dsprot.a

# Files (in this specific order) that will go into the library
LIBRARY_FILES := \
	$(BUILD_DIR)/dsprot_main_encrypted.o          \
	$(BUILD_DIR)/dsprot_main_decrypter_encoded.o  \
	$(BUILD_DIR)/dsprot_main_decrypter_decoder.o  \
	$(BUILD_DIR)/extra.o                          \
	$(BUILD_DIR)/integrity_encrypted.o            \
	$(BUILD_DIR)/integrity_decrypter_encoded.o    \
	$(BUILD_DIR)/integrity_decrypter_decoder.o    \
	$(BUILD_DIR)/encryptor_encoded.o              \
	$(BUILD_DIR)/encryptor_decoder.o              \
	$(BUILD_DIR)/mac_owner_encrypted.o            \
	$(BUILD_DIR)/mac_owner_decrypter_encoded.o    \
	$(BUILD_DIR)/rom_util_encrypted.o             \
	$(BUILD_DIR)/rom_util_decrypter_encoded.o     \
	$(BUILD_DIR)/rom_test_encrypted.o             \
	$(BUILD_DIR)/rom_test_decrypter_encoded.o     \
	$(BUILD_DIR)/coretests_decrypter_decoder.o    \
	$(BUILD_DIR)/rc4_encoded.o                    \
	$(BUILD_DIR)/rc4_decoder.o

# Encryption keys
KEY_DSPROT_MAIN := 6AB2
KEY_INTEGRITY   := 9785
KEY_CORE_TESTS  := 0982

.PHONY: all clean tidy tools dsprot install
.DELETE_ON_ERROR: 
.NOTPARALLEL: 
.SECONDARY: none

all:
	$(MAKE) tools
	$(MAKE) dsprot

clean:
	$(MAKE) -C $(ELFCODER_DIR) clean
	$(RM) -r $(BUILD_DIR)

tidy: clean

tools:
	$(MAKE) -C $(ELFCODER_DIR)

dsprot:
	$(MAKE) $(BUILD_DIR)/$(LIBRARY_NAME)

install: all
	$(shell mkdir -p $(INSTALL_LIBDIR))
	cp $(BUILD_DIR)/$(LIBRARY_NAME) $(INSTALL_LIBDIR)


# Library output + header
$(BUILD_DIR)/$(LIBRARY_NAME): $(LIBRARY_FILES)
	$(WINE) $(MWLD) -nostdlib -library $(LIBRARY_FILES) -o $(BUILD_DIR)/$(LIBRARY_NAME)


# Main module
$(BUILD_DIR)/dsprot_main_decrypter_decoder.o: $(BUILD_DIR)/dsprot_main_decrypter_decoder.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/dsprot_main_decrypter_decoder.s -o $(BUILD_DIR)/dsprot_main_decrypter_decoder.o

$(BUILD_DIR)/dsprot_main_decrypter_encoded.o \
$(BUILD_DIR)/dsprot_main_decrypter_decoder.s: $(BUILD_DIR)/dsprot_main_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/dsprot_main_decrypter.o $(BUILD_DIR)/dsprot_main_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/dsprot_main_decrypter_encoded.o -o $(BUILD_DIR)/dsprot_main_decrypter_decoder.s -g Garbage -f \
		DSProt_DetectFlashcart     \
		DSProt_DetectNotFlashcart  \
		DSProt_DetectEmulator      \
		DSProt_DetectNotEmulator   \
		DSProt_DetectDummy         \
		DSProt_DetectNotDummy

$(BUILD_DIR)/dsprot_main_decrypter.o: $(BUILD_DIR)/dsprot_main_decrypter.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/dsprot_main_decrypter.s -o $(BUILD_DIR)/dsprot_main_decrypter.o

$(BUILD_DIR)/dsprot_main_encrypted.o \
$(BUILD_DIR)/dsprot_main_decrypter.s: $(BUILD_DIR)/dsprot_main.o $(ELFCODER)
	cp $(BUILD_DIR)/dsprot_main.o $(BUILD_DIR)/dsprot_main_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/dsprot_main_encrypted.o -o $(BUILD_DIR)/dsprot_main_decrypter.s -k $(KEY_DSPROT_MAIN) -p DSProt_ -f \
		DetectFlashcart     \
		DetectNotFlashcart  \
		DetectEmulator      \
		DetectNotEmulator   \
		DetectDummy         \
		DetectNotDummy

$(BUILD_DIR)/dsprot_main.o: $(SRC_DIR)/dsprot_main.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/dsprot_main.c -o $(BUILD_DIR)/dsprot_main.o
	@$(call fixdep,$(BUILD_DIR)/dsprot_main.d)


# BSS + Garbage
$(BUILD_DIR)/extra.o: $(SRC_DIR)/extra.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/extra.c -o $(BUILD_DIR)/extra.o
	@$(call fixdep,$(BUILD_DIR)/extra.d)


# Integrity module
$(BUILD_DIR)/integrity_decrypter_decoder.o: $(BUILD_DIR)/integrity_decrypter_decoder.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/integrity_decrypter_decoder.s -o $(BUILD_DIR)/integrity_decrypter_decoder.o

$(BUILD_DIR)/integrity_decrypter_encoded.o \
$(BUILD_DIR)/integrity_decrypter_decoder.s: $(BUILD_DIR)/integrity_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/integrity_decrypter.o $(BUILD_DIR)/integrity_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/integrity_decrypter_encoded.o -o $(BUILD_DIR)/integrity_decrypter_decoder.s -f \
		RunEncrypted_Integrity_MACOwner_IsBad   \
		RunEncrypted_Integrity_MACOwner_IsGood  \
		RunEncrypted_Integrity_ROMTest_IsBad    \
		RunEncrypted_Integrity_ROMTest_IsGood

$(BUILD_DIR)/integrity_decrypter.o: $(BUILD_DIR)/integrity_decrypter.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/integrity_decrypter.s -o $(BUILD_DIR)/integrity_decrypter.o

$(BUILD_DIR)/integrity_encrypted.o \
$(BUILD_DIR)/integrity_decrypter.s: $(BUILD_DIR)/integrity.o $(ELFCODER)
	cp $(BUILD_DIR)/integrity.o $(BUILD_DIR)/integrity_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/integrity_encrypted.o -o $(BUILD_DIR)/integrity_decrypter.s -k $(KEY_INTEGRITY) -f \
		Integrity_MACOwner_IsBad   \
		Integrity_MACOwner_IsGood  \
		Integrity_ROMTest_IsBad    \
		Integrity_ROMTest_IsGood

$(BUILD_DIR)/integrity.o: $(SRC_DIR)/integrity.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/integrity.c -o $(BUILD_DIR)/integrity.o
	@$(call fixdep,$(BUILD_DIR)/integrity.d)


# Encryptor module
$(BUILD_DIR)/encryptor_decoder.o: $(BUILD_DIR)/encryptor_decoder.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/encryptor_decoder.s -o $(BUILD_DIR)/encryptor_decoder.o

$(BUILD_DIR)/encryptor_encoded.o \
$(BUILD_DIR)/encryptor_decoder.s: $(BUILD_DIR)/encryptor.o $(ELFCODER)
	cp $(BUILD_DIR)/encryptor.o $(BUILD_DIR)/encryptor_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/encryptor_encoded.o -o $(BUILD_DIR)/encryptor_decoder.s -f \
		Encryptor_EncryptFunction  \
		Encryptor_DecryptFunction

$(BUILD_DIR)/encryptor.o: $(SRC_DIR)/encryptor.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/encryptor.c -o $(BUILD_DIR)/encryptor.o
	@$(call fixdep,$(BUILD_DIR)/encryptor.d)


# Core tests module: MAC/Owner, ROM utilities, ROM tests
$(BUILD_DIR)/coretests_decrypter_decoder.o: $(BUILD_DIR)/coretests_decrypter_decoder.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/coretests_decrypter_decoder.s -o $(BUILD_DIR)/coretests_decrypter_decoder.o

$(BUILD_DIR)/mac_owner_decrypter_encoded.o \
$(BUILD_DIR)/rom_util_decrypter_encoded.o  \
$(BUILD_DIR)/rom_test_decrypter_encoded.o  \
$(BUILD_DIR)/coretests_decrypter_decoder.s: $(BUILD_DIR)/mac_owner_decrypter.o $(BUILD_DIR)/rom_util_decrypter.o $(BUILD_DIR)/rom_test_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/mac_owner_decrypter.o $(BUILD_DIR)/mac_owner_decrypter_encoded.o
	cp $(BUILD_DIR)/rom_util_decrypter.o $(BUILD_DIR)/rom_util_decrypter_encoded.o
	cp $(BUILD_DIR)/rom_test_decrypter.o $(BUILD_DIR)/rom_test_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/mac_owner_decrypter_encoded.o $(BUILD_DIR)/rom_util_decrypter_encoded.o $(BUILD_DIR)/rom_test_decrypter_encoded.o -o $(BUILD_DIR)/coretests_decrypter_decoder.s -f \
		RunEncrypted_ROMTest_IsBad    \
		RunEncrypted_ROMTest_IsGood   \
		RunEncrypted_MACOwner_IsBad   \
		RunEncrypted_MACOwner_IsGood  \
		RunEncrypted_ROMUtil_Read     \
		RunEncrypted_ROMUtil_CRC32

$(BUILD_DIR)/mac_owner_decrypter.o: $(BUILD_DIR)/mac_owner_decrypter.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/mac_owner_decrypter.s -o $(BUILD_DIR)/mac_owner_decrypter.o

$(BUILD_DIR)/rom_util_decrypter.o: $(BUILD_DIR)/rom_util_decrypter.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/rom_util_decrypter.s -o $(BUILD_DIR)/rom_util_decrypter.o

$(BUILD_DIR)/rom_test_decrypter.o: $(BUILD_DIR)/rom_test_decrypter.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/rom_test_decrypter.s -o $(BUILD_DIR)/rom_test_decrypter.o

$(BUILD_DIR)/mac_owner_encrypted.o \
$(BUILD_DIR)/mac_owner_decrypter.s: $(BUILD_DIR)/mac_owner.o $(ELFCODER)
	cp $(BUILD_DIR)/mac_owner.o $(BUILD_DIR)/mac_owner_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/mac_owner_encrypted.o -o $(BUILD_DIR)/mac_owner_decrypter.s -k $(KEY_CORE_TESTS) -f \
		MACOwner_IsBad  \
		MACOwner_IsGood

$(BUILD_DIR)/rom_util_encrypted.o \
$(BUILD_DIR)/rom_util_decrypter.s: $(BUILD_DIR)/rom_util.o $(ELFCODER)
	cp $(BUILD_DIR)/rom_util.o $(BUILD_DIR)/rom_util_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rom_util_encrypted.o -o $(BUILD_DIR)/rom_util_decrypter.s -k $(KEY_CORE_TESTS) -f \
		ROMUtil_Read   \
		ROMUtil_CRC32

$(BUILD_DIR)/rom_test_encrypted.o \
$(BUILD_DIR)/rom_test_decrypter.s: $(BUILD_DIR)/rom_test.o $(ELFCODER)
	cp $(BUILD_DIR)/rom_test.o $(BUILD_DIR)/rom_test_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rom_test_encrypted.o -o $(BUILD_DIR)/rom_test_decrypter.s -k $(KEY_CORE_TESTS) -f \
		ROMTest_IsBad   \
		ROMTest_IsGood

$(BUILD_DIR)/mac_owner.o: $(SRC_DIR)/mac_owner.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/mac_owner.c -o $(BUILD_DIR)/mac_owner.o
	@$(call fixdep,$(BUILD_DIR)/mac_owner.d)

$(BUILD_DIR)/rom_util.o: $(SRC_DIR)/rom_util.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/rom_util.c -o $(BUILD_DIR)/rom_util.o
	@$(call fixdep,$(BUILD_DIR)/rom_util.d)

$(BUILD_DIR)/rom_test.o: $(SRC_DIR)/rom_test.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/rom_test.c -o $(BUILD_DIR)/rom_test.o
	@$(call fixdep,$(BUILD_DIR)/rom_test.d)


# RC4 module
$(BUILD_DIR)/rc4_decoder.o: $(BUILD_DIR)/rc4_decoder.s
	$(WINE) $(MWAS) $(ASM_PARAM) $(BUILD_DIR)/rc4_decoder.s -o $(BUILD_DIR)/rc4_decoder.o

$(BUILD_DIR)/rc4_encoded.o \
$(BUILD_DIR)/rc4_decoder.s: $(BUILD_DIR)/rc4.o $(ELFCODER)
	cp $(BUILD_DIR)/rc4.o $(BUILD_DIR)/rc4_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rc4_encoded.o -o $(BUILD_DIR)/rc4_decoder.s -f \
		RC4_Init                        \
		RC4_Byte                        \
		RC4_InitSBox                    \
		RC4_EncryptInstructions         \
		RC4_DecryptInstructions         \
		RC4_InitAndEncryptInstructions  \
		RC4_InitAndDecryptInstructions

$(BUILD_DIR)/rc4.o: $(SRC_DIR)/rc4.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $(SRC_DIR)/rc4.c -o $(BUILD_DIR)/rc4.o
	@$(call fixdep,$(BUILD_DIR)/rc4.d)
