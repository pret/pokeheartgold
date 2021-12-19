/*
 * NOTE:
 * This file is specific to ARM7
 * DO NOT PUT SHARED/ARM9 CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include <nitro/os/interrupt.h> instead!
 */

#ifndef NITRO_OS_ARM7_INTERRUPT_H
#define NITRO_OS_ARM7_INTERRUPT_H

#include <nitro/hw/consts.h>

extern OSIrqFunction OS_IRQTable[];
extern OSIrqCallbackInfo OSi_IrqCallbackInfo[9];

#define OS_IE_FIFO_RECV       (1UL << REG_OS_IE_IFN_SHIFT)

static inline void OSi_SetVBlankCount(u32 count)
{
    *(u32 *)HW_VBLANK_COUNT_BUF = count;
}

#endif //NITRO_OS_ARM7_INTERRUPT_H
