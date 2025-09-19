/* No dedicated header */

#include "encoding_constants.h"
#include "integrity.h"
#include "mac_owner.h"
#include "nitro_types.h"
#include "rom_test.h"

// Functions to be encrypted (cannot be called directly)
u32 DetectFlashcart(void *callback);
u32 DetectNotFlashcart(void *callback);
u32 DetectEmulator(void *callback);
u32 DetectNotEmulator(void *callback);
u32 DetectDummy(void *callback);
u32 DetectNotDummy(void *callback);

#define DSP_OBFS_OFFSET (0x320)

enum {
    EXPECT_FALSE,
    EXPECT_TRUE
};

typedef u32 (*TaskFunc)(void);
typedef void (*CallbackFunc)(void);

// This was likely not originally an inline, but an inline is able to match here nicely
static inline u32 dsprotMain(u32 *func_queue, int expected_result, void *callback) {
    BOOL ret;
    BOOL func_result;
    s32 compare_sum;
    u32 i;
    s32 func_result_sum;

    // These two bit arrays must be signed to match
    compare_sum = 0;
    func_result_sum = 0;

    for (i = 0; func_queue[i] != 0; i++) {
        func_result = ((TaskFunc)(func_queue[i] - ENC_VAL_1 - DSP_OBFS_OFFSET))() != 0;

        func_result_sum += func_result;
        func_result_sum <<= 1;

        compare_sum += 1;
        compare_sum <<= 1;
    }

    if (expected_result == EXPECT_TRUE) {
        ret = (func_result_sum >> 1) == (compare_sum >> 1);
    } else {
        ret = ((func_result_sum & compare_sum) >> 1) != 0;
    }

    if (callback != NULL && ret) {
        ((CallbackFunc)callback)();
    }

    return (u32)ret;
}

u32 DetectFlashcart(void *callback) {
    u32 func_queue[32];

    func_queue[2] = 0;
    func_queue[0] = ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;
    func_queue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_ROMTest_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&func_queue[0], EXPECT_FALSE, callback);
}

u32 DetectNotFlashcart(void *callback) {
    u32 func_queue[32];

    func_queue[2] = 0;
    func_queue[0] = ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;
    func_queue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_ROMTest_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&func_queue[0], EXPECT_TRUE, callback);
}

u32 DetectEmulator(void *callback) {
    u32 func_queue[32];

    func_queue[2] = 0;
    func_queue[0] = ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;
    func_queue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_MACOwner_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&func_queue[0], EXPECT_FALSE, callback);
}

u32 DetectNotEmulator(void *callback) {
    u32 func_queue[32];

    func_queue[2] = 0;
    func_queue[0] = ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;
    func_queue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_MACOwner_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&func_queue[0], EXPECT_TRUE, callback);
}

u32 DetectDummy(void *callback) {
    u32 func_queue[32];

    // Prevent optimization of the function queue processing
    *(u32 *)&func_queue[0] = 0;

    return dsprotMain(&func_queue[0], EXPECT_FALSE, callback);
}

u32 DetectNotDummy(void *callback) {
    u32 func_queue[32];

    // Prevent optimization of the function queue processing
    *(u32 *)&func_queue[0] = 0;

    return dsprotMain(&func_queue[0], EXPECT_TRUE, callback);
}
