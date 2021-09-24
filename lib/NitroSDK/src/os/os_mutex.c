#include <nitro.h>

void OSi_EnqueueTail(OSThread *thread, OSMutex *mtx);
void OSi_DequeueItem(OSThread *thread, OSMutex *mtx);

void OS_InitMutex(OSMutex *mtx) {
    OS_InitThreadQueue(&mtx->queue);
    mtx->thread = NULL;
    mtx->count = 0;
}

void OS_LockMutex(OSMutex *mtx) {
    OSIntrMode enable;
    OSThread *currentThread;

    enable = OS_DisableInterrupts();
    currentThread = OS_GetCurrentThread();
    while (1) {
        if (mtx->thread == NULL) {
            mtx->thread = currentThread;
            mtx->count++;
            OSi_EnqueueTail(currentThread, mtx);
            break;
        } else if (mtx->thread == currentThread) {
            mtx->count++;
            break;
        } else {
            currentThread->mutex = mtx;
            OS_SleepThread(&mtx->queue);
            currentThread->mutex = NULL;
        }
    }
    OS_RestoreInterrupts(enable);
}

void OS_UnlockMutex(OSMutex *mtx) {
    OSIntrMode enable;
    OSThread *currentThread;

    enable = OS_DisableInterrupts();
    currentThread = OS_GetCurrentThread();
    if (mtx->thread == currentThread && --mtx->count == 0) {
        OSi_DequeueItem(currentThread, mtx);
        mtx->thread = NULL;
        OS_WakeupThread(&mtx->queue);
    }
    OS_RestoreInterrupts(enable);
}

void OSi_UnlockAllMutex(OSThread *thread) {
    while (thread->mutexQueue.head) {
        OSMutex *mtx = OSi_RemoveMutexLinkFromQueue(&thread->mutexQueue);
        mtx->count = 0;
        mtx->thread = NULL;
        OS_WakeupThread(&mtx->queue);
    }
}

BOOL OS_TryLockMutex(OSMutex *mtx) {
    OSIntrMode enable;
    OSThread *currentThread;
    BOOL success;

    enable = OS_DisableInterrupts();
    currentThread = OS_GetCurrentThread();
    if (mtx->thread == NULL) {
        mtx->thread = currentThread;
        mtx->count++;
        OSi_EnqueueTail(currentThread, mtx);
        success = TRUE;
    } else if (mtx->thread == currentThread) {
        mtx->count++;
        success = TRUE;
    } else {
        success = FALSE;
    }
    OS_RestoreInterrupts(enable);
    return success;
}

void OSi_EnqueueTail(OSThread *thread, OSMutex *mtx) {
    OSMutex *prev;

    prev = thread->mutexQueue.tail;
    if (prev == NULL) {
        thread->mutexQueue.head = mtx;
    } else {
        prev->link.next = mtx;
    }
    mtx->link.prev = prev;
    mtx->link.next = NULL;
    thread->mutexQueue.tail = mtx;
}

void OSi_DequeueItem(OSThread *thread, OSMutex *mtx) {
    OSMutex *next;
    OSMutex *prev;

    next = mtx->link.next;
    prev = mtx->link.prev;

    if (next == NULL) {
        thread->mutexQueue.tail = prev;
    } else {
        next->link.prev = prev;
    }

    if (prev == NULL) {
        thread->mutexQueue.head = next;
    } else {
        prev->link.next = next;
    }
}
