#ifndef NITRO_SUB_OS_IRQTABLE_H
#define NITRO_SUB_OS_IRQTABLE_H

#include "consts.h"
#include "OS_interrupt.h"

void OS_IrqDummy(void);
void OSi_IrqCallback(s32 index);
void OSi_IrqDma0(void);
void OSi_IrqDma1(void);
void OSi_IrqDma2(void);
void OSi_IrqDma3(void);
void OSi_IrqTimer0(void);
void OSi_IrqTimer1(void);
void OSi_IrqTimer2(void);
void OSi_IrqTimer3(void);
void OSi_IrqVBlank(void);

static inline void OS_SetIrqCheckFlag(OSIrqMask intr)
{
    *(vu32 *)HW_INTR_CHECK_BUF |= (u32)intr;
}

#endif //NITRO_SUB_OS_IRQTABLE_H
