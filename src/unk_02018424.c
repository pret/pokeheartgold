#include "unk_02018424.h"

#include "global.h"

#include "constants/sndseq.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "palette.h"
#include "sys_task_api.h"

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10);
void sub_02018744(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, PaletteData *paletteData, HeapID heapId);
void sub_020187C0(SysTask *task, void *taskData);
u8 sub_0201881C(LISTMENUITEM *listMenuItem, u8 a1, FontID a2, u8 a3);
void sub_02018890(UnkStruct_020185FC *a0);
void sub_02018998(UnkStruct_020185FC *a0);
void sub_020189AC(UnkStruct_020185FC *a0);
void sub_02018C90(UnkStruct_020185FC *a0);
void sub_02018D90(UnkStruct_020185FC *a0);
void sub_02018D0C(UnkStruct_020185FC *a0, int a1, int a2);
void sub_02018DF4(UnkStruct_020185FC *a0, int a1);
int sub_02018E08(UnkStruct_020185FC *a0, int *a1);
int sub_02018E8C(UnkStruct_020185FC *a0);
void sub_02018FE8(UnkStruct_020185FC *a0, int a1);
void sub_02018FFC(UnkStruct_020185FC *a0, int a1);

UnkStruct_02018424 *sub_02018424(HeapID heapId, PaletteData *a1) {
    UnkStruct_02018424 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_02018424));
    MI_CpuClear8(ret, sizeof(UnkStruct_02018424));
    ret->heapId      = heapId;
    ret->charDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 1, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedBGCharacterData(ret->charDataRaw, &ret->pCharData);
    ret->plttDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 0, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedPaletteData(ret->plttDataRaw, &ret->pPlttData);
    ret->paletteData = a1;
    return ret;
}

void sub_02018474(UnkStruct_02018424 *a0) {
    FreeToHeap(a0->plttDataRaw);
    FreeToHeap(a0->charDataRaw);
    MI_CpuFill8(a0, 0, sizeof(UnkStruct_02018424));
    FreeToHeap(a0);
}

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10) {
    UnkStruct_020185FC *ret = AllocFromHeap(a0->heapId, sizeof(UnkStruct_020185FC));
    MI_CpuClear8(ret, sizeof(UnkStruct_020185FC));
    MI_CpuCopy8(a1, &ret->unk_04, sizeof(Ov122_021E7488));
    ret->unk_00 = a0;
    if (a6 < ret->unk_04.unk14) {
        ret->unk_24 = a6;
    }
    ret->unk_25      = 0;
    ret->heapId      = a0->heapId;
    ret->unk_29      = a4;
    ret->unk_24      = a6;
    ret->unk_27_1    = a2;
    ret->callback    = a7;
    ret->callbackArg = a8;
    ret->unk_27_0    = a9;
    if (a5 == 0) {
        ret->unk_26 = sub_0201881C(a1->listMenuItems, ret->unk_04.unk14, 4, ret->unk_04.unk0.unk1);
    } else {
        ret->unk_26 = a5;
    }
    switch (a10) {
    default:
        GF_ASSERT(FALSE);
    case 0:
        ret->unk_28 = a3;
        break;
    case 1:
        ret->unk_26 = (ret->unk_26 + 1) & ~1;
        if (a3 - (ret->unk_26 + 2) / 2 < 0) {
            ret->unk_28 = 0;
        } else {
            ret->unk_28 = a3 - (ret->unk_26 + 2) / 2;
        }
        break;
    case 2:
        if (a3 - (ret->unk_26 + 2) < 0) {
            ret->unk_28 = 0;
        } else {
            ret->unk_28 = a3 - (ret->unk_26 + 2);
        }
        break;
    }
    sub_02018890(ret);
    sub_02018744(a0, &ret->unk_04, ret->unk_00->paletteData, ret->heapId);
    sub_020189AC(ret);
    sub_02018C90(ret);
    sub_02018DF4(ret, ret->unk_24);
    sub_02018FE8(ret, SEQ_SE_DP_SELECT);
    sub_02018FFC(ret, 0);
    return ret;
}

UnkStruct_020185FC *sub_020185FC(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, 0);
}

UnkStruct_020185FC *sub_02018620(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, int a7) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, a7);
}

UnkStruct_020185FC *sub_02018648(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

u8 sub_02018674(UnkStruct_020185FC *a0) {
    return a0->unk_27_1;
}

void sub_02018680(UnkStruct_020185FC *a0) {
    MI_CpuClear8(a0, sizeof(UnkStruct_020185FC));
    FreeToHeap(a0);
}

void sub_02018694(UnkStruct_020185FC *a0) {
    sub_02018D90(a0);
    sub_02018998(a0);
}

int sub_020186A4(UnkStruct_020185FC *a0) {
    if (a0->unk_25 == 1) {
        if (a0->unk_2B == 0) {
            sub_02018694(a0);
            return a0->unk_04.listMenuItems[a0->unk_2A].value;
        }
        if (a0->unk_2B % 2 == 0) {
            if ((a0->unk_2B / 2) % 2 == 0) {
                sub_02018D0C(a0, a0->unk_2A, 1);
            } else {
                sub_02018D0C(a0, a0->unk_2A, 0);
            }
        }
        --a0->unk_2B;
        return -1;
    }

    int sp0;
    int r4 = sub_02018E08(a0, &sp0);
    if (sp0 == 0) {
        r4 = sub_02018E8C(a0);
    }
    if (r4 == -2) {
        sub_02018694(a0);
        return r4;
    }

    return -1;
}

typedef struct UnkTaskData_sub_020187C0 {
    BgConfig *bgConfig;
    u8 bgId;
    u8 plttOffset;
    u16 charOffset;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
} UnkTaskData_sub_020187C0;

void sub_02018744(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, PaletteData *plttData, HeapID heapId) {
    UnkTaskData_sub_020187C0 *taskData = AllocFromHeapAtEnd(heapId, sizeof(UnkTaskData_sub_020187C0));
    MI_CpuClear8(taskData, sizeof(UnkTaskData_sub_020187C0));
    taskData->pCharData  = a0->pCharData;
    taskData->pPlttData  = a0->pPlttData;
    taskData->bgConfig   = a1->bgConfig;
    taskData->bgId       = a1->unk0.bgId;
    taskData->charOffset = a1->unk0.charOffset;
    taskData->plttOffset = a1->unk0.plttOffset;
    SysTask_CreateOnVWaitQueue(sub_020187C0, taskData, 128);
    if (plttData != NULL) {
        if (a1->unk0.bgId < GF_BG_LYR_SUB_0) {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_MAIN_BG, a1->unk0.plttOffset * 16, 0x20);
        } else {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_SUB_BG, a1->unk0.plttOffset * 16, 0x20);
        }
    }
}

void sub_020187C0(SysTask *task, void *taskData) {
    UnkTaskData_sub_020187C0 *data = taskData;

    DC_FlushRange(data->pCharData->pRawData, data->pCharData->szByte);
    BG_LoadCharTilesData(data->bgConfig, data->bgId, data->pCharData->pRawData, data->pCharData->szByte, data->charOffset);

    DC_FlushRange(data->pPlttData->pRawData, 0x20);
    if (data->bgId < GF_BG_LYR_SUB_0) {
        GX_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    } else {
        GXS_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    }

    SysTask_Destroy(task);
    FreeToHeap(taskData);
}

u8 sub_0201881C(LISTMENUITEM *listMenuItem, u8 a1, FontID a2, u8 a3) {
    u8 maxWidth = 0;
    for (int i = 0; i < a1; ++i) {
        GF_ASSERT(listMenuItem[i].text != NULL);
        GF_ASSERT(listMenuItem[i].text != (void *)LIST_NOTHING_CHOSEN);
        u8 width = FontID_String_GetWidth(a2, listMenuItem[i].text, 0);
        if (width > maxWidth) {
            maxWidth = width;
        }
    }
    maxWidth += a3 * 2;
    if (maxWidth % 8 == 0) {
        return maxWidth / 8;
    } else {
        return maxWidth / 8 + 1;
    }
}
