#ifndef POKEHEARTGOLD_HEAP_H
#define POKEHEARTGOLD_HEAP_H

#include "global.h"

#include "constants/heap.h"

typedef struct HeapParam {
    u32 size; // maximum size of the heap
    OSArenaId arena; // where to allocate the heap from
} HeapParam;

void Heap_InitSystem(const HeapParam *templates, u32 nTemplates, u32 totalNumHeaps, u32 preSize);
BOOL Heap_Create(enum HeapID parent, enum HeapID child, u32 size);
BOOL Heap_CreateAtEnd(enum HeapID parent, enum HeapID child, u32 size);
void Heap_Destroy(enum HeapID heapID);
void *Heap_Alloc(enum HeapID heapID, u32 size);
void *Heap_AllocAtEnd(enum HeapID heapID, u32 size);
void Heap_Free(void *ptr);
void Heap_FreeExplicit(enum HeapID heapID, void *ptr);
u32 HeapExp_FndGetTotalFreeSize(enum HeapID heapID);
void HeapExp_FndInitAllocator(NNSFndAllocator *pAllocator, enum HeapID heapID, int alignment);
void Heap_Realloc(void *ptr, u32 newSize);
BOOL GF_heap_c_dummy_return_true(enum HeapID heapID);

#endif // POKEHEARTGOLD_HEAP_H
