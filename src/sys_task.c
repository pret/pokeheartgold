#include "sys_task.h"

#include "global.h"

void SysTaskQueue_InitTask(SysTaskQueue *queue, SysTask *task);
void SysTaskQueue_InitStack(SysTaskQueue *queue);
SysTask *SysTaskQueue_CreateTask(SysTaskQueue *queue);
BOOL SysTaskQueue_DeleteTask(SysTaskQueue *queue, SysTask *task);
void SysTaskQueue_Init(SysTaskQueue *queue);
SysTask *SysTaskQueue_InsertTaskCore(SysTaskQueue *queue, SysTaskFunc func, void *data, u32 priority);

void SysTaskQueue_InitTask(SysTaskQueue *queue, SysTask *task) {
    task->queue = queue;
    task->prev = task->next = &queue->headSentinel;
    task->priority          = 0;
    task->data              = NULL;
    task->func              = NULL;
}

void SysTaskQueue_InitStack(SysTaskQueue *queue) {
    for (int i = 0; i < queue->limit; ++i) {
        SysTaskQueue_InitTask(queue, &queue->taskList[i]);
        queue->taskStack[i] = &queue->taskList[i];
    }
    queue->activeCount = 0;
}

SysTask *SysTaskQueue_CreateTask(SysTaskQueue *queue) {
    if (queue->activeCount == queue->limit) {
        return NULL;
    }
    SysTask *ret = queue->taskStack[queue->activeCount];
    ++queue->activeCount;
    return ret;
}

BOOL SysTaskQueue_DeleteTask(SysTaskQueue *queue, SysTask *task) {
    if (queue->activeCount == 0) {
        return FALSE;
    }
    task->queue = queue;
    task->prev = task->next = &queue->headSentinel;
    task->priority          = 0;
    task->data              = NULL;
    task->func              = NULL;
    --queue->activeCount;
    queue->taskStack[queue->activeCount] = task;
    return TRUE;
}

u32 SysTaskQueue_GetArenaSize(u32 num) {
    return num * (sizeof(SysTask) + sizeof(SysTask *)) + sizeof(SysTaskQueue);
}

SysTaskQueue *SysTaskQueue_PlacementNew(u32 num, void *p_mem) {
    GF_ASSERT(p_mem != NULL);

    SysTaskQueue *ret    = (SysTaskQueue *)p_mem;
    SysTask **taskStack  = (SysTask **)&ret[1];
    ret->taskStack       = taskStack;
    SysTask *taskList    = (SysTask *)&taskStack[num];
    ret->taskList        = taskList;
    ret->limit           = num;
    ret->activeCount     = 0;
    ret->isInsertingTask = 0;
    SysTaskQueue_Init(ret);
    return ret;
}

void SysTaskQueue_Init(SysTaskQueue *queue) {
    SysTaskQueue_InitStack(queue);
    queue->headSentinel.queue = queue;
    queue->headSentinel.prev = queue->headSentinel.next = &queue->headSentinel;
    queue->headSentinel.priority                        = 0;
    queue->headSentinel.data                            = NULL;
    queue->headSentinel.func                            = NULL;
    queue->runningTask                                  = queue->headSentinel.next;
}

void SysTaskQueue_RunTasks(SysTaskQueue *queue) {
    if (!queue->isInsertingTask) {
        queue->runningTask = queue->headSentinel.next;
        while (queue->runningTask != &queue->headSentinel) {
            queue->nextTask = queue->runningTask->next;
            if (!queue->runningTask->runNow) {
                if (queue->runningTask->func != NULL) {
                    queue->runningTask->func(queue->runningTask, queue->runningTask->data);
                }
            } else {
                queue->runningTask->runNow = FALSE;
            }
            queue->runningTask = queue->nextTask;
        }
        queue->runningTask->func = NULL;
    }
}

SysTask *SysTaskQueue_InsertTask(SysTaskQueue *queue, SysTaskFunc func, void *data, u32 priority) {
    queue->isInsertingTask = TRUE;
    SysTask *ret           = SysTaskQueue_InsertTaskCore(queue, func, data, priority);
    queue->isInsertingTask = FALSE;
    return ret;
}

SysTask *SysTaskQueue_InsertTaskCore(SysTaskQueue *queue, SysTaskFunc func, void *data, u32 priority) {
    SysTask *ret = SysTaskQueue_CreateTask(queue);
    SysTask *tail;
    if (ret == NULL) {
        return NULL;
    }
    ret->priority = priority;
    ret->data     = data;
    ret->func     = func;

    if (queue->runningTask->func != NULL) {
        if (queue->runningTask->priority <= priority) {
            ret->runNow = TRUE;
        } else {
            ret->runNow = FALSE;
        }
    } else {
        ret->runNow = FALSE;
    }
    for (tail = queue->headSentinel.next; tail != &queue->headSentinel; tail = tail->next) {
        if (tail->priority > ret->priority) {
            ret->prev        = tail->prev;
            ret->next        = tail;
            tail->prev->next = ret;
            tail->prev       = ret;
            if (tail == queue->nextTask) {
                queue->nextTask = ret;
            }
            return ret;
        }
    }
    if (queue->nextTask == &queue->headSentinel) {
        queue->nextTask = ret;
    }
    ret->prev                      = queue->headSentinel.prev;
    ret->next                      = &queue->headSentinel;
    queue->headSentinel.prev->next = ret;
    queue->headSentinel.prev       = ret;
    return ret;
}

BOOL SysTask_Unlink(SysTask *task) {
    GF_ASSERT(task->func != NULL);
    if (task->queue->nextTask == task) {
        task->queue->nextTask = task->next;
    }
    task->prev->next = task->next;
    task->next->prev = task->prev;
    return SysTaskQueue_DeleteTask(task->queue, task);
}

void SysTask_SetFunc(SysTask *task, SysTaskFunc func) {
    task->func = func;
}

void *SysTask_GetData(SysTask *task) {
    return task->data;
}

u32 SysTask_GetPriority(SysTask *task) {
    return task->priority;
}
