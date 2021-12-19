#include <nitro/os/interrupt.h>

extern OSThreadQueue OSi_IrqThreadQueue;

static u32 OSi_IrqStackWarningOffset = 0;

void OS_InitIrqTable(void) {
    OS_InitThreadQueue(&OSi_IrqThreadQueue);
#ifdef SDK_ARM7
    OSi_SetVBlankCount(0);
#endif
}

void OS_SetIrqFunction(OSIrqMask intrBit, OSIrqFunction function) {
    int i;
    OSIrqCallbackInfo * info;
    for (i = 0; i < OS_IRQ_TABLE_MAX; i++) {
        if (intrBit & 1) {
            info = NULL;
            if (REG_OS_IE_D0_SHIFT <= i && i <= REG_OS_IE_D3_SHIFT) {
                info = &OSi_IrqCallbackInfo[i - REG_OS_IE_D0_SHIFT];
            } else if (REG_OS_IE_T0_SHIFT <= i && i <= REG_OS_IE_T3_SHIFT) {
                info = &OSi_IrqCallbackInfo[i - REG_OS_IE_T0_SHIFT + OSi_IRQCALLBACK_NO_TIMER0];
            }
#ifdef SDK_ARM7
                else if (i == REG_OS_IE_VB_SHIFT) {
                info = &OSi_IrqCallbackInfo[OSi_IRQCALLBACK_NO_VBLANK];
            }
#endif
            else {
                OS_IRQTable[i] = function;
            }
            if (info) {
                info->func = (void (*)(void*))function;
                info->arg = 0;
                info->enable = TRUE;
            }
        }
        intrBit >>= 1;
    }
}

OSIrqFunction OS_GetIrqFunction(OSIrqMask intrBit) {
    int i;
    OSIrqFunction *funcPtr = &OS_IRQTable[0];
    for (i = 0; i < OS_IRQ_TABLE_MAX; i++) {
        if (intrBit & 1) {
            if (REG_OS_IE_D0_SHIFT <= i && i <= REG_OS_IE_D3_SHIFT) {
                return (OSIrqFunction)OSi_IrqCallbackInfo[i - REG_OS_IE_D0_SHIFT].func;
            } else if (REG_OS_IE_T0_SHIFT <= i && i <= REG_OS_IE_T3_SHIFT) {
                return (OSIrqFunction)OSi_IrqCallbackInfo[i - REG_OS_IE_T0_SHIFT + OSi_IRQCALLBACK_NO_TIMER0].func;
            }
#ifdef SDK_ARM7
            else if (i == REG_OS_IE_VB_SHIFT) {
                return (OSIrqFunction)OSi_IrqCallbackInfo[OSi_IRQCALLBACK_NO_VBLANK].func;
            }
#endif
            return *funcPtr;
        }
        intrBit >>= 1;
        funcPtr++;
    }
    return NULL;
}

void OSi_EnterDmaCallback(u32 dmaNo, void (*callback)(void * arg), void * arg) {
    OSIrqMask imask = (1UL << (dmaNo + REG_OS_IE_D0_SHIFT));
    OSi_IrqCallbackInfo[dmaNo].func = callback;
    OSi_IrqCallbackInfo[dmaNo].arg = arg;
    OSi_IrqCallbackInfo[dmaNo].enable = OS_EnableIrqMask(imask) & imask;
}

void OSi_EnterTimerCallback(u32 timerNo, void (*callback)(void * arg), void * arg) {
    OSIrqMask imask = (1UL << (timerNo + REG_OS_IE_T0_SHIFT));
    OSi_IrqCallbackInfo[timerNo + OSi_IRQCALLBACK_NO_TIMER0].func = callback;
    OSi_IrqCallbackInfo[timerNo + OSi_IRQCALLBACK_NO_TIMER0].arg = arg;
    OS_EnableIrqMask(imask);
    OSi_IrqCallbackInfo[timerNo + OSi_IRQCALLBACK_NO_TIMER0].enable = TRUE;
}

OSIrqMask OS_SetIrqMask(OSIrqMask newMask) {
    BOOL ime = OS_DisableIrq();
    OSIrqMask prep = reg_OS_IE;
    reg_OS_IE = newMask;
    OS_RestoreIrq(ime);
    return prep;
}

#ifdef SDK_ARM7
BOOL OS_DisableIrq(void) {
    BOOL ime = reg_OS_IME;
    reg_OS_IME = 0;
    return ime;
}
#endif

OSIrqMask OS_EnableIrqMask(OSIrqMask newMask) {
    BOOL ime = OS_DisableIrq();
    OSIrqMask prep = reg_OS_IE;
    reg_OS_IE = prep | newMask;
    OS_RestoreIrq(ime);
    return prep;
}

OSIrqMask OS_DisableIrqMask(OSIrqMask newMask) {
    BOOL ime = OS_DisableIrq();
    OSIrqMask prep = reg_OS_IE;
    reg_OS_IE = prep & ~newMask;
    OS_RestoreIrq(ime);
    return prep;
}

OSIrqMask OS_ResetRequestIrqMask(OSIrqMask newMask) {
    BOOL ime = OS_DisableIrq();
    OSIrqMask prep = reg_OS_IF;
    reg_OS_IF = newMask;
    OS_RestoreIrq(ime);
    return prep;
}

extern void SDK_IRQ_STACKSIZE(void);

//---- defs for irq stack
#ifdef SDK_ARM9
#define  OSi_IRQ_STACK_TOP                (HW_DTCM_SVC_STACK - ((s32)SDK_IRQ_STACKSIZE))
#define  OSi_IRQ_STACK_BOTTOM             HW_DTCM_SVC_STACK
#else
#define  OSi_IRQ_STACK_TOP                (HW_PRV_WRAM_IRQ_STACK_END - ((s32)SDK_IRQ_STACKSIZE))
#define  OSi_IRQ_STACK_BOTTOM             HW_PRV_WRAM_IRQ_STACK_END
#endif

//---- Stack CheckNumber
#ifdef SDK_ARM9
#define  OSi_IRQ_STACK_CHECKNUM_BOTTOM     0xfddb597dUL
#define  OSi_IRQ_STACK_CHECKNUM_TOP        0x7bf9dd5bUL
#define  OSi_IRQ_STACK_CHECKNUM_WARN       0x597dfbd9UL
#else
#define  OSi_IRQ_STACK_CHECKNUM_BOTTOM     0xd73bfdf7UL
#define  OSi_IRQ_STACK_CHECKNUM_TOP        0xfbdd37bbUL
#define  OSi_IRQ_STACK_CHECKNUM_WARN       0xbdf7db3dUL
#endif


void OS_SetIrqStackChecker(void) {
    *(u32 *)(OSi_IRQ_STACK_BOTTOM - sizeof(u32)) = OSi_IRQ_STACK_CHECKNUM_BOTTOM;
    *(u32 *)(OSi_IRQ_STACK_TOP) = OSi_IRQ_STACK_CHECKNUM_TOP;
}
