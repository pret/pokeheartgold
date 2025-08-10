#ifndef ROM_UTIL_H
#define ROM_UTIL_H

#include "types.h"

// Nitro functions
// <nitro/os.h>
// <nitro/card.h>
extern s32 OS_GetLockID(void);
extern void CARD_LockRom(u16 lock_id);
extern void CARD_UnlockRom(u16 lock_id);
extern void OS_ReleaseLockID(u16 lock_id);

// Assembly decryption wrappers
extern void RunEncrypted_ROMUtil_Read(void* dest, u32 addr, s32 num_bytes);
extern u32 RunEncrypted_ROMUtil_CRC32(void* buf, u32 size);

#endif
