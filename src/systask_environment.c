#include "global.h"
#include "systask_environment.h"
#include "unk_0201F79C.h"

SysTask *CreateSysTaskAndEnvironment(SysTaskFunc function, u32 environmentSize, u32 priority, HeapID heapId) {
    void *environment;

    if (environmentSize != 0) {
        environment = AllocFromHeap(heapId, environmentSize);
        if (environment == NULL) {
            return NULL;
        }
        memset(environment, 0, environmentSize);
    } else {
        environment = NULL;
    }

    return CreateSysTask(function, environment, priority);
}

void DestroySysTaskAndEnvironment(SysTask *task) {
    void *environment = sub_0201F988(task);
    if (environment != NULL) {
        FreeToHeap(environment);
    }

    DestroySysTask(task);
}
