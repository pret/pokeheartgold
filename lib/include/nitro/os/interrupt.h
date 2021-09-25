#ifndef NITRO_SUB_OS_INTERRUPT_H
#define NITRO_SUB_OS_INTERRUPT_H

#include <nitro/os/common/interrupt_shared.h>
#include <nitro/hw/consts.h>

#ifdef SDK_ARM7
#define OS_IRQ_TABLE_MAX 25
#else // SDK_ARM9
#define OS_IRQ_TABLE_MAX 22
#endif //SDK_ARM7 SDK_ARM9

#define OSi_IRQCALLBACK_NO_DMA0         0
#define OSi_IRQCALLBACK_NO_DMA1         1
#define OSi_IRQCALLBACK_NO_DMA2         2
#define OSi_IRQCALLBACK_NO_DMA3         3
#define OSi_IRQCALLBACK_NO_TIMER0       4
#define OSi_IRQCALLBACK_NO_TIMER1       5
#define OSi_IRQCALLBACK_NO_TIMER2       6
#define OSi_IRQCALLBACK_NO_TIMER3       7
#ifdef SDK_ARM7
#define OSi_IRQCALLBACK_NO_VBLANK  8
#endif //SDK_ARM7
#ifdef SDK_ARM9
#define OSi_IRQCALLBACK_NUM       (7+1)
#else // SDK_ARM7
#define OSi_IRQCALLBACK_NUM       (8+1)
#endif // SDK_ARM9 SDK_ARM7

#ifdef SDK_ARM7
static inline void OSi_SetVBlankCount(u32 count)
{
    *(u32 *)HW_VBLANK_COUNT_BUF = count;
}
#endif //SDK_ARM7

extern OSIrqFunction OS_IRQTable[];
extern OSIrqCallbackInfo OSi_IrqCallbackInfo[OSi_IRQCALLBACK_NUM];

static inline void OS_ClearIrqCheckFlag(OSIrqMask intr) {
    *(vu32 *)HW_INTR_CHECK_BUF &= (u32)~intr;
}

static inline u32 OS_GetIrqCheckFlag(void) {
    return *(vu32 *)HW_INTR_CHECK_BUF;
}

static inline void OS_SetIrqCheckFlag(OSIrqMask intr) {
    *(vu32 *)HW_INTR_CHECK_BUF |= (u32)intr;
}

static inline BOOL OS_DisableIrq(void) {
    BOOL ime = reg_OS_IME;
    reg_OS_IME = 0;
    return ime;
}

static inline BOOL OS_RestoreIrq(BOOL enable) {
    BOOL ime = reg_OS_IME;
    reg_OS_IME = enable;
    return ime;
}

void OS_InitIrqTable(void);
void OS_SetIrqFunction(OSIrqMask intrBit, OSIrqFunction function);
void OSi_EnterTimerCallback(u32 timerNo, void (*callback) (void *), void *arg);
OSIrqMask OS_SetIrqMask(OSIrqMask mask);
OSIrqMask OS_EnableIrqMask(OSIrqMask mask);
OSIrqMask OS_DisableIrqMask(OSIrqMask mask);
OSIrqMask OS_ResetRequestIrqMask(OSIrqMask mask);
void OS_SetIrqStackChecker(void);
void OS_WaitIrq(BOOL clear, OSIrqMask irqFlags);

#endif //NITRO_SUB_OS_INTERRUPT_H
