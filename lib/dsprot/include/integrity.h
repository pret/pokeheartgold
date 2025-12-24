#ifndef DSPROT_INTEGRITY_H
#define DSPROT_INTEGRITY_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
u32 Integrity_MACOwner_IsBad(void);
u32 Integrity_MACOwner_IsGood(void);
u32 Integrity_ROMTest_IsBad(void);
u32 Integrity_ROMTest_IsGood(void);

// Assembly decryption wrappers
extern u32 RunEncrypted_Integrity_MACOwner_IsBad(void);
extern u32 RunEncrypted_Integrity_MACOwner_IsGood(void);
extern u32 RunEncrypted_Integrity_ROMTest_IsBad(void);
extern u32 RunEncrypted_Integrity_ROMTest_IsGood(void);

#define INTEGRITY_OBFS_OFFSET (ENC_VAL_1 & ~0xFFF)

#endif // DSPROT_INTEGRITY_H
