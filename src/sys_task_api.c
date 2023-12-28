#include "global.h"
#include "sys_task_api.h"
#include "system.h"

SysTask *CreateSysTask(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.mainTaskQueue, func, data, priority);
}

SysTask *CreateVBlankSysTask(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.vblankTaskQueue, func, data, priority);
}

SysTask *CreatePrintSysTask(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.printTaskQueue, func, data, priority);
}

SysTask *CreateVWaitSysTask(SysTaskFunc func, void *data, u32 priority) {
    return SysTaskQueue_InsertTask(gSystem.vwaitTaskQueue, func, data, priority);
}

void DestroySysTask(SysTask *task) {
    SysTask_Delete(task);
}
