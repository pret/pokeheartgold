#ifndef NITRO_OS_THREAD_H_
#define NITRO_OS_THREAD_H_

#include <nitro/os/context.h>
#include <nitro/os/common/thread_shared.h>

#define SDK_THREAD_INFINITY

s32 OSi_GetUnusedThreadId(void);
OSThread *OSi_RemoveLinkFromQueue(OSThreadQueue *queue);
OSThread *OSi_RemoveSpecifiedLinkFromQueue(OSThreadQueue *queue, OSThread *thread);
OSMutex *OSi_RemoveMutexLinkFromQueue(OSMutexQueue *queue);
void OSi_InsertThreadToList(OSThread *thread);
void OSi_RemoveThreadFromList(OSThread *thread);
void OSi_RescheduleThread(void);
void OS_InitThread(void);
BOOL OS_IsThreadAvailable(void);
void OS_CreateThread(OSThread *thread, void (*func) (void *), void *arg, void *stack, u32 stackSize, u32 prio);
void OS_ExitThread(void);
void OS_DestroyThread(OSThread *thread);
void OS_KillThread(OSThread *thread, void *arg);
void OS_KillThreadWithPriority(OSThread *thread, void *arg, u32 prio);
void OSi_CancelThreadAlarmForSleep(OSThread *thread);
void OS_JoinThread(OSThread *thread);
BOOL OS_IsThreadTerminated(const OSThread *thread);
void OS_SleepThread(OSThreadQueue *queue);
void OS_WakeupThread(OSThreadQueue *queue);
void OS_WakeupThreadDirect(OSThread *thread);
OSThread *OS_SelectThread(void);
void OS_RescheduleThread(void);
void OS_YieldThread(void);
BOOL OS_SetThreadPriority(OSThread *thread, u32 prio);
u32 OS_GetThreadPriority(const OSThread *thread);
void OS_Sleep(u32 msec);
OSSwitchThreadCallback OS_SetSwitchThreadCallback(OSSwitchThreadCallback callback);
u32 OS_DisableScheduler(void);
u32 OS_EnableScheduler(void);
void OS_SetThreadDestructor(OSThread *thread, OSThreadDestructor dtor);
void OSi_InsertLinkToQueue(OSThreadQueue *queue, OSThread *thread);

#endif //NITRO_OS_THREAD_H_
