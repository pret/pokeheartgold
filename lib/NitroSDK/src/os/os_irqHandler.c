#include <nitro/os/interrupt.h>
#include <nitro/os/system.h>
#include <nitro/os/thread.h>
#include <nitro/os/irqTable.h>

extern OSThreadQueue OSi_IrqThreadQueue;

void OS_WaitIrq(BOOL clear, OSIrqMask irqFlags) {
    OSIntrMode enabled = OS_DisableInterrupts();
    if (clear) {
        OS_ClearIrqCheckFlag(irqFlags);
    }
    OS_RestoreInterrupts(enabled);
    while (!(OS_GetIrqCheckFlag() & irqFlags)) {
        OS_SleepThread(&OSi_IrqThreadQueue);
    }
}

#include <nitro/dtcm_begin.h>
OSIrqFunction OS_IRQTable[] = {
    OS_IrqDummy,
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
    OS_IrqDummy
};

OSThreadQueue OSi_IrqThreadQueue;
#include <nitro/dtcm_end.h>
