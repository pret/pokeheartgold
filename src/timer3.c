#include "global.h"
#include "timer_3.h"

vu64 _021D2214;
int _021D2210;

static void sub_02025438(void);

void Init_Timer3(void) {
    _021D2214 = 0;
    _021D2210 = 0;
    OS_SetTimerControl(OS_TIMER_3, 0);
    OS_SetTimerCount(OS_TIMER_3, 0);
    OS_SetTimerControl(OS_TIMER_3, (OS_TIMER_PRESCALER_64 << REG_OS_TM3CNT_H_PS_SHIFT) | (1 << REG_OS_TM3CNT_H_I_SHIFT) | (1 << REG_OS_TM3CNT_H_E_SHIFT));
    OS_SetIrqFunction(OS_IE_TIMER3, sub_02025438);
    OS_EnableIrqMask(OS_IE_TIMER3);
}

static void sub_02025438(void) {
    _021D2214++;
    if (_021D2210) {
        OS_SetTimerControl(OS_TIMER_3, 0);
        OS_SetTimerCount(OS_TIMER_3, 0);
        OS_SetTimerControl(OS_TIMER_3, (OS_TIMER_PRESCALER_64 << REG_OS_TM3CNT_H_PS_SHIFT) | (1 << REG_OS_TM3CNT_H_I_SHIFT) | (1 << REG_OS_TM3CNT_H_E_SHIFT));
        _021D2210 = 0;
    }
    OS_SetIrqCheckFlag(OS_IE_TIMER3);
    OS_SetIrqFunction(OS_IE_TIMER3, sub_02025438);
}

u64 sub_02025488(void) {
    vu16 count_lo;
    vu64 count_hi;
    OSIntrMode bak_psr;

    bak_psr = OS_DisableInterrupts();
    count_lo = *(REGType16 *)((u32)(REG_TM0CNT_L_ADDR + 4 * OS_TIMER_3));
    count_hi = _021D2214 & 0x0000FFFFFFFFFFFFull;
    if ((reg_OS_IF & OS_IE_TIMER3) && !(count_lo & 0x8000)) {
        count_hi++;
    }
    OS_RestoreInterrupts(bak_psr);

    return (count_hi << 16) | count_lo;
}

u64 sub_020254FC(void) {
    return sub_02025488();
}

u64 sub_02025504(u64 a0) {
    return (a0 * 64) / OS_SYSTEM_CLOCK;
}
