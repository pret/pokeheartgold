#ifndef NITRO_SUB_OS_SPINLOCK_H
#define NITRO_SUB_OS_SPINLOCK_H

#include "consts.h"
#include "nitro/OS_spinLock_shared.h"
#include "syscall.h"

void OS_InitLock(void);
void FUN_037F8CB4(s32 ct);
s32 OSi_DoLockByWord(u16 lockId, OSLockWord *lockp, void (*ctrlFuncp) (void), BOOL disableFiq);
s32 OSi_DoUnlockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp) (void), BOOL disableFIQ);
s32 OSi_DoTryLockByWord(u16 lockID, OSLockWord *lockp, void (*ctrlFuncp) (void), BOOL disableFiq);
s32 OS_LockCartridge(u16 lockID);
s32 OS_UnlockCartridge(u16 lockID);
s32 OS_TryLockCartridge(u16 lockID);
void OSi_AllocateCartridgeBus(void);
void OSi_FreeCartridgeBus(void);
u16 OS_ReadOwnerOfLockWord(OSLockWord * lock);
s32 OS_UnLockCartridge(u16 lockID);
s32 OS_GetLockID(void);
void OS_ReleaseLockID(register u16 lockID);

static inline void OSi_WaitByLoop(void)
{
    FUN_037F8CB4(0x1000 / 4);
}

#endif //NITRO_SUB_OS_SPINLOCK_H
