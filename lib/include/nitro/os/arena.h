#ifndef NITRO_OS_ARENA_H
#define NITRO_OS_ARENA_H

#include <nitro/os/common/arena_shared.h>

void OS_InitArena(void);
void OS_InitArenaHiAndLo(OSArenaId id);
void* OS_GetArenaHi(OSArenaId id);
void* OS_GetArenaLo(OSArenaId id);
void* OS_GetInitArenaHi(OSArenaId id);
void* OS_GetInitArenaLo(OSArenaId id);
void OS_SetArenaHi(OSArenaId id, void* newHi);
void OS_SetArenaLo(OSArenaId id, void* newLo);
void *OS_AllocFromArenaHi(OSArenaId arena, u32 size, u32 align);
void *OS_AllocFromArenaLo(OSArenaId id, u32 size, u32 align);

#endif //NITRO_OS_ARENA_H
