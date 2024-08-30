#ifndef POKEHEARTGOLD_SYS_TASK_API_H
#define POKEHEARTGOLD_SYS_TASK_API_H

#include "sys_task.h"

SysTask *SysTask_CreateOnMainQueue(SysTaskFunc func, void *data, u32 priority);
SysTask *SysTask_CreateOnVBlankQueue(SysTaskFunc func, void *data, u32 priority);
SysTask *SysTask_CreateOnPrintQueue(SysTaskFunc func, void *data, u32 priority);
SysTask *SysTask_CreateOnVWaitQueue(SysTaskFunc func, void *data, u32 priority);
void SysTask_Destroy(SysTask *task);

#endif // POKEHEARTGOLD_SYS_TASK_API_H
