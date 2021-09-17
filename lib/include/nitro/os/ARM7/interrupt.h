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

static inline void OSi_SetVBlankCount(u32 count)
{
    *(u32 *)HW_VBLANK_COUNT_BUF = count;
}

void OS_InitIrqTable(void);
void OS_SetIrqFunction(OSIrqMask intrBit, OSIrqFunction function);
void OSi_EnterTimerCallback(u32 timerNo, void (*callback) (void *), void *arg);
OSIrqMask OS_SetIrqMask(OSIrqMask mask);
OSIrqMask OS_EnableIrqMask(OSIrqMask mask);
OSIrqMask OS_DisableIrqMask(OSIrqMask mask);
OSIrqMask OS_ResetRequestIrqMask(OSIrqMask mask);

#endif //NITRO_OS_ARM7_INTERRUPT_H
