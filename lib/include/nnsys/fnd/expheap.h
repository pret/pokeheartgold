#ifndef NNSYS_FND_EXPHEAP_H_
#define NNSYS_FND_EXPHEAP_H_

#include <nnsys/fnd/heapcommon.h>

#define NNS_FndCreateExpHeap(startAddress, size) NNS_FndCreateExpHeapEx(startAddress, size, 0)

NNSFndHeapHandle NNS_FndCreateExpHeapEx(void *startAddress, u32 size, u16 optFlag);
void *NNS_FndAllocFromExpHeapEx(NNSFndHeapHandle heap, u32 size, int alignment);
void NNS_FndDestroyExpHeap(NNSFndHeapHandle heap);
void NNS_FndFreeToExpHeap(NNSFndHeapHandle heap, void *memBlock);
u32 NNS_FndGetTotalFreeSizeForExpHeap(NNSFndHeapHandle heap);
u32 NNS_FndGetSizeForMBlockExpHeap(const void *memBlock);
u32 NNS_FndResizeForMBlockExpHeap(NNSFndHeapHandle heap, void *memBlock, u32 size);

#endif //NNSYS_FND_EXPHEAP_H_
