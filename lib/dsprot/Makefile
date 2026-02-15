# ===================================================================
# See doc/BUILD_OVERVIEW.TXT for a clearer outline of this build process
# ===================================================================

MWCCVER        := 2.0/sp2p3
PROC           := arm946e
PROC_S         := arm5te
PROC_LD        := v5te
OPTFLAGS       := -O4,p

# Need GLB_DEFINES and CLI_DEFINES from config
include ../../config.mk

# Undef this from config.mk so common.mk knows this is not building a linked elf
ELFNAME :=

# Relevant directories
BUILD_DIR   :=  ./build
C_OBJ_DIR   :=  $(BUILD_DIR)/src
SRC_DIR     :=  ./src
INC_DIR     :=  ./include
SYSINC_DIR  :=  ../include

include ../../common.mk

ifeq ($(NODEP),)
  DEP_PARAM := -gccdep -MD
  include $(wildcard $(C_OBJ_DIR)/*.d)
endif

INSTALL_PREFIX ?= ./install
INSTALL_LIBDIR := $(INSTALL_PREFIX)/lib/dsprot

# C / ASM compilation parameters
CC_PARAM   :=  -O4,p -enum int -proc arm946E -gccext,on -fp soft -lang c99 -char signed -inline on,noauto -Cpp_exceptions off -interworking -gccinc -i $(INC_DIR) -I$(SYSINC_DIR) -c $(GLB_DEFINES) $(CLI_DEFINES)
CC_PARAM   +=  -W all -W pedantic -W noimpl_signedunsigned -W noimplicitconv -W nounusedarg -W nomissingreturn -W error

ASM_PARAM  :=  -proc arm5TE -i $(INC_DIR)

# Files that will go into the library, to be copied to INSTALL_LIBDIR
LIBRARY_FILES := \
	$(BUILD_DIR)/dsprot_main_encrypted.o          \
	$(BUILD_DIR)/dsprot_main_decrypter_encoded.o  \
	$(BUILD_DIR)/dsprot_main_decrypter_decoder.o  \
	$(C_OBJ_DIR)/extra.o                          \
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


.PHONY: all clean tidy tools dsprot install
.DELETE_ON_ERROR:
.NOTPARALLEL:
.SECONDARY: none

all: dsprot

clean:
	$(RM) -r $(BUILD_DIR)

tidy: clean

dsprot: $(LIBRARY_FILES)

install: all
	$(shell mkdir -p $(INSTALL_LIBDIR))
	cp $(LIBRARY_FILES) $(INSTALL_LIBDIR)


# Assembly assembling
$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.s
	$(WINE) $(MWAS) $(ASM_PARAM) $< -o $@


# C compilation
$(C_OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(WINE) $(MWCC) $(CC_PARAM) $(DEP_PARAM) $< -o $@
	@$(call fixdep,$(@:.o=.d))


# Main module function encoding
KEY_DSPROT_MAIN := 6AB2

DSPROT_MAIN_ENCRYPTION_REPLACE_PREFIX := DSProtInternal_
DSPROT_MAIN_ENCRYPTION_PREFIX := DSProt_
DSPROT_MAIN_ENCRYPTED_FUNCTIONS := \
	DSProtInternal_DetectFlashcart     \
	DSProtInternal_DetectNotFlashcart  \
	DSProtInternal_DetectEmulator      \
	DSProtInternal_DetectNotEmulator   \
	DSProtInternal_DetectDummy         \
	DSProtInternal_DetectNotDummy

DSPROT_MAIN_ADDED_REF := DSProt_Garbage
DSPROT_MAIN_ENCODED_FUNCTIONS := \
	DSProt_DetectFlashcart     \
	DSProt_DetectNotFlashcart  \
	DSProt_DetectEmulator      \
	DSProt_DetectNotEmulator   \
	DSProt_DetectDummy         \
	DSProt_DetectNotDummy

$(BUILD_DIR)/dsprot_main_decrypter_encoded.o \
$(BUILD_DIR)/dsprot_main_decrypter_decoder.s: $(BUILD_DIR)/dsprot_main_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/dsprot_main_decrypter.o $(BUILD_DIR)/dsprot_main_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/dsprot_main_decrypter_encoded.o -o $(BUILD_DIR)/dsprot_main_decrypter_decoder.s -g $(DSPROT_MAIN_ADDED_REF) -f $(DSPROT_MAIN_ENCODED_FUNCTIONS)

$(BUILD_DIR)/dsprot_main_encrypted.o \
$(BUILD_DIR)/dsprot_main_decrypter.s: $(C_OBJ_DIR)/dsprot_main.o $(ELFCODER)
	cp $(C_OBJ_DIR)/dsprot_main.o $(BUILD_DIR)/dsprot_main_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/dsprot_main_encrypted.o -o $(BUILD_DIR)/dsprot_main_decrypter.s -k $(KEY_DSPROT_MAIN) -p $(DSPROT_MAIN_ENCRYPTION_PREFIX) -r $(DSPROT_MAIN_ENCRYPTION_REPLACE_PREFIX) -f $(DSPROT_MAIN_ENCRYPTED_FUNCTIONS)


# Integrity module function encoding
KEY_INTEGRITY := 9785

# Default prefix (RunEncrypted_)
INTEGRITY_ENCRYPTED_FUNCTIONS := \
	Integrity_MACOwner_IsBad   \
	Integrity_MACOwner_IsGood  \
	Integrity_ROMTest_IsBad    \
	Integrity_ROMTest_IsGood

INTEGRITY_ENCODED_FUNCTIONS := \
	RunEncrypted_Integrity_MACOwner_IsBad   \
	RunEncrypted_Integrity_MACOwner_IsGood  \
	RunEncrypted_Integrity_ROMTest_IsBad    \
	RunEncrypted_Integrity_ROMTest_IsGood

$(BUILD_DIR)/integrity_decrypter_encoded.o \
$(BUILD_DIR)/integrity_decrypter_decoder.s: $(BUILD_DIR)/integrity_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/integrity_decrypter.o $(BUILD_DIR)/integrity_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/integrity_decrypter_encoded.o -o $(BUILD_DIR)/integrity_decrypter_decoder.s -f $(INTEGRITY_ENCODED_FUNCTIONS)

$(BUILD_DIR)/integrity_encrypted.o \
$(BUILD_DIR)/integrity_decrypter.s: $(C_OBJ_DIR)/integrity.o $(ELFCODER)
	cp $(C_OBJ_DIR)/integrity.o $(BUILD_DIR)/integrity_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/integrity_encrypted.o -o $(BUILD_DIR)/integrity_decrypter.s -k $(KEY_INTEGRITY) -f $(INTEGRITY_ENCRYPTED_FUNCTIONS)


# Encryptor module function encoding
ENCRYPTOR_ENCODED_FUNCTIONS := \
	Encryptor_EncryptFunction  \
	Encryptor_DecryptFunction

$(BUILD_DIR)/encryptor_encoded.o \
$(BUILD_DIR)/encryptor_decoder.s: $(C_OBJ_DIR)/encryptor.o $(ELFCODER)
	cp $(C_OBJ_DIR)/encryptor.o $(BUILD_DIR)/encryptor_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/encryptor_encoded.o -o $(BUILD_DIR)/encryptor_decoder.s -f $(ENCRYPTOR_ENCODED_FUNCTIONS)


# Core tests module: MAC/Owner, ROM utilities, ROM tests function encoding
KEY_CORE_TESTS := 0982

# Default prefix (RunEncrypted_)
MACOWNER_ENCRYPTED_FUNCTIONS := \
	MACOwner_IsBad   \
	MACOwner_IsGood

ROMUTIL_ENCRYPTED_FUNCTIONS := \
	ROMUtil_Read   \
	ROMUtil_CRC32

ROMTEST_ENCRYPTED_FUNCTIONS := \
	ROMTest_IsBad   \
	ROMTest_IsGood

CORETESTS_ENCODED_FUNCTIONS := \
	RunEncrypted_ROMTest_IsBad    \
	RunEncrypted_ROMTest_IsGood   \
	RunEncrypted_MACOwner_IsBad   \
	RunEncrypted_MACOwner_IsGood  \
	RunEncrypted_ROMUtil_Read     \
	RunEncrypted_ROMUtil_CRC32

$(BUILD_DIR)/mac_owner_decrypter_encoded.o \
$(BUILD_DIR)/rom_util_decrypter_encoded.o  \
$(BUILD_DIR)/rom_test_decrypter_encoded.o  \
$(BUILD_DIR)/coretests_decrypter_decoder.s: $(BUILD_DIR)/mac_owner_decrypter.o $(BUILD_DIR)/rom_util_decrypter.o $(BUILD_DIR)/rom_test_decrypter.o $(ELFCODER)
	cp $(BUILD_DIR)/mac_owner_decrypter.o $(BUILD_DIR)/mac_owner_decrypter_encoded.o
	cp $(BUILD_DIR)/rom_util_decrypter.o $(BUILD_DIR)/rom_util_decrypter_encoded.o
	cp $(BUILD_DIR)/rom_test_decrypter.o $(BUILD_DIR)/rom_test_decrypter_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/mac_owner_decrypter_encoded.o $(BUILD_DIR)/rom_util_decrypter_encoded.o $(BUILD_DIR)/rom_test_decrypter_encoded.o -o $(BUILD_DIR)/coretests_decrypter_decoder.s -f $(CORETESTS_ENCODED_FUNCTIONS)

$(BUILD_DIR)/mac_owner_encrypted.o \
$(BUILD_DIR)/mac_owner_decrypter.s: $(C_OBJ_DIR)/mac_owner.o $(ELFCODER)
	cp $(C_OBJ_DIR)/mac_owner.o $(BUILD_DIR)/mac_owner_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/mac_owner_encrypted.o -o $(BUILD_DIR)/mac_owner_decrypter.s -k $(KEY_CORE_TESTS) -f $(MACOWNER_ENCRYPTED_FUNCTIONS)

$(BUILD_DIR)/rom_util_encrypted.o \
$(BUILD_DIR)/rom_util_decrypter.s: $(C_OBJ_DIR)/rom_util.o $(ELFCODER)
	cp $(C_OBJ_DIR)/rom_util.o $(BUILD_DIR)/rom_util_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rom_util_encrypted.o -o $(BUILD_DIR)/rom_util_decrypter.s -k $(KEY_CORE_TESTS) -f $(ROMUTIL_ENCRYPTED_FUNCTIONS)

$(BUILD_DIR)/rom_test_encrypted.o \
$(BUILD_DIR)/rom_test_decrypter.s: $(C_OBJ_DIR)/rom_test.o $(ELFCODER)
	cp $(C_OBJ_DIR)/rom_test.o $(BUILD_DIR)/rom_test_encrypted.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rom_test_encrypted.o -o $(BUILD_DIR)/rom_test_decrypter.s -k $(KEY_CORE_TESTS) -f $(ROMTEST_ENCRYPTED_FUNCTIONS)


# RC4 module function encoding
RC4_ENCODED_FUNCTIONS := \
	RC4_Init                        \
	RC4_Byte                        \
	RC4_InitSBox                    \
	RC4_EncryptInstructions         \
	RC4_DecryptInstructions         \
	RC4_InitAndEncryptInstructions  \
	RC4_InitAndDecryptInstructions

$(BUILD_DIR)/rc4_encoded.o \
$(BUILD_DIR)/rc4_decoder.s: $(C_OBJ_DIR)/rc4.o $(ELFCODER)
	cp $(C_OBJ_DIR)/rc4.o $(BUILD_DIR)/rc4_encoded.o
	$(ELFCODER) -e -i $(BUILD_DIR)/rc4_encoded.o -o $(BUILD_DIR)/rc4_decoder.s -f $(RC4_ENCODED_FUNCTIONS)
