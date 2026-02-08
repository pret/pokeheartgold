#ifndef DSPROT_MAIN_H
#define DSPROT_MAIN_H

#include "sdk.h"

// Functions to be encrypted (cannot be called directly)
u32 DSProtInternal_DetectFlashcart(void *callback);
u32 DSProtInternal_DetectNotFlashcart(void *callback);
u32 DSProtInternal_DetectEmulator(void *callback);
u32 DSProtInternal_DetectNotEmulator(void *callback);
u32 DSProtInternal_DetectDummy(void *callback);
u32 DSProtInternal_DetectNotDummy(void *callback);

#define DSP_OBFS_OFFSET (0x320)

#define FUNC_QUEUE_END (0)

typedef u32 (*TaskFunc)(void);
typedef void (*CallbackFunc)(void);

typedef enum ExpectedResult {
    EXPECT_FALSE,
    EXPECT_TRUE
} ExpectedResult;

#endif // DSPROT_MAIN_H
