#ifndef INTEGRITY_H
#define INTEGRITY_H

#include "types.h"

// Assembly decryption wrappers
extern u32 RunEncrypted_Integrity_MACOwner_IsBad(void);
extern u32 RunEncrypted_Integrity_MACOwner_IsGood(void);
extern u32 RunEncrypted_Integrity_ROMTest_IsBad(void);
extern u32 RunEncrypted_Integrity_ROMTest_IsGood(void);

#endif
