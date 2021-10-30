#ifndef NNSYS_SND_HEAP_H_
#define NNSYS_SND_HEAP_H_

struct NNSSndHeap;
typedef struct NNSSndHeap* NNSSndHeapHandle;

NNSSndHeapHandle NNS_SndHeapCreate(void *buf, u32 maxsize);
int NNS_SndHeapSaveState(NNSSndHeapHandle heap);
int NNS_SndHeapLoadState(NNSSndHeapHandle heap, int level);
u32 NNS_SndHeapGetSize(NNSSndHeapHandle heap);
u32 NNS_SndHeapGetFreeSize(NNSSndHeapHandle heap);

#endif //NNSYS_SND_HEAP_H_
