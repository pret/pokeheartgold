#ifndef NITRO_SUB_OS_ARENA_H
#define NITRO_SUB_OS_ARENA_H

#include "nitro/OS_arena_shared.h"

void OS_InitArena(void);
void OS_InitArenaHiAndLo(OSArenaId id);
void* OS_GetArenaHi(OSArenaId id);
void* OS_GetArenaLo(OSArenaId id);
void* OS_GetInitArenaHi(OSArenaId id);
void* OS_GetInitArenaLo(OSArenaId id);
void OS_SetArenaHi(OSArenaId id, void* newHi);
void OS_SetArenaLo(OSArenaId id, void* newLo);

#endif //NITRO_SUB_OS_ARENA_H
