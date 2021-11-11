#ifndef NNSYS_FND_ALLOCATOR_H_
#define NNSYS_FND_ALLOCATOR_H_

#include <nnsys/fnd/heapcommon.h>

typedef struct NNSFndAllocator NNSFndAllocator;

typedef void *(*NNSFndFuncAllocatorAlloc)(NNSFndAllocator *pAllocator, u32 size);
typedef void (*NNSFndFuncAllocatorFree)(NNSFndAllocator *pAllocator,void *memBlock);

typedef struct NNSFndAllocatorFunc NNSFndAllocatorFunc;

struct NNSFndAllocatorFunc {
    NNSFndFuncAllocatorAlloc pfAlloc;
    NNSFndFuncAllocatorFree pfFree;
};

struct NNSFndAllocator {
    NNSFndAllocatorFunc const * pFunc;
    void *pHeap;
    u32 heapParam1;
    u32 heapParam2;
};

void NNS_FndInitAllocatorForExpHeap(NNSFndAllocator *pAllocator, NNSFndHeapHandle heap, int alignment);

#endif //NNSYS_FND_ALLOCATOR_H_
