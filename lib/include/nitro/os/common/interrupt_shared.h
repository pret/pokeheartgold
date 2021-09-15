/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_interrupt.h from the specific proc's lib
 */

#ifndef NITRO_OS_INTERRUPT_SHARED_H
#define NITRO_OS_INTERRUPT_SHARED_H

#include <nitro/types.h>

typedef u32 OSIrqMask;

typedef void (*OSIrqFunction) (void);

typedef struct
{
    void (*func) (void *);
    u32 enable;
    void* arg;
} OSIrqCallbackInfo;

#endif //NITRO_OS_INTERRUPT_SHARED_H
