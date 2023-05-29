#ifndef NITRO_OS_MUTEX_H
#define NITRO_OS_MUTEX_H

#include <nitro/os/context.h>
#include <nitro/os/common/mutex_shared.h>

void OSi_DequeueItem(OSThread * thread, OSMutex * mutex);
void OSi_EnqueueTail(OSThread * thread, OSMutex * mutex);
void OS_InitMutex(OSMutex* mutex);
void OS_LockMutex(OSMutex* mutex);
void OS_UnlockMutex(OSMutex* mutex);
void OSi_UnlockAllMutex(OSThread * thread);
BOOL OS_TryLockMutex(OSMutex *mtx);

#endif //NITRO_OS_MUTEX_H
