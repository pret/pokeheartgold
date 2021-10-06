#include <nitro.h>

asm void OSi_WaitVCount0(void) {
    mov r12, #HW_REG_BASE
    ldr r1, [r12, #REG_IME_OFFSET]
    str r12, [r12, #REG_IME_OFFSET]
@spinWait:
    ldrh r0, [r12, #REG_VCOUNT_OFFSET]
    cmp r0, #0
    bne @spinWait
    str r1, [r12, #REG_IME_OFFSET]
    bx lr
}

void OS_Init(void)
{
#ifdef SDK_ARM9
    OS_InitArena();
    PXI_Init();
    OS_InitLock();
    OS_InitArenaEx();
    OS_InitIrqTable();
    OS_SetIrqStackChecker();
    OS_InitException();
    MI_Init();
    OS_InitVAlarm();
    OSi_InitVramExclusive();
    OS_InitThread();
    OS_InitReset();
    CTRDG_Init();
    CARD_Init();
    PM_Init();
    OSi_WaitVCount0();
#else
    OS_InitArena();
    PXI_Init();
    OS_InitLock();
    OS_InitIrqTable();
    OS_InitTick();
    OS_InitAlarm();
    OS_InitThread();
    OS_InitReset();
    CTRDG_Init();
#endif
}
