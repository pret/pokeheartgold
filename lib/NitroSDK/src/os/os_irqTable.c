#include <nitro/os/interrupt.h>
#include <nitro/os/irqTable.h>

OSIrqCallbackInfo OSi_IrqCallbackInfo[OSi_IRQCALLBACK_NUM];

u16 OSi_IrqCallbackInfoIndex[] = {
    REG_OS_IE_D0_SHIFT,
    REG_OS_IE_D1_SHIFT,
    REG_OS_IE_D2_SHIFT,
    REG_OS_IE_D3_SHIFT,
    REG_OS_IE_T0_SHIFT,
    REG_OS_IE_T1_SHIFT,
    REG_OS_IE_T2_SHIFT,
    REG_OS_IE_T3_SHIFT,
#ifdef SDK_ARM7
    REG_OS_IE_VB_SHIFT,
#endif
};

#ifdef SDK_ARM9
#include <nitro/dtcm_begin.h>
#endif
OSIrqFunction OS_IRQTable[] = {
#ifdef SDK_ARM7
    OSi_IrqVBlank,
#else
    OS_IrqDummy,
#endif
    OS_IrqDummy,
    OS_IrqDummy,
    OSi_IrqTimer0,
    OSi_IrqTimer1,
    OSi_IrqTimer2,
    OSi_IrqTimer3,
    OS_IrqDummy,
    OSi_IrqDma0,
    OSi_IrqDma1,
    OSi_IrqDma2,
    OSi_IrqDma3,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
#ifdef SDK_ARM7
    OS_IrqDummy,
    OS_IrqDummy,
    OS_IrqDummy,
#endif
};

#ifdef SDK_ARM9
#include <nitro/dtcm_end.h>
#endif

void OS_IrqDummy(void) {}

void OSi_IrqCallback(s32 index) {
    OSIrqMask imask = (1UL << OSi_IrqCallbackInfoIndex[index]);
    void (*callback)(void *) = OSi_IrqCallbackInfo[index].func;
    OSi_IrqCallbackInfo[index].func = NULL;
    if (callback) callback(OSi_IrqCallbackInfo[index].arg);
    OS_SetIrqCheckFlag(imask);
    if (!OSi_IrqCallbackInfo[index].enable)
        OS_DisableIrqMask(imask);
}

void OSi_IrqDma0(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_DMA0);
}

void OSi_IrqDma1(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_DMA1);
}

void OSi_IrqDma2(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_DMA2);
}

void OSi_IrqDma3(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_DMA3);
}

void OSi_IrqTimer0(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_TIMER0);
}

void OSi_IrqTimer1(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_TIMER1);
}

void OSi_IrqTimer2(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_TIMER2);
}

void OSi_IrqTimer3(void) {
    OSi_IrqCallback(OSi_IRQCALLBACK_NO_TIMER3);
}

#ifdef SDK_ARM7
void OSi_IrqVBlank(void) {
    void (*callback)(void) = (void(*)(void))OSi_IrqCallbackInfo[OSi_IRQCALLBACK_NO_VBLANK].func;
    (*(u32 *)HW_VBLANK_COUNT_BUF)++;
    if (callback) {
        callback();
    }
    OS_SetIrqCheckFlag(1UL << REG_OS_IE_VB_SHIFT);
}
#endif //SDK_ARM7
