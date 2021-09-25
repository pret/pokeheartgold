#include <nitro.h>

extern void SDK_IRQ_STACKSIZE(void);

#define RESET_HW_DTCM_IRQ_STACK_END SDK_AUTOLOAD_DTCM_START + 0x00003fc0 - HW_SVC_STACK_SIZE

static vu16 OSi_IsResetOccurred = FALSE;
u16 OSi_IsInitReset = FALSE;

void OS_InitReset(void) {
    if (OSi_IsInitReset) {
        return;
    }
    OSi_IsInitReset = TRUE;
    PXI_Init();
    while (!PXI_IsCallbackReady(PXI_FIFO_TAG_OS, PXI_PROC_ARM7)) ;
    PXI_SetFifoRecvCallback(PXI_FIFO_TAG_OS, OSi_CommonCallback);
}

void OSi_CommonCallback(PXIFifoTag tag, u32 data, BOOL err) {
#pragma unused(tag)
#pragma unused(err)
    u16 command;
    u16 commandArg;

    command = (u16)((data & OS_PXI_COMMAND_MASK) >> OS_PXI_COMMAND_SHIFT);
    commandArg = (u16)((data & OS_PXI_DATA_MASK) >> OS_PXI_DATA_SHIFT);
    if (command == OS_PXI_COMMAND_RESET) {
        OSi_IsResetOccurred = TRUE;
        return;
    }

    OS_Panic("");
}

void OSi_SendToPxi(u16 data) {
    u32 pxi_send_data;

    pxi_send_data = (u32)(data) << OS_PXI_COMMAND_SHIFT;
    while (PXI_SendWordByFifo(PXI_FIFO_TAG_OS, pxi_send_data, FALSE) != PXI_FIFO_SUCCESS) {}
}

void OS_ResetSystem(u32 parameter) {
    u16 lockId;

    if (MB_IsMultiBootChild()) {
        OS_Panic("");
    }

    lockId = OS_GetLockID();
    CARD_LockRom(lockId);
    MI_StopDma(0);
    MI_StopDma(1);
    MI_StopDma(2);
    MI_StopDma(3);
    OS_SetIrqMask(OS_IE_SPFIFO_RECV);
    OS_ResetRequestIrqMask(~OS_IE_SPFIFO_RECV);
    *(vu32 *)HW_RESET_PARAMETER_BUF = parameter;
    OSi_SendToPxi(OS_PXI_COMMAND_RESET);
    asm {
        ldr r0, =RESET_HW_DTCM_IRQ_STACK_END
        ldr r1, =SDK_IRQ_STACKSIZE
        sub r0, r0, r1
        mov sp, r0
        bl OSi_DoResetSystem
    }
}
