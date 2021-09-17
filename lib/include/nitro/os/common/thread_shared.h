/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_thread.h from the specific proc's lib
 */

#ifndef NITRO_OS_THREAD_SHARED_H_
#define NITRO_OS_THREAD_SHARED_H_

typedef struct OSiAlarm OSAlarm;

typedef struct _OSThread OSThread;

typedef struct _OSThreadQueue OSThreadQueue;
typedef struct _OSThreadLink OSThreadLink;
typedef struct _OSMutexQueue OSMutexQueue;
typedef struct _OSMutexLink OSMutexLink;
typedef struct OSMutex OSMutex;

struct _OSThreadQueue
{
    OSThread *head;
    OSThread *tail;
};

struct _OSThreadLink
{
    OSThread *prev;
    OSThread *next;
};

struct _OSMutexQueue
{
    OSMutex *head;
    OSMutex *tail;
};

struct _OSMutexLink
{
    OSMutex *next;
    OSMutex *prev;
};

typedef struct OSThreadInfo {
    u16 isNeedRescheduling;
    u16 irqDepth;
    OSThread* current;
    OSThread* list;
    void* switchCallback; // type: OSSwitchThreadCallback
} OSThreadInfo;

typedef enum {
    OS_THREAD_STATE_WAITING = 0,
    OS_THREAD_STATE_READY = 1,
    OS_THREAD_STATE_TERMINATED = 2
} OSThreadState;

typedef void (*OSSwitchThreadCallback) (OSThread *from, OSThread *to);

typedef void (*OSThreadDestructor) (void *);

struct _OSThread
{
    OSContext context;
    OSThreadState state;
    OSThread *next;
    u32 id;
    u32 priority;
    void *profiler;

    OSThreadQueue *queue;
    OSThreadLink link;

    OSMutex *mutex;
    OSMutexQueue mutexQueue;

    u32 stackTop;
    u32 stackBottom;
    u32 stackWarningOffset;

    OSThreadQueue joinQueue;

    void *specific[3];
    OSAlarm *alarmForSleep;
    OSThreadDestructor destructor;
    void *userParameter;

    u32 systemErrno;
};

extern OSThreadInfo OSi_ThreadInfo;

static inline OSThreadInfo *OS_GetThreadInfo(void)
{
    return &OSi_ThreadInfo;
}

static inline BOOL OS_IsThreadRunnable(const OSThread *thread)
{
    return thread->state == OS_THREAD_STATE_READY;
}

static inline void OS_InitThreadQueue(OSThreadQueue * queue)
{
    queue->head = queue->tail = NULL;
}

static inline OSThread *OS_GetCurrentThread(void)
{
    return OS_GetThreadInfo()->current;
}

static inline void OS_SetCurrentThread(OSThread *thread)
{
    OS_GetThreadInfo()->current = thread;
}

#define OSi_GetCurrentThread()          (*OSi_CurrentThreadPtr)

#endif //NITRO_OS_THREAD_SHARED_H_
