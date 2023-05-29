#include <nitro/os/thread.h>
#include <nitro/os/system.h>
#include <nitro/hw/consts.h>
#include <nitro/os/terminate_proc.h>
#include <nitro/os/mutex.h>
#include <nitro/os/alarm.h>
#include <nitro/os/context.h>
#include <nitro/os/systemWork.h>
#include <nitro/mi/memory.h>

extern void SDK_SYS_STACKSIZE(void);
extern void SDK_IRQ_STACKSIZE(void);

OSThread OSi_LauncherThread;
OSThread OSi_IdleThread;
OSThreadInfo OSi_ThreadInfo;
OSThread **OSi_CurrentThreadPtr;
void   *OSi_SystemCallbackInSwitchThread = NULL;
u32     OSi_RescheduleCount = 0;
static int OSi_ThreadIdCount = 0;
void   *OSi_StackForDestructor = NULL;
static u32 exitThreadStatus = 0;
static u32 killThreadStatus = 0;
static u32 OSi_SystemStackBuffer = 0;
BOOL    OSi_IsThreadInitialized = FALSE;


static s32 OSi_GetUnusedThreadId(void);
//static void OSi_InsertLinkToQueue(OSThreadQueue *queue, OSThread *thread);
//static OSThread *OSi_RemoveLinkFromQueue(OSThreadQueue *queue);
//static OSThread *OSi_RemoveSpecifiedLinkFromQueue(OSThreadQueue *queue, OSThread *thread);
static void OSi_InsertThreadToList(OSThread *thread);
//static void OSi_RemoveThreadFromList(OSThread *thread);
static void OSi_RescheduleThread(void);
void OSi_ExitThread_ArgSpecified(OSThread *thread, void *arg);
static void OSi_ExitThread(void *arg);
void OSi_ExitThread_Destroy(void);
static void OSi_SleepAlarmCallback(void *arg);

#pragma warn_no_side_effect off
static inline s32 OSi_GetUnusedThreadId(void)
{
    OSi_SystemStackBuffer;
    killThreadStatus;
    exitThreadStatus;
    return ++OSi_ThreadIdCount;
}
#pragma warn_no_side_effect on

static inline void OS_RescheduleThread(void)
{
    OSIntrMode enabled = OS_DisableInterrupts();
    OSi_RescheduleThread();
    (void)OS_RestoreInterrupts(enabled);
}

inline void OS_SetThreadDestructor(OSThread *thread, OSThreadDestructor dtor)
{
    thread->destructor = dtor;
}

void OSi_InsertLinkToQueue(OSThreadQueue *queue, OSThread *thread)
{
    OSThread *next = queue->head;

    while (next && next->priority <= thread->priority)
    {
        if (next == thread)
            return;
        next = next->link.next;
    }

    if (!next)
    {
        OSThread *prev = queue->tail;

        if (!prev)
        {
            queue->head = thread;
        }
        else
        {
            prev->link.next = thread;
        }

        thread->link.prev = prev;
        thread->link.next = NULL;
        queue->tail = thread;
    }
    else
    {
        OSThread *prev = next->link.prev;

        if (!prev)
        {
            queue->head = thread;
        }
        else
        {
            prev->link.next = thread;
        }

        thread->link.prev = prev;
        thread->link.next = next;
        next->link.prev = thread;
    }
}

static OSThread *OSi_RemoveLinkFromQueue(OSThreadQueue *queue)
{
    OSThread *thread = queue->head;

    if (thread)
    {
        OSThread *next = thread->link.next;

        queue->head = next;

        if (next)
        {
            next->link.prev = NULL;
        }
        else
        {
            queue->tail = NULL;
            thread->queue = NULL;
        }
    }

    return thread;
}

OSThread *OSi_RemoveSpecifiedLinkFromQueue(OSThreadQueue *queue, OSThread *thread)
{
    OSThread *queueHead = queue->head;

    while (queueHead)
    {
        OSThread *next = queueHead->link.next;

        if (queueHead == thread)
        {
            OSThread *prev = queueHead->link.prev;

            if (queue->head == queueHead)
            {
                queue->head = next;
            }
            else
            {
                prev->link.next = next;
            }

            if (queue->tail == queueHead)
            {
                queue->tail = prev;
            }
            else
            {
                next->link.prev = prev;
            }

            break;
        }

        queueHead = next;
    }

    return queueHead;
}

OSMutex *OSi_RemoveMutexLinkFromQueue(OSMutexQueue *queue)
{
    OSMutex *mutexHead = queue->head;

    if (mutexHead)
    {
        OSMutex *next = mutexHead->link.next;

        queue->head = next;

        if (next)
        {
            next->link.prev = NULL;
        }
        else
        {
            queue->tail = NULL;
        }
    }

    return mutexHead;
}

static void OSi_InsertThreadToList(OSThread *thread)
{
    OSThread *t = OSi_ThreadInfo.list;
    OSThread *pre = NULL;

    while(t && t->priority < thread->priority)
    {
        pre = t;
        t = t->next;
    }

    if (!pre)
    {
        thread->next = OSi_ThreadInfo.list;
        OSi_ThreadInfo.list = thread;
    }
    else
    {
        thread->next = pre->next;
        pre->next = thread;
    }
}

void OSi_RemoveThreadFromList(OSThread *thread)
{
    OSThread *t = OSi_ThreadInfo.list;
    OSThread *pre = NULL;

    while (t && t != thread)
    {
        pre = t;
        t = t-> next;
    }

    if (!pre)
    {
        OSi_ThreadInfo.list = thread->next;
    }
    else
    {
        pre->next = thread->next;
    }
}

static void OSi_RescheduleThread(void)
{
    if (OSi_RescheduleCount <= 0)
    {
        OSThreadInfo *info = &OSi_ThreadInfo;
        if (info->irqDepth > 0 || OS_GetProcMode() == OS_PROCMODE_IRQ)
        {
            info->isNeedRescheduling = TRUE;
        }
        else
        {
            OSThread *currentThread = OSi_GetCurrentThread();
            OSThread *nextThread = OS_SelectThread();

            if (currentThread == nextThread || !nextThread)
                return;

            if (currentThread->state != OS_THREAD_STATE_TERMINATED
                && OS_SaveContext(&currentThread->context))
                return;

            if (OSi_SystemCallbackInSwitchThread)
            {
                ((OSSwitchThreadCallback)OSi_SystemCallbackInSwitchThread) (currentThread, nextThread);
            }

            if (info->switchCallback)
            {
                ((OSSwitchThreadCallback)info->switchCallback) (currentThread, nextThread);
            }

            OS_SetCurrentThread(nextThread);

            OS_LoadContext(&nextThread->context);
        }
    }
}

void OS_InitThread(void)
{
    if (OSi_IsThreadInitialized)
        return;
    OSi_IsThreadInitialized = TRUE;

    OSi_CurrentThreadPtr = &(OSi_ThreadInfo.current);

    OSi_LauncherThread.priority = OS_THREAD_LAUNCHER_PRIORITY;
    OSi_LauncherThread.id = 0;
    OSi_LauncherThread.state = OS_THREAD_STATE_READY;
    OSi_LauncherThread.next = NULL;

    OSi_LauncherThread.profiler = NULL;

    OSi_ThreadInfo.list = &OSi_LauncherThread;

    OS_SetCurrentThread(&OSi_LauncherThread);

    void *stackLo = (((s32)SDK_SYS_STACKSIZE) <= 0) ?
                    (void *)((u32)HW_WRAM - (s32)SDK_SYS_STACKSIZE) :
                    (void *)((u32)(HW_PRV_WRAM_IRQ_STACK_END - (s32)SDK_IRQ_STACKSIZE) - (s32)SDK_SYS_STACKSIZE);

    OSi_LauncherThread.stackBottom = (u32)(HW_PRV_WRAM_IRQ_STACK_END - (s32)SDK_IRQ_STACKSIZE);
    OSi_LauncherThread.stackTop = (u32)stackLo;
    OSi_LauncherThread.stackWarningOffset = 0;

    //checksums
    *(u32 *)(OSi_LauncherThread.stackBottom - sizeof(u32)) = 0xd73bfdf7UL;
    *(u32 *)OSi_LauncherThread.stackTop = 0xfbdd37bbUL;

    OS_InitThreadQueue(&OSi_LauncherThread.joinQueue);

    OSi_ThreadInfo.isNeedRescheduling = FALSE;
    OSi_ThreadInfo.irqDepth = 0;

    OS_GetSystemWork()->threadinfo_subp = &OSi_ThreadInfo;

    (void)OS_SetSwitchThreadCallback(NULL);
}

void OS_CreateThread(OSThread *thread, void (*func) (void *), void *arg, void *stack, u32 stackSize, u32 prio)
{
    OSIntrMode enable = OS_DisableInterrupts();

    s32 index = OSi_GetUnusedThreadId();

    thread->priority = prio;
    thread->id = (u32)index;
    thread->state = OS_THREAD_STATE_WAITING;

    thread->profiler = NULL;

    OSi_InsertThreadToList(thread);

    thread->stackBottom = (u32)stack;
    thread->stackTop = (u32)stack - stackSize;
    thread->stackWarningOffset = 0;

    *(u32 *)(thread->stackBottom - sizeof(u32)) = 0xd73bfdf7UL;
    *(u32 *)thread->stackTop = 0xfbdd37bbUL;

    OS_InitThreadQueue(&thread->joinQueue);

    OS_InitContext(&thread->context, (u32)func, (u32)stack - 4);

    thread->context.r[0] = (u32)arg;
    thread->context.lr = (u32)OS_ExitThread;

    MI_CpuClear32((void *)((u32)stack - stackSize + 4), stackSize - 8);

    thread->mutex = NULL;
    thread->mutexQueue.head = NULL;
    thread->mutexQueue.tail = NULL;

    OS_SetThreadDestructor(thread, NULL);

    thread->queue = NULL;
    thread->link.prev = thread->link.next = NULL;

    MI_CpuClear32(&thread->specific[0], sizeof(void *) * OS_THREAD_SPECIFIC_MAX);

    thread->alarmForSleep = NULL;

    (void)OS_RestoreInterrupts(enable);
}

void OS_ExitThread(void)
{
    (void)OS_DisableInterrupts();
    OSi_ExitThread_ArgSpecified(OS_GetCurrentThread(), 0);
}

void OSi_ExitThread_ArgSpecified(OSThread *thread, void *arg)
{
    if (OSi_StackForDestructor)
    {
        OS_InitContext(&thread->context, (u32)OSi_ExitThread, (u32)OSi_StackForDestructor);
        thread->context.r[0] = (u32)arg;
        thread->context.cpsr |= HW_PSR_DISABLE_IRQ;
        thread->state = OS_THREAD_STATE_READY;
        OS_LoadContext(&thread->context);
    }
    else
    {
        OSi_ExitThread(arg);
    }
}

static void OSi_ExitThread(void *arg)
{
    OSThread *currentThread = OSi_GetCurrentThread();
    OSThreadDestructor destructor = currentThread->destructor;

    if (destructor)
    {
        currentThread->destructor = NULL;
        destructor(arg);
        (void)OS_DisableInterrupts();
    }

    OSi_ExitThread_Destroy();
}

void OSi_ExitThread_Destroy(void)
{
    OSThread *currentThread = OSi_GetCurrentThread();
    (void)OS_DisableScheduler();

    OSi_UnlockAllMutex(currentThread);

    if (currentThread->queue)
    {
        (void)OSi_RemoveSpecifiedLinkFromQueue(currentThread->queue, currentThread);
    }

    OSi_RemoveThreadFromList(currentThread);

    currentThread->state = OS_THREAD_STATE_TERMINATED;

    OS_WakeupThread(&currentThread->joinQueue);

    (void)OS_EnableScheduler();

    OS_RescheduleThread();

    OS_Terminate();
}

void OS_JoinThread(OSThread *thread)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    if (thread->state != OS_THREAD_STATE_TERMINATED)
    {
        OS_SleepThread(&thread->joinQueue);
    }

    (void)OS_RestoreInterrupts(enabled);
}

BOOL OS_IsThreadTerminated(const OSThread *thread)
{
    return (thread->state == OS_THREAD_STATE_TERMINATED) ? TRUE : FALSE;
}

void OS_SleepThread(OSThreadQueue *queue)
{
    OSIntrMode enabled = OS_DisableInterrupts();
    OSThread *currentThread = OSi_GetCurrentThread();

    if (queue)
    {
        currentThread->queue = queue;
        OSi_InsertLinkToQueue(queue, currentThread);
    }

    currentThread->state = OS_THREAD_STATE_WAITING;
    OSi_RescheduleThread();

    (void)OS_RestoreInterrupts(enabled);
}

void OS_WakeupThread(OSThreadQueue *queue)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    if (queue->head)
    {
        while (queue->head)
        {
            OSThread *thread = OSi_RemoveLinkFromQueue(queue);

            thread->state = OS_THREAD_STATE_READY;
            thread->queue = NULL;
            thread->link.prev = thread->link.next = NULL;
        }

        OS_InitThreadQueue(queue);
        OSi_RescheduleThread();
    }

    (void)OS_RestoreInterrupts(enabled);
}

void OS_WakeupThreadDirect(OSThread *thread)
{
    OSIntrMode enabled = OS_DisableInterrupts();

    thread->state = OS_THREAD_STATE_READY;
    OSi_RescheduleThread();

    (void)OS_RestoreInterrupts(enabled);
}

OSThread *OS_SelectThread(void)
{
    OSThread *thread = OSi_ThreadInfo.list;

    while (thread && !OS_IsThreadRunnable(thread))
    {
        thread = thread->next;
    }

    return thread;
}

BOOL OS_SetThreadPriority(OSThread *thread, u32 prio)
{
    OSThread *t = OSi_ThreadInfo.list;
    OSThread *pre = NULL;
    OSIntrMode enabled = OS_DisableInterrupts();

    while (t && t != thread)
    {
        pre = t;
        t = t->next;
    }

    if (!t || t == &OSi_IdleThread)
    {
        (void)OS_RestoreInterrupts(enabled);
        return FALSE;
    }

    if (t->priority != prio)
    {
        if (!pre)
        {
            OSi_ThreadInfo.list = thread->next;
        }
        else
        {
            pre->next = thread->next;
        }

        thread->priority = prio;
        OSi_InsertThreadToList(thread);

        OSi_RescheduleThread();
    }

    (void)OS_RestoreInterrupts(enabled);

    return TRUE;
}

void OS_Sleep(u32 msec)
{
    OSAlarm alarm;

    OS_CreateAlarm(&alarm);
    OSThread *volatile p_thread = OSi_GetCurrentThread();
    OSIntrMode enabled = OS_DisableInterrupts();

    p_thread->alarmForSleep = &alarm;

    OS_SetAlarm(&alarm, OS_MilliSecondsToTicks(msec), &OSi_SleepAlarmCallback,
                (void*)&p_thread);
    while (p_thread != NULL)
    {
        OS_SleepThread(NULL);
    }
    (void)OS_RestoreInterrupts(enabled);
}

static void OSi_SleepAlarmCallback(void *arg)
{
    OSThread **pp_thread = (OSThread **)arg;
    OSThread *p_thread = *pp_thread;
    *pp_thread = NULL;

    p_thread->alarmForSleep = NULL;

    OS_WakeupThreadDirect(p_thread);
}

OSSwitchThreadCallback OS_SetSwitchThreadCallback(OSSwitchThreadCallback callback)
{
    OSIntrMode enabled = OS_DisableInterrupts();
    OSSwitchThreadCallback prev = OSi_ThreadInfo.switchCallback;
    OSi_ThreadInfo.switchCallback = callback;

    (void)OS_RestoreInterrupts(enabled);
    return prev;
}

u32 OS_DisableScheduler(void)
{
    OSIntrMode enabled = OS_DisableInterrupts();
    u32 count;

    if (OSi_RescheduleCount < (u32)-1)
    {
        count = OSi_RescheduleCount++;
    }
    (void)OS_RestoreInterrupts(enabled);

    return count;
}

u32 OS_EnableScheduler(void)
{
    OSIntrMode enabled = OS_DisableInterrupts();
    u32 count = 0;

    if (OSi_RescheduleCount > 0)
    {
        count = OSi_RescheduleCount--;
    }
    (void)OS_RestoreInterrupts(enabled);

    return count;
}
