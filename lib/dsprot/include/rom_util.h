#ifndef DSPROT_ROM_UTIL_H
#define DSPROT_ROM_UTIL_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
void ROMUtil_Read(void *dest, u32 addr, s32 numBytes);
u32 ROMUtil_CRC32(void *buf, u32 size);

// Assembly decryption wrappers
extern void RunEncrypted_ROMUtil_Read(void *dest, u32 addr, s32 numBytes);
extern u32 RunEncrypted_ROMUtil_CRC32(void *buf, u32 size);

#endif // DSPROT_ROM_UTIL_H
