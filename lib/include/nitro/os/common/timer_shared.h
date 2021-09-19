#ifndef NITRO_OS_TIMER_SHARED_H
#define NITRO_OS_TIMER_SHARED_H

#include <nitro/hw/consts_shared.h>

typedef enum
{
    OS_TIMER_PRESCALER_1 = (0UL << REG_OS_TM0CNT_H_PS_SHIFT),
    OS_TIMER_PRESCALER_64 = (1UL << REG_OS_TM0CNT_H_PS_SHIFT),
    OS_TIMER_PRESCALER_256 = (2UL << REG_OS_TM0CNT_H_PS_SHIFT),
    OS_TIMER_PRESCALER_1024 = (3UL << REG_OS_TM0CNT_H_PS_SHIFT)
} OSTimerPrescaler;

typedef enum
{
    OS_TIMER_0 = 0,
    OS_TIMER_1 = 1,
    OS_TIMER_2 = 2,
    OS_TIMER_3 = 3
} OSTimer;

static inline void OS_SetTimerCount(OSTimer id, u16 count)
{
    *((REGType16 *)((u32)&reg_OS_TM0CNT_L + id * 4)) = count;
}

static inline void OS_SetTimerControl(OSTimer id, u16 control)
{
    *((REGType16 *)((u32)&reg_OS_TM0CNT_H + id * 4)) = control;
}

#endif //NITRO_OS_TIMER_SHARED_H
