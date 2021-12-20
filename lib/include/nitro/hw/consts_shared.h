/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include consts.h from the specific proc's lib
 */

#ifndef NITRO_HW_CONSTS_SHARED_H_
#define NITRO_HW_CONSTS_SHARED_H_

#include <nitro/hw/mmap_shared.h>
#include <nitro/hw/common/io_reg.h>

//Shared Consts

#define HW_PSR_CPU_MODE_MASK       0x1f // CPU mode

#define HW_PSR_DISABLE_FIQ         0x40 // Disable FIQ
#define HW_PSR_DISABLE_IRQ         0x80 // Disable IRQ
#define HW_PSR_DISABLE_IRQ_FIQ     0xc0 // Disable FIQ and IRQ

#define OSi_ROUND(n, a)            (((u32) (n) + (a) - 1) & ~((a) - 1))
#define OSi_TRUNC(n, a)            (((u32) (n)) & ~((a) - 1))
#define OSi_InRange(targ, a, b)    ((u32)(a) <= (u32)(targ) && (u32)(targ) < (u32)(b))
#define OSi_OFFSET(n, a)           (((u32) (n)) & ((a) - 1))

#define OS_THREAD_SPECIFIC_MAX     0x03

#define OS_THREAD_LAUNCHER_PRIORITY 0x10
#define OS_THREAD_PRIORITY_MIN     0x00
#define OS_THREAD_PRIORITY_MAX     0x1F

#define HW_SYSTEM_CLOCK            33514000

#define OSi_GetArenaInfo()         (*(OSArenaInfo*)HW_ARENA_INFO_BUF)

#endif //NITRO_HW_CONSTS_SHARED_H_
