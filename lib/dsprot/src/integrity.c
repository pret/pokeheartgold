#include "integrity.h"

#include "mac_owner.h"
#include "rom_test.h"
#include "encoding_constants.h"

// Functions to be encrypted (cannot be called directly)
u32 Integrity_MACOwner_IsBad(void);
u32 Integrity_MACOwner_IsGood(void);
u32 Integrity_ROMTest_IsBad(void);
u32 Integrity_ROMTest_IsGood(void);

#define INTEGRITY_OBFS_OFFSET  (0x1000)


u32 Integrity_MACOwner_IsBad(void) {
    // Obfuscated handling of function address
    u32 base = (u32)&RunEncrypted_MACOwner_IsBad[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u8* bytes = (u8*)(base + INTEGRITY_OBFS_OFFSET);
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;
    u32 ret = base + 1;

    // Bytes of the first four instructions of the function
    if (bytes[offset+0x0] != 0xF0) return ret;
    if (bytes[offset+0x1] != 0x00) return ret;
    if (bytes[offset+0x2] != 0x2D) return ret;
    if (bytes[offset+0x3] != 0xE9) return ret;

    if (bytes[offset+0x4] != 0x0F) return ret;
    if (bytes[offset+0x5] != 0x00) return ret;
    if (bytes[offset+0x6] != 0x2D) return ret;
    if (bytes[offset+0x7] != 0xE9) return ret;

    if (bytes[offset+0x8] != 0xF0) return ret;
    if (bytes[offset+0x9] != 0x00) return ret;
    if (bytes[offset+0xA] != 0xBD) return ret;
    if (bytes[offset+0xB] != 0xE8) return ret;

    if (bytes[offset+0xC] != 0x60) return ret;
    if (bytes[offset+0xD] != 0x10) return ret;
    if (bytes[offset+0xE] != 0x9F) return ret;
    if (bytes[offset+0xF] != 0xE5) return ret;

    return 0;
}

u32 Integrity_MACOwner_IsGood(void) {
    // Obfuscated handling of function address
    u32 base = (u32)&RunEncrypted_MACOwner_IsGood[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = base;
    base += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    // (Has to be like this to match, `(u8*)base` as a variable causes regswaps)
    if (((u8*)base)[offset+0x0] != 0xF0) return 0;
    if (((u8*)base)[offset+0x1] != 0x00) return 0;
    if (((u8*)base)[offset+0x2] != 0x2D) return 0;
    if (((u8*)base)[offset+0x3] != 0xE9) return 0;

    if (((u8*)base)[offset+0x4] != 0x0F) return 0;
    if (((u8*)base)[offset+0x5] != 0x00) return 0;
    if (((u8*)base)[offset+0x6] != 0x2D) return 0;
    if (((u8*)base)[offset+0x7] != 0xE9) return 0;

    if (((u8*)base)[offset+0x8] != 0xF0) return 0;
    if (((u8*)base)[offset+0x9] != 0x00) return 0;
    if (((u8*)base)[offset+0xA] != 0xBD) return 0;
    if (((u8*)base)[offset+0xB] != 0xE8) return 0;

    if (((u8*)base)[offset+0xC] != 0x60) return 0;
    if (((u8*)base)[offset+0xD] != 0x10) return 0;
    if (((u8*)base)[offset+0xE] != 0x9F) return 0;
    if (((u8*)base)[offset+0xF] != 0xE5) return 0;

    return ret + 1;
}

u32 Integrity_ROMTest_IsBad(void) {
    // Obfuscated handling of function address
    u32 base = (u32)&RunEncrypted_ROMTest_IsBad[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u8* bytes = (u8*)(base + INTEGRITY_OBFS_OFFSET);
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;
    u32 ret = base + 1;

    // Bytes of the first four instructions of the function
    if (bytes[offset+0x0] != 0xF0) return ret;
    if (bytes[offset+0x1] != 0x00) return ret;
    if (bytes[offset+0x2] != 0x2D) return ret;
    if (bytes[offset+0x3] != 0xE9) return ret;

    if (bytes[offset+0x4] != 0x0F) return ret;
    if (bytes[offset+0x5] != 0x00) return ret;
    if (bytes[offset+0x6] != 0x2D) return ret;
    if (bytes[offset+0x7] != 0xE9) return ret;

    if (bytes[offset+0x8] != 0xF0) return ret;
    if (bytes[offset+0x9] != 0x00) return ret;
    if (bytes[offset+0xA] != 0xBD) return ret;
    if (bytes[offset+0xB] != 0xE8) return ret;

    if (bytes[offset+0xC] != 0x60) return ret;
    if (bytes[offset+0xD] != 0x10) return ret;
    if (bytes[offset+0xE] != 0x9F) return ret;
    if (bytes[offset+0xF] != 0xE5) return ret;

    return 0;
}

u32 Integrity_ROMTest_IsGood(void) {
    // Obfuscated handling of function address
    u32 base = (u32)&RunEncrypted_ROMTest_IsGood[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = base;
    base += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    // (Has to be like this to match, `(u8*)base` as a variable causes regswaps)
    if (((u8*)base)[offset+0x0] != 0xF0) return 0;
    if (((u8*)base)[offset+0x1] != 0x00) return 0;
    if (((u8*)base)[offset+0x2] != 0x2D) return 0;
    if (((u8*)base)[offset+0x3] != 0xE9) return 0;

    if (((u8*)base)[offset+0x4] != 0x0F) return 0;
    if (((u8*)base)[offset+0x5] != 0x00) return 0;
    if (((u8*)base)[offset+0x6] != 0x2D) return 0;
    if (((u8*)base)[offset+0x7] != 0xE9) return 0;

    if (((u8*)base)[offset+0x8] != 0xF0) return 0;
    if (((u8*)base)[offset+0x9] != 0x00) return 0;
    if (((u8*)base)[offset+0xA] != 0xBD) return 0;
    if (((u8*)base)[offset+0xB] != 0xE8) return 0;

    if (((u8*)base)[offset+0xC] != 0x60) return 0;
    if (((u8*)base)[offset+0xD] != 0x10) return 0;
    if (((u8*)base)[offset+0xE] != 0x9F) return 0;
    if (((u8*)base)[offset+0xF] != 0xE5) return 0;

    return ret + 1;
}
