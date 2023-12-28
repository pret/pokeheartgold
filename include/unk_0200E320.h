#ifndef POKEHEARTGOLD_UNK_0200E320_H
#define POKEHEARTGOLD_UNK_0200E320_H

#include "sys_task.h"

SysTask *CreateSysTask(SysTaskFunc func, void *data, int priority);
SysTask *sub_0200E33C(SysTaskFunc func, void *data, int priority);
SysTask *sub_0200E358(SysTaskFunc func, void *data, int priority);
SysTask *sub_0200E374(SysTaskFunc func, void *data, int priority);
void DestroySysTask(SysTask *task);

#endif //POKEHEARTGOLD_UNK_0200E320_H
