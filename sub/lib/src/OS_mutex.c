#include <nitro/os/mutex.h>
#include <nitro/os/system.h>
#include <nitro/os/thread.h>

void OS_InitMutex(OSMutex* mutex) {
    OS_InitThreadQueue(&mutex->queue);
    mutex->thread = NULL;
    mutex->count = 0;
}

void OS_LockMutex(OSMutex* mutex) {
    OSIntrMode mode;
    OSThread* current;

    mode = OS_DisableInterrupts();
    current = OS_GetCurrentThread();
    while (1) {
        OSThread* owner = mutex->thread;
        if (owner == NULL) {
            mutex->thread = current;
            mutex->count++;
            OSi_EnqueueTail(current, mutex);
            break;
        }
        else if (owner == current) {
            mutex->count++;
            break;
        }
        else {
            current->mutex = mutex;
            OS_SleepThread(&mutex->queue);
            current->mutex = NULL;
        }
    }
    (void)OS_RestoreInterrupts(mode);
}

void OS_UnlockMutex(OSMutex* mutex) {
    OSIntrMode mode;
    OSThread* current;

    mode = OS_DisableInterrupts();
    current = OS_GetCurrentThread();
    if (mutex->thread == current) {
        if (--mutex->count == 0) {
            OSi_DequeueItem(current, mutex);
            mutex->thread = NULL;
            OS_WakeupThread(&mutex->queue);
        }
    }
    (void)OS_RestoreInterrupts(mode);
}

void OSi_UnlockAllMutex(OSThread * thread) {
    OSMutex * mutex;
    while (thread->mutexQueue.head) {
        mutex = OSi_RemoveMutexLinkFromQueue(&thread->mutexQueue);
        mutex->count = 0;
        mutex->thread = NULL;
        OS_WakeupThread(&mutex->queue);
    }
}

void OSi_EnqueueTail(OSThread * thread, OSMutex * mutex) {
    OSMutex * tail = thread->mutexQueue.tail;
    if (tail == NULL) {
        thread->mutexQueue.head = mutex;
    }
    else {
        tail->link.next = mutex;
    }
    mutex->link.prev = tail;
    mutex->link.next = NULL;
    thread->mutexQueue.tail = mutex;
}

void OSi_DequeueItem(OSThread * thread, OSMutex * mutex) {
    OSMutex *next = mutex->link.next;
    OSMutex *prev = mutex->link.prev;

    if (next == NULL) {
        thread->mutexQueue.tail = prev;
    }
    else {
        next->link.prev = prev;
    }

    if (prev == NULL) {
        thread->mutexQueue.head = next;
    }
    else {
        prev->link.next = next;
    }
}
