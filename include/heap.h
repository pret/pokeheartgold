#ifndef POKEHEARTGOLD_HEAP_H
#define POKEHEARTGOLD_HEAP_H

#include "global.h"

#include "constants/heap.h"

typedef struct HeapParam {
    u32 size;        // maximum size of the heap
    OSArenaId arena; // where to allocate the heap from
} HEAP_PARAM;

void Heap_InitSystem(const HEAP_PARAM *templates, u32 nTemplates, u32 totalNumHeaps, u32 pre_size);
BOOL Heap_Create(HeapID parent, HeapID child, u32 size);
BOOL Heap_CreateAtEnd(HeapID parent, HeapID child, u32 size);
void Heap_Destroy(HeapID heapId);
void *Heap_Alloc(HeapID heapId, u32 size);
void *Heap_AllocAtEnd(HeapID heapId, u32 size);
void Heap_Free(void *ptr);
void Heap_FreeExplicit(HeapID heapId, void *ptr);
u32 HeapExp_FndGetTotalFreeSize(HeapID heapId);
void HeapExp_FndInitAllocator(NNSFndAllocator *pAllocator, HeapID heapId, int alignment);
void Heap_Realloc(void *ptr, u32 newSize);
BOOL GF_heap_c_dummy_return_true(HeapID heapId);

#endif // POKEHEARTGOLD_HEAP_H
