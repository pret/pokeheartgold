#include "sys_task_api.h"

#include "global.h"

#include "system.h"

SysTask *SysTask_CreateOnMainQueue(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.mainTaskQueue, func, data, priority);
}

SysTask *SysTask_CreateOnVBlankQueue(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.vblankTaskQueue, func, data, priority);
}

SysTask *SysTask_CreateOnPrintQueue(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.printTaskQueue, func, data, priority);
}

SysTask *SysTask_CreateOnVWaitQueue(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.vwaitTaskQueue, func, data, priority);
}

void SysTask_Destroy(SysTask *task) {
    SysTask_Unlink(task);
}
