#include <nitro.h>

#define OSi_LOCKID_INITIAL_FLAG_0     0xffffffff
#define OSi_LOCKID_INITIAL_FLAG_1     0xffff0000

#ifdef SDK_ARM9
#define OSi_ANYP_LOCK_ID_FLAG  HW_LOCK_ID_FLAG_MAIN
#define OSi_ANYP_LOCK_ID_START OS_MAINP_LOCK_ID_START
#else
#define OSi_ANYP_LOCK_ID_FLAG  HW_LOCK_ID_FLAG_SUB
#define OSi_ANYP_LOCK_ID_START OS_SUBP_LOCK_ID_START
#endif

void OSi_AllocateCartridgeBus(void);
void OSi_FreeCartridgeBus(void);
void OSi_AllocateCardBus(void);
void OSi_FreeCardBus(void);

// FIXME: This looks like it's meant to be a linker-inserted veneer, but I can't get it to insert properly yet
#ifdef SDK_ARM9
static inline void OSi_WaitByLoop(void) {
    SVC_WaitByLoop(0x1000 / 4);
}
#else
void VENEER_SVC_WaitByLoop(s32 count);
static inline void OSi_WaitByLoop(void) {
    VENEER_SVC_WaitByLoop(0x1000 / 4);
}
#endif

void OS_InitLock(void) {
    static BOOL isInitialized = FALSE;
    OSLockWord *lockp;

    if (isInitialized)
        return;

    isInitialized = TRUE;
    lockp = (OSLockWord *)HW_INIT_LOCK_BUF;

#ifdef SDK_ARM9
    lockp->lockFlag = 0;
    OS_LockByWord(OS_MAINP_SYSTEM_LOCK_ID - 1, lockp, NULL);
    while (lockp->extension != 0) {
        OSi_WaitByLoop();
    }
    ((u32 *)OSi_ANYP_LOCK_ID_FLAG)[0] = OSi_LOCKID_INITIAL_FLAG_0;
    ((u32 *)OSi_ANYP_LOCK_ID_FLAG)[1] = OSi_LOCKID_INITIAL_FLAG_1;
    MI_CpuClear32((void *)HW_SHARED_LOCK_BUF, HW_CTRDG_LOCK_BUF - HW_SHARED_LOCK_BUF);
    MIi_SetCardProcessor(MI_PROCESSOR_ARM7);
    MIi_SetCartridgeProcessor(MI_PROCESSOR_ARM7);
    OS_UnlockByWord(OS_MAINP_SYSTEM_LOCK_ID - 1, lockp, NULL);
    OS_LockByWord(OS_MAINP_SYSTEM_LOCK_ID, lockp, NULL);
#else
    lockp->extension = 0;
    while (lockp->ownerID != OS_MAINP_SYSTEM_LOCK_ID) {
        OSi_WaitByLoop();
    }
    ((u32 *)OSi_ANYP_LOCK_ID_FLAG)[0] = OSi_LOCKID_INITIAL_FLAG_0;
    ((u32 *)OSi_ANYP_LOCK_ID_FLAG)[1] = OSi_LOCKID_INITIAL_FLAG_1;
    lockp->extension = OS_SUBP_SYSTEM_LOCK_ID;
#endif
}

#ifdef SDK_ARM7
asm void VENEER_SVC_WaitByLoop(register s32 count) {
    ldr ip, =SVC_WaitByLoop
    bx ip
}
#endif

#ifdef SDK_ARM7
static inline
#endif //SDK_ARM7
s32 OSi_DoLockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp)(void), BOOL disableFiq) {
    s32 lastLockFlag;

    while ((lastLockFlag = OSi_DoTryLockByWord(lockID, lockp, ctrlFuncp, disableFiq)) > 0) {
        OSi_WaitByLoop();
    }
    return lastLockFlag;
}

s32 OS_LockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp)(void)) {
    return OSi_DoLockByWord(lockID, lockp, ctrlFuncp, FALSE);
}

s32 OSi_DoUnlockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp)(void), BOOL disableFiq) {
    if (lockID != lockp->ownerID) {
        return -2;
    }
    OSIntrMode ime = disableFiq ? OS_DisableInterrupts_IrqAndFiq() : OS_DisableInterrupts();
    lockp->ownerID = 0;
    if (ctrlFuncp != NULL) {
        ctrlFuncp();
    }
    lockp->lockFlag = 0;
    if (disableFiq) {
        OS_RestoreInterrupts_IrqAndFiq(ime);
    } else {
        OS_RestoreInterrupts(ime);
    }
    return 0;
}

s32 OS_UnlockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp)(void)) {
    return OSi_DoUnlockByWord(lockID, lockp, ctrlFuncp, FALSE);
}

s32 OSi_DoTryLockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp)(void), BOOL disableFiq) {
    s32 lastLockFlag;
    OSIntrMode ime;

    ime = disableFiq ? OS_DisableInterrupts_IrqAndFiq() : OS_DisableInterrupts();
    lastLockFlag = MI_SwapWord(lockID, &lockp->lockFlag);
    if (lastLockFlag == 0) {
        if (ctrlFuncp != NULL) {
            ctrlFuncp();
        }
        lockp->ownerID = lockID;
    }
    if (disableFiq) {
        OS_RestoreInterrupts_IrqAndFiq(ime);
    } else {
        OS_RestoreInterrupts(ime);
    }
    return lastLockFlag;
}

s32 OS_LockCartridge(u16 lockID) {
    return OSi_DoLockByWord(lockID, (OSLockWord*)HW_CTRDG_LOCK_BUF, OSi_AllocateCartridgeBus, TRUE);
}

s32 OS_UnlockCartridge(u16 lockID) {
    return OSi_DoUnlockByWord(lockID, (OSLockWord*)HW_CTRDG_LOCK_BUF, OSi_FreeCartridgeBus, TRUE);
}

// For backwards compatibility.
// Nintendo decided they didn't want to use a define here,
// so they made an asm func instead
asm s32 OS_UnLockCartridge(u16 lockID) {
    ldr r1, =OS_UnlockCartridge
    bx r1
}

s32 OS_TryLockCartridge(u16 lockID) {
    return OSi_DoTryLockByWord(lockID, (OSLockWord*)HW_CTRDG_LOCK_BUF, OSi_AllocateCartridgeBus, TRUE);
}

void OSi_AllocateCartridgeBus(void) {
#ifdef SDK_ARM9
    MIi_SetCartridgeProcessor(MI_PROCESSOR_ARM9);
#endif
}

void OSi_FreeCartridgeBus(void) {
#ifdef SDK_ARM9
    MIi_SetCartridgeProcessor(MI_PROCESSOR_ARM7);
#endif
}

s32 OS_LockCard(u16 lockID) {
    return OS_LockByWord(lockID, (OSLockWord*)HW_CARD_LOCK_BUF, OSi_AllocateCardBus);
}

s32 OS_UnlockCard(u16 lockID) {
    return OS_UnlockByWord(lockID, (OSLockWord*)HW_CARD_LOCK_BUF, OSi_FreeCardBus);
}

// For backwards compatibility.
// Nintendo decided they didn't want to use a define here,
// so they made an asm func instead
asm s32 OS_UnLockCard(u16 lockID) {
    ldr r1, =OS_UnlockCard
    bx r1
}

BOOL OS_TryLockCard(u16 lockID) {
    return OSi_DoTryLockByWord(lockID, (OSLockWord*)HW_CARD_LOCK_BUF, OSi_AllocateCardBus, FALSE);
}

void OSi_AllocateCardBus(void) {
#ifdef SDK_ARM9
    MIi_SetCardProcessor(MI_PROCESSOR_ARM9);
#endif
}

void OSi_FreeCardBus(void) {
#ifdef SDK_ARM9
    MIi_SetCardProcessor(MI_PROCESSOR_ARM7);
#endif
}

u16 OS_ReadOwnerOfLockWord(OSLockWord *lockp) {
    return lockp->ownerID;
}

asm s32 OS_GetLockID(void) {
    ldr r3, =OSi_ANYP_LOCK_ID_FLAG;
    ldr r1, [r3]
#ifdef SDK_ARM9
    clz r2, r1
#else //SDK_ARM7
    mov r2, #0
    mov r0, #0x80000000
_lp1:
    tst r1, r0
    bne _ex1
    add r2, r2, #1
    cmp r2, #32
    beq _ex1
    mov r0, r0, lsr #1
    b _lp1
_ex1:
#endif //SDK_ARM9
    cmp r2, #32
    movne r0, #OSi_ANYP_LOCK_ID_START
    bne @movne
    add r3, r3, #4
    ldr r1, [r3]
#ifdef SDK_ARM9
    clz r2, r1
#else //SDK_ARM7
    mov r2, #0
    mov r0, #0x80000000
_lp2:
    tst r1, r0
    bne _ex2
    add r2, r2, #1
    cmp r2, #32
    beq _ex2
    mov r0, r0, lsr #1
    b _lp2
_ex2:
#endif //SDK_ARM9
    cmp r2, #32
    ldr r0, =-3
    bxeq lr
    mov r0, #OSi_ANYP_LOCK_ID_START + 32
    @movne:
    add r0, r0, r2
    mov r1, #0x80000000
    mov r1, r1, lsr r2
    ldr r2, [r3]
    bic r2, r2, r1
    str r2, [r3]
    bx lr
}

asm void OS_ReleaseLockID(register u16 lockID) {
    ldr r3, =OSi_ANYP_LOCK_ID_FLAG
    cmp r0, #OSi_ANYP_LOCK_ID_START + 32
    addpl r3, r3, #4
    subpl r0, r0, #OSi_ANYP_LOCK_ID_START + 32
    submi r0, r0, #OSi_ANYP_LOCK_ID_START
    mov r1, #0x80000000
    mov r1, r1, lsr r0
    ldr r2, [r3]
    orr r2, r2, r1
    str r2, [r3]
    bx lr
}
