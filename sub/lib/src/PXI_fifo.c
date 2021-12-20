#include <nitro.h>

// Stub file for now
u16 FifoCtrlInit = 0;
PXIFifoCallback FifoRecvCallbackTable[PXI_MAX_FIFO_TAG];

s32 PXIi_SetToFifo(u32 data);

void PXI_Init(void) {
    PXI_InitFifo();
}

void PXI_InitFifo(void) {
    int i;
    OSSystemWork *work;
    OSIntrMode enabled = OS_DisableInterrupts();
    if (!FifoCtrlInit) {
        FifoCtrlInit = TRUE;
        work = OS_GetSystemWork();
        work->pxiHandleChecker[PXI_PROC_ARM7] = 0;
        for (i = 0; i < PXI_MAX_FIFO_TAG; i++) {
            FifoRecvCallbackTable[i] = NULL;
        }
        reg_PXI_MAINP_FIFO_CNT = REG_PXI_MAINP_FIFO_CNT_FIELD(
            1,1,1,0,0,1,0,0,0
        );
        OS_ResetRequestIrqMask(OS_IE_FIFO_RECV);
        OS_SetIrqFunction(OS_IE_FIFO_RECV, PXIi_HandlerRecvFifoNotEmpty);
        OS_EnableIrqMask(OS_IE_FIFO_RECV);
        for (i = 8; i >= 0; i--) {
            reg_PXI_MAINPINTF = (i << REG_PXI_MAINPINTF_A7STATUS_SHIFT);
            OS_SpinWait(1000);
            if (((reg_PXI_MAINPINTF & REG_PXI_MAINPINTF_A9STATUS_MASK) >> REG_PXI_MAINPINTF_A9STATUS_SHIFT) != i) {
                i = 8;
            }
        }
    }
    OS_RestoreInterrupts(enabled);
}

void PXI_SetFifoRecvCallback(s32 fifotag, PXIFifoCallback callback) {
    OSIntrMode enabled = OS_DisableInterrupts();
    OSSystemWork *work = OS_GetSystemWork();

    FifoRecvCallbackTable[fifotag] = callback;
    if (callback != NULL) {
        work->pxiHandleChecker[PXI_PROC_ARM7] |= (1 << fifotag);
    } else {
        work->pxiHandleChecker[PXI_PROC_ARM7] &= ~(1 << fifotag);
    }
    OS_RestoreInterrupts(enabled);
}

BOOL PXI_IsCallbackReady(s32 fifotag, PXIProc proc) {
    OSSystemWork *work = OS_GetSystemWork();
    return ((work->pxiHandleChecker[proc] & (1 << fifotag)) != 0);
}

s32 PXI_SendWordByFifo(s32 fifotag, u32 data, BOOL err) {
    PXIFifoMessage fifomsg;

    fifomsg.e.tag = fifotag;
    fifomsg.e.err = err;
    fifomsg.e.data = data;
    return PXIi_SetToFifo(fifomsg.raw);
}

s32 PXIi_SetToFifo(u32 data) {
    OSIntrMode enabled;
    if (reg_PXI_MAINP_FIFO_CNT & REG_PXI_MAINP_FIFO_CNT_ERR_MASK) {
        reg_PXI_MAINP_FIFO_CNT |= (REG_PXI_MAINP_FIFO_CNT_E_MASK | REG_PXI_MAINP_FIFO_CNT_ERR_MASK);
        return PXI_FIFO_FAIL_SEND_ERR;
    }
    enabled = OS_DisableInterrupts();
    if (reg_PXI_MAINP_FIFO_CNT & REG_PXI_MAINP_FIFO_CNT_SEND_FULL_MASK) {
        OS_RestoreInterrupts(enabled);
        return PXI_FIFO_FAIL_SEND_FULL;
    }

    reg_PXI_SEND_FIFO = data;
    OS_RestoreInterrupts(enabled);
    return PXI_FIFO_SUCCESS;
}
