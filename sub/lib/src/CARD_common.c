#include <nitro.h>

CARDiCommon cardi_common ALIGN(32);
CARDiCommandArg cardi_arg ALIGN(32); // ARM9 only

u8 cardi_thread_stack[0x400] ALIGN(4);

void CARDi_InitCommon(void) {
    CARDiCommon *p = &cardi_common;

    p->lock_owner = OS_LOCK_ID_ERROR;
    p->lock_ref = 0;
    p->lock_target = CARD_TARGET_NONE;

#if defined(SDK_ARM9)
    p->cmd = &cardi_arg;
    MI_CpuFillFast(&cardi_arg, 0x00, sizeof(cardi_arg));
    DC_FlushRange(&cardi_arg, sizeof(cardi_arg));
#else
    p->cmd = NULL;
    p->recv_step = 0;
#endif

#if defined(SDK_ARM9)
    p->flush_threshold_ic = 0xFFFFFFFF;
    p->flush_threshold_dc = 0xFFFFFFFF;
#endif

#if !defined(SDK_SMALL_BUILD) && defined(SDK_ARM9)
    if (!MB_IsMultiBootChild()) {
        MI_CpuCopy8((const void *)HW_ROM_HEADER_BUF, (void *)HW_CARD_ROM_HEADER, HW_CARD_ROM_HEADER_SIZE);
    }
#endif /* !defined(SDK_SMALL_BUILD) && defined(SDK_ARM9) */

#if !defined(SDK_NO_THREAD)
    OS_InitThreadQueue(p->lock_queue);
    OS_InitThreadQueue(p->busy_q);
    p->priority = CARD_THREAD_PRIORITY_DEFAULT;
    OS_CreateThread(p->thread,
                    CARDi_TaskThread, NULL,
                    cardi_thread_stack + sizeof(cardi_thread_stack),
                    sizeof(cardi_thread_stack), p->priority);
    OS_WakeupThreadDirect(p->thread);
#endif

    PXI_SetFifoRecvCallback(PXI_FIFO_TAG_FS, CARDi_OnFifoRecv);

    if (!MB_IsMultiBootChild()) {
        CARD_Enable(TRUE);
    }
}

static BOOL CARDi_EnableFlag;

void CARD_Enable(BOOL enable) {
    CARDi_EnableFlag = enable;
}

u32 CARD_SetThreadPriority(u32 prior) {
    CARDiCommon *const p = &cardi_common;

    OSIntrMode bak_psr = OS_DisableInterrupts();
    u32 ret = p->priority;
    p->priority = prior;
    (void)OS_SetThreadPriority(p->thread, p->priority);
    (void)OS_RestoreInterrupts(bak_psr);
    return ret;
}

const u8 *CARD_GetRomHeader(void) {
    return (const u8 *)HW_CARD_ROM_HEADER;
}
