#ifndef DSPROT_MAC_OWNER_H
#define DSPROT_MAC_OWNER_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
u32 MACOwner_IsBad(void);
u32 MACOwner_IsGood(void);

// Assembly decryption wrappers
extern u32 RunEncrypted_MACOwner_IsBad(void);
extern u32 RunEncrypted_MACOwner_IsGood(void);

#endif // DSPROT_MAC_OWNER_H
