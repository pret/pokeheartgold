#include <nitro.h>

static u16 OSi_UseTick = FALSE;
vu64 OSi_TickCounter;
BOOL OSi_NeedResetTimer = FALSE;

#define OSi_TICK_TIMERCONTROL  ( REG_OS_TM0CNT_H_E_MASK | REG_OS_TM0CNT_H_I_MASK | OS_TIMER_PRESCALER_64 )
#define OSi_TICK_TIMER         OS_TIMER_0
#define OSi_TICK_IE_TIMER      OS_IE_TIMER0

void OSi_CountUpTick(void);

void OS_InitTick(void) {
    if (OSi_UseTick) {
        return;
    }
    OSi_UseTick = TRUE;
    OSi_SetTimerReserved(OSi_TICK_TIMER);
    OSi_TickCounter = 0;
    OS_SetTimerControl(OSi_TICK_TIMER, 0);
    OS_SetTimerCount(OSi_TICK_TIMER, 0);
    OS_SetTimerControl(OSi_TICK_TIMER, OSi_TICK_TIMERCONTROL);
    OS_SetIrqFunction(OSi_TICK_IE_TIMER, OSi_CountUpTick);
    OS_EnableIrqMask(OSi_TICK_IE_TIMER);
    OSi_NeedResetTimer = FALSE;
}

BOOL OS_IsTickAvailable(void) {
    return OSi_UseTick;
}

void OSi_CountUpTick(void) {
    // timer0 interrupt
    OSi_TickCounter++;
    if (OSi_NeedResetTimer) {
        OS_SetTimerControl(OSi_TICK_TIMER, 0);
        OS_SetTimerCount(OSi_TICK_TIMER, 0);
        OS_SetTimerControl(OSi_TICK_TIMER, OSi_TICK_TIMERCONTROL);
        OSi_NeedResetTimer = FALSE;
    }
    OSi_EnterTimerCallback(OSi_TICK_TIMER, (void (*)(void *))OSi_CountUpTick, NULL);
}

OSTick OS_GetTick(void) {
    vu16 countL;
    vu64 countH;
    OSIntrMode enabled = OS_DisableInterrupts();

    countL = *(REGType16 *)((u32)REG_TM0CNT_L_ADDR + OSi_TICK_TIMER * 4);
    countH = OSi_TickCounter & 0xffffffffffffULL;
    if (reg_OS_IF & OSi_TICK_IE_TIMER && !(countL & 0x8000)) {
        countH++;
    }
    OS_RestoreInterrupts(enabled);
    return (countH << 16) | countL;
}

u16 OS_GetTickLo(void) {
    return *(REGType16 *)((u32)REG_TM0CNT_L_ADDR + OSi_TICK_TIMER * 4);
}

void OS_SetTick(OSTick tick) {
    OSIntrMode enabled = OS_DisableInterrupts();
    reg_OS_IF = OSi_TICK_IE_TIMER;
    OSi_NeedResetTimer = TRUE;
    OSi_TickCounter = tick >> 16;
    OS_SetTimerControl(OSi_TICK_TIMER, 0);
    OS_SetTimerCount(OSi_TICK_TIMER, tick & 0xFFFF);
    OS_SetTimerControl(OSi_TICK_TIMER, OSi_TICK_TIMERCONTROL);
    OS_RestoreInterrupts(enabled);
}
