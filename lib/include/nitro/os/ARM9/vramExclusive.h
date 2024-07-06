#ifndef NITRO_OS_VRAMEXCLUSIVE_H_
#define NITRO_OS_VRAMEXCLUSIVE_H_

#define        OS_VRAM_BANK_ID_A        0x0001
#define        OS_VRAM_BANK_ID_B        0x0002
#define        OS_VRAM_BANK_ID_C        0x0004
#define        OS_VRAM_BANK_ID_D        0x0008
#define        OS_VRAM_BANK_ID_E        0x0010
#define        OS_VRAM_BANK_ID_F        0x0020
#define        OS_VRAM_BANK_ID_G        0x0040
#define        OS_VRAM_BANK_ID_H        0x0080
#define        OS_VRAM_BANK_ID_I        0x0100
#define        OS_VRAM_BANK_ID_ALL        0x01ff

#define        OS_VRAM_BANK_KINDS        9

u32 OsCountZeroBits(u32 bitmap);
void OSi_InitVramExclusive(void);
BOOL OSi_TryLockVram(u16 bank, u16 lockId);
void OSi_UnlockVram(u16 bank, u16 lockId);

#endif //NITRO_OS_VRAMEXCLUSIVE_H_
