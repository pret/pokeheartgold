#include "global.h"
#include "obj_char_transfer.h"
#include "vram_transfer_manager.h"

typedef enum ObjCharTransferTaskState {
    OBJ_CHAR_TRANSFER_TASK_INIT,
    OBJ_CHAR_TRANSFER_TASK_1,
    OBJ_CHAR_TRANSFER_TASK_2,
    OBJ_CHAR_TRANSFER_TASK_3,
    OBJ_CHAR_TRANSFER_TASK_4,
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
    BOOL unk_44;
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
} *sObjCharTransferTasksManager;

BOOL ObjCharTransfer_TaskExistsByID(int resId);
void sub_020218D4(void);
void ObjCharTransferTask_Init(ObjCharTransferTask *task);
BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *template, ObjCharTransferTask *task);
BOOL sub_02021C9C(ObjCharTransferTask *task);
ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn);
BOOL sub_02021CCC(ObjCharTransferTask *task);
BOOL sub_02021D00(ObjCharTransferTask *task);
void sub_02021D58(ObjCharTransferTask *task);
ObjCharTransferTask *ObjCharTransfer_GetTaskByID(int resId);
GXOBJVRamModeChar ObjCharTransferTask_SetMappingTypeFromHW(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
void ObjCharTransferTask_SetBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub);
BOOL sub_02021DE4(int vram, u32 *pOffsetMain, u32 *pOffsetSub, u32 size, u32 *freeSpaceMain, u32 *freeSpaceSub);  // a0 should be NNS_G2D_VRAM_TYPE but needs to be int in order to match
void sub_02021E90(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub);
void sub_02021EC0(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 a3, u32 a4);
void sub_02021F28(ObjCharTransferTask *task);
void sub_02021F54(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
void sub_02021FB0(ObjCharTransferTask *task);
void sub_02021FDC(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram);
ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void);
void ObjCharTransfer_GetVramCapacityByBank(void);
void ObjCharTransfer_InitBlocksTransferBuffers(u32 numBlocksMain, u32 numBlocksSub, HeapID heapID);
void sub_020221B4(void);
void ObjCharTransfer_FreeBlockTransferBuffer(u8 *a0);
u32 ObjCharTransfer_GetBlocksCountFromBufferPtr(u8 *buffer);
void ObjCharTransfer_ClearBlockBuf(u8 *buffer);
void ObjCharTransfer_ReserveTransferBlocks(u32 blockStart, u32 numBlocks, u8 *buffer);
u32 ObjCharTransfer_FindAvailableTransferBlock(u32 numBlocksUsed, u8 *buffer);
void ObjCharTransfer_ResetBlockTransferFlagsEx(u32 blockStart, u32 blockMax, u8 *buffer);
void ObjCharTransferTask_ResetBlockTransferFlags(ObjCharTransferTask *task);
int ObjCharTransfer_AlignToBlock(int size, int blockSize, BOOL alignRight);
u32 ObjCharTransfer_CalcBlockNumLimit(int size, int blockSize);
int ObjCharTransfer_GetBlockMemOffset(int blockNum, int blockSize);
BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub);
void ObjCharTransfer_ReserveVramSpace(u32 size, NNS_G2D_VRAM_TYPE vram);
void ObjCharTransfer_BitPositionToByteAndBitIndexPair(int arrayBitIndex, u32 *byteIndex, u8 *bitIndex);
void sub_0202256C(u32 a0, u32 a1, u32 a2, int *a3, int *a4);

void ObjCharTransfer_Init(ObjCharTransferTemplate *template) {
    ObjCharTransfer_InitEx(template, GX_GetOBJVRamModeChar(), GXS_GetOBJVRamModeChar());
}

void ObjCharTransfer_InitEx(ObjCharTransferTemplate *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub) {
    if (sObjCharTransferTasksManager == NULL) {
        sObjCharTransferTasksManager = AllocFromHeap(template->heapId, sizeof(struct ObjCharTransferTasksManager));
        MI_CpuClear32(sObjCharTransferTasksManager, sizeof(struct ObjCharTransferTasksManager));
        sObjCharTransferTasksManager->max = template->maxTasks;
        sObjCharTransferTasksManager->tasks = (ObjCharTransferTask *)AllocFromHeap(template->heapId, sizeof(ObjCharTransferTask) * sObjCharTransferTasksManager->max);
        for (int i = 0; i < template->maxTasks; ++i) {
            ObjCharTransferTask_Init(&sObjCharTransferTasksManager->tasks[i]);
        }
        sObjCharTransferTasksManager->blockSizeMain = ObjCharTransfer_GetBlockSizeFromMode(modeMain);
        sObjCharTransferTasksManager->blockSizeSub = ObjCharTransfer_GetBlockSizeFromMode(modeSub);
        GX_SetOBJVRamModeChar(modeMain);
        GXS_SetOBJVRamModeChar(modeSub);
        int numBlocksMain = ObjCharTransfer_CalcBlockNumLimit(template->sizeMain, sObjCharTransferTasksManager->blockSizeMain);
        int numBlocksSub = ObjCharTransfer_CalcBlockNumLimit(template->sizeSub, sObjCharTransferTasksManager->blockSizeSub);
        ObjCharTransfer_InitBlocksTransferBuffers(numBlocksMain, numBlocksSub, template->heapId);
    }
}

void ObjCharTransfer_Destroy(void) {
    if (sObjCharTransferTasksManager != NULL) {
        ObjCharTransfer_FreeBlockTransferBuffer(sObjCharTransferTasksManager->blockBufMain);
        ObjCharTransfer_FreeBlockTransferBuffer(sObjCharTransferTasksManager->blockBufSub);
        sub_020218D4();
        FreeToHeap(sObjCharTransferTasksManager->tasks);
        FreeToHeap(sObjCharTransferTasksManager);
        sObjCharTransferTasksManager = NULL;
    }
}

void sub_020216C8(void) {
    sObjCharTransferTasksManager->offsetMain = 0;
    sObjCharTransferTasksManager->offsetSub = 0;
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufMain);
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufSub);
    ObjCharTransfer_GetVramCapacityByBank();
}

void sub_020216F4(u32 offset, u32 size, NNS_G2D_VRAM_TYPE vram) {
    int newOffset;
    int sp4;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        sub_0202256C(sObjCharTransferTasksManager->freeSizeMain, offset, size, &newOffset, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DMAIN, newOffset, 0, sp4, 0);
        }
    } else {
        sub_0202256C(sObjCharTransferTasksManager->freeSizeSub, offset, size, &newOffset, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DSUB, 0, newOffset, 0, sp4);
        }
    }
}

BOOL sub_02021758(const ObjCharTransferTaskTemplate *template) {
    GF_ASSERT(ObjCharTransfer_TaskExistsByID(template->id) != TRUE);
    ObjCharTransferTask *sub = ObjCharTransfer_GetFreeTask();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!ObjCharTransferTask_InitFromTemplate(template, sub)) {
        return FALSE;
    }
    if (!sub_02021C9C(sub)) {
        sub_02021884(sub->resId);
        return FALSE;
    }
    ++sObjCharTransferTasksManager->num;
    return TRUE;
}

BOOL sub_020217B0(const ObjCharTransferTaskTemplate *template) {
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
    if (!sub_02021C9C(sub)) {
        sub_02021884(sub->resId);
        return FALSE;
    }
    ++sObjCharTransferTasksManager->num;
    return TRUE;
}

BOOL ObjCharTransfer_TaskExistsByID(int resId) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (resId == sObjCharTransferTasksManager->tasks[i].resId) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_0202183C(int id, NNSG2dCharacterData *charData) {
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

void sub_02021884(int resId) {
    ObjCharTransferTask *sub;
    BOOL r5 = TRUE;
    do {
        sub = ObjCharTransfer_GetTaskByID(resId);
        GF_ASSERT(sub != NULL);
        if (sub->state == 4) {
            sub_02021A50(&sub->imageProxy);
        } else {
            r5 = FALSE;
        }
    } while (r5);
    if (sub->state != 0) {
        sub_02021D58(sub);
        --sObjCharTransferTasksManager->num;
    }
}

void sub_020218D4(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state != 0) {
            sub_02021D58(&sObjCharTransferTasksManager->tasks[i]);
            --sObjCharTransferTasksManager->num;
        }
    }
}

NNSG2dImageProxy *sub_02021910(int resId) {
    ObjCharTransferTask *sub = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(sub != NULL);
    if (sub->state == 0) {
        return NULL;
    }

    return &sub->imageProxy;
}

NNSG2dImageProxy *sub_02021934(int resId, u32 size) {
    ObjCharTransferTask *task = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(task != NULL);
    if (task->state == 0) {
        return NULL;
    }
    u32 offsetMain;
    u32 offsetSub;
    u32 newSizeMain;
    u32 newSizeSub;
    sub_02021DE4(task->vram, &offsetMain, &offsetSub, size, &newSizeMain, &newSizeSub);
    if (task->state == 3) {
        return NULL;
    }
    task->state = 3;
    sub_02021E90(task, offsetMain, offsetSub);
    task->needResetBlockTransferFlags = TRUE;
    task->sizeMain = newSizeMain;
    task->sizeSub = newSizeSub;
    sub_02021FB0(task);
    sub_02021EC0(task->vram, offsetMain, offsetSub, newSizeMain, newSizeSub);

    return &task->imageProxy;
}

NNSG2dImageProxy *sub_020219B8(NNSG2dImageProxy *proxyIn) {
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
    if (task->state != 3) {
        return NULL;
    }
    *copiedTask = *task;
    copiedTask->state = 4;
    if (copiedTask->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        size = copiedTask->sizeMain;
    } else {
        size = copiedTask->sizeSub;
    }

    sub_02021DE4(copiedTask->vram, &offsetMain, &offsetSub, size, &newSizeMain, &newSizeSub);
    sub_02021E90(copiedTask, offsetMain, offsetSub);
    copiedTask->needResetBlockTransferFlags = TRUE;
    copiedTask->sizeMain = newSizeMain;
    copiedTask->sizeSub = newSizeSub;
    sub_02021FB0(copiedTask);
    sub_02021EC0(copiedTask->vram, offsetMain, offsetSub, newSizeMain, newSizeSub);

    return &copiedTask->imageProxy;
}

void sub_02021A50(const NNSG2dImageProxy *proxy) {
    int i;
    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if ((sObjCharTransferTasksManager->tasks[i].state == 3 || sObjCharTransferTasksManager->tasks[i].state == 4) && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxy)  {
            break;
        }
    }
    if (i < sObjCharTransferTasksManager->max) {
        ObjCharTransferTask_ResetBlockTransferFlags(&sObjCharTransferTasksManager->tasks[i]);
        if (sObjCharTransferTasksManager->tasks[i].state == 3) {
            sObjCharTransferTasksManager->tasks[i].state = 2;
        } else {
            sObjCharTransferTasksManager->tasks[i].state = 0;
            ObjCharTransferTask_Init(&sObjCharTransferTasksManager->tasks[i]);
        }
    }
}

BOOL sub_02021AC8(u32 size, BOOL a1, NNS_G2D_VRAM_TYPE vram, UnkStruct_02021AC8 *a3) {
    u32 offsetMain;
    u32 offsetSub;
    u32 sizeMain;
    u32 sizeSub;
    BOOL ret;

    if (a1 == 0) {
        ret = ObjCharTransfer_TryGetDestVramOffsets(size, vram, &offsetMain, &offsetSub);
        if (ret) {
            ObjCharTransfer_ReserveVramSpace(size, vram);
            a3->vram = vram;
            a3->size = size;
            a3->offset = vram == NNS_G2D_VRAM_TYPE_2DMAIN ? offsetMain : offsetSub;
            a3->unk_0A = 0;
        }
    } else {
        ret = sub_02021DE4(vram, &offsetMain, &offsetSub, size, &sizeMain, &sizeSub);
        if (ret) {
            sub_02021EC0(vram, offsetMain, offsetSub, sizeMain, sizeSub);
            a3->vram = vram;
            if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
                a3->size = sizeMain;
                a3->offset = offsetMain + sObjCharTransferTasksManager->freeSizeMain;
            } else {
                a3->size = sizeSub;
                a3->offset = offsetSub + sObjCharTransferTasksManager->freeSizeSub;
            }
            a3->unk_0A = 1;
        }
    }
    return ret;
}

void sub_02021B5C(UnkStruct_02021AC8 *a0) {
    if (a0->unk_0A != 0) {
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

ObjCharTransferTasksManager *sub_02021BD0(void) {
    GF_ASSERT(sObjCharTransferTasksManager != NULL);
    ObjCharTransferTasksManager *ret = sObjCharTransferTasksManager;
    sObjCharTransferTasksManager = NULL;
    return ret;
}

void sub_02021BEC(ObjCharTransferTasksManager *a0) {
    GF_ASSERT(sObjCharTransferTasksManager == NULL);
    sObjCharTransferTasksManager = a0;
}

void ObjCharTransferTask_Init(ObjCharTransferTask *task) {
    task->charData = NULL;
    task->vram = NNS_G2D_VRAM_TYPE_NEITHER;
    task->isTransferred = FALSE;
    task->resId = -1;
    task->baseAddrMain = 0;
    task->baseAddrSub = 0;
    task->state = 0;
    task->shouldUpdateMappingTypeFromHW = FALSE;
    NNS_G2dInitImageProxy(&task->imageProxy);
}

BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *template, ObjCharTransferTask *task) {
    task->charData = template->charData;
    task->resId = template->id;
    task->vram = template->vram;
    task->isTransferred = task->charData->characterFmt >> NNS_G2D_VRAMTRANSFERDATA_FLAG_SHIFT;
    task->unk_44 = template->unk_0C;
    task->needResetBlockTransferFlags = FALSE;
    task->sizeMain = 0;
    task->sizeSub = 0;
    return TRUE;
}

ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn) {
    int i;

    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state != 0 && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxyIn) {
            break;
        }
    }
    if (i >= sObjCharTransferTasksManager->max) {
        return NULL;
    }

    return &sObjCharTransferTasksManager->tasks[i];
}

BOOL sub_02021C9C(ObjCharTransferTask *task) {
    BOOL ret = TRUE;
    if (task->isTransferred) {
        task->state = 2;
    } else {
        task->state = 1;
        if (!task->unk_44) {
            ret = sub_02021CCC(task);
        } else {
            ret = sub_02021D00(task);
        }
    }
    return ret;
}

BOOL sub_02021CCC(ObjCharTransferTask *task) {
    u32 offsetMain;
    u32 offsetSub;
    BOOL ret = ObjCharTransfer_TryGetDestVramOffsets(task->charData->szByte, task->vram, &offsetMain, &offsetSub);
    if (ret) {
        ObjCharTransferTask_SetBaseAddrs(task, offsetMain, offsetSub);
        ObjCharTransfer_ReserveVramSpace(task->charData->szByte, task->vram);
    }
    return ret;
}

BOOL sub_02021D00(ObjCharTransferTask *task) {
    u32 offsetMain;
    u32 offsetSub;
    u32 sizeMain;
    u32 sizeSub;
    if (!sub_02021DE4(task->vram, &offsetMain, &offsetSub, task->charData->szByte, &sizeMain, &sizeSub)) {
        return FALSE;
    }
    sub_02021E90(task, offsetMain, offsetSub);
    task->needResetBlockTransferFlags = TRUE;
    task->sizeMain = sizeMain;
    task->sizeSub = sizeSub;
    sub_02021F28(task);
    sub_02021EC0(task->vram, offsetMain, offsetSub, sizeMain, sizeSub);
    return TRUE;
}

void sub_02021D58(ObjCharTransferTask *task) {
    if (task->needResetBlockTransferFlags) {
        ObjCharTransferTask_ResetBlockTransferFlags(task);
    }
    ObjCharTransferTask_Init(task);
}

ObjCharTransferTask *ObjCharTransfer_GetTaskByID(int resId) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].resId == resId) {
            return &sObjCharTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

GXOBJVRamModeChar ObjCharTransferTask_SetMappingTypeFromHW(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        task->charData->mapingType = GX_GetOBJVRamModeChar();
    } else {
        task->charData->mapingType = GXS_GetOBJVRamModeChar();
    }
    return task->charData->mapingType;
}

void ObjCharTransferTask_SetBaseAddrs(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub) {
    task->baseAddrMain = offsetMain;
    task->baseAddrSub = offsetSub;
    if (!task->isTransferred) {
        sub_02021F28(task);
    }
}

BOOL sub_02021DE4(int vram, u32 *blockNumMain, u32 *blockNumSub, u32 size, u32 *freeSpaceMain, u32 *freeSpaceSub) {
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

void sub_02021E90(ObjCharTransferTask *task, u32 offsetMain, u32 offsetSub) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        task->baseAddrMain = offsetMain + sObjCharTransferTasksManager->freeSizeMain;
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        task->baseAddrSub = offsetSub + sObjCharTransferTasksManager->freeSizeSub;
    }
}

void sub_02021EC0(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 sizeMain, u32 sizeSub) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        u32 r7 = ObjCharTransfer_CalcBlockNumLimit(sizeMain, sObjCharTransferTasksManager->blockSizeMain);
        u32 r0 = ObjCharTransfer_CalcBlockNumLimit(offsetMain, sObjCharTransferTasksManager->blockSizeMain);
        ObjCharTransfer_ReserveTransferBlocks(r0, r7, sObjCharTransferTasksManager->blockBufMain);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        u32 r7 = ObjCharTransfer_CalcBlockNumLimit(sizeSub, sObjCharTransferTasksManager->blockSizeSub);
        u32 r0 = ObjCharTransfer_CalcBlockNumLimit(offsetSub, sObjCharTransferTasksManager->blockSizeSub);
        ObjCharTransfer_ReserveTransferBlocks(r0, r7, sObjCharTransferTasksManager->blockBufSub);
    }
}

void sub_02021F28(ObjCharTransferTask *task) {
    NNS_G2dInitImageProxy(&task->imageProxy);
    if (task->vram != NNS_G2D_VRAM_TYPE_BOTH) {
        sub_02021F54(task, task->vram);
    } else {
        sub_02021F54(task, NNS_G2D_VRAM_TYPE_2DMAIN);
        sub_02021F54(task, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

void sub_02021F54(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
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

void sub_02021FB0(ObjCharTransferTask *task) {
    NNS_G2dInitImageProxy(&task->imageProxy);
    if (task->vram != NNS_G2D_VRAM_TYPE_BOTH) {
        sub_02021FDC(task, task->vram);
    } else {
        sub_02021FDC(task, NNS_G2D_VRAM_TYPE_2DMAIN);
        sub_02021FDC(task, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

void sub_02021FDC(ObjCharTransferTask *task, NNS_G2D_VRAM_TYPE vram) {
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

ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].state == 0) {
            return &sObjCharTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

void ObjCharTransfer_GetVramCapacityByBank(void) {
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
    GF_ASSERT(sObjCharTransferTasksManager->freeSizeMain >= 0 && sObjCharTransferTasksManager->freeSizeSub >= 0);  // they wanted to be doubly sure
}

void sub_020221B4(void) {
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufMain);
    ObjCharTransfer_ClearBlockBuf(sObjCharTransferTasksManager->blockBufSub);
}

void ObjCharTransfer_InitBlocksTransferBuffers(u32 numBlocksMain, u32 numBlocksSub, HeapID heapID) {
    sObjCharTransferTasksManager->numBlocksMain = numBlocksMain;
    sObjCharTransferTasksManager->numBlocksSub = numBlocksSub;
    if (sObjCharTransferTasksManager->blockBufMain != NULL) {
        FreeToHeap(sObjCharTransferTasksManager->blockBufMain);
    }
    if (sObjCharTransferTasksManager->blockBufSub != NULL) {
        FreeToHeap(sObjCharTransferTasksManager->blockBufSub);
    }
    if (sObjCharTransferTasksManager->numBlocksMain != 0) {
        sObjCharTransferTasksManager->blockBufMain = AllocFromHeap(heapID, numBlocksMain / 8);
    }
    if (sObjCharTransferTasksManager->numBlocksSub != 0) {
        sObjCharTransferTasksManager->blockBufSub = AllocFromHeap(heapID, numBlocksSub / 8);
    }
    sub_020221B4();
}

void ObjCharTransfer_FreeBlockTransferBuffer(u8 *buffer) {
    if (buffer != NULL) {
        if (buffer == sObjCharTransferTasksManager->blockBufMain) {
            sObjCharTransferTasksManager->numBlocksMain = 0;
            FreeToHeap(buffer);
        } else {
            sObjCharTransferTasksManager->numBlocksSub = 0;
            FreeToHeap(buffer);
        }
    }
}

u32 ObjCharTransfer_GetBlocksCountFromBufferPtr(u8 *buffer) {
    if (buffer == sObjCharTransferTasksManager->blockBufMain) {
        return sObjCharTransferTasksManager->numBlocksMain;
    } else {
        return sObjCharTransferTasksManager->numBlocksSub;
    }
}

void ObjCharTransfer_ClearBlockBuf(u8 *buff) {
    if (buff != NULL) {
        memset(buff, 0, ObjCharTransfer_GetBlocksCountFromBufferPtr(buff) / 8);
    }
}

void ObjCharTransfer_ReserveTransferBlocks(u32 blockStart, u32 numBlocks, u8 *buffer) {
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

u32 ObjCharTransfer_FindAvailableTransferBlock(u32 reserveSize, u8 *buffer) {
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

void ObjCharTransfer_ResetBlockTransferFlagsEx(u32 blockStart, u32 blockMax, u8 *buffer) {
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

void ObjCharTransferTask_ResetBlockTransferFlags(ObjCharTransferTask *task) {
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

int ObjCharTransfer_AlignToBlock(int size, int blockSize, BOOL alignRight) {
    blockSize *= 32;
    if (size % blockSize) {
        size -= (size % blockSize);
        if (alignRight == TRUE) {
            size += blockSize;
        }
    }
    return size;
}

u32 ObjCharTransfer_CalcBlockNumLimit(int size, int blockSize) {
    return size / 32 / blockSize;
}

int ObjCharTransfer_GetBlockMemOffset(int blockNum, int blockSize) {
    return blockNum * blockSize * 32;
}

BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub) {
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

void ObjCharTransfer_ReserveVramSpace(u32 size, NNS_G2D_VRAM_TYPE vram) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        sObjCharTransferTasksManager->offsetMain += size;
        sObjCharTransferTasksManager->offsetMain = ObjCharTransfer_AlignToBlock(sObjCharTransferTasksManager->offsetMain, sObjCharTransferTasksManager->blockSizeMain, 1);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        sObjCharTransferTasksManager->offsetSub += size;
        sObjCharTransferTasksManager->offsetSub = ObjCharTransfer_AlignToBlock(sObjCharTransferTasksManager->offsetSub, sObjCharTransferTasksManager->blockSizeSub, 1);
    }
}

void ObjCharTransfer_BitPositionToByteAndBitIndexPair(int arrayBitIndex, u32 *byteIndex, u8 *bitIndex) {
    *byteIndex = arrayBitIndex >> 3;
    *bitIndex = arrayBitIndex & 7;
}

void sub_0202256C(u32 baseOffset, u32 curOffset, u32 size, int *distance, int *a4) {
    *distance = curOffset - baseOffset;
    if (*distance < 0) {
        *a4 = size + *distance;
        *distance = 0;
    } else {
        *a4 = size;
    }
}
