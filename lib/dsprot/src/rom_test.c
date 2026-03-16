#include "rom_test.h"

#include "rom_util.h"

static inline u32 testROM(u32 passRet, u32 failRet) {
    // Extra CRC entry is required to match
    u32 crcs[7];
    u8 romBuf[ROM_BLOCK_SIZE];
    s32 i;

    u32 romAddr = 0x1000;

    for (i = 0; i < 6; i++) {
        RunEncrypted_ROMUtil_Read(&romBuf[0], romAddr, ROM_BLOCK_SIZE);
        crcs[i] = RunEncrypted_ROMUtil_CRC32(&romBuf[0], ROM_BLOCK_SIZE);

        if (i == 2) {
            // Has to be like this to match
            romAddr = 1;
            romAddr <<= 15;
        } else {
            romAddr += ROM_BLOCK_SIZE;
        }
    }

    // Checking the ROM reading results were as expected:
    //   0 == 1 == 2 == 3
    //   3 != 4 and 3 != 5

    u32 ret;
    for (i = 0; i < 3; i++) {
        if (crcs[i] != crcs[3]) {
            ret = failRet;
            goto EXIT;
        }
    }

    if (crcs[3] == crcs[4] && crcs[3] == crcs[5]) {
        ret = failRet;
    } else {
        ret = passRet;
    }

EXIT:
    // Erasing read buffer
    for (i = 0; i < ROM_BLOCK_SIZE; i++) {
        romBuf[i] = 0;
    }

    return ret;
}

u32 ROMTest_IsBad(void) {
    return testROM(0, 1);
}

u32 ROMTest_IsGood(void) {
    return testROM(1, 0);
}
