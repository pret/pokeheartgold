#include "dsprot_main.h"

#include "encoding_constants.h"
#include "integrity.h"
#include "mac_owner.h"
#include "rom_test.h"

// This was likely not originally an inline, but an inline is able to match here nicely
static inline u32 dsprotMain(u32 *funcQueue, ExpectedResult expectedResult, void *callback) {
    // These two bit arrays must be signed to match
    s32 compareSum = 0;
    u32 i;
    s32 funcResultSum = 0;

    for (i = 0; funcQueue[i] != FUNC_QUEUE_END; i++) {
        BOOL funcResult = ((TaskFunc)(funcQueue[i] - ENC_VAL_1 - DSP_OBFS_OFFSET))() != 0;

        funcResultSum += funcResult;
        funcResultSum <<= 1;

        compareSum += TRUE;
        compareSum <<= 1;
    }

    BOOL ret;
    if (expectedResult == EXPECT_TRUE) {
        ret = (funcResultSum >> 1) == (compareSum >> 1);
    } else {
        ret = ((funcResultSum & compareSum) >> 1) != 0;
    }

    if (callback != NULL && ret) {
        ((CallbackFunc)callback)();
    }

    return (u32)ret;
}

u32 DSProtInternal_DetectFlashcart(void *callback) {
    u32 funcQueue[32];

    funcQueue[2] = FUNC_QUEUE_END;
    funcQueue[0] = ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;
    funcQueue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_ROMTest_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&funcQueue[0], EXPECT_FALSE, callback);
}

u32 DSProtInternal_DetectNotFlashcart(void *callback) {
    u32 funcQueue[32];

    funcQueue[2] = FUNC_QUEUE_END;
    funcQueue[0] = ADDR_PLUS_ADDEND(RunEncrypted_ROMTest_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;
    funcQueue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_ROMTest_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&funcQueue[0], EXPECT_TRUE, callback);
}

u32 DSProtInternal_DetectEmulator(void *callback) {
    u32 funcQueue[32];

    funcQueue[2] = FUNC_QUEUE_END;
    funcQueue[0] = ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;
    funcQueue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_MACOwner_IsBad, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&funcQueue[0], EXPECT_FALSE, callback);
}

u32 DSProtInternal_DetectNotEmulator(void *callback) {
    u32 funcQueue[32];

    funcQueue[2] = FUNC_QUEUE_END;
    funcQueue[0] = ADDR_PLUS_ADDEND(RunEncrypted_MACOwner_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;
    funcQueue[1] = ADDR_PLUS_ADDEND(RunEncrypted_Integrity_MACOwner_IsGood, ENC_VAL_1) + DSP_OBFS_OFFSET;

    return dsprotMain(&funcQueue[0], EXPECT_TRUE, callback);
}

u32 DSProtInternal_DetectDummy(void *callback) {
    u32 funcQueue[32];

    // Prevent optimization of the function queue processing
    *(u32 *)&funcQueue[0] = FUNC_QUEUE_END;

    return dsprotMain(&funcQueue[0], EXPECT_FALSE, callback);
}

u32 DSProtInternal_DetectNotDummy(void *callback) {
    u32 funcQueue[32];

    // Prevent optimization of the function queue processing
    *(u32 *)&funcQueue[0] = FUNC_QUEUE_END;

    return dsprotMain(&funcQueue[0], EXPECT_TRUE, callback);
}
