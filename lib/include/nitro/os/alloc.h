#ifndef NITRO_OS_ALLOC_H
#define NITRO_OS_ALLOC_H

#include <nitro/os/arena.h>
#include <nitro/os/common/alloc_shared.h>

Cell *DLExtract(Cell *list, Cell *cell);
Cell *DLInsert(Cell *list, Cell *cell);
void* OS_AllocFromHeap(OSArenaId id, OSHeapHandle heap, u32 size);
void OS_FreeToHeap(OSArenaId id, OSHeapHandle heap, void* ptr);
OSHeapHandle OS_SetCurrentHeap(OSArenaId id, OSHeapHandle heap);
void *OS_InitAlloc(OSArenaId id, void *arenaStart, void *arenaEnd, s32 maxHeaps);
void OS_ClearAlloc(OSArenaId id);
OSHeapHandle OS_CreateHeap(OSArenaId id, void *start, void *end);
s32 OS_CheckHeap(OSArenaId id, OSHeapHandle heap);

#endif //NITRO_OS_ALLOC_H
