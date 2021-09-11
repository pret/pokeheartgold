#ifndef POKEDIAMOND_ARM7_OS_MUTEX_H
#define POKEDIAMOND_ARM7_OS_MUTEX_H

#include "OS_context.h"
#include "nitro/OS_mutex_shared.h"

void OSi_DequeueItem(OSThread * thread, OSMutex * mutex);
void OSi_EnqueueTail(OSThread * thread, OSMutex * mutex);
void OS_InitMutex(OSMutex* mutex);
void OS_LockMutex(OSMutex* mutex);
void OS_UnlockMutex(OSMutex* mutex);
void OSi_UnlockAllMutex(OSThread * thread);

#endif //POKEDIAMOND_ARM7_OS_MUTEX_H
