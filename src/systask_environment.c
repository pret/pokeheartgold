#include "systask_environment.h"

#include "global.h"

#include "sys_task.h"

SysTask *CreateSysTaskAndEnvironment(SysTaskFunc function, u32 environmentSize, u32 priority, enum HeapID heapID) {
    void *environment;

    if (environmentSize != 0) {
        environment = Heap_Alloc(heapID, environmentSize);
        if (environment == NULL) {
            return NULL;
        }
        memset(environment, 0, environmentSize);
    } else {
        environment = NULL;
    }

    return SysTask_CreateOnMainQueue(function, environment, priority);
}

void DestroySysTaskAndEnvironment(SysTask *task) {
    void *environment = SysTask_GetData(task);
    if (environment != NULL) {
        Heap_Free(environment);
    }

    SysTask_Destroy(task);
}
