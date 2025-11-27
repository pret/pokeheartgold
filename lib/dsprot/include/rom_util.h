#ifndef DSPROT_ROM_UTIL_H
#define DSPROT_ROM_UTIL_H

#include "sdk.h"

// Custom defs not provided by SDK
#define REG_CARD_MASTER_CNT_OFFSET (0x1A1)
#define REG_CARDCNT_OFFSET         (0x1A4)
#define REG_CARD_CMD_OFFSET        (0x1A8)
#define REG_CARD_DATA_OFFSET       (0x100010)

// Functions to be encrypted (cannot be called directly)
void ROMUtil_Read(void *dest, u32 addr, s32 numBytes);
u32 ROMUtil_CRC32(void *buf, u32 size);

// Assembly decryption wrappers
extern void RunEncrypted_ROMUtil_Read(void *dest, u32 addr, s32 numBytes);
extern u32 RunEncrypted_ROMUtil_CRC32(void *buf, u32 size);

#endif // DSPROT_ROM_UTIL_H
