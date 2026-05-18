#ifndef DSPROT_ROM_TEST_H
#define DSPROT_ROM_TEST_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
u32 ROMTest_IsBad(void);
u32 ROMTest_IsGood(void);

// Assembly decryption wrappers
extern u32 RunEncrypted_ROMTest_IsBad(void);
extern u32 RunEncrypted_ROMTest_IsGood(void);

#define ROM_BLOCK_SIZE CARD_ROM_PAGE_SIZE

#endif // DSPROT_ROM_TEST_H
