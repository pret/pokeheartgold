#include "rom_test.h"

#include "nitro_card.h"
#include "rom_util.h"

// Functions to be encrypted (cannot be called directly)
u32 ROMTest_IsBad(void);
u32 ROMTest_IsGood(void);

#define ROM_BLOCK_SIZE CARD_ROM_PAGE_SIZE

static inline u32 testROM(u32 pass_ret, u32 fail_ret) {
    // Extra CRC entry is required to match
    u32 crcs[7];
    u8 rom_buf[ROM_BLOCK_SIZE];
    s32 i;

    u32 rom_addr = 0x1000;

    for (i = 0; i < 6; i++) {
        RunEncrypted_ROMUtil_Read(&rom_buf[0], rom_addr, ROM_BLOCK_SIZE);
        crcs[i] = RunEncrypted_ROMUtil_CRC32(&rom_buf[0], ROM_BLOCK_SIZE);

        if (i == 2) {
            // Has to be like this to match
            rom_addr = 1;
            rom_addr <<= 15;
        } else {
            rom_addr += ROM_BLOCK_SIZE;
        }
    }

    // Checking the ROM reading results were as expected:
    //   0 == 1 == 2 == 3
    //   3 != 4 and 3 != 5

    u32 ret;
    for (i = 0; i < 3; i++) {
        if (crcs[i] != crcs[3]) {
            ret = fail_ret;
            goto EXIT;
        }
    }

    if (crcs[3] == crcs[4] && crcs[3] == crcs[5]) {
        ret = fail_ret;
    } else {
        ret = pass_ret;
    }

EXIT:
    // Erasing read buffer
    u8 *buf_ptr = &rom_buf[0];
    for (i = 0; i < ROM_BLOCK_SIZE; i++) {
        *buf_ptr++ = 0;
    }

    return ret;
}

u32 ROMTest_IsBad(void) {
    return testROM(0, 1);
}

u32 ROMTest_IsGood(void) {
    return testROM(1, 0);
}
