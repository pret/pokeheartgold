#include "obj_pltt_transfer.h"

#include "global.h"

#include "vram_transfer_manager.h"

typedef struct ObjPlttTransferTask {
    NNSG2dPaletteData *plttData;
    NNS_G2D_VRAM_TYPE vram;
    u32 plttSize;
    int resID;
    NNSG2dImagePaletteProxy plttProxy;
    u32 baseAddrMain;
    u32 baseAddrSub;
    u8 active;
} ObjPlttTransferTask;

typedef struct ObjPlttTransferTasksManager {
    ObjPlttTransferTask *tasks;
    int numTasks;
    u8 filler_08[0x4];
    u32 posMain;
    u32 posSub;
    u32 extPosMain;
    u32 extPosSub;
    u32 extSizeMain;
    u32 extSizeSub;
    u16 blocksMain; // flagsMain?
    u16 blocksSub;  // flagsSub?
} ObjPlttTransferTasksManager;

static ObjPlttTransferTasksManager *sObjPlttTransferTasksManager;

static void ObjPlttTransfer_HandleError(void);
static BOOL ObjPlttTransfer_TaskExistsByID(int resId);
static void ObjPlttTransfer_FreeAllTasks(void);
static void ObjPlttTransferTask_Reset(ObjPlttTransferTask *task);
static BOOL ObjPlttTransfer_InitFromTemplate(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task);
static void ObjPlttTransferTask_Init(ObjPlttTransferTask *task);
static BOOL ObjPlttTransfer_ReserveAndTransfer_HandleExtPltt(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task);
static BOOL ObjCharTransfer_ReserveAndTransfer_ExtPlttBanned(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task);
static ObjPlttTransferTask *ObjPlttTransfer_GetTaskByID(int resID);
static void ObjPlttTransfer_GetExtPlttSize(void);
static void ObjPlttTransferTask_PushToVRam_UpdateSzByte(ObjPlttTransferTask *task);
static void ObjPlttTransferTask_PushToVRam(ObjPlttTransferTask *task);
static void setBlockBits(u16 *addr, int num, int offset);
static void resetBlockBits(u16 *addr, int num, int offset);
static u32 ObjPlttTransfer_GetFreePlttLoadAddr(u16 blocks, int num);
static void ObjPlttTransfer_ReleaseAllBlocks(ObjPlttTransferTasksManager *manager);
static ObjPlttTransferTask *ObjPlttTransfer_GetFreeTask(void);
static void ObjPlttTransferTask_AcquireBlocks(ObjPlttTransferTask *task);
static void ObjPlttTransferTask_ReleaseBlocks(ObjPlttTransferTask *task);
static BOOL ObjPlttTransferTask_CheckAllocBlocks(ObjPlttTransferTask *task, u32 blockAddrMain, u32 blockAddrSub, u32 sizeMain, u32 sizeSub);
static void ObjPlttTransferTask_ReserveBlocks(ObjPlttTransferTask *task, u32 *pBlockAddrMain, u32 *pBlockAddrSub);

void ObjPlttTransfer_Init(int num, enum HeapID heapID) {
    if (sObjPlttTransferTasksManager == NULL) {
        sObjPlttTransferTasksManager = Heap_Alloc(heapID, sizeof(ObjPlttTransferTasksManager));
        MI_CpuClear32(sObjPlttTransferTasksManager, sizeof(ObjPlttTransferTasksManager));
        sObjPlttTransferTasksManager->numTasks = num;
        sObjPlttTransferTasksManager->tasks = Heap_Alloc(heapID, num * sizeof(ObjPlttTransferTask));
        for (int i = 0; i < num; ++i) {
            ObjPlttTransferTask_Init(&sObjPlttTransferTasksManager->tasks[i]);
        }
    }
}

void ObjPlttTransfer_SetReservedRegion(u32 flag, NNS_G2D_VRAM_TYPE type) {
    if (type == NNS_G2D_VRAM_TYPE_2DMAIN) {
        sObjPlttTransferTasksManager->blocksMain |= flag;
    } else if (type == NNS_G2D_VRAM_TYPE_2DSUB) {
        sObjPlttTransferTasksManager->blocksSub |= flag;
    }
}

void ObjPlttTransfer_Destroy(void) {
    if (sObjPlttTransferTasksManager != NULL) {
        ObjPlttTransfer_FreeAllTasks();
        Heap_Free(sObjPlttTransferTasksManager->tasks);
        Heap_Free(sObjPlttTransferTasksManager);
        sObjPlttTransferTasksManager = NULL;
    }
}

static void ObjPlttTransfer_HandleError(void) {
}

void ObjPlttTransfer_Reset(void) {
    sObjPlttTransferTasksManager->posMain = 0;
    sObjPlttTransferTasksManager->posSub = 0;
    sObjPlttTransferTasksManager->extPosMain = 0;
    sObjPlttTransferTasksManager->extPosSub = 0;
    ObjPlttTransfer_GetExtPlttSize();
    ObjPlttTransfer_ReleaseAllBlocks(sObjPlttTransferTasksManager);
}

BOOL ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_HandleExtPltt(const ObjPlttTransferTaskTemplate *template) {
    ObjPlttTransferTask *task = ObjPlttTransfer_GetFreeTask();
    if (task == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    if (!ObjPlttTransfer_InitFromTemplate(template, task)) {
        return FALSE;
    }

    if (!ObjPlttTransfer_ReserveAndTransfer_HandleExtPltt(template, task)) {
        ObjPlttTransfer_FreeTaskByID(template->id);
        return FALSE;
    }

    ObjPlttTransferTask_AcquireBlocks(task);
    return TRUE;
}

BOOL ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_ExtPlttBanned(const ObjPlttTransferTaskTemplate *template) {
    ObjPlttTransferTask *task = ObjPlttTransfer_GetFreeTask();
    if (task == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    if (!ObjPlttTransfer_InitFromTemplate(template, task)) {
        return FALSE;
    }

    if (!ObjCharTransfer_ReserveAndTransfer_ExtPlttBanned(template, task)) {
        ObjPlttTransfer_FreeTaskByID(template->id);
        return FALSE;
    }

    return TRUE;
}

void ObjPlttTransfer_CreateTransferTask(int resID, NNSG2dPaletteData *plttData) {
    GF_ASSERT(plttData != NULL);
    ObjPlttTransferTask *task = ObjPlttTransfer_GetTaskByID(resID);
    GF_ASSERT(task != NULL);
    task->plttData = plttData;
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_PLTT_MAIN, task->baseAddrMain, plttData->pRawData, task->plttSize * 32);
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_PLTT_SUB, task->baseAddrSub, plttData->pRawData, task->plttSize * 32);
    }
}

static BOOL ObjPlttTransfer_TaskExistsByID(int resId) {
    return ObjPlttTransfer_GetTaskByID(resId) != NULL;
}

void ObjPlttTransfer_FreeTaskByID(int resId) {
    ObjPlttTransferTask *task = ObjPlttTransfer_GetTaskByID(resId);
    GF_ASSERT(task != NULL);
    if (task->active == TRUE) {
        ObjPlttTransferTask_ReleaseBlocks(task);
        ObjPlttTransferTask_Reset(task);
    }
}

static void ObjPlttTransfer_FreeAllTasks(void) {
    for (int i = 0; i < sObjPlttTransferTasksManager->numTasks; ++i) {
        if (sObjPlttTransferTasksManager->tasks[i].active == TRUE) {
            ObjPlttTransferTask_ReleaseBlocks(&sObjPlttTransferTasksManager->tasks[i]);
            ObjPlttTransferTask_Reset(&sObjPlttTransferTasksManager->tasks[i]);
        }
    }
}

NNSG2dImagePaletteProxy *ObjPlttTransfer_GetPlttProxyByID(int resID) {
    ObjPlttTransferTask *task = ObjPlttTransfer_GetTaskByID(resID);
    if (task == NULL) {
        GF_ASSERT(task != NULL);
        return NULL;
    }

    if (task->active == TRUE) {
        return &task->plttProxy;
    }

    return NULL;
}

NNSG2dImagePaletteProxy *ObjPlttTransfer_GetPlttProxyByID_UpdateRefProxyExtFlag(int resID, NNSG2dImageProxy *imageProxy) {
    ObjPlttTransferTask *task = ObjPlttTransfer_GetTaskByID(resID);
    if (task == NULL) {
        GF_ASSERT(task != NULL);
        return NULL;
    }

    if (task->active != TRUE) {
        return NULL;
    }

    if (task->plttData->bExtendedPlt) {
        NNS_G2dSetImageExtPaletteFlag(imageProxy, TRUE);
    }

    return &task->plttProxy;
}

u32 ObjPlttTransfer_GetPaletteVramOffset(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType) {
    u32 plttSize;

    if (proxy->bExtendedPlt) {
        plttSize = 0x200;
    } else if (proxy->fmt == GX_TEXFMT_PLTT256) {
        plttSize = 0;
    } else {
        plttSize = 0x20;
    }
    if (plttSize != 0) {
        return NNS_G2dGetImagePaletteLocation(proxy, vramType) / plttSize;
    }

    return 0;
}

static void ObjPlttTransferTask_Reset(ObjPlttTransferTask *task) {
    ObjPlttTransferTask_Init(task);
}

static BOOL ObjPlttTransfer_InitFromTemplate(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task) {
    task->plttData = template->plttData;
    if (ObjPlttTransfer_TaskExistsByID(template->id) == TRUE) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    task->resID = template->id;
    task->vram = template->vram;
    task->active = TRUE;
    task->plttSize = template->plttNum;
    return TRUE;
}

static void ObjPlttTransferTask_Init(ObjPlttTransferTask *task) {
    memset(task, 0, sizeof(ObjPlttTransferTask));
    task->resID = -1;
    NNS_G2dInitImagePaletteProxy(&task->plttProxy);
}

static BOOL ObjPlttTransfer_ReserveAndTransfer_HandleExtPltt(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task) {
    u32 sizeMain;
    u32 sizeSub;
    u32 *pPosMain;
    u32 *pPosSub;

    if (task->plttData->bExtendedPlt) {
        pPosMain = &sObjPlttTransferTasksManager->extPosMain;
        sizeMain = sObjPlttTransferTasksManager->extSizeMain;
        pPosSub = &sObjPlttTransferTasksManager->extPosSub;
        sizeSub = sObjPlttTransferTasksManager->extSizeSub;
    } else {
        pPosMain = &sObjPlttTransferTasksManager->posMain;
        sizeMain = 0x200;
        pPosSub = &sObjPlttTransferTasksManager->posSub;
        sizeSub = 0x200;
    }
    ObjPlttTransferTask_CheckAllocBlocks(task, *pPosMain, *pPosSub, sizeMain, sizeSub);
    ObjPlttTransferTask_PushToVRam_UpdateSzByte(task);
    ObjPlttTransferTask_ReserveBlocks(task, pPosMain, pPosSub);
    return TRUE;
}

static BOOL ObjCharTransfer_ReserveAndTransfer_ExtPlttBanned(const ObjPlttTransferTaskTemplate *template, ObjPlttTransferTask *task) {
    u32 loadAddrMain;
    u32 loadAddrSub;
    GF_ASSERT(!task->plttData->bExtendedPlt);
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        loadAddrMain = ObjPlttTransfer_GetFreePlttLoadAddr(sObjPlttTransferTasksManager->blocksMain, task->plttSize);
        if (loadAddrMain == -1) {
            return FALSE;
        }
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        loadAddrSub = ObjPlttTransfer_GetFreePlttLoadAddr(sObjPlttTransferTasksManager->blocksSub, task->plttSize);
        if (loadAddrSub == -1) {
            return FALSE;
        }
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        task->baseAddrMain = loadAddrMain;
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        task->baseAddrSub = loadAddrSub;
    }
    task->plttData->szByte = 0x20 * task->plttSize;
    ObjPlttTransferTask_PushToVRam(task);
    ObjPlttTransferTask_AcquireBlocks(task);
    return TRUE;
}

static ObjPlttTransferTask *ObjPlttTransfer_GetTaskByID(int resID) {
    for (int i = 0; i < sObjPlttTransferTasksManager->numTasks; ++i) {
        if (sObjPlttTransferTasksManager->tasks[i].resID == resID) {
            return &sObjPlttTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

static ObjPlttTransferTask *ObjPlttTransfer_GetFreeTask(void) {
    for (int i = 0; i < sObjPlttTransferTasksManager->numTasks; ++i) {
        if (!sObjPlttTransferTasksManager->tasks[i].active) {
            return &sObjPlttTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

static void ObjPlttTransfer_GetExtPlttSize(void) {
    switch (GX_GetBankForOBJExtPltt()) {
    case GX_VRAM_OBJEXTPLTT_0_F:
    case GX_VRAM_OBJEXTPLTT_0_G:
        sObjPlttTransferTasksManager->extSizeMain = 0x2000;
        break;
    default:
        sObjPlttTransferTasksManager->extSizeMain = 0;
        break;
    }

    switch (GX_GetBankForSubOBJExtPltt()) {
    case GX_VRAM_SUB_OBJEXTPLTT_0_I:
        sObjPlttTransferTasksManager->extSizeSub = 0x2000;
        break;
    default:
        sObjPlttTransferTasksManager->extSizeSub = 0;
        break;
    }
}

static void ObjPlttTransferTask_PushToVRam_UpdateSzByte(ObjPlttTransferTask *task) {
    task->plttData->szByte = task->plttSize * 32;
    ObjPlttTransferTask_PushToVRam(task);
}

static void ObjPlttTransferTask_PushToVRam(ObjPlttTransferTask *task) {
    NNS_G2dInitImagePaletteProxy(&task->plttProxy);
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        NNS_G2dLoadPalette(task->plttData, task->baseAddrMain, NNS_G2D_VRAM_TYPE_2DMAIN, &task->plttProxy);
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        NNS_G2dLoadPalette(task->plttData, task->baseAddrSub, NNS_G2D_VRAM_TYPE_2DSUB, &task->plttProxy);
    }
}

static void setBlockBits(u16 *addr, int num, int offset) {
    for (int i = 0; i < num; ++i) {
        *addr |= 1 << (offset + i);
    }
}

static void resetBlockBits(u16 *addr, int num, int offset) {
    for (int i = 0; i < num; ++i) {
        *addr &= ~(1 << (offset + i));
    }
}

static u32 ObjPlttTransfer_GetFreePlttLoadAddr(u16 blocks, int num) {
    int i;
    int j;

    for (i = 0; i < 16; ++i) {
        for (j = 0; !(blocks & (1 << (i + j))) && j < num; ++j) {
            if (i + j >= 16) {
                break;
            }
        }
        if (j >= num) {
            break;
        }
        i += j;
    }
    if (i >= 16) {
        return -1;
    }

    return i * 32;
}

static void ObjPlttTransfer_ReleaseAllBlocks(ObjPlttTransferTasksManager *manager) {
    manager->blocksMain = 0;
    manager->blocksSub = 0;
}

static void ObjPlttTransferTask_AcquireBlocks(ObjPlttTransferTask *task) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        setBlockBits(&sObjPlttTransferTasksManager->blocksMain, task->plttSize, task->baseAddrMain / 32);
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        setBlockBits(&sObjPlttTransferTasksManager->blocksSub, task->plttSize, task->baseAddrSub / 32);
    }
}

static void ObjPlttTransferTask_ReleaseBlocks(ObjPlttTransferTask *task) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        resetBlockBits(&sObjPlttTransferTasksManager->blocksMain, task->plttSize, task->baseAddrMain / 32);
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        resetBlockBits(&sObjPlttTransferTasksManager->blocksSub, task->plttSize, task->baseAddrSub / 32);
    }
}

static BOOL ObjPlttTransferTask_CheckAllocBlocks(ObjPlttTransferTask *task, u32 blockAddrMain, u32 blockAddrSub, u32 sizeMain, u32 sizeSub) {
    BOOL ret = TRUE;

    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        if (blockAddrMain + task->plttSize * 32 > sizeMain) {
            GF_ASSERT(FALSE);
            ObjPlttTransfer_HandleError();
            ret = FALSE;
        } else {
            task->baseAddrMain = blockAddrMain;
        }
    }

    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        if (blockAddrSub + task->plttSize * 32 > sizeSub) {
            GF_ASSERT(FALSE);
            ObjPlttTransfer_HandleError();
            ret = FALSE;
        } else {
            task->baseAddrSub = blockAddrSub;
        }
    }

    return ret;
}

static void ObjPlttTransferTask_ReserveBlocks(ObjPlttTransferTask *task, u32 *pBlockAddrMain, u32 *pBlockAddrSub) {
    if (task->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        *pBlockAddrMain += task->plttSize * 32;
    }
    if (task->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        *pBlockAddrSub += task->plttSize * 32;
    }
}
