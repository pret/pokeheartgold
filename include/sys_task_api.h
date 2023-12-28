#ifndef POKEHEARTGOLD_SYS_TASK_API_H
#define POKEHEARTGOLD_SYS_TASK_API_H

#include "sys_task.h"

SysTask *CreateSysTask(SysTaskFunc func, void *data, u32 priority);
SysTask *CreateVBlankSysTask(SysTaskFunc func, void *data, u32 priority);
SysTask *CreatePrintSysTask(SysTaskFunc func, void *data, u32 priority);
SysTask *CreateVWaitSysTask(SysTaskFunc func, void *data, u32 priority);
void DestroySysTask(SysTask *task);

#endif //POKEHEARTGOLD_SYS_TASK_API_H
