#include <nitro.h>

// Stub file for now
u16 FifoCtrlInit = 0;
PXIFifoCallback FifoRecvCallbackTable[PXI_MAX_FIFO_TAG];

PXIFifoStatus PXIi_SetToFifo(u32 data);

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
        reg_PXI_FIFO_CNT = REG_PXI_FIFO_CNT_FIELD(
            1,1,1,0,0,1,0,0,0
        );
        OS_ResetRequestIrqMask(OS_IE_FIFO_RECV);
        OS_SetIrqFunction(OS_IE_FIFO_RECV, PXIi_HandlerRecvFifoNotEmpty);
        OS_EnableIrqMask(OS_IE_FIFO_RECV);
#ifdef SDK_ARM7
        for (i = 8; i >= 0; i--) {
            reg_PXI_INTF = (i << REG_PXI_INTF_A7STATUS_SHIFT);
            OS_SpinWait(1000);
            if (((reg_PXI_INTF & REG_PXI_INTF_A9STATUS_MASK) >> REG_PXI_INTF_A9STATUS_SHIFT) != i) {
                i = 8;
            }
        }
#else
        {
            int timeout;
            s32 c;
            for (i = 0;; i++) {
                c = (reg_PXI_INTF & REG_PXI_INTF_A9STATUS_MASK) >> REG_PXI_INTF_A9STATUS_SHIFT;
                reg_PXI_INTF = c << REG_PXI_INTF_A7STATUS_SHIFT;
                if (c == 0 && i > 4) {
                    break;
                }
                for (timeout = 1000; ((reg_PXI_INTF & REG_PXI_INTF_A9STATUS_MASK) >> REG_PXI_INTF_A9STATUS_SHIFT) == c; timeout--) {
                    if (timeout == 0) {
                        i = 0;
                        break;
                    }
                }
            }
        }
#endif
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

#ifdef SDK_ARM9
static inline
#endif
PXIFifoStatus PXIi_SetToFifo(u32 data) {
    OSIntrMode enabled;
    if (reg_PXI_FIFO_CNT & REG_PXI_FIFO_CNT_ERR_MASK) {
        reg_PXI_FIFO_CNT |= (REG_PXI_FIFO_CNT_E_MASK | REG_PXI_FIFO_CNT_ERR_MASK);
        return PXI_FIFO_FAIL_SEND_ERR;
    }
    enabled = OS_DisableInterrupts();
    if (reg_PXI_FIFO_CNT & REG_PXI_FIFO_CNT_SEND_FULL_MASK) {
        OS_RestoreInterrupts(enabled);
        return PXI_FIFO_FAIL_SEND_FULL;
    }

    reg_PXI_SEND_FIFO = data;
    OS_RestoreInterrupts(enabled);
    return PXI_FIFO_SUCCESS;
}

static inline PXIFifoStatus PXIi_GetFromFifo(u32 *data_p) {
    OSIntrMode enabled;
    if (reg_PXI_FIFO_CNT & REG_PXI_FIFO_CNT_ERR_MASK) {
        reg_PXI_FIFO_CNT |= (REG_PXI_FIFO_CNT_E_MASK | REG_PXI_FIFO_CNT_ERR_MASK);
        return PXI_FIFO_FAIL_RECV_ERR;
    }
    enabled = OS_DisableInterrupts();
    if (reg_PXI_FIFO_CNT & REG_PXI_FIFO_CNT_RECV_EMP_MASK) {
        OS_RestoreInterrupts(enabled);
        return PXI_FIFO_FAIL_RECV_EMPTY;
    }
    *data_p = reg_PXI_RECV_FIFO;
    OS_RestoreInterrupts(enabled);
    return PXI_FIFO_SUCCESS;
}

void PXIi_HandlerRecvFifoNotEmpty(void) {
    PXIFifoMessage fifomsg;
    s32 result;
    PXIFifoCallback callback;

    while (1) {
        result = PXIi_GetFromFifo(&fifomsg.raw);
        if (result == PXI_FIFO_FAIL_RECV_EMPTY) {
            return;
        }
        if (result == PXI_FIFO_FAIL_RECV_ERR) {
            continue;
        }
        if (fifomsg.e.tag == 0) {
            continue;
        }
        callback = FifoRecvCallbackTable[fifomsg.e.tag];
        if (callback != NULL) {
            callback((PXIFifoTag)fifomsg.e.tag, fifomsg.e.data, fifomsg.e.err);
        } else if (!fifomsg.e.err) {
            fifomsg.e.err = TRUE;
            PXIi_SetToFifo(fifomsg.raw);
        }
    }
}
