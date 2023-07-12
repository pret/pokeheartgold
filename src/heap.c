#include "global.h"
#include "heap.h"
#include "unk_02037C94.h"
#include "error_handling.h"

struct HeapInfo {
    NNSFndHeapHandle *heapHandles;
    NNSFndHeapHandle *parentHeapHandles;
    void **subHeapRawPtrs;
    u16 *numMemBlocks;
    u8 *heapIdxs;
    u16 totalNumHeaps;
    u16 nTemplates;
    u16 maxHeaps;
    u16 unallocatedHeapId;
};

typedef struct MemoryBlock {
    u8 filler_00[12];
    u32 heapId:8;
    u32 filler_0D:24;
} MemoryBlock;

static struct HeapInfo sHeapInfo;

static BOOL CreateHeapInternal(u32 parent, u32 child, u32 size, s32 alignment);
BOOL GF_heap_c_dummy_return_true(HeapID heapId);

void InitHeapSystem(const HEAP_PARAM *templates, u32 nTemplates, u32 totalNumHeaps, u32 pre_size) {
    void * ptr;
    u32 unk_size, i;

    unk_size = nTemplates + 24;

    if (totalNumHeaps < unk_size) {
        totalNumHeaps = unk_size;
    }
    if (pre_size != 0) {
        // force align
        while (pre_size % 4 != 0) {
            pre_size++;
        }

        OS_AllocFromArenaLo(OS_ARENA_MAIN, pre_size, 4);
    }

    sHeapInfo.heapHandles = (NNSFndHeapHandle*) OS_AllocFromArenaLo(
        OS_ARENA_MAIN,
        (unk_size + 1) * sizeof(NNSFndHeapHandle)
        + unk_size * sizeof(NNSFndHeapHandle)
        + unk_size * sizeof(void *)
        + totalNumHeaps * sizeof(u16)
        + totalNumHeaps,
        4
    );
    sHeapInfo.parentHeapHandles = sHeapInfo.heapHandles + (unk_size + 1);
    sHeapInfo.subHeapRawPtrs = (void **)(sHeapInfo.parentHeapHandles + unk_size);
    sHeapInfo.numMemBlocks = (u16 *)(sHeapInfo.subHeapRawPtrs + unk_size);
    sHeapInfo.heapIdxs = (u8 *)(sHeapInfo.numMemBlocks + totalNumHeaps);
    sHeapInfo.totalNumHeaps = (u16)totalNumHeaps;
    sHeapInfo.nTemplates = (u16)nTemplates;

    sHeapInfo.unallocatedHeapId = (u16)unk_size;
    sHeapInfo.maxHeaps = (u16)unk_size;

    for (i = 0; i < nTemplates; i++) {
        switch (templates[i].arena) {
        case OS_ARENA_MAIN:
        default:
            ptr = OS_AllocFromArenaLo(OS_ARENA_MAIN, templates[i].size, 4);
            break;
        case OS_ARENA_MAINEX:
            ptr = OS_AllocFromArenaHi(OS_ARENA_MAINEX, templates[i].size, 4);
            break;
        }

        if (ptr != NULL) {

            sHeapInfo.heapHandles[i] = NNS_FndCreateExpHeap(ptr, templates[i].size);
            sHeapInfo.heapIdxs[i] = (u8)i;
        } else {
            GF_ASSERT(0);
        }
    }

    for (i = nTemplates; i < unk_size + 1; i++) {
        sHeapInfo.heapHandles[i] = NULL;
        sHeapInfo.heapIdxs[i] = (u8)sHeapInfo.unallocatedHeapId;
    }

    while (i < totalNumHeaps) {
        sHeapInfo.heapIdxs[i] = (u8)sHeapInfo.unallocatedHeapId;

        i++;
    }

    for (i = 0; i < totalNumHeaps; i++) {
        sHeapInfo.numMemBlocks[i] = 0;
    }
}

static s32 FindFirstAvailableHeapHandle() {
    s32 i;

    for (i = sHeapInfo.nTemplates; i < sHeapInfo.maxHeaps; i++) {
        if (sHeapInfo.heapHandles[i] == NULL)
            return i;
    }

    return -1;
}

BOOL CreateHeap(u32 parent, u32 child, u32 size) {
    return CreateHeapInternal(parent, child, size, 4);
}

BOOL CreateHeapAtEnd(u32 parent, u32 child, u32 size) {
    return CreateHeapInternal(parent, child, size, -4);
}

static BOOL CreateHeapInternal(u32 parent, u32 child, u32 size, s32 alignment) {
    GF_ASSERT(OS_GetProcMode() != OS_PROCMODE_IRQ);

    u8 *ptr = sHeapInfo.heapIdxs;
    if (sHeapInfo.unallocatedHeapId == ptr[child]) {
        NNSFndHeapHandle parentHeap = sHeapInfo.heapHandles[ptr[parent]];
        if (parentHeap != NULL) {
            void *newHeapAddr = NNS_FndAllocFromExpHeapEx(parentHeap, size, alignment);
            if (newHeapAddr != NULL) {
                s32 i = FindFirstAvailableHeapHandle();
                if (i >= 0) {
                    sHeapInfo.heapHandles[i] = NNS_FndCreateExpHeap(newHeapAddr, size);


                    if (sHeapInfo.heapHandles[i] != NULL) {
                        sHeapInfo.parentHeapHandles[i] = parentHeap;
                        sHeapInfo.subHeapRawPtrs[i] = newHeapAddr;
                        sHeapInfo.heapIdxs[child] = (u8)i;

                        return TRUE;
                    } else {
                        GF_ASSERT(0);
                    }
                } else {
                    GF_ASSERT(0);
                }
            } else {
                GF_ASSERT(0);
            }
        } else {
            GF_ASSERT(0);
        }
    } else {
        GF_ASSERT(0);
    }
    return FALSE;
}

void DestroyHeap(HeapID heapId) {
    GF_ASSERT(OS_GetProcMode() != OS_PROCMODE_IRQ);

    NNSFndHeapHandle handle = sHeapInfo.heapHandles[sHeapInfo.heapIdxs[heapId]];

    if (handle != NULL) {
        NNS_FndDestroyExpHeap(handle);

        u8 index = sHeapInfo.heapIdxs[heapId];
        NNSFndHeapHandle parentHeap = sHeapInfo.parentHeapHandles[index];
        void *childRaw = sHeapInfo.subHeapRawPtrs[index];
        if (parentHeap != NULL && childRaw != NULL) {
            NNS_FndFreeToExpHeap(parentHeap, childRaw);
        } else {
            GF_ASSERT(0);
        }

        sHeapInfo.heapHandles[sHeapInfo.heapIdxs[heapId]] = NULL;
        sHeapInfo.parentHeapHandles[sHeapInfo.heapIdxs[heapId]] = NULL;
        sHeapInfo.subHeapRawPtrs[sHeapInfo.heapIdxs[heapId]] = NULL;

        sHeapInfo.heapIdxs[heapId] = (u8)sHeapInfo.unallocatedHeapId;
    }
}

static void *AllocFromHeapInternal(NNSFndHeapHandle heap, u32 size, s32 alignment, HeapID heapId) {
    GF_ASSERT(heap);

    OSIntrMode intr_mode = OS_DisableInterrupts();
    size += sizeof(MemoryBlock);
    void *ptr = NNS_FndAllocFromExpHeapEx(heap, size, alignment);

    OS_RestoreInterrupts(intr_mode);
    if (ptr != NULL) {
        ((MemoryBlock *)ptr)->heapId = heapId;

        ptr += sizeof(MemoryBlock);
    }

    return ptr;
}

static void AllocFail() {
    if (sub_02037D78()) {
        PrintErrorMessageAndReset();
    }
}

void *AllocFromHeap(HeapID heapId, u32 size) {
    void *ptr = NULL;
    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {
        u8 index = sHeapInfo.heapIdxs[heapId];
        ptr = AllocFromHeapInternal(sHeapInfo.heapHandles[index], size, 4, heapId);
    }
    if (ptr != NULL) {
        sHeapInfo.numMemBlocks[heapId]++;
    } else {
        AllocFail();
    }

    return ptr;
}

void *AllocFromHeapAtEnd(HeapID heapId, u32 size) {
    void *ptr = NULL;
    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {
        u8 index = sHeapInfo.heapIdxs[heapId];
        ptr = AllocFromHeapInternal(sHeapInfo.heapHandles[index], size, -4, heapId);
    }

    if (ptr != NULL) {
        sHeapInfo.numMemBlocks[heapId]++;
    } else {
        AllocFail();
    }

    return ptr;
}

void FreeToHeap(void *ptr) {
    ptr -= sizeof(MemoryBlock);
    HeapID heapId = (HeapID)((MemoryBlock *)ptr)->heapId;

    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {
        u8 index = sHeapInfo.heapIdxs[heapId];
        NNSFndHeapHandle heap = sHeapInfo.heapHandles[index];
        GF_ASSERT(heap != NULL);

        if (sHeapInfo.numMemBlocks[heapId] == 0) {
            GF_heap_c_dummy_return_true(heapId);
        }
        GF_ASSERT(sHeapInfo.numMemBlocks[heapId] != 0);

        sHeapInfo.numMemBlocks[heapId]--;
        OSIntrMode intr_mode = OS_DisableInterrupts();
        NNS_FndFreeToExpHeap(heap, ptr);
        OS_RestoreInterrupts(intr_mode);
        return;
    }

    GF_ASSERT(0);
}

void FreeToHeapExplicit(HeapID heapId, void *ptr) {
    GF_ASSERT(OS_GetProcMode() != OS_PROCMODE_IRQ);

    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {
        u8 index = sHeapInfo.heapIdxs[heapId];
        NNSFndHeapHandle heap = sHeapInfo.heapHandles[index];
        GF_ASSERT( heap != NULL );

        ptr -= sizeof(MemoryBlock);
        GF_ASSERT(((MemoryBlock *)ptr)->heapId == heapId);

        NNS_FndFreeToExpHeap(heap, ptr);
        GF_ASSERT(sHeapInfo.numMemBlocks[heapId] != 0);

        sHeapInfo.numMemBlocks[heapId]--;
        return;
    }

    GF_ASSERT(0);
}

u32 GF_ExpHeap_FndGetTotalFreeSize(HeapID heapId) {
    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {
        u8 index = sHeapInfo.heapIdxs[heapId];
        return NNS_FndGetTotalFreeSizeForExpHeap(sHeapInfo.heapHandles[index]);
    }

    GF_ASSERT(0);
    return 0;
}

void GF_ExpHeap_FndInitAllocator(NNSFndAllocator * pAllocator, HeapID heapId, int alignment) {
    if (((u32)heapId) < sHeapInfo.totalNumHeaps) {

        u8 index = sHeapInfo.heapIdxs[heapId];
        NNS_FndInitAllocatorForExpHeap(pAllocator, sHeapInfo.heapHandles[index], alignment);
        return;
    }

    GF_ASSERT(0);
}

void ReallocFromHeap(void *ptr, u32 newSize) {
    GF_ASSERT(OS_GetProcMode() != OS_PROCMODE_IRQ);

    newSize += sizeof(MemoryBlock);
    ptr -= sizeof(MemoryBlock);
    if (NNS_FndGetSizeForMBlockExpHeap(ptr) >= newSize) {
        u32 heapId = ((MemoryBlock *)ptr)->heapId;

        u8 index = sHeapInfo.heapIdxs[heapId];

        NNS_FndResizeForMBlockExpHeap(sHeapInfo.heapHandles[index], ptr, newSize);
        return;
    }
    GF_ASSERT(0);
}

BOOL GF_heap_c_dummy_return_true(HeapID heapId) {
#pragma unused(heapId)
    return TRUE;
}
