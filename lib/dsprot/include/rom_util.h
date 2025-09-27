#ifndef ROM_UTIL_H
#define ROM_UTIL_H

#include "nitro_types.h"

// Assembly decryption wrappers
extern void RunEncrypted_ROMUtil_Read(void *dest, u32 addr, s32 num_bytes);
extern u32 RunEncrypted_ROMUtil_CRC32(void *buf, u32 size);

#endif
