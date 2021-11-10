#ifndef POKEHEARTGOLD_HEAP_H
#define POKEHEARTGOLD_HEAP_H

typedef u32 HeapID;

typedef struct HeapParam {
    u32 size;         // maximum size of the heap
    OSArenaId arena;  // where to allocate the heap from
} HEAP_PARAM;

void InitHeapSystem(const HEAP_PARAM *templates, u32 nTemplates, u32 totalNumHeaps, u32 pre_size);
BOOL CreateHeap(u32 parent, u32 child, u32 size);
BOOL CreateHeapAtEnd(u32 parent, u32 child, u32 size);
void DestroyHeap(u32 heap_id);
void * AllocFromHeap(u32 heap_id, u32 size);
void * AllocFromHeapAtEnd(u32 heap_id, u32 size);
void FreeToHeap(void * ptr);
void FreeToHeapExplicit(u32 heap_id, void * ptr);
u32 GF_ExpHeap_FndGetTotalFreeSize(u32 heap_id);
void GF_ExpHeap_FndInitAllocator(NNSFndAllocator * pAllocator, u32 heap_id, int alignment);
void ReallocFromHeap(void *ptr, u32 newSize);
BOOL GF_heap_c_dummy_return_true(u32 heap_id);

#endif //POKEHEARTGOLD_HEAP_H
