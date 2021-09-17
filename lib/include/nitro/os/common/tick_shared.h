/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_tick.h from the specific proc's lib
 */

#ifndef NITRO_OS_TICK_SHARED_H
#define NITRO_OS_TICK_SHARED_H

#include <nitro/types.h>

typedef u64 OSTick;

#define OS_SYSTEM_CLOCK HW_SYSTEM_CLOCK

#define OS_MilliSecondsToTicks(msec) ((OSTick)(((OS_SYSTEM_CLOCK/1000) * (u64)(msec)) / 64))

#endif //NITRO_OS_TICK_SHARED_H
