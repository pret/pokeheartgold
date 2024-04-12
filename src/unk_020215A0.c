#include "global.h"
#include "unk_020215A0.h"
#include "vram_transfer_manager.h"

typedef struct ObjCharTransferTask {
    NNSG2dCharacterData *charData;
    NNS_G2D_VRAM_TYPE vram;
    u8 isTransferred;
    int resId;
    NNSG2dImageProxy imageProxy;
    u32 baseAddrMain;
    u32 baseAddrSub;
    u8 unk_3C;
    int unk_40;
    BOOL unk_44;
    int unk_48;
    u32 sizeMain;
    u32 sizeSub;
} ObjCharTransferTask;

struct ObjCharTransferTasksManager {
    ObjCharTransferTask *tasks;
    int max;
    int num;
    int offsetMain;
    int offsetSub;
    u32 unk_14;
    u32 unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
    int unk_28;
    u32 unk_2C;
    u32 unk_30;
    u8 *unk_34;
    u8 *unk_38;
} *sObjCharTransferTasksManager;

BOOL ObjCharTransfer_TaskExistsByID(int resId);
void sub_020218D4(void);
void ObjCharTransferTask_Reset(ObjCharTransferTask *a0);
BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *a0, ObjCharTransferTask *a1);
BOOL sub_02021C9C(ObjCharTransferTask *a0);
ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn);
BOOL sub_02021CCC(ObjCharTransferTask *a0);
BOOL sub_02021D00(ObjCharTransferTask *a0);
void sub_02021D58(ObjCharTransferTask *a0);
ObjCharTransferTask *ObjCharTransfer_GetTaskByID(int resId);
GXOBJVRamModeChar ObjCharTransferTask_SetMappingTypeFromHW(ObjCharTransferTask *a0, NNS_G2D_VRAM_TYPE vram);
void ObjCharTransferTask_SetBaseAddrs(ObjCharTransferTask *a0, u32 offsetMain, u32 offsetSub);
BOOL sub_02021DE4(int vram, u32 *pOffsetMain, u32 *pOffsetSub, u32 size, u32 *a4, u32 *a5);  // a0 should be NNS_G2D_VRAM_TYPE but needs to be int in order to match
void sub_02021E90(ObjCharTransferTask *a0, u32 a1, u32 a2);
void sub_02021EC0(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 a3, u32 a4);
void sub_02021F28(ObjCharTransferTask *a0);
void sub_02021F54(ObjCharTransferTask *a0, NNS_G2D_VRAM_TYPE vram);
void sub_02021FB0(ObjCharTransferTask *a0);
void sub_02021FDC(ObjCharTransferTask *a0, NNS_G2D_VRAM_TYPE vram);
ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void);
void sub_02022060(void);
void sub_020221D0(u32 a0, u32 a1, HeapID heapID);
void sub_020221B4(void);
void sub_02022238(u8 *a0);
u32 sub_02022260(u8 *a0);
void sub_02022278(u8 *a0);
void sub_02022290(u32 a0, u32 a1, u8 *a2);
u32 sub_020222EC(u32 a0, u8 *a1);
void sub_02022374(u32 a0, u32 a1, u8 *a2);
void sub_020223C4(ObjCharTransferTask *a0);
int sub_02022448(GXOBJVRamModeChar mode);
int sub_02022488(int a0, int a1, int a2);
u32 sub_020224A8(int a0, int a1);
int sub_020224B8(int a0, int a1);
BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub);
void ObjCharTransfer_ReserveVramSpace(u32 size, NNS_G2D_VRAM_TYPE vram);
void sub_02022560(int a0, u32 *a1, u8 *a2);
void sub_0202256C(u32 a0, u32 a1, u32 a2, int *a3, int *a4);

void ObjCharTransfer_Init(UnkStruct_020215A0 *template) {
    ObjCharTransfer_InitEx(template, GX_GetOBJVRamModeChar(), GXS_GetOBJVRamModeChar());
}

void ObjCharTransfer_InitEx(UnkStruct_020215A0 *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub) {
    if (sObjCharTransferTasksManager == NULL) {
        sObjCharTransferTasksManager = AllocFromHeap(template->heapId, sizeof(struct ObjCharTransferTasksManager));
        MI_CpuClear32(sObjCharTransferTasksManager, sizeof(struct ObjCharTransferTasksManager));
        sObjCharTransferTasksManager->max = template->unk_00;
        sObjCharTransferTasksManager->tasks = (ObjCharTransferTask *)AllocFromHeap(template->heapId, sizeof(ObjCharTransferTask) * sObjCharTransferTasksManager->max);
        for (int i = 0; i < template->unk_00; ++i) {
            ObjCharTransferTask_Reset(&sObjCharTransferTasksManager->tasks[i]);
        }
        sObjCharTransferTasksManager->unk_2C = sub_02022448(modeMain);
        sObjCharTransferTasksManager->unk_30 = sub_02022448(modeSub);
        GX_SetOBJVRamModeChar(modeMain);
        GXS_SetOBJVRamModeChar(modeSub);
        int r4 = sub_020224A8(template->unk_04, sObjCharTransferTasksManager->unk_2C);
        int r0 = sub_020224A8(template->unk_08, sObjCharTransferTasksManager->unk_30);
        sub_020221D0(r4, r0, template->heapId);
    }
}

void ObjCharTransfer_Destroy(void) {
    if (sObjCharTransferTasksManager != NULL) {
        sub_02022238(sObjCharTransferTasksManager->unk_34);
        sub_02022238(sObjCharTransferTasksManager->unk_38);
        sub_020218D4();
        FreeToHeap(sObjCharTransferTasksManager->tasks);
        FreeToHeap(sObjCharTransferTasksManager);
        sObjCharTransferTasksManager = NULL;
    }
}

void sub_020216C8(void) {
    sObjCharTransferTasksManager->offsetMain = 0;
    sObjCharTransferTasksManager->offsetSub = 0;
    sub_02022278(sObjCharTransferTasksManager->unk_34);
    sub_02022278(sObjCharTransferTasksManager->unk_38);
    sub_02022060();
}

void sub_020216F4(u32 offset, u32 size, NNS_G2D_VRAM_TYPE vram) {
    int newOffset;
    int sp4;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        sub_0202256C(sObjCharTransferTasksManager->unk_1C, offset, size, &newOffset, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DMAIN, newOffset, 0, sp4, 0);
        }
    } else {
        sub_0202256C(sObjCharTransferTasksManager->unk_20, offset, size, &newOffset, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DSUB, 0, newOffset, 0, sp4);
        }
    }
}

BOOL sub_02021758(const ObjCharTransferTaskTemplate *a0) {
    GF_ASSERT(ObjCharTransfer_TaskExistsByID(a0->id) != 1);
    ObjCharTransferTask *sub = ObjCharTransfer_GetFreeTask();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!ObjCharTransferTask_InitFromTemplate(a0, sub)) {
        return FALSE;
    }
    if (!sub_02021C9C(sub)) {
        sub_02021884(sub->resId);
        return FALSE;
    }
    ++sObjCharTransferTasksManager->num;
    return TRUE;
}

BOOL sub_020217B0(const ObjCharTransferTaskTemplate *a0) {
    GF_ASSERT(ObjCharTransfer_TaskExistsByID(a0->id) != 1);
    ObjCharTransferTask *sub = ObjCharTransfer_GetFreeTask();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!ObjCharTransferTask_InitFromTemplate(a0, sub)) {
        return FALSE;
    }
    sub->unk_40 = 1;
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
        if (sub->unk_3C == 4) {
            sub_02021A50(&sub->imageProxy);
        } else {
            r5 = FALSE;
        }
    } while (r5);
    if (sub->unk_3C != 0) {
        sub_02021D58(sub);
        --sObjCharTransferTasksManager->num;
    }
}

void sub_020218D4(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].unk_3C != 0) {
            sub_02021D58(&sObjCharTransferTasksManager->tasks[i]);
            --sObjCharTransferTasksManager->num;
        }
    }
}

NNSG2dImageProxy *sub_02021910(int resId) {
    ObjCharTransferTask *sub = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(sub != NULL);
    if (sub->unk_3C == 0) {
        return NULL;
    }

    return &sub->imageProxy;
}

NNSG2dImageProxy *sub_02021934(int resId, u32 size) {
    ObjCharTransferTask *sub = ObjCharTransfer_GetTaskByID(resId);
    GF_ASSERT(sub != NULL);
    if (sub->unk_3C == 0) {
        return NULL;
    }
    u32 offsetMain;
    u32 offsetSub;
    u32 spC;
    u32 sp8;
    sub_02021DE4(sub->vram, &offsetMain, &offsetSub, size, &spC, &sp8);
    if (sub->unk_3C == 3) {
        return NULL;
    }
    sub->unk_3C = 3;
    sub_02021E90(sub, offsetMain, offsetSub);
    sub->unk_48 = 1;
    sub->sizeMain = spC;
    sub->sizeSub = sp8;
    sub_02021FB0(sub);
    sub_02021EC0(sub->vram, offsetMain, offsetSub, spC, sp8);

    return &sub->imageProxy;
}

NNSG2dImageProxy *sub_020219B8(NNSG2dImageProxy *proxyIn) {
    ObjCharTransferTask *task;
    ObjCharTransferTask *copiedTask;
    u32 offsetMain;
    u32 offsetSub;
    u32 spC;
    u32 sp8;
    u32 size;

    task = ObjCharTransfer_GetTaskByImageProxy(proxyIn);
    GF_ASSERT(task != NULL);
    copiedTask = ObjCharTransfer_GetFreeTask();
    GF_ASSERT(copiedTask != NULL);
    if (task->unk_3C != 3) {
        return NULL;
    }
    *copiedTask = *task;
    copiedTask->unk_3C = 4;
    if (copiedTask->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        size = copiedTask->sizeMain;
    } else {
        size = copiedTask->sizeSub;
    }

    sub_02021DE4(copiedTask->vram, &offsetMain, &offsetSub, size, &spC, &sp8);
    sub_02021E90(copiedTask, offsetMain, offsetSub);
    copiedTask->unk_48 = 1;
    copiedTask->sizeMain = spC;
    copiedTask->sizeSub = sp8;
    sub_02021FB0(copiedTask);
    sub_02021EC0(copiedTask->vram, offsetMain, offsetSub, spC, sp8);

    return &copiedTask->imageProxy;
}

void sub_02021A50(const NNSG2dImageProxy *proxy) {
    int i;
    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if ((sObjCharTransferTasksManager->tasks[i].unk_3C == 3 || sObjCharTransferTasksManager->tasks[i].unk_3C == 4) && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxy)  {
            break;
        }
    }
    if (i < sObjCharTransferTasksManager->max) {
        sub_020223C4(&sObjCharTransferTasksManager->tasks[i]);
        if (sObjCharTransferTasksManager->tasks[i].unk_3C == 3) {
            sObjCharTransferTasksManager->tasks[i].unk_3C = 2;
        } else {
            sObjCharTransferTasksManager->tasks[i].unk_3C = 0;
            ObjCharTransferTask_Reset(&sObjCharTransferTasksManager->tasks[i]);
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
                a3->offset = offsetMain + sObjCharTransferTasksManager->unk_1C;
            } else {
                a3->size = sizeSub;
                a3->offset = offsetSub + sObjCharTransferTasksManager->unk_20;
            }
            a3->unk_0A = 1;
        }
    }
    return ret;
}

void sub_02021B5C(UnkStruct_02021AC8 *a0) {
    if (a0->unk_0A != 0) {
        if (a0->vram & 1) {
            u32 r5 = sub_020224A8(a0->size, sObjCharTransferTasksManager->unk_2C);
            u32 r0 = sub_020224A8(a0->offset - sObjCharTransferTasksManager->unk_1C, sObjCharTransferTasksManager->unk_2C);
            sub_02022374(r0, r5, sObjCharTransferTasksManager->unk_34);
        }
        if (a0->vram & 2) {
            u32 r5 = sub_020224A8(a0->size, sObjCharTransferTasksManager->unk_30);
            u32 r0 = sub_020224A8(a0->offset - sObjCharTransferTasksManager->unk_20, sObjCharTransferTasksManager->unk_30);
            sub_02022374(r0, r5, sObjCharTransferTasksManager->unk_38);
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

void ObjCharTransferTask_Reset(ObjCharTransferTask *a0) {
    a0->charData = NULL;
    a0->vram = NNS_G2D_VRAM_TYPE_NEITHER;
    a0->isTransferred = FALSE;
    a0->resId = -1;
    a0->baseAddrMain = 0;
    a0->baseAddrSub = 0;
    a0->unk_3C = 0;
    a0->unk_40 = 0;
    NNS_G2dInitImageProxy(&a0->imageProxy);
}

BOOL ObjCharTransferTask_InitFromTemplate(const ObjCharTransferTaskTemplate *template, ObjCharTransferTask *task) {
    task->charData = template->charData;
    task->resId = template->id;
    task->vram = template->vram;
    task->isTransferred = task->charData->characterFmt >> NNS_G2D_VRAMTRANSFERDATA_FLAG_SHIFT;
    task->unk_44 = template->unk_0C;
    task->unk_48 = 0;
    task->sizeMain = 0;
    task->sizeSub = 0;
    return TRUE;
}

ObjCharTransferTask *ObjCharTransfer_GetTaskByImageProxy(const NNSG2dImageProxy *proxyIn) {
    int i;

    for (i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].unk_3C != 0 && &sObjCharTransferTasksManager->tasks[i].imageProxy == proxyIn) {
            break;
        }
    }
    if (i >= sObjCharTransferTasksManager->max) {
        return NULL;
    }

    return &sObjCharTransferTasksManager->tasks[i];
}

BOOL sub_02021C9C(ObjCharTransferTask *a0) {
    BOOL ret = TRUE;
    if (a0->isTransferred) {
        a0->unk_3C = 2;
    } else {
        a0->unk_3C = 1;
        if (!a0->unk_44) {
            ret = sub_02021CCC(a0);
        } else {
            ret = sub_02021D00(a0);
        }
    }
    return ret;
}

BOOL sub_02021CCC(ObjCharTransferTask *a0) {
    u32 offsetMain;
    u32 offsetSub;
    BOOL ret = ObjCharTransfer_TryGetDestVramOffsets(a0->charData->szByte, a0->vram, &offsetMain, &offsetSub);
    if (ret) {
        ObjCharTransferTask_SetBaseAddrs(a0, offsetMain, offsetSub);
        ObjCharTransfer_ReserveVramSpace(a0->charData->szByte, a0->vram);
    }
    return ret;
}

BOOL sub_02021D00(ObjCharTransferTask *a0) {
    u32 offsetMain;
    u32 offsetSub;
    u32 sizeMain;
    u32 sizeSub;
    if (!sub_02021DE4(a0->vram, &offsetMain, &offsetSub, a0->charData->szByte, &sizeMain, &sizeSub)) {
        return FALSE;
    }
    sub_02021E90(a0, offsetMain, offsetSub);
    a0->unk_48 = 1;
    a0->sizeMain = sizeMain;
    a0->sizeSub = sizeSub;
    sub_02021F28(a0);
    sub_02021EC0(a0->vram, offsetMain, offsetSub, sizeMain, sizeSub);
    return TRUE;
}

void sub_02021D58(ObjCharTransferTask *a0) {
    if (a0->unk_48) {
        sub_020223C4(a0);
    }
    ObjCharTransferTask_Reset(a0);
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

BOOL sub_02021DE4(int a0, u32 *a1, u32 *a2, u32 a3, u32 *a4, u32 *a5) {
    if (a0 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        *a4 = sub_02022488(a3, sObjCharTransferTasksManager->unk_2C, 1);
        u32 r0 = sub_020224A8(*a4, sObjCharTransferTasksManager->unk_2C);
        *a1 = sub_020222EC(r0, sObjCharTransferTasksManager->unk_34);
        if (*a1 == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *a1 = sub_020224B8(*a1, sObjCharTransferTasksManager->unk_2C);
    }
    if (a0 & NNS_G2D_VRAM_TYPE_2DSUB) {
        *a5 = sub_02022488(a3, sObjCharTransferTasksManager->unk_30, 1);
        u32 r0 = sub_020224A8(*a5, sObjCharTransferTasksManager->unk_30);
        *a2 = sub_020222EC(r0, sObjCharTransferTasksManager->unk_38);
        if (*a2 == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *a2 = sub_020224B8(*a2, sObjCharTransferTasksManager->unk_30);
    }
    return TRUE;
}

void sub_02021E90(ObjCharTransferTask *a0, u32 a1, u32 a2) {
    if (a0->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        a0->baseAddrMain = a1 + sObjCharTransferTasksManager->unk_1C;
    }
    if (a0->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        a0->baseAddrSub = a2 + sObjCharTransferTasksManager->unk_20;
    }
}

void sub_02021EC0(NNS_G2D_VRAM_TYPE vram, u32 offsetMain, u32 offsetSub, u32 sizeMain, u32 sizeSub) {
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        u32 r7 = sub_020224A8(sizeMain, sObjCharTransferTasksManager->unk_2C);
        u32 r0 = sub_020224A8(offsetMain, sObjCharTransferTasksManager->unk_2C);
        sub_02022290(r0, r7, sObjCharTransferTasksManager->unk_34);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        u32 r7 = sub_020224A8(sizeSub, sObjCharTransferTasksManager->unk_30);
        u32 r0 = sub_020224A8(offsetSub, sObjCharTransferTasksManager->unk_30);
        sub_02022290(r0, r7, sObjCharTransferTasksManager->unk_38);
    }
}

void sub_02021F28(ObjCharTransferTask *a0) {
    NNS_G2dInitImageProxy(&a0->imageProxy);
    if (a0->vram != NNS_G2D_VRAM_TYPE_BOTH) {
        sub_02021F54(a0, a0->vram);
    } else {
        sub_02021F54(a0, NNS_G2D_VRAM_TYPE_2DMAIN);
        sub_02021F54(a0, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

void sub_02021F54(ObjCharTransferTask *a0, NNS_G2D_VRAM_TYPE vram) {
    int mappingType = a0->unk_40 ? ObjCharTransferTask_SetMappingTypeFromHW(a0, vram) : vram;
    u32 baseAddr;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        baseAddr = a0->baseAddrMain;
        GX_GetOBJVRamModeChar();
    } else {
        baseAddr = a0->baseAddrSub;
        GXS_GetOBJVRamModeChar();
    }
    if (mappingType == 0) {
        NNS_G2dLoadImage2DMapping(a0->charData, baseAddr, vram, &a0->imageProxy);
    } else {
        NNS_G2dLoadImage1DMapping(a0->charData, baseAddr, vram, &a0->imageProxy);
    }
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        GX_GetOBJVRamModeChar();
    } else {
        GXS_GetOBJVRamModeChar();
    }
}

void sub_02021FB0(ObjCharTransferTask *a0) {
    NNS_G2dInitImageProxy(&a0->imageProxy);
    if (a0->vram != NNS_G2D_VRAM_TYPE_BOTH) {
        sub_02021FDC(a0, a0->vram);
    } else {
        sub_02021FDC(a0, NNS_G2D_VRAM_TYPE_2DMAIN);
        sub_02021FDC(a0, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

void sub_02021FDC(ObjCharTransferTask *a0, NNS_G2D_VRAM_TYPE vram) {
    int r0 = a0->unk_40 ? ObjCharTransferTask_SetMappingTypeFromHW(a0, vram) : vram;
    u32 baseAddr;
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        baseAddr = a0->baseAddrMain;
        GX_GetOBJVRamModeChar();
    } else {
        baseAddr = a0->baseAddrSub;
        GXS_GetOBJVRamModeChar();
    }
    NNS_G2dLoadImageVramTransfer(a0->charData, baseAddr, vram, &a0->imageProxy);
    if (vram == NNS_G2D_VRAM_TYPE_2DMAIN) {
        GX_GetOBJVRamModeChar();
    } else {
        GXS_GetOBJVRamModeChar();
    }
}

ObjCharTransferTask *ObjCharTransfer_GetFreeTask(void) {
    for (int i = 0; i < sObjCharTransferTasksManager->max; ++i) {
        if (sObjCharTransferTasksManager->tasks[i].unk_3C == 0) {
            return &sObjCharTransferTasksManager->tasks[i];
        }
    }

    return NULL;
}

void sub_02022060(void) {
    switch (GX_GetBankForOBJ()) {
    case GX_VRAM_OBJ_NONE:
        sObjCharTransferTasksManager->unk_14 = 0;
        break;
    case GX_VRAM_OBJ_16_F:
    case GX_VRAM_OBJ_16_G:
        sObjCharTransferTasksManager->unk_14 = 16 * 1024;
        break;
    case GX_VRAM_OBJ_32_FG:
        sObjCharTransferTasksManager->unk_14 = 32 * 1024;
        break;
    case GX_VRAM_OBJ_64_E:
        sObjCharTransferTasksManager->unk_14 = 64 * 1024;
        break;
    case GX_VRAM_OBJ_80_EF:
    case GX_VRAM_OBJ_80_EG:
        sObjCharTransferTasksManager->unk_14 = 80 * 1024;
        break;
    case GX_VRAM_OBJ_96_EFG:
        sObjCharTransferTasksManager->unk_14 = 96 * 1024;
        break;
    case GX_VRAM_OBJ_128_A:
    case GX_VRAM_OBJ_128_B:
        sObjCharTransferTasksManager->unk_14 = 128 * 1024;
        break;
    case GX_VRAM_OBJ_256_AB:
        sObjCharTransferTasksManager->unk_14 = 256 * 1024;
        break;
    default:
        sObjCharTransferTasksManager->unk_14 = 0;
        break;
    }

    switch (GX_GetBankForSubOBJ()) {
    case GX_VRAM_SUB_OBJ_NONE:
        sObjCharTransferTasksManager->unk_18 = 0;
        break;
    case GX_VRAM_SUB_OBJ_16_I:
        sObjCharTransferTasksManager->unk_18 = 16 * 1024;
        break;
    case GX_VRAM_SUB_OBJ_128_D:
        sObjCharTransferTasksManager->unk_18 = 128 * 1024;
        break;
    default:
        sObjCharTransferTasksManager->unk_18 = 0;
        break;
    }

    int r0 = sub_020224B8(sObjCharTransferTasksManager->unk_24, sObjCharTransferTasksManager->unk_2C);
    sObjCharTransferTasksManager->unk_1C = sObjCharTransferTasksManager->unk_14 - r0;
    r0 = sub_020224B8(sObjCharTransferTasksManager->unk_28, sObjCharTransferTasksManager->unk_30);
    sObjCharTransferTasksManager->unk_20 = sObjCharTransferTasksManager->unk_18 - r0;
    GF_ASSERT(sObjCharTransferTasksManager->unk_1C >= 0 && sObjCharTransferTasksManager->unk_20 >= 0);
    GF_ASSERT(sObjCharTransferTasksManager->unk_1C >= 0 && sObjCharTransferTasksManager->unk_20 >= 0);  // they wanted to be doubly sure
}

void sub_020221B4(void) {
    sub_02022278(sObjCharTransferTasksManager->unk_34);
    sub_02022278(sObjCharTransferTasksManager->unk_38);
}

void sub_020221D0(u32 a0, u32 a1, HeapID heapID) {
    sObjCharTransferTasksManager->unk_24 = a0;
    sObjCharTransferTasksManager->unk_28 = a1;
    if (sObjCharTransferTasksManager->unk_34 != NULL) {
        FreeToHeap(sObjCharTransferTasksManager->unk_34);
    }
    if (sObjCharTransferTasksManager->unk_38 != NULL) {
        FreeToHeap(sObjCharTransferTasksManager->unk_38);
    }
    if (sObjCharTransferTasksManager->unk_24 != 0) {
        sObjCharTransferTasksManager->unk_34 = AllocFromHeap(heapID, a0 / 8);
    }
    if (sObjCharTransferTasksManager->unk_28 != 0) {
        sObjCharTransferTasksManager->unk_38 = AllocFromHeap(heapID, a1 / 8);
    }
    sub_020221B4();
}

void sub_02022238(u8 *a0) {
    if (a0 != NULL) {
        if (a0 == sObjCharTransferTasksManager->unk_34) {
            sObjCharTransferTasksManager->unk_24 = 0;
            FreeToHeap(a0);
        } else {
            sObjCharTransferTasksManager->unk_28 = 0;
            FreeToHeap(a0);
        }
    }
}

u32 sub_02022260(u8 *a0) {
    if (a0 == sObjCharTransferTasksManager->unk_34) {
        return sObjCharTransferTasksManager->unk_24;
    } else {
        return sObjCharTransferTasksManager->unk_28;
    }
}

void sub_02022278(u8 *a0) {
    if (a0 != NULL) {
        memset(a0, 0, sub_02022260(a0) / 8);
    }
}

void sub_02022290(u32 a0, u32 a1, u8 *a2) {
    if (a2 != NULL) {
        u32 r7 = sub_02022260(a2);
        u32 r6 = a0 + a1;
        for (int i = a0; i < r6; ++i) {
            if (i >= r7) {
                break;
            }
            u32 sp4;
            u8 sp0;
            sub_02022560(i, &sp4, &sp0);
            GF_ASSERT(!(a2[sp4] & (1 << sp0)));
            u8 mask = 1 << sp0;
            a2[sp4] |= mask;
        }
    }
}

u32 sub_020222EC(u32 a0, u8 *a1) {
    if (a1 != NULL) {
        u32 sp4 = sub_02022260(a1);
        for (int i = 0; i < sp4; ++i) {
            u32 spC;
            u8 sp8;
            sub_02022560(i, &spC, &sp8);
            u8 mask = 1 << sp8;
            int j = 0;
            while ((a1[spC] & mask) == 0 && j <= a0) {
                int num = i + j;
                sub_02022560(num, &spC, &sp8);
                mask = 1 << sp8;
                if (num >= sp4) {
                    return -1;
                }
                ++j;
            }
            if (j > a0) {
                return i;
            }
            i += j;
        }
    }
    return -1;
}

void sub_02022374(u32 a0, u32 a1, u8 *a2) {
    if (a2 != NULL) {
        u32 r6 = a0 + a1;
        for (int i = a0; i < r6; ++i) {
            u32 sp4;
            u8 sp0;
            sub_02022560(i, &sp4, &sp0);
            GF_ASSERT(a2[sp4] & (1 << sp0));
            u8 mask = (1 << sp0) ^ 0xFF;
            a2[sp4] &= mask;
        }
    }
}

void sub_020223C4(ObjCharTransferTask *a0) {
    if (a0->vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        u32 loc = NNS_G2dGetImageLocation(&a0->imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN);
        u32 r5 = sub_020224A8(loc - sObjCharTransferTasksManager->unk_1C, sObjCharTransferTasksManager->unk_2C);
        u32 r1 = sub_020224A8(a0->sizeMain, sObjCharTransferTasksManager->unk_2C);
        sub_02022374(r5, r1, sObjCharTransferTasksManager->unk_34);
    }
    if (a0->vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        u32 loc = NNS_G2dGetImageLocation(&a0->imageProxy, NNS_G2D_VRAM_TYPE_2DSUB);
        u32 r5 = sub_020224A8(loc - sObjCharTransferTasksManager->unk_20, sObjCharTransferTasksManager->unk_30);
        u32 r1 = sub_020224A8(a0->sizeSub, sObjCharTransferTasksManager->unk_30);
        sub_02022374(r5, r1, sObjCharTransferTasksManager->unk_38);
    }
    a0->unk_48 = 0;
}

int sub_02022448(GXOBJVRamModeChar mode) {
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

int sub_02022488(int a0, int a1, int a2) {
    a1 *= 32;
    if (a0 % a1) {
        a0 -= (a0 % a1);
        if (a2 == 1) {
            a0 += a1;
        }
    }
    return a0;
}

u32 sub_020224A8(int a0, int a1) {
    return a0 / 32 / a1;
}

int sub_020224B8(int a0, int a1) {
    return a0 * a1 * 32;
}

BOOL ObjCharTransfer_TryGetDestVramOffsets(u32 size, NNS_G2D_VRAM_TYPE vram, u32 *pOffsetMain, u32 *pOffsetSub) {
    BOOL result = TRUE;
    if (vram & NNS_G2D_VRAM_TYPE_2DMAIN) {
        if (sObjCharTransferTasksManager->offsetMain + size > sObjCharTransferTasksManager->unk_1C) {
            GF_ASSERT(FALSE);
            result = FALSE;
        } else {
            *pOffsetMain = sObjCharTransferTasksManager->offsetMain;
        }
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        if (sObjCharTransferTasksManager->offsetSub + size > sObjCharTransferTasksManager->unk_20) {
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
        sObjCharTransferTasksManager->offsetMain = sub_02022488(sObjCharTransferTasksManager->offsetMain, sObjCharTransferTasksManager->unk_2C, 1);
    }
    if (vram & NNS_G2D_VRAM_TYPE_2DSUB) {
        sObjCharTransferTasksManager->offsetSub += size;
        sObjCharTransferTasksManager->offsetSub = sub_02022488(sObjCharTransferTasksManager->offsetSub, sObjCharTransferTasksManager->unk_30, 1);
    }
}

void sub_02022560(int a0, u32 *a1, u8 *a2) {
    *a1 = a0 >> 3;
    *a2 = a0 & 7;
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
