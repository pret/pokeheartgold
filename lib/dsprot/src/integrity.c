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

// This was likely not originally an inline, but an inline is able to match here nicely
static inline u32 checkDecryptionWrapper(u8 *addr, u32 match_ret, u32 mismatch_ret) {
    addr += INTEGRITY_OBFS_OFFSET;
    u32 idx = ENC_VAL_1 - INTEGRITY_OBFS_OFFSET;

    // The bytes checked here are from the `run_encrypted_func` macro defined in asm_macro.inc:
    //   e92d00f0    stmfd  sp!, {r4-r7}
    //   e92d000f    stmfd  sp!, {r0-r3}
    //   e8bd00f0    ldmfd  sp!, {r4-r7}
    //   e59f103c    ldr    r1, [pc, #60]
    if (addr[idx++] != 0xF0) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x00) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x2D) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0xE9) {
        return mismatch_ret;
    }

    if (addr[idx++] != 0x0F) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x00) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x2D) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0xE9) {
        return mismatch_ret;
    }

    if (addr[idx++] != 0xF0) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x00) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0xBD) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0xE8) {
        return mismatch_ret;
    }

    if (addr[idx++] != 0x60) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x10) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0x9F) {
        return mismatch_ret;
    }
    if (addr[idx++] != 0xE5) {
        return mismatch_ret;
    }

    return match_ret;
}

u32 Integrity_MACOwner_IsBad(void) {
    u8 *addr = (u8 *)ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsBad, ENC_VAL_1) - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr + 1;

    return checkDecryptionWrapper(addr, 0, ret);
}

u32 Integrity_MACOwner_IsGood(void) {
    u8 *addr = (u8 *)ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsGood, ENC_VAL_1) - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr;

    return checkDecryptionWrapper(addr, ret + 1, 0);
}

u32 Integrity_ROMTest_IsBad(void) {
    u8 *addr = (u8 *)ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsBad, ENC_VAL_1) - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr + 1;

    return checkDecryptionWrapper(addr, 0, ret);
}

u32 Integrity_ROMTest_IsGood(void) {
    u8 *addr = (u8 *)ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsGood, ENC_VAL_1) - (ENC_VAL_1 * 2);
    u32 ret = (u32)addr;

    return checkDecryptionWrapper(addr, ret + 1, 0);
}
