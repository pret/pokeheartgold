#include "integrity.h"

#include "encoding_constants.h"
#include "mac_owner.h"
#include "rom_test.h"

// Functions to be encrypted (cannot be called directly)
u32 Integrity_MACOwner_IsBad(void);
u32 Integrity_MACOwner_IsGood(void);
u32 Integrity_ROMTest_IsBad(void);
u32 Integrity_ROMTest_IsGood(void);

#define INTEGRITY_OBFS_OFFSET (ENC_VAL_1 & ~0xFFF)

// The bytes checked here are from the `run_encrypted_func` macro defined in asm_macro.inc:
//   e92d00f0    stmfd sp!, {r4-r7}
//   e92d000f    stmfd sp!, {r0-r3}
//   e8bd00f0    ldmfd sp!, {r4-r7}
//   e59f103c    ldr r1, [pc, #60]

u32 Integrity_MACOwner_IsBad(void) {
    // Obfuscated handling of function address
    u8 *addr = (u8 *)&RunEncrypted_MACOwner_IsBad[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr + 1;
    addr += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    if (addr[offset + 0x0] != 0xF0) {
        return ret;
    }
    if (addr[offset + 0x1] != 0x00) {
        return ret;
    }
    if (addr[offset + 0x2] != 0x2D) {
        return ret;
    }
    if (addr[offset + 0x3] != 0xE9) {
        return ret;
    }

    if (addr[offset + 0x4] != 0x0F) {
        return ret;
    }
    if (addr[offset + 0x5] != 0x00) {
        return ret;
    }
    if (addr[offset + 0x6] != 0x2D) {
        return ret;
    }
    if (addr[offset + 0x7] != 0xE9) {
        return ret;
    }

    if (addr[offset + 0x8] != 0xF0) {
        return ret;
    }
    if (addr[offset + 0x9] != 0x00) {
        return ret;
    }
    if (addr[offset + 0xA] != 0xBD) {
        return ret;
    }
    if (addr[offset + 0xB] != 0xE8) {
        return ret;
    }

    if (addr[offset + 0xC] != 0x60) {
        return ret;
    }
    if (addr[offset + 0xD] != 0x10) {
        return ret;
    }
    if (addr[offset + 0xE] != 0x9F) {
        return ret;
    }
    if (addr[offset + 0xF] != 0xE5) {
        return ret;
    }

    return 0;
}

u32 Integrity_MACOwner_IsGood(void) {
    // Obfuscated handling of function address
    u8 *addr = (u8 *)&RunEncrypted_MACOwner_IsGood[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr;
    addr += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    if (addr[offset + 0x0] != 0xF0) {
        return 0;
    }
    if (addr[offset + 0x1] != 0x00) {
        return 0;
    }
    if (addr[offset + 0x2] != 0x2D) {
        return 0;
    }
    if (addr[offset + 0x3] != 0xE9) {
        return 0;
    }

    if (addr[offset + 0x4] != 0x0F) {
        return 0;
    }
    if (addr[offset + 0x5] != 0x00) {
        return 0;
    }
    if (addr[offset + 0x6] != 0x2D) {
        return 0;
    }
    if (addr[offset + 0x7] != 0xE9) {
        return 0;
    }

    if (addr[offset + 0x8] != 0xF0) {
        return 0;
    }
    if (addr[offset + 0x9] != 0x00) {
        return 0;
    }
    if (addr[offset + 0xA] != 0xBD) {
        return 0;
    }
    if (addr[offset + 0xB] != 0xE8) {
        return 0;
    }

    if (addr[offset + 0xC] != 0x60) {
        return 0;
    }
    if (addr[offset + 0xD] != 0x10) {
        return 0;
    }
    if (addr[offset + 0xE] != 0x9F) {
        return 0;
    }
    if (addr[offset + 0xF] != 0xE5) {
        return 0;
    }

    return ret + 1;
}

u32 Integrity_ROMTest_IsBad(void) {
    // Obfuscated handling of function address
    u8 *addr = (u8 *)&RunEncrypted_ROMTest_IsBad[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr + 1;
    addr += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    if (addr[offset + 0x0] != 0xF0) {
        return ret;
    }
    if (addr[offset + 0x1] != 0x00) {
        return ret;
    }
    if (addr[offset + 0x2] != 0x2D) {
        return ret;
    }
    if (addr[offset + 0x3] != 0xE9) {
        return ret;
    }

    if (addr[offset + 0x4] != 0x0F) {
        return ret;
    }
    if (addr[offset + 0x5] != 0x00) {
        return ret;
    }
    if (addr[offset + 0x6] != 0x2D) {
        return ret;
    }
    if (addr[offset + 0x7] != 0xE9) {
        return ret;
    }

    if (addr[offset + 0x8] != 0xF0) {
        return ret;
    }
    if (addr[offset + 0x9] != 0x00) {
        return ret;
    }
    if (addr[offset + 0xA] != 0xBD) {
        return ret;
    }
    if (addr[offset + 0xB] != 0xE8) {
        return ret;
    }

    if (addr[offset + 0xC] != 0x60) {
        return ret;
    }
    if (addr[offset + 0xD] != 0x10) {
        return ret;
    }
    if (addr[offset + 0xE] != 0x9F) {
        return ret;
    }
    if (addr[offset + 0xF] != 0xE5) {
        return ret;
    }

    return 0;
}

u32 Integrity_ROMTest_IsGood(void) {
    // Obfuscated handling of function address
    u8 *addr = (u8 *)&RunEncrypted_ROMTest_IsGood[ENC_VAL_1] - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr;
    addr += INTEGRITY_OBFS_OFFSET;
    u32 offset = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // Bytes of the first four instructions of the function
    if (addr[offset + 0x0] != 0xF0) {
        return 0;
    }
    if (addr[offset + 0x1] != 0x00) {
        return 0;
    }
    if (addr[offset + 0x2] != 0x2D) {
        return 0;
    }
    if (addr[offset + 0x3] != 0xE9) {
        return 0;
    }

    if (addr[offset + 0x4] != 0x0F) {
        return 0;
    }
    if (addr[offset + 0x5] != 0x00) {
        return 0;
    }
    if (addr[offset + 0x6] != 0x2D) {
        return 0;
    }
    if (addr[offset + 0x7] != 0xE9) {
        return 0;
    }

    if (addr[offset + 0x8] != 0xF0) {
        return 0;
    }
    if (addr[offset + 0x9] != 0x00) {
        return 0;
    }
    if (addr[offset + 0xA] != 0xBD) {
        return 0;
    }
    if (addr[offset + 0xB] != 0xE8) {
        return 0;
    }

    if (addr[offset + 0xC] != 0x60) {
        return 0;
    }
    if (addr[offset + 0xD] != 0x10) {
        return 0;
    }
    if (addr[offset + 0xE] != 0x9F) {
        return 0;
    }
    if (addr[offset + 0xF] != 0xE5) {
        return 0;
    }

    return ret + 1;
}
