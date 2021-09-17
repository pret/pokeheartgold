/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_alloc.h from the specific proc's lib
 */

#ifndef NITRO_OS_ALLOC_SHARED_H
#define NITRO_OS_ALLOC_SHARED_H

#include <nitro/types.h>

typedef s32 OSHeapHandle;

typedef struct Cell Cell;

struct Cell {
    Cell* prev;
    Cell* next;
    long size;
};

typedef struct {
    long size;
    Cell *free;
    Cell *allocated;
} HeapDesc;

typedef struct {
    volatile OSHeapHandle currentHeap;
    int numHeaps;
    void* arenaStart;
    void* arenaEnd;
    HeapDesc* heapArray;
} OSHeapInfo;

#endif //NITRO_OS_ALLOC_SHARED_H
