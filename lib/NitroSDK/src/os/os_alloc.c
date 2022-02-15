#include <nitro.h>

#define OFFSET(n, a) (((u32) (n)) & ((a) - 1))
#define TRUNC(n, a)  (((u32) (n)) & ~((a) - 1))
#define ROUND(n, a)  (((u32) (n) + (a) - 1) & ~((a) - 1))

#define ALIGNMENT  32
#define MINOBJSIZE (HEADERSIZE + ALIGNMENT)
#define HEADERSIZE ROUND(sizeof(Cell), ALIGNMENT)

void *OSiHeapInfo[OS_ARENA_MAX] = {};

static
#ifdef SDK_ARM7
inline
#endif //SDK_ARM7
Cell *DLAddFront(Cell *list, Cell *cell) {
    cell->next = list;
    cell->prev = NULL;
    if (list != NULL) {
        list->prev = cell;
    }
    return cell;
}

Cell *DLExtract(Cell *list, Cell *cell) {
    if (cell->next != NULL) {
        cell->next->prev = cell->prev;
    }
    if (cell->prev == NULL) {
        return cell->next;
    } else {
        cell->prev->next = cell->next;
        return list;
    }
}

Cell *DLInsert(Cell *list, Cell *cell) {
    Cell *prev;
    Cell *next;

    for (next = list, prev = NULL; next; prev = next, next = next->next) {
        if (cell <= next) {
            break;
        }
    }

    cell->next = next;
    cell->prev = prev;

    if (next) {
        next->prev = cell;
        if ((char *)cell + cell->size == (char *)next) {
            cell->size += next->size;
            cell->next = next = next->next;
            if (next) {
                next->prev = cell;
            }
        }
    }
    if (prev) {
        prev->next = cell;
        if ((char *)prev + prev->size == (char *)cell) {
            prev->size += cell->size;
            prev->next = next;
            if (next) {
                next->prev = prev;
            }
        }
        return list;
    } else {
        return cell;
    }
}

void *OS_AllocFromHeap(OSArenaId id, OSHeapHandle heap, u32 size) {
    OSHeapInfo *heapInfo;
    HeapDesc *hd;
    Cell *cell;
    Cell *newCell;
    long leftoverSize;
    OSIntrMode enabled = OS_DisableInterrupts();

    heapInfo = (OSHeapInfo *)OSiHeapInfo[id];
    if (heapInfo == NULL) {
        OS_RestoreInterrupts(enabled);
        return NULL;
    }

    if (heap < 0) {
        heap = heapInfo->currentHeap;
    }
    hd = &heapInfo->heapArray[heap];
    size += HEADERSIZE;
    size = ROUND(size, ALIGNMENT);
    for (cell = hd->free; cell != NULL; cell = cell->next) {
        if ((long)size <= cell->size) {
            break;
        }
    }
    if (cell == NULL) {
        OS_RestoreInterrupts(enabled);
        return NULL;
    }
    leftoverSize = cell->size - size;
    if (leftoverSize < MINOBJSIZE) {
        hd->free = DLExtract(hd->free, cell);
    } else {
        cell->size = (long)size;
        newCell = (Cell*)((char *)cell + size);
        newCell->size = leftoverSize;
        newCell->prev = cell->prev;
        newCell->next = cell->next;
        if (newCell->next != NULL) {
            newCell->next->prev = newCell;
        }
        if (newCell->prev != NULL) {
            newCell->prev->next = newCell;
        } else {
            // debug assert here: "broken heap"
            hd->free = newCell;
        }
    }
    hd->allocated = DLAddFront(hd->allocated, cell);
    OS_RestoreInterrupts(enabled);
    return (void *)((char *)cell + HEADERSIZE);
}

void OS_FreeToHeap(OSArenaId id, OSHeapHandle heap, void *ptr) {
    OSHeapInfo *heapInfo;
    HeapDesc *hd;
    Cell *cell;
    OSIntrMode enabled = OS_DisableInterrupts();
    heapInfo = (OSHeapInfo *)OSiHeapInfo[id];
    if (heap < 0) {
        heap = heapInfo->currentHeap;
    }
    hd = &heapInfo->heapArray[heap];
    cell = (Cell *)((char *)ptr - HEADERSIZE);
    hd->allocated = DLExtract(hd->allocated, cell);
    hd->free = DLInsert(hd->free, cell);
    OS_RestoreInterrupts(enabled);
}

OSHeapHandle OS_SetCurrentHeap(OSArenaId id, OSHeapHandle heap) {
    OSHeapInfo *heapInfo;
    OSHeapHandle prev;
    OSIntrMode enabled = OS_DisableInterrupts();
    heapInfo = (OSHeapInfo *)OSiHeapInfo[id];
    prev = heapInfo->currentHeap;
    heapInfo->currentHeap = heap;
    OS_RestoreInterrupts(enabled);
    return prev;
}

void *OS_InitAlloc(OSArenaId id, void *arenaStart, void *arenaEnd, s32 maxHeaps) {
    OSHeapInfo *heapInfo;
    OSHeapHandle i;
    u32 arraySize;
    OSIntrMode enabled = OS_DisableInterrupts();
    heapInfo = arenaStart;
    OSiHeapInfo[id] = heapInfo;
    arraySize = sizeof(HeapDesc) * maxHeaps;
    heapInfo->heapArray = (void *)((u32)arenaStart + sizeof(OSHeapInfo));
    heapInfo->numHeaps = maxHeaps;
    for (i = 0; i < heapInfo->numHeaps; i++) {
        HeapDesc *hd = &heapInfo->heapArray[i];
        hd->size = -1;
        hd->free = hd->allocated = NULL;
    }
    heapInfo->currentHeap = -1;
    arenaStart = (void *)((char *)heapInfo->heapArray + arraySize);
    arenaStart = (void *)ROUND(arenaStart, ALIGNMENT);
    heapInfo->arenaStart = arenaStart;
    heapInfo->arenaEnd = (void *)TRUNC(arenaEnd, ALIGNMENT);
    OS_RestoreInterrupts(enabled);
    return heapInfo->arenaStart;
}

void OS_ClearAlloc(OSArenaId id) {
    OSiHeapInfo[id] = NULL; // Act like it never existed
}

OSHeapHandle OS_CreateHeap(OSArenaId id, void *start, void *end) {
    OSHeapInfo *heapInfo;
    OSHeapHandle heap;
    HeapDesc *hd;
    Cell *cell;
    OSIntrMode enabled = OS_DisableInterrupts();
    heapInfo = (OSHeapInfo *)OSiHeapInfo[id];
    start = (void *)ROUND(start, ALIGNMENT);
    end = (void *)TRUNC(end, ALIGNMENT);
    for (heap = 0; heap < heapInfo->numHeaps; heap++) {
        hd = &heapInfo->heapArray[heap];
        if (hd->size < 0) {
            // This heap is available, asign it
            hd->size = (char *)end - (char *)start;
            cell = (Cell *)start;
            cell->prev = NULL;
            cell->next = NULL;
            cell->size = hd->size;
            hd->free = cell;
            hd->allocated = NULL;
            OS_RestoreInterrupts(enabled);
            return heap;
        }
    }
    // No heap is available, signal such
    OS_RestoreInterrupts(enabled);
    return -1;
}

#define InRange(targ, a, b)((u32)(a) <= (u32)(targ) && (u32)(targ) < (u32)(b))

#define OSi_CHECK(exp) do {     \
    if (!(exp)) {                 \
        goto exit_OS_CheckHeap; \
    }                           \
} while (0)

s32 OS_CheckHeap(OSArenaId id, OSHeapHandle heap) {
    OSHeapInfo *heapInfo;
    HeapDesc *hd;
    Cell *cell;
    long total = 0;
    long free = 0;
    long retValue = -1;
    OSIntrMode enabled = OS_DisableInterrupts();
    heapInfo = OSiHeapInfo[id];
    if (heap == -1) {
        heap = heapInfo->currentHeap;
    }
    OSi_CHECK(heapInfo->heapArray);
    OSi_CHECK(0 <= heap && heap < heapInfo->numHeaps);

    hd = &heapInfo->heapArray[heap];
    OSi_CHECK(0 <= hd->size);

    OSi_CHECK(hd->allocated == NULL || hd->allocated->prev == NULL);
    for (cell = hd->allocated; cell; cell = cell->next) {
        OSi_CHECK(InRange(cell, heapInfo->arenaStart, heapInfo->arenaEnd));
        OSi_CHECK(OFFSET(cell, ALIGNMENT) == 0);
        OSi_CHECK(cell->next == NULL || cell->next->prev == cell);
        OSi_CHECK(MINOBJSIZE <= cell->size);
        OSi_CHECK(OFFSET(cell->size, ALIGNMENT) == 0);

        total += cell->size;
        OSi_CHECK(0 < total && total <= hd->size);

    }

    OSi_CHECK(hd->free == NULL || hd->free->prev == NULL);
    for (cell = hd->free; cell; cell = cell->next) {
        OSi_CHECK(InRange(cell, heapInfo->arenaStart, heapInfo->arenaEnd));
        OSi_CHECK(OFFSET(cell, ALIGNMENT) == 0);
        OSi_CHECK(cell->next == NULL || cell->next->prev == cell);
        OSi_CHECK(MINOBJSIZE <= cell->size);
        OSi_CHECK(OFFSET(cell->size, ALIGNMENT) == 0);
        OSi_CHECK(cell->next == NULL || (char *) cell + cell->size < (char *) cell->next);

        total += cell->size;
        free += cell->size - HEADERSIZE;
        OSi_CHECK(0 < total && total <= hd->size);
    }

    OSi_CHECK(total == hd->size);
    retValue = free;

exit_OS_CheckHeap:
    OS_RestoreInterrupts(enabled);
    return retValue;
}
