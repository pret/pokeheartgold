#ifndef POKEHEARTGOLD_SYSTASK_ENVIRONMENT_H
#define POKEHEARTGOLD_SYSTASK_ENVIRONMENT_H

#include "heap.h"
#include "unk_0200E320.h"

SysTask *CreateSysTaskAndEnvironment(SysTaskFunc function, u32 environmentSize, u32 priority, HeapID heapId);
void DestroySysTaskAndEnvironment(SysTask *task);

#endif
