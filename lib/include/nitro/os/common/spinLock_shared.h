/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_spinLock.h from the specific proc's lib
 */

#ifndef NITRO_OS_SPINLOCK_SHARED_H_
#define NITRO_OS_SPINLOCK_SHARED_H_

#include <nitro/types.h>

typedef volatile struct OSLockWord {
    u32 lockFlag;
    u16 ownerID;
    u16 extension;
} OSLockWord;

#endif //NITRO_OS_SPINLOCK_SHARED_H_
