#ifndef NITRO_SUB_OS_INTERRUPT_H
#define NITRO_SUB_OS_INTERRUPT_H

#include <nitro/os/common/interrupt_shared.h>
#include <nitro/hw/consts.h>

#define OS_IME_DISABLE      (0UL << REG_OS_IME_IME_SHIFT)
#define OS_IME_ENABLE       (1UL << REG_OS_IME_IME_SHIFT)

#ifdef SDK_ARM7
#include <nitro/os/ARM7/interrupt.h>
#define OS_IRQ_TABLE_MAX 25
#else // SDK_ARM9
//#include <nitro/os/ARM9/interrupt.h>
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

static inline BOOL OS_EnableIrq(void) {
    u16 prep = reg_OS_IME;
    reg_OS_IME = OS_IME_ENABLE;
    return (BOOL)prep;
}

#ifdef SDK_ARM9
static inline BOOL OS_DisableIrq(void) {
    BOOL ime = reg_OS_IME;
    reg_OS_IME = OS_IME_DISABLE;
    return ime;
}
#else
BOOL OS_DisableIrq(void);
#endif

static inline BOOL OS_RestoreIrq(BOOL enable) {
    BOOL ime = reg_OS_IME;
    reg_OS_IME = enable;
    return ime;
}

static inline OSIrqMask OS_GetIrqMask(void) {
    return reg_OS_IE;
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
OSIrqFunction OS_GetIrqFunction(OSIrqMask intrBit);
void OSi_EnterDmaCallback(u32 dmaNo, void (*callback)(void * arg), void * arg);

static inline vu32 OS_GetVBlankCount(void) {
    return *(vu32 *)HW_VBLANK_COUNT_BUF;
}

#endif //NITRO_SUB_OS_INTERRUPT_H
