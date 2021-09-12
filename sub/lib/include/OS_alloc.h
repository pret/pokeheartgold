#ifndef NITRO_SUB_OS_ALLOC_H
#define NITRO_SUB_OS_ALLOC_H

#include "nitro/OS_alloc_shared.h"
#include "OS_arena.h"

Cell *DLAddFront(Cell* list, Cell* cell);
Cell *DLExtract(Cell* list, Cell* cell);
Cell *DLInsert(Cell *original, Cell *inserted);
void* OS_AllocFromHeap(OSArenaId id, OSHeapHandle heap, u32 size);
void OS_FreeToHeap(OSArenaId id, OSHeapHandle heap, void* ptr);
OSHeapHandle OS_SetCurrentHeap(OSArenaId id, OSHeapHandle heap);
void *OS_InitAlloc(OSArenaId id, void *arenaStart, void *arenaEnd, s32 maxHeaps);
OSHeapHandle OS_CreateHeap(OSArenaId id, void *start, void *end);
s32 OS_CheckHeap(OSArenaId id, OSHeapHandle heap);

#endif //NITRO_SUB_OS_ALLOC_H
