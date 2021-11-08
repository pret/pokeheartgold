#ifndef POKEHEARTGOLD_HEAP_H
#define POKEHEARTGOLD_HEAP_H

typedef u32 HeapID;

void * AllocFromHeap(u32 heap_id, u32 size);
void * AllocFromHeapAtEnd(u32 heap_id, u32 size);
void FreeToHeap(void * ptr);
void FreeToHeapExplicit(u32 heap_id, void * ptr);

#endif //POKEHEARTGOLD_HEAP_H
