/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_system.h from the specific proc's lib
 */

#ifndef NITRO_OS_SYSTEM_SHARED_H_
#define NITRO_OS_SYSTEM_SHARED_H_

#include <nitro/hw/consts_shared.h>

typedef enum {
    OS_PROCMODE_USER=16,
    OS_PROCMODE_FIQ=17,
    OS_PROCMODE_IRQ=18,
    OS_PROCMODE_SVC=19,
    OS_PROCMODE_ABORT=23,
    OS_PROCMODE_UNDEF=27,
    OS_PROCMODE_SYS=31
} OSProcMode;

typedef enum {
    OS_INTRMODE_DISABLE_IRQ = HW_PSR_DISABLE_IRQ,
    OS_INTRMODE_DISABLE_FIQ = HW_PSR_DISABLE_FIQ,
    OS_INTRMODE_ENABLE = 0
} OSIntrMode;

typedef enum {
    OS_INTRMODE_IRQ_DISABLE = HW_PSR_DISABLE_IRQ,
    OS_INTRMODE_IRQ_ENABLE = 0
} OSIntrMode_Irq;

#endif //NITRO_OS_SYSTEM_SHARED_H_
