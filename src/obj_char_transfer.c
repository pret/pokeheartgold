#include "obj_char_transfer.h"

#include "global.h"

#include "vram_transfer_manager.h"

typedef enum ObjCharTransferTaskState {
    OBJ_CHAR_TRANSFER_TASK_INIT,
    OBJ_CHAR_TRANSFER_TASK_1,
    OBJ_CHAR_TRANSFER_TASK_2,
    OBJ_CHAR_TRANSFER_TASK_COPYABLE,
    OBJ_CHAR_TRANSFER_TASK_COPY,
} ObjCharTransferTaskState;

typedef struct ObjCharTransferTask {
    NNSG2dCharacterData *charData;
    NNS_G2D_VRAM_TYPE vram;
    u8 isTransferred;
    int resId;
    NNSG2dImageProxy imageProxy;
    u32 baseAddrMain;
    u32 baseAddrSub;
    u8 state;
    BOOL shouldUpdateMappingTypeFromHW;
    BOOL transferFromTail;
    BOOL needResetBlockTransferFlags;
    u32 sizeMain;
    u32 sizeSub;
} ObjCharTransferTask;

struct ObjCharTransferTasksManager {
    ObjCharTransferTask *tasks;
    int max;
    int num;
    int offsetMain;
    int offsetSub;
    u32 vramCapacityMain;
    u32 vramCapacitySub;
    int freeSizeMain;
    int freeSizeSub;
    int numBlocksMain;
    int numBlocksSub;
    u32 blockSizeMain;
    u32 blockSizeSub;
    u8 *blockBufMain;
    u8 *blockBufSub;
};

static ObjCharTransferTasksManager *sObjCharTransferTasksManager;

static BOOL ObjCharTransfer_TaskExistsByID(int resId);
static void ObjCharTransferInternal_ResetAllTransferTasks(void);
static void ObjCharTransferTask_Init(ObjCharTransferTask *task);
static BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *template, ObjCharTransferTask *task);
static BOOL ObjCharTransferTask_ReserveAndTransfer(ObjCharTransferTask *task);
static ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn);
static BOOL ObjCharTransferTask_ReserveFromHead(ObjCharTransferTask *task);
static BOOL ObjCharTransferTask_ReserveFromTail(ObjCharTransferTask *task);
static void ObjCharTransferTask_Reset(ObjCharTransferTask *task);
static ObjCharTransferTask *ObjCharTransfer_GetTaskByID(int resId);
static GXOBJVRamModeChar ObjCharTransferTask_SetMappingTypeFromHW(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
static void ObjCharTransferTask_SetBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub);
static BOOL ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(int vram, u32 *pOffsetMain, u32 *pOffsetSub, u32 size, u32 *freeSpaceMain, u32 *freeSpaceSub); // a0 should be NNS_G2D_VRAM_TYPE but needs to be int in order to match
static void ObjCharTransferTask_UpdateBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub);
static void ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 sizeMain, u32 sizeSub);
static void ObjCharTransferTask_G2dLoadImageMapping(ObjCharTransferTask *task);
static void ObjCharTransferTask_G2dLoadImageMappingByScreen(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
static void ObjCharTransferTask_G2dLoadImageMappingVramTransfer(ObjCharTransferTask *task);
static void ObjCharTransferTask_G2dLoadImageMappingVramTransferByScreen(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
static ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void);
static void ObjCharTransfer_GetVramCapacityByBank(void);
static void ObjCharTransfer_InitBlocksTransferBuffers(u32 numBlocksMain, u32 numBlocksSub, enum HeapID heapID);
static void ObjCharTransfer_ClearBothScreensBlockBufs(void);
static void ObjCharTransfer_FreeBlockTransferBuffer(u8 *buffer);
static u32 ObjCharTransfer_GetBlocksCountFromBufferPtr(u8 *buffer);
static void ObjCharTransfer_ClearBlockBuf(u8 *buffer);
static void ObjCharTransfer_ReserveTransferBlocks(u32 blockStart, u32 numBlocks, u8 *buffer);
static u32 ObjCharTransfer_FindAvailableTransferBlock(u32 numBlocksUsed, u8 *buffer);
static void ObjCharTransfer_ResetBlockTransferFlagsEx(u32 blockStart, u32 blockMax, u8 *buffer);
static void ObjCharTransferTask_ResetBlockTransferFlags(ObjCharTransferTask *task);
static int ObjCharTransfer_AlignToBlock(int size, int blockSize, BOOL alignRight);
static u32 ObjCharTransfer_CalcBlockNumLimit(int size, int blockSize);
static int ObjCharTransfer_GetBlockMemOffset(int blockNum, int blockSize);
static BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub);
static void ObjCharTransfer_ReserveVramSpace(u32 size, NNS_G2D_VRAM_TYPE vram);
static void ObjCharTransfer_BitPositionToByteAndBitIndexPair(int arrayBitIndex, u32 *byteIndex, u8 *bitIndex);
static void ObjCharTransferInternal_BoundsFixOffsetAndSize(u32 baseOffset, u32 curOffset, u32 size, int *correctedOffset, int *correctedSize);

void ObjCharTransfer_Init(ObjCharTransferTemplate *template) {
    ObjCharTransfer_InitEx(template, GX_GetOBJVRamModeChar(), GXS_GetOBJVRamModeChar());
}

void ObjCharTransfer_InitEx(ObjCharTransferTemplate *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub) {
    if (sObjCharTransferTasksManager == NULL) {
        sObjCharTransferTasksManager = Heap_Alloc(template->heapID, sizeof(ObjCharTransferTasksManager));
        MI_CpuClear32(sObjCharTransferTasksManager, sizeof(ObjCharTransferTasksManager));
        sObjCharTransferTasksManager->max = template->maxTasks;
        sObjCharTransferTasksManager->tasks = (ObjCharTransferTask *)Heap_Alloc(template->heapID, sizeof(ObjCharTransferTask) * sObjCharTransferTasksManager->max);
        for (int i = 0; i < template->maxTasks; ++i) {
            ObjCharTransferTask_Init(&sObjCharTransferTasksManager->tasks[i]);
        }
        sObjCharTransferTasksManager->blockSizeMain = ObjCharTransfer_GetBlockSizeFromMode(modeMain);
        sObjCharTransferTasksManager->blockSizeSub = ObjCharTransfer_GetBlockSizeFromMode(modeSub);
        GX_SetOBJVRamModeChar(modeMain);
        GXS_SetOBJVRamModeChar(modeSub);
        int numBlocksMain = ObjCharTransfer_CalcBlockNumLimit(template->sizeMain, sObjCharTransferTasksManager->blockSizeMain);
        int numBlocksSub = ObjCharTransfer_CalcBlockNumLimit(template->sizeSub, sObjCharTransferTasksManager->blockSizeSub);
        ObjCharTransfer_InitBlocksTransferBuffers(numBlocksMain, numBlocksSub, template->heapID);
    }
}

void ObjCharTransfer_Destroy(void) {
    if (sObjCharTransferTasksManager != NULL) {
        ObjCharTransfer_FreeBlockTransferBuffer(sObjCharTransferTasksManager->blockBufMain);
        ObjCharTransfer_FreeBlockTransferBuffer(sObjCharTransferTasksManager->blockBufSub);
        ObjCharTransferInternal_ResetAllTransferTasks();
        Heap_Free(sObjCharTransferTasksManager->tasks);
        Heap_Free(sObjCharTransferTasksManager);
        sObjCharTransferTasksManager = NULL;
    }
}

void ObjCharTransfer_ClearBuffers(void) {
    sObjCharTransferTasksManager->offsetMain = 0;
    sObjCharTransferTasksManager->offsetSub = 0;
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufMain);
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufSub);
    ObjCharTransfer_GetVramCapacityByBank();
}

void ObjCharTransfer_SetReservedRegion(u32 offset, u32 size, NNS_G2D_VRAM_TYPE vram) {
    int newOffset;
    int newSize;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        ObjCharTransferInternal_BoundsFixOffsetAndSize(sObjCharTransferTasksManager->freeSizeMain, offset, size, &newOffset, &newSize);
        if (newSize > 0) {
            ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(NNS_G2D_VRAM_TYPE_2DMAIN, newOffset, 0, newSize, 0);
        }
    } else {
        ObjCharTransferInternal_BoundsFixOffsetAndSize(sObjCharTransferTasksManager->freeSizeSub, offset, size, &newOffset, &newSize);
        if (newSize > 0) {
            ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(NNS_G2D_VRAM_TYPE_2DSUB, 0, newOffset, 0, newSize);
        }
    }
}

BOOL ObjCharTransfer_CreateTaskAndDoTransferFromTemplate(const ObjCharTransferTaskTemplate *template) {
    GF_ASSERT(ObjCharTransfer_TaskExistsByID(template->id) != TRUE);
    ObjCharTransferTask *sub = ObjCharTransfer_GetFreeTask();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!ObjCharTransferTask_InitFromTemplate(template, sub)) {
        return FALSE;
    }
    if (!ObjCharTransferTask_ReserveAndTransfer(sub)) {
        ObjCharTransfer_ResetTransferTasksByResID(sub->resId);
        return FALSE;
    }
    ++sObjCharTransferTasksManager->num;
    return TRUE;
}

BOOL ObjCharTransfer_CreateTaskAndDoTransferFromTemplate_UpdateMappingTypeFromHW(const ObjCharTransferTaskTemplate *template) {
    GF_ASSERT(ObjCharTransfer_TaskExistsByID(template->id) != TRUE);
    ObjCharTransferTask *sub = ObjCharTransfer_GetFreeTask();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!ObjCharTransferTask_InitFromTemplate(template, sub)) {
        return FALSE;
    }
    sub->shouldUpdateMappingTypeFromHW = TRUE;
    if (!ObjCharTransferTask_ReserveAndTransfer(sub)) {
        ObjCharTransfer_ResetTransferTasksByResID(sub->resId);
        return FALSE;
    }
    ++sObjCharTransferTasksManager->num;
    return TRUE;
}

static BOOL ObjCharTransfer_TaskExistsByID(int resId) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (resId == sObjCharTransferTasksManager->tasks[i].resId) {
            return TRUE;
        }
    }

    return FALSE;
}

void ObjCharTransfer_ReplaceGraphicsFromChardataByResID(int id, NNSG2dCharacterData *charData) {
    GF_ASSERT(charData != NULL);
    ObjCharTransferTask *sub = ObjCharTransfer_GetTaskByID(id);
    GF_ASSERT(sub != NULL);
    sub->charData = charData;
    if (sub->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_CHAR_MAIN, sub->baseAddrMain, charData->pRawData, charData->szByte);
    }
    if (sub->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_CHAR_SUB, sub->baseAddrSub, charData->pRawData, charData->szByte);
    }
}

void ObjCharTransfer_ResetTransferTasksByResID(int resId) {
    ObjCharTransferTask *task;
    BOOL searchingCopies = TRUE;
    do {
        task = ObjCharTransfer_GetTaskByID(resId);
        GF_ASSERT(task != NULL);
        if (task->state == OBJ_CHAR_TRANSFER_TASK_COPY) {
            ObjCharTransfer_DeleteTaskCopyByProxyPtr(&task->imageProxy);
        } else {
            searchingCopies = FALSE;
        }
    } while (searchingCopies);
    if (task->state != OBJ_CHAR_TRANSFER_TASK_INIT) {
        ObjCharTransferTask_Reset(task);
        --sObjCharTransferTasksManager->num;
    }
}

static void ObjCharTransferInternal_ResetAllTransferTasks(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state != OBJ_CHAR_TRANSFER_TASK_INIT) {
            ObjCharTransferTask_Reset(&sObjCharTransferTasksManager->tasks[i]);
            --sObjCharTransferTasksManager->num;
        }
    }
}

NNSG2dImageProxy *ObjCharTransfer_GetProxyPtrByResID(int resId) {
    ObjCharTransferTask *sub = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(sub != NULL);
    if (sub->state == OBJ_CHAR_TRANSFER_TASK_INIT) {
        return NULL;
    }

    return &sub->imageProxy;
}

NNSG2dImageProxy *ObjCharTransfer_ResizeTaskByResID_GetProxyPtr(int resId, u32 size) {
    ObjCharTransferTask *task = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(task != NULL);
    if (task->state == OBJ_CHAR_TRANSFER_TASK_INIT) {
        return NULL;
    }
    u32 offsetMain;
    u32 offsetSub;
    u32 newSizeMain;
    u32 newSizeSub;
    ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(task->vram, &offsetMain, &offsetSub, size, &newSizeMain, &newSizeSub);
    if (task->state == OBJ_CHAR_TRANSFER_TASK_COPYABLE) {
        return NULL;
    }
    task->state = OBJ_CHAR_TRANSFER_TASK_COPYABLE;
    ObjCharTransferTask_UpdateBaseAddrs(task, offsetMain, offsetSub);
    task->needResetBlockTransferFlags = TRUE;
    task->sizeMain = newSizeMain;
    task->sizeSub = newSizeSub;
    ObjCharTransferTask_G2dLoadImageMappingVramTransfer(task);
    ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(task->vram, offsetMain, offsetSub, newSizeMain, newSizeSub);

    return &task->imageProxy;
}

NNSG2dImageProxy *ObjCharTransfer_CopyTransferTaskByProxyPtr(NNSG2dImageProxy *proxyIn) {
    ObjCharTransferTask *task;
    ObjCharTransferTask *copiedTask;
    u32 offsetMain;
    u32 offsetSub;
    u32 newSizeMain;
    u32 newSizeSub;
    u32 size;

    task = ObjCharTransfer_GetTaskByImageProxy(proxyIn);
    GF_ASSERT(task != NULL);
    copiedTask = ObjCharTransfer_GetFreeTask();
    GF_ASSERT(copiedTask != NULL);
    if (task->state != OBJ_CHAR_TRANSFER_TASK_COPYABLE) {
        return NULL;
    }
    *copiedTask = *task;
    copiedTask->state = OBJ_CHAR_TRANSFER_TASK_COPY;
    if (copiedTask->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        size = copiedTask->sizeMain;
    } else {
        size = copiedTask->sizeSub;
    }

    ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(copiedTask->vram, &offsetMain, &offsetSub, size, &newSizeMain, &newSizeSub);
    ObjCharTransferTask_UpdateBaseAddrs(copiedTask, offsetMain, offsetSub);
    copiedTask->needResetBlockTransferFlags = TRUE;
    copiedTask->sizeMain = newSizeMain;
    copiedTask->sizeSub = newSizeSub;
    ObjCharTransferTask_G2dLoadImageMappingVramTransfer(copiedTask);
    ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(copiedTask->vram, offsetMain, offsetSub, newSizeMain, newSizeSub);

    return &copiedTask->imageProxy;
}

void ObjCharTransfer_DeleteTaskCopyByProxyPtr(const NNSG2dImageProxy *proxy) {
    int i;
    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if ((sObjCharTransferTasksManager->tasks[i].state == OBJ_CHAR_TRANSFER_TASK_COPYABLE || sObjCharTransferTasksManager->tasks[i].state == OBJ_CHAR_TRANSFER_TASK_COPY) && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxy) {
            break;
        }
    }
    if (i < sObjCharTransferTasksManager->max) {
        ObjCharTransferTask_ResetBlockTransferFlags(&sObjCharTransferTasksManager->tasks[i]);
        if (sObjCharTransferTasksManager->tasks[i].state == OBJ_CHAR_TRANSFER_TASK_COPYABLE) {
            sObjCharTransferTasksManager->tasks[i].state = OBJ_CHAR_TRANSFER_TASK_2;
        } else {
            sObjCharTransferTasksManager->tasks[i].state = OBJ_CHAR_TRANSFER_TASK_INIT;
            ObjCharTransferTask_Init(&sObjCharTransferTasksManager->tasks[i]);
        }
    }
}

BOOL sub_02021AC8(u32 size, BOOL atEnd, NNS_G2D_VRAM_TYPE vram, UnkStruct_02021AC8 *a3) {
    u32 offsetMain;
    u32 offsetSub;
    u32 sizeMain;
    u32 sizeSub;
    BOOL ret;

    if (!atEnd) {
        ret = ObjCharTransfer_TryGetDestVramOffsets(size, vram, &offsetMain, &offsetSub);
        if (ret) {
            ObjCharTransfer_ReserveVramSpace(size, vram);
            a3->vram = vram;
            a3->size = size;
            a3->offset = vram == NNS_G2D_VRAM_TYPE_2DMAIN ? offsetMain : offsetSub;
            a3->isAtEnd = FALSE;
        }
    } else {
        ret = ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(vram, &offsetMain, &offsetSub, size, &sizeMain, &sizeSub);
        if (ret) {
            ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(vram, offsetMain, offsetSub, sizeMain, sizeSub);
            a3->vram = vram;
            if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
                a3->size = sizeMain;
                a3->offset = offsetMain + sObjCharTransferTasksManager->freeSizeMain;
            } else {
                a3->size = sizeSub;
                a3->offset = offsetSub + sObjCharTransferTasksManager->freeSizeSub;
            }
            a3->isAtEnd = TRUE;
        }
    }
    return ret;
}

void sub_02021B5C(UnkStruct_02021AC8 *a0) {
    if (a0->isAtEnd) {
        if (a0->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
            u32 blockMax = ObjCharTransfer_CalcBlockNumLimit(a0->size, sObjCharTransferTasksManager->blockSizeMain);
            u32 blockCur = ObjCharTransfer_CalcBlockNumLimit(a0->offset - sObjCharTransferTasksManager->freeSizeMain, sObjCharTransferTasksManager->blockSizeMain);
            ObjCharTransfer_ResetBlockTransferFlagsEx(blockCur, blockMax, sObjCharTransferTasksManager->blockBufMain);
        }
        if (a0->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
            u32 blockMax = ObjCharTransfer_CalcBlockNumLimit(a0->size, sObjCharTransferTasksManager->blockSizeSub);
            u32 blockCur = ObjCharTransfer_CalcBlockNumLimit(a0->offset - sObjCharTransferTasksManager->freeSizeSub, sObjCharTransferTasksManager->blockSizeSub);
            ObjCharTransfer_ResetBlockTransferFlagsEx(blockCur, blockMax, sObjCharTransferTasksManager->blockBufSub);
        }
    }
}

ObjCharTransferTasksManager *ObjCharTransfer_PopTaskManager(void) {
    GF_ASSERT(sObjCharTransferTasksManager != NULL);
    ObjCharTransferTasksManager *ret = sObjCharTransferTasksManager;
    sObjCharTransferTasksManager = NULL;
    return ret;
}

void ObjCharTransfer_PushTaskManager(ObjCharTransferTasksManager *taskManager) {
    GF_ASSERT(sObjCharTransferTasksManager == NULL);
    sObjCharTransferTasksManager = taskManager;
}

static void ObjCharTransferTask_Init(ObjCharTransferTask *task) {
    task->charData = NULL;
    task->vram = NNS_G2D_VRAM_TYPE_NEITHER;
    task->isTransferred = FALSE;
    task->resId = -1;
    task->baseAddrMain = 0;
    task->baseAddrSub = 0;
    task->state = OBJ_CHAR_TRANSFER_TASK_INIT;
    task->shouldUpdateMappingTypeFromHW = FALSE;
    NNS_G2dInitImageProxy(&task->imageProxy);
}

static BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *template, ObjCharTransferTask *task) {
    task->charData = template->charData;
    task->resId = template->id;
    task->vram = template->vram;
    task->isTransferred = task->charData->characterFmt >> NNS_G2D_VRAMTRANSFERDATA_FLAG_SHIFT;
    task->transferFromTail = template->atEnd;
    task->needResetBlockTransferFlags = FALSE;
    task->sizeMain = 0;
    task->sizeSub = 0;
    return TRUE;
}

static ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn) {
    int i;

    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state != OBJ_CHAR_TRANSFER_TASK_INIT && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxyIn) {
            break;
        }
    }
    if (i >= sObjCharTransferTasksManager->max) {
        return NULL;
    }

    return &sObjCharTransferTasksManager->tasks[i];
}

static BOOL ObjCharTransferTask_ReserveAndTransfer(ObjCharTransferTask *task) {
    BOOL ret = TRUE;
    if (task->isTransferred) {
        task->state = OBJ_CHAR_TRANSFER_TASK_2;
    } else {
        task->state = OBJ_CHAR_TRANSFER_TASK_1;
        if (!task->transferFromTail) {
            ret = ObjCharTransferTask_ReserveFromHead(task);
        } else {
            ret = ObjCharTransferTask_ReserveFromTail(task);
        }
    }
    return ret;
}

static BOOL ObjCharTransferTask_ReserveFromHead(ObjCharTransferTask *task) {
    u32 offsetMain;
    u32 offsetSub;
    BOOL ret = ObjCharTransfer_TryGetDestVramOffsets(task->charData->szByte, task->vram, &offsetMain, &offsetSub);
    if (ret) {
        ObjCharTransferTask_SetBaseAddrs(task, offsetMain, offsetSub);
        ObjCharTransfer_ReserveVramSpace(task->charData->szByte, task->vram);
    }
    return ret;
}

static BOOL ObjCharTransferTask_ReserveFromTail(ObjCharTransferTask *task) {
    u32 offsetMain;
    u32 offsetSub;
    u32 sizeMain;
    u32 sizeSub;
    if (!ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(task->vram, &offsetMain, &offsetSub, task->charData->szByte, &sizeMain, &sizeSub)) {
        return FALSE;
    }
    ObjCharTransferTask_UpdateBaseAddrs(task, offsetMain, offsetSub);
    task->needResetBlockTransferFlags = TRUE;
    task->sizeMain = sizeMain;
    task->sizeSub = sizeSub;
    ObjCharTransferTask_G2dLoadImageMapping(task);
    ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(task->vram, offsetMain, offsetSub, sizeMain, sizeSub);
    return TRUE;
}

static void ObjCharTransferTask_Reset(ObjCharTransferTask *task) {
    if (task->needResetBlockTransferFlags) {
        ObjCharTransferTask_ResetBlockTransferFlags(task);
    }
    ObjCharTransferTask_Init(task);
}

static ObjCharTransferTask *ObjCharTransfer_GetTaskByID(int resId) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].resId == resId) {
            return &sObjCharTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

static GXOBJVRamModeChar ObjCharTransferTask_SetMappingTypeFromHW(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        task->charData->mapingType = GX_GetOBJVRamModeChar();
    } else {
        task->charData->mapingType = GXS_GetOBJVRamModeChar();
    }
    return task->charData->mapingType;
}

static void ObjCharTransferTask_SetBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub) {
    task->baseAddrMain = offsetMain;
    task->baseAddrSub = offsetSub;
    if (!task->isTransferred) {
        ObjCharTransferTask_G2dLoadImageMapping(task);
    }
}

static BOOL ObjCharTransferInternal_GetBlockNumAndFreeSpaceForTransfer(int vram, u32 *blockNumMain, u32 *blockNumSub, u32 size, u32 *freeSpaceMain, u32 *freeSpaceSub) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        *freeSpaceMain = ObjCharTransfer_AlignToBlock(size, sObjCharTransferTasksManager->blockSizeMain, TRUE);
        u32 numBlocksUsed = ObjCharTransfer_CalcBlockNumLimit(*freeSpaceMain, sObjCharTransferTasksManager->blockSizeMain);
        *blockNumMain = ObjCharTransfer_FindAvailableTransferBlock(numBlocksUsed, sObjCharTransferTasksManager->blockBufMain);
        if (*blockNumMain == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *blockNumMain = ObjCharTransfer_GetBlockMemOffset(*blockNumMain, sObjCharTransferTasksManager->blockSizeMain);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        *freeSpaceSub = ObjCharTransfer_AlignToBlock(size, sObjCharTransferTasksManager->blockSizeSub, TRUE);
        u32 numBlocksUsed = ObjCharTransfer_CalcBlockNumLimit(*freeSpaceSub, sObjCharTransferTasksManager->blockSizeSub);
        *blockNumSub = ObjCharTransfer_FindAvailableTransferBlock(numBlocksUsed, sObjCharTransferTasksManager->blockBufSub);
        if (*blockNumSub == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *blockNumSub = ObjCharTransfer_GetBlockMemOffset(*blockNumSub, sObjCharTransferTasksManager->blockSizeSub);
    }
    return TRUE;
}

static void ObjCharTransferTask_UpdateBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        task->baseAddrMain = offsetMain + sObjCharTransferTasksManager->freeSizeMain;
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        task->baseAddrSub = offsetSub + sObjCharTransferTasksManager->freeSizeSub;
    }
}

static void ObjCharTransferInternal_ReserveTransferBlocksByVramOffsetAndSize(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 sizeMain, u32 sizeSub) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        u32 numBlocks = ObjCharTransfer_CalcBlockNumLimit(sizeMain, sObjCharTransferTasksManager->blockSizeMain);
        u32 blockStart = ObjCharTransfer_CalcBlockNumLimit(offsetMain, sObjCharTransferTasksManager->blockSizeMain);
        ObjCharTransfer_ReserveTransferBlocks(blockStart, numBlocks, sObjCharTransferTasksManager->blockBufMain);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        u32 numBlocks = ObjCharTransfer_CalcBlockNumLimit(sizeSub, sObjCharTransferTasksManager->blockSizeSub);
        u32 blockStart = ObjCharTransfer_CalcBlockNumLimit(offsetSub, sObjCharTransferTasksManager->blockSizeSub);
        ObjCharTransfer_ReserveTransferBlocks(blockStart, numBlocks, sObjCharTransferTasksManager->blockBufSub);
    }
}

static void ObjCharTransferTask_G2dLoadImageMapping(ObjCharTransferTask *task) {
    NNS_G2dInitImageProxy(&task->imageProxy);
    if (task->vram != NNS_G2D_VRAM_TYPE_2DBOTH) {
        ObjCharTransferTask_G2dLoadImageMappingByScreen(task, task->vram);
    } else {
        ObjCharTransferTask_G2dLoadImageMappingByScreen(task, NNS_G2D_VRAM_TYPE_2DMAIN);
        ObjCharTransferTask_G2dLoadImageMappingByScreen(task, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

static void ObjCharTransferTask_G2dLoadImageMappingByScreen(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
    int mappingType = task->shouldUpdateMappingTypeFromHW ? ObjCharTransferTask_SetMappingTypeFromHW(task, vram) : vram;
    u32 baseAddr;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        baseAddr = task->baseAddrMain;
        GX_GetOBJVRamModeChar();
    } else {
        baseAddr = task->baseAddrSub;
        GXS_GetOBJVRamModeChar();
    }
    if (mappingType == GX_OBJVRAMMODE_CHAR_2D) {
        NNS_G2dLoadImage2DMapping(task->charData, baseAddr, vram, &task->imageProxy);
    } else {
        NNS_G2dLoadImage1DMapping(task->charData, baseAddr, vram, &task->imageProxy);
    }
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        GX_GetOBJVRamModeChar();
    } else {
        GXS_GetOBJVRamModeChar();
    }
}

static void ObjCharTransferTask_G2dLoadImageMappingVramTransfer(ObjCharTransferTask *task) {
    NNS_G2dInitImageProxy(&task->imageProxy);
    if (task->vram != NNS_G2D_VRAM_TYPE_2DBOTH) {
        ObjCharTransferTask_G2dLoadImageMappingVramTransferByScreen(task, task->vram);
    } else {
        ObjCharTransferTask_G2dLoadImageMappingVramTransferByScreen(task, NNS_G2D_VRAM_TYPE_2DMAIN);
        ObjCharTransferTask_G2dLoadImageMappingVramTransferByScreen(task, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

static void ObjCharTransferTask_G2dLoadImageMappingVramTransferByScreen(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
    int mappingType = task->shouldUpdateMappingTypeFromHW ? ObjCharTransferTask_SetMappingTypeFromHW(task, vram) : vram;
#pragma unused(mappingType)
    u32 baseAddr;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        baseAddr = task->baseAddrMain;
        GX_GetOBJVRamModeChar();
    } else {
        baseAddr = task->baseAddrSub;
        GXS_GetOBJVRamModeChar();
    }
    NNS_G2dLoadImageVramTransfer(task->charData, baseAddr, vram, &task->imageProxy);
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        GX_GetOBJVRamModeChar();
    } else {
        GXS_GetOBJVRamModeChar();
    }
}

static ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state == OBJ_CHAR_TRANSFER_TASK_INIT) {
            return &sObjCharTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

static void ObjCharTransfer_GetVramCapacityByBank(void) {
    switch (GX_GetBankForOBJ()) {
    case GX_VRAM_OBJ_NONE:
        sObjCharTransferTasksManager->vramCapacityMain = 0;
        break;
    case GX_VRAM_OBJ_16_F:
    case GX_VRAM_OBJ_16_G:
        sObjCharTransferTasksManager->vramCapacityMain = 16 * 1024;
        break;
    case GX_VRAM_OBJ_32_FG:
        sObjCharTransferTasksManager->vramCapacityMain = 32 * 1024;
        break;
    case GX_VRAM_OBJ_64_E:
        sObjCharTransferTasksManager->vramCapacityMain = 64 * 1024;
        break;
    case GX_VRAM_OBJ_80_EF:
    case GX_VRAM_OBJ_80_EG:
        sObjCharTransferTasksManager->vramCapacityMain = 80 * 1024;
        break;
    case GX_VRAM_OBJ_96_EFG:
        sObjCharTransferTasksManager->vramCapacityMain = 96 * 1024;
        break;
    case GX_VRAM_OBJ_128_A:
    case GX_VRAM_OBJ_128_B:
        sObjCharTransferTasksManager->vramCapacityMain = 128 * 1024;
        break;
    case GX_VRAM_OBJ_256_AB:
        sObjCharTransferTasksManager->vramCapacityMain = 256 * 1024;
        break;
    default:
        sObjCharTransferTasksManager->vramCapacityMain = 0;
        break;
    }

    switch (GX_GetBankForSubOBJ()) {
    case GX_VRAM_SUB_OBJ_NONE:
        sObjCharTransferTasksManager->vramCapacitySub = 0;
        break;
    case GX_VRAM_SUB_OBJ_16_I:
        sObjCharTransferTasksManager->vramCapacitySub = 16 * 1024;
        break;
    case GX_VRAM_SUB_OBJ_128_D:
        sObjCharTransferTasksManager->vramCapacitySub = 128 * 1024;
        break;
    default:
        sObjCharTransferTasksManager->vramCapacitySub = 0;
        break;
    }

    int sizeToReserve = ObjCharTransfer_GetBlockMemOffset(sObjCharTransferTasksManager->numBlocksMain, sObjCharTransferTasksManager->blockSizeMain);
    sObjCharTransferTasksManager->freeSizeMain = sObjCharTransferTasksManager->vramCapacityMain - sizeToReserve;
    sizeToReserve = ObjCharTransfer_GetBlockMemOffset(sObjCharTransferTasksManager->numBlocksSub, sObjCharTransferTasksManager->blockSizeSub);
    sObjCharTransferTasksManager->freeSizeSub = sObjCharTransferTasksManager->vramCapacitySub - sizeToReserve;
    GF_ASSERT(sObjCharTransferTasksManager->freeSizeMain >= 0 && sObjCharTransferTasksManager->freeSizeSub >= 0);
    GF_ASSERT(sObjCharTransferTasksManager->freeSizeMain >= 0 && sObjCharTransferTasksManager->freeSizeSub >= 0); // they wanted to be doubly sure
}

static void ObjCharTransfer_ClearBothScreensBlockBufs(void) {
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufMain);
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufSub);
}

static void ObjCharTransfer_InitBlocksTransferBuffers(u32 numBlocksMain, u32 numBlocksSub, enum HeapID heapID) {
    sObjCharTransferTasksManager->numBlocksMain = numBlocksMain;
    sObjCharTransferTasksManager->numBlocksSub = numBlocksSub;
    if (sObjCharTransferTasksManager->blockBufMain != NULL) {
        Heap_Free(sObjCharTransferTasksManager->blockBufMain);
    }
    if (sObjCharTransferTasksManager->blockBufSub != NULL) {
        Heap_Free(sObjCharTransferTasksManager->blockBufSub);
    }
    if (sObjCharTransferTasksManager->numBlocksMain != 0) {
        sObjCharTransferTasksManager->blockBufMain = Heap_Alloc(heapID, numBlocksMain / 8);
    }
    if (sObjCharTransferTasksManager->numBlocksSub != 0) {
        sObjCharTransferTasksManager->blockBufSub = Heap_Alloc(heapID, numBlocksSub / 8);
    }
    ObjCharTransfer_ClearBothScreensBlockBufs();
}

static void ObjCharTransfer_FreeBlockTransferBuffer(u8 *buffer) {
    if (buffer != NULL) {
        if (buffer == sObjCharTransferTasksManager->blockBufMain) {
            sObjCharTransferTasksManager->numBlocksMain = 0;
            Heap_Free(buffer);
        } else {
            sObjCharTransferTasksManager->numBlocksSub = 0;
            Heap_Free(buffer);
        }
    }
}

static u32 ObjCharTransfer_GetBlocksCountFromBufferPtr(u8 *buffer) {
    if (buffer == sObjCharTransferTasksManager->blockBufMain) {
        return sObjCharTransferTasksManager->numBlocksMain;
    } else {
        return sObjCharTransferTasksManager->numBlocksSub;
    }
}

static void ObjCharTransfer_ClearBlockBuf(u8 *buff) {
    if (buff != NULL) {
        memset(buff, 0, ObjCharTransfer_GetBlocksCountFromBufferPtr(buff) / 8);
    }
}

static void ObjCharTransfer_ReserveTransferBlocks(u32 blockStart, u32 numBlocks, u8 *buffer) {
    if (buffer != NULL) {
        u32 blocksMax = ObjCharTransfer_GetBlocksCountFromBufferPtr(buffer);
        u32 blockEnd = blockStart + numBlocks;
        for (int i = blockStart; i < blockEnd; ++i) {
            if (i >= blocksMax) {
                break;
            }
            u32 byteIndex;
            u8 bitIndex;
            ObjCharTransfer_BitPositionToByteAndBitIndexPair(i, &byteIndex, &bitIndex);
            GF_ASSERT(!(buffer[byteIndex] & (1 << bitIndex)));
            u8 mask = 1 << bitIndex;
            buffer[byteIndex] |= mask;
        }
    }
}

static u32 ObjCharTransfer_FindAvailableTransferBlock(u32 reserveSize, u8 *buffer) {
    if (buffer != NULL) {
        u32 blocksMax = ObjCharTransfer_GetBlocksCountFromBufferPtr(buffer);
        for (int i = 0; i < blocksMax; ++i) {
            u32 bitIndex;
            u8 byteIndex;
            ObjCharTransfer_BitPositionToByteAndBitIndexPair(i, &bitIndex, &byteIndex);
            u8 mask = 1 << byteIndex;
            int j = 0;
            while ((buffer[bitIndex] & mask) == 0 && j <= reserveSize) {
                int num = i + j;
                ObjCharTransfer_BitPositionToByteAndBitIndexPair(num, &bitIndex, &byteIndex);
                mask = 1 << byteIndex;
                if (num >= blocksMax) {
                    return -1;
                }
                ++j;
            }
            if (j > reserveSize) {
                return i;
            }
            i += j;
        }
    }
    return -1;
}

static void ObjCharTransfer_ResetBlockTransferFlagsEx(u32 blockStart, u32 blockMax, u8 *buffer) {
    if (buffer != NULL) {
        u32 blockEnd = blockStart + blockMax;
        for (int i = blockStart; i < blockEnd; ++i) {
            u32 byte;
            u8 bitIndex;
            ObjCharTransfer_BitPositionToByteAndBitIndexPair(i, &byte, &bitIndex);
            GF_ASSERT(buffer[byte] & (1 << bitIndex));
            u8 mask = (1 << bitIndex) ^ 0xFF;
            buffer[byte] &= mask;
        }
    }
}

static void ObjCharTransferTask_ResetBlockTransferFlags(ObjCharTransferTask *task) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        u32 loc = NNS_G2dGetImageLocation(&task->imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN);
        u32 blockCur = ObjCharTransfer_CalcBlockNumLimit(loc - sObjCharTransferTasksManager->freeSizeMain, sObjCharTransferTasksManager->blockSizeMain);
        u32 blockMax = ObjCharTransfer_CalcBlockNumLimit(task->sizeMain, sObjCharTransferTasksManager->blockSizeMain);
        ObjCharTransfer_ResetBlockTransferFlagsEx(blockCur, blockMax, sObjCharTransferTasksManager->blockBufMain);
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        u32 loc = NNS_G2dGetImageLocation(&task->imageProxy, NNS_G2D_VRAM_TYPE_2DSUB);
        u32 blockCur = ObjCharTransfer_CalcBlockNumLimit(loc - sObjCharTransferTasksManager->freeSizeSub, sObjCharTransferTasksManager->blockSizeSub);
        u32 blockMax = ObjCharTransfer_CalcBlockNumLimit(task->sizeSub, sObjCharTransferTasksManager->blockSizeSub);
        ObjCharTransfer_ResetBlockTransferFlagsEx(blockCur, blockMax, sObjCharTransferTasksManager->blockBufSub);
    }
    task->needResetBlockTransferFlags = FALSE;
}

int ObjCharTransfer_GetBlockSizeFromMode(GXOBJVRamModeChar mode) {
    switch (mode) {
    case GX_OBJVRAMMODE_CHAR_1D_32K:
        return 1;
    case GX_OBJVRAMMODE_CHAR_1D_64K:
        return 2;
    case GX_OBJVRAMMODE_CHAR_1D_128K:
        return 4;
    case GX_OBJVRAMMODE_CHAR_1D_256K:
        return 8;
    default:
        return 1;
    }
}

static int ObjCharTransfer_AlignToBlock(int size, int blockSize, BOOL alignRight) {
    blockSize *= 32;
    if (size % blockSize) {
        size -= (size % blockSize);
        if (alignRight == TRUE) {
            size += blockSize;
        }
    }
    return size;
}

static u32 ObjCharTransfer_CalcBlockNumLimit(int size, int blockSize) {
    return size / 32 / blockSize;
}

static int ObjCharTransfer_GetBlockMemOffset(int blockNum, int blockSize) {
    return blockNum * blockSize * 32;
}

static BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub) {
    BOOL result = TRUE;
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        if (sObjCharTransferTasksManager->offsetMain + size > sObjCharTransferTasksManager->freeSizeMain) {
            GF_ASSERT(FALSE);
            result = FALSE;
        } else {
            *pOffsetMain = sObjCharTransferTasksManager->offsetMain;
        }
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        if (sObjCharTransferTasksManager->offsetSub + size > sObjCharTransferTasksManager->freeSizeSub) {
            GF_ASSERT(FALSE);
            result = FALSE;
        } else {
            *pOffsetSub = sObjCharTransferTasksManager->offsetSub;
        }
    }
    return result;
}

static void ObjCharTransfer_ReserveVramSpace(u32 size, NNS_G2D_VRAM_TYPE vram) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        sObjCharTransferTasksManager->offsetMain += size;
        sObjCharTransferTasksManager->offsetMain = ObjCharTransfer_AlignToBlock(sObjCharTransferTasksManager->offsetMain, sObjCharTransferTasksManager->blockSizeMain, 1);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        sObjCharTransferTasksManager->offsetSub += size;
        sObjCharTransferTasksManager->offsetSub = ObjCharTransfer_AlignToBlock(sObjCharTransferTasksManager->offsetSub, sObjCharTransferTasksManager->blockSizeSub, 1);
    }
}

static void ObjCharTransfer_BitPositionToByteAndBitIndexPair(int arrayBitIndex, u32 *byteIndex, u8 *bitIndex) {
    *byteIndex = arrayBitIndex >> 3;
    *bitIndex = arrayBitIndex & 7;
}

static void ObjCharTransferInternal_BoundsFixOffsetAndSize(u32 baseOffset, u32 curOffset, u32 size, int *correctedOffset, int *correctedSize) {
    *correctedOffset = curOffset - baseOffset;
    if (*correctedOffset < 0) {
        *correctedSize = size + *correctedOffset;
        *correctedOffset = 0;
    } else {
        *correctedSize = size;
    }
}
