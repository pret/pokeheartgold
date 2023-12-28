#include "global.h"
#include "yes_no_prompt.h"
#include "constants/sndseq.h"
#include "gf_gfx_loader.h"
#include "system.h"
#include "unk_02005D10.h"

struct UnkStruct_02016C28 {
    BgConfig *bgConfig;
    fx32 *unk4;
    u16 unk8;
    u16 unkA[2];
    u16 unkE;
    u16 unk10;
    u8 bgId;
    u8 unk13;
    u8 x;
    u8 y;
};

struct SysTaskState_02016DBC {
    BgConfig *bgConfig;
    NNSG2dCharacterData *charData;
    void *charDataRaw;
    u16 bgId;
    u16 tileStart;
};

struct SysTaskState_02016DF8 {
    NNSG2dPaletteData *plttData;
    void *plttDataRaw;
    u16 bgId;
    u16 offset;
    u16 size;
};

void YesNoPrompt_InitFromTemplate_Internal(YesNoPromptState *yesno, const YesNoPromptTemplate *template);
void sub_02016788(YesNoPromptState *yesno, u8 a1, int a2);
void sub_020167C4(YesNoPromptState *yesno);
BOOL sub_02016804(YesNoPromptState *yesno, int joyInput);
BOOL sub_02016884(YesNoPromptState *yesno);
void YesNoPrompt_Init(YesNoPromptState *yesno, HeapID heapId);
void sub_02016A64(YesNoPromptState *yesno, const YesNoPromptTemplate *template);
void sub_02016A84(YesNoPromptState *yesno, const YesNoPromptTemplate *template);
void sub_02016AB0(YesNoPromptState *yesno, const YesNoPromptTemplate *template);
void sub_02016B4C(YesNoPromptState *yesno, const YesNoPromptTemplate *template);
void sub_02016BC0(u32 a0, u32 a1, void *arg);
void sub_02016C28(YesNoPromptSubstruct00 *a0, const struct UnkStruct_02016C28 *a1, HeapID heapId);
void sub_02016CC4(YesNoPromptSubstruct00 *a0);
SysTask *sub_02016D24(NarcId narcId, s32 fileId, BgConfig *bgConfig, int bgId, u32 tileStart, HeapID heapId);
SysTask *sub_02016D74(NarcId narcId, s32 fileId, int bgId, u32 offset, u32 size, HeapID heapId);
void sub_02016DBC(SysTask *task, void *data);
void sub_02016DF8(SysTask *task, void *data);
void sub_02016E40(BgConfig *bgConfig, int bgId, NNSG2dScreenData *screenData, int x, int y);
void sub_02016E8C(NNSG2dScreenData *scrnData, int a1);
void sub_02016EAC(NNSG2dScreenData *scrnData, int a1);

YesNoPromptState *YesNoPrompt_Create(HeapID heapId) {
    YesNoPromptState *out = (YesNoPromptState *)AllocFromHeap(heapId, sizeof(YesNoPromptState));
    YesNoPrompt_Init(out, heapId);
    return out;
}

void YesNoPrompt_Destroy(YesNoPromptState *yesno) {
    if (yesno->unk77_0 == 1) {
        sub_020169CC(yesno);
    }
    FreeToHeap(yesno);
}

void YesNoPrompt_InitFromTemplate_Internal(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    static const u8 _020F61B8[2][2] = {
        {  6, 4 },
        { 16, 6 },
    };

    yesno->bgConfig = template->bgConfig;
    yesno->bgId = template->unk4;
    yesno->x = template->unk10;
    yesno->y = template->unk11;
    yesno->unk74_0 = FALSE;
    if (template->unk12_4 < 2) {
        yesno->cursorPos = template->unk12_4;
    } else {
        yesno->cursorPos = 0;
    }
    yesno->width = _020F61B8[template->unk13][0];
    yesno->height = _020F61B8[template->unk13][1];
    sub_02016A64(yesno, template);
    sub_02016A84(yesno, template);
    sub_02016AB0(yesno, template);
    sub_02016B4C(yesno, template);
    yesno->unk77_0 = 1;
    yesno->unk77_4 = 8;
    sub_020167C4(yesno);
}

void YesNoPrompt_InitFromTemplate(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    YesNoPrompt_InitFromTemplate_Internal(yesno, template);
}

void YesNoPrompt_InitFromTemplateWithPalette(YesNoPromptState *yesno, const YesNoPromptTemplate *template, PaletteData *plttData) {
    YesNoPrompt_InitFromTemplate_Internal(yesno, template);
    if (plttData != NULL) {
        NNSG2dPaletteData *plttDataOut;
        void *raw = GfGfxLoader_GetPlttData(NARC_system_touch_subwindow, 0, &plttDataOut, yesno->heapId);
        PaletteData_LoadPalette(plttData, plttDataOut->pRawData, yesno->bgId / 4, template->plttSlot * 16, 64);
        FreeToHeap(raw);
    }
}

u32 sub_02016748(YesNoPromptState *yesno) {
    yesno->unk77_4 = 8;
    u32 result = YesNoPrompt_HandleInput(yesno);
    if (result == 0 && yesno->unk77_4 == 0) {
        if (yesno->result == 0) {
            result = 3;
        } else {
            result = 4;
        }
    }
    return result;
}

void sub_02016788(YesNoPromptState *yesno, u8 a1, int a2) {
    YesNoPromptSubstruct00 *r5 = &yesno->unk0C[a1];
    sub_02016E40(r5->bgConfig, r5->bgId, r5->screenDataPtrs[a2], r5->x, r5->y);
    ScheduleBgTilemapBufferTransfer(r5->bgConfig, r5->bgId);
}

void sub_020167C4(YesNoPromptState *yesno) {
    if (!yesno->unk74_0) {
        sub_02016788(yesno, yesno->cursorPos, 1);
        sub_02016788(yesno, yesno->cursorPos ^ 1, 0);
    } else {
        sub_02016788(yesno, yesno->cursorPos, 0);
    }
}

BOOL sub_02016804(YesNoPromptState *yesno, int joyInput) {
    if (joyInput & PAD_BUTTON_A) {
        yesno->result = yesno->cursorPos;
        PlaySE(SEQ_SE_DP_BUTTON9);
        return TRUE;
    }
    if (joyInput & PAD_BUTTON_B) {
        yesno->result = 1;
        PlaySE(SEQ_SE_DP_BUTTON9);
        return TRUE;
    }
    if (joyInput & (PAD_KEY_UP | PAD_KEY_DOWN)) {
        yesno->cursorPos ^= 1;
        sub_020167C4(yesno);
        PlaySE(SEQ_SE_DP_SELECT);
        return FALSE;
    }
    return FALSE;
}

BOOL sub_02016884(YesNoPromptState *yesno) {
    if (yesno->unk76_4 == 0 && sub_02026CC4(yesno->unk00)) {
        yesno->unk74_0 = TRUE;
        return TRUE;
    }
    if (yesno->unk74_0 == TRUE && gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN)) {
        yesno->unk74_0 = FALSE;
        sub_020167C4(yesno);
        return FALSE;
    }
    return sub_02016804(yesno, gSystem.newKeys);
}

int YesNoPrompt_HandleInput(YesNoPromptState *yesno) {
    GF_ASSERT(yesno->unk77_0 == 1);
    if (yesno->result == 3) {
        if (!sub_02016884(yesno)) {
            return FALSE;
        }
        sub_02016788(yesno, yesno->result, 1);
        sub_02016788(yesno, yesno->result ^ 1, 0);
        return 0;
    }
    if (yesno->unk74_2 == 8) {
        if (yesno->result == 0) {
            return 1;
        }
        return 2;
    }
    if (!(yesno->unk74_2 % 2)) {
        if (!((yesno->unk74_2 / 2) % 2)) {
            sub_02016788(yesno, yesno->result, 1);
        } else {
            sub_02016788(yesno, yesno->result, 0);
        }
    }
    ++yesno->unk74_2;
    return 0;
}

BOOL sub_020169C0(YesNoPromptState *yesno) {
    return yesno->unk74_0;
}

void sub_020169CC(YesNoPromptState *yesno) {
    sub_02026CAC(yesno->unk00);
    for (int i = 0; i < 2; ++i) {
        sub_02016CC4(&yesno->unk0C[i]);
    }
    YesNoPrompt_Init(yesno, yesno->heapId);
}

void sub_020169F4(YesNoPromptState *yesno, int a1) {
    GF_ASSERT(yesno != NULL);
    yesno->unk76_4 = a1;
}

void YesNoPrompt_Init(YesNoPromptState *yesno, HeapID heapId) {
    memset(yesno, 0, sizeof(YesNoPromptState));
    yesno->unk77_0 = 0;
    yesno->heapId = heapId;
    yesno->result = 3;
    yesno->unk77_4 = 8;
}

void sub_02016A64(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    sub_02016D24(NARC_system_touch_subwindow, 1, yesno->bgConfig, yesno->bgId, template->tileStart, yesno->heapId);
}

void sub_02016A84(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    sub_02016D74(NARC_system_touch_subwindow, 0, yesno->bgId < 4 ? 0 : 4, template->plttSlot * 32, 64, yesno->heapId);
}

void sub_02016AB0(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    int i;
    int j;
    struct UnkStruct_02016C28 sp4;

    for (i = 0; i < 2; ++i) {
        yesno->unk68[i] = (i + 1) * 4096;
    }

    sp4.bgConfig = yesno->bgConfig;
    sp4.bgId = yesno->bgId;
    sp4.unk8 = NARC_system_touch_subwindow;
    sp4.unkE = template->tileStart;
    sp4.unk10 = template->plttSlot;
    sp4.unk4 = yesno->unk68;
    sp4.unk13 = 2;
    sp4.x = yesno->x;

    u8 r5;
    if (template->unk13) {
        r5 = 6;
    } else {
        r5 = 2;
    }

    for (i = 0; i < 2; ++i) {
        for (j = 0; j < 2; ++j) {
            sp4.unkA[j] = r5 + j + i * 2;
        }
        sp4.y = i * yesno->height + yesno->y;
        sp4.unk10 += i;
        sub_02016C28(&yesno->unk0C[i], &sp4, yesno->heapId);
    }
}

void sub_02016B4C(YesNoPromptState *yesno, const YesNoPromptTemplate *template) {
    int i;
    for (i = 0; i < 2; ++i) {
        yesno->unk04[i].rect.top = (yesno->y * 8) + (i * yesno->height * 8);
        yesno->unk04[i].rect.left = (yesno->x * 8);
        yesno->unk04[i].rect.bottom = (yesno->y * 8) + (i * yesno->height * 8) + (yesno->height * 8);
        yesno->unk04[i].rect.right = (yesno->x  * 8) + (yesno->width * 8);
    }
    yesno->unk00 = sub_02026C44(yesno->unk04, 2, sub_02016BC0, yesno, yesno->heapId);
}

void sub_02016BC0(u32 a0, u32 a1, void *arg) {
    YesNoPromptState *yesno = (YesNoPromptState *)arg;
    yesno->unk77_4 = a1;
    if (a1 == 0) {
        yesno->result = a0;
        YesNoPromptSubstruct00 *r3 = &yesno->unk0C[a0];
        sub_02016E40(r3->bgConfig, r3->bgId, r3->screenDataPtrs[1], r3->x, r3->y);
        PlaySE(SEQ_SE_DP_BUTTON9);
    }
}

void sub_02016C28(YesNoPromptSubstruct00 *a0, const struct UnkStruct_02016C28 *a1, HeapID heapId) {
    struct YesNoPromptSubstruct00_18 *r2 = &a0->unk18;
    r2->unk0 = a1->unk4;
    r2->unk4 = a1->unk13;
    r2->unk8 = 0;
    a0->bgConfig = a1->bgConfig;
    a0->bgId = a1->bgId;
    a0->x = a1->x;
    a0->y = a1->y;
    for (int i = 0; i < 2; ++i) {
        a0->unk08[i] = GfGfxLoader_GetScrnData((NarcId)a1->unk8, a1->unkA[i], TRUE, &a0->screenDataPtrs[i], heapId);
        sub_02016E8C(a0->screenDataPtrs[i], a1->unkE);
        sub_02016EAC(a0->screenDataPtrs[i], a1->unk10);
    }
    sub_02016E40(a0->bgConfig, a0->bgId, a0->screenDataPtrs[0], a0->x, a0->y);
    a0->unk26 = 0;
}

void sub_02016CC4(YesNoPromptSubstruct00 *a0) {
    FillBgTilemapRect(a0->bgConfig, a0->bgId, 0, a0->x, a0->y, a0->screenDataPtrs[0]->screenWidth / 8, a0->screenDataPtrs[0]->screenHeight / 8, TILEMAP_COPY_SRC_FLAT);
    ScheduleBgTilemapBufferTransfer(a0->bgConfig, a0->bgId);
    for (int i = 0; i < 2; ++i) {
        FreeToHeap(a0->unk08[i]);
    }
    memset(a0, 0, sizeof(YesNoPromptSubstruct00));
}

SysTask *sub_02016D24(NarcId narcId, s32 fileId, BgConfig *bgConfig, int bgId, u32 tileStart, HeapID heapId) {
    struct SysTaskState_02016DBC *buffer = (struct SysTaskState_02016DBC *)AllocFromHeap(heapId, sizeof(struct SysTaskState_02016DBC));
    memset(buffer, 0, sizeof(struct SysTaskState_02016DBC));
    buffer->charDataRaw = GfGfxLoader_GetCharData(narcId, fileId, TRUE, &buffer->charData, heapId);
    buffer->bgConfig = bgConfig;
    buffer->bgId = bgId;
    buffer->tileStart = tileStart;
    return sub_0200E374(sub_02016DBC, buffer, 0x80);
}

SysTask *sub_02016D74(NarcId narcId, s32 fileId, int bgId, u32 offset, u32 size, HeapID heapId) {
    struct SysTaskState_02016DF8 *buffer = (struct SysTaskState_02016DF8 *)AllocFromHeap(heapId, sizeof(struct SysTaskState_02016DF8));
    memset(buffer, 0, sizeof(struct SysTaskState_02016DF8));
    buffer->plttDataRaw = GfGfxLoader_GetPlttData(narcId, fileId, &buffer->plttData, heapId);
    buffer->bgId = bgId;
    buffer->offset = offset;
    buffer->size = size;
    return sub_0200E374(sub_02016DF8, buffer, 0x80);
}

void sub_02016DBC(SysTask *task, void *voidptr) {
    struct SysTaskState_02016DBC *data = (struct SysTaskState_02016DBC *)voidptr;
    DC_FlushRange(data->charData->pRawData, data->charData->szByte);
    BG_LoadCharTilesData(data->bgConfig, data->bgId, data->charData->pRawData, data->charData->szByte, data->tileStart);
    DestroySysTask(task);
    FreeToHeap(data->charDataRaw);
    FreeToHeap(data);
}

void sub_02016DF8(SysTask *task, void *voidptr) {
    struct SysTaskState_02016DF8 *data = (struct SysTaskState_02016DF8 *)voidptr;
    DC_FlushRange(data->plttData->pRawData, data->size);
    if (data->bgId == 0) {
        GX_LoadBGPltt(data->plttData->pRawData, data->offset, data->size);
    } else if (data->bgId == 4) {
        GXS_LoadBGPltt(data->plttData->pRawData, data->offset, data->size);
    }
    DestroySysTask(task);
    FreeToHeap(data->plttDataRaw);
    FreeToHeap(data);
}

void sub_02016E40(BgConfig *bgConfig, int bgId, NNSG2dScreenData *screenData, int x, int y) {
    CopyToBgTilemapRect(bgConfig, bgId, x, y, screenData->screenWidth / 8, screenData->screenHeight / 8, screenData->rawData, 0, 0, screenData->screenWidth / 8, screenData->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
}

void sub_02016E8C(NNSG2dScreenData *scrnData, int a1) {
    int i;
    u16 *data;
    int ntiles = scrnData->szByte / 2;

    data = (u16 *)scrnData->rawData;
    for (i = 0; i < ntiles; ++i) {
        data[i] += a1;
    }
}

void sub_02016EAC(NNSG2dScreenData *scrnData, int a1) {
        int i;
    u16 *data;
    int ntiles = scrnData->szByte / 2;

    data = (u16 *)scrnData->rawData;
    for (i = 0; i < ntiles; ++i) {
        data[i] &= 0xFFF;
        data[i] |= a1 << 12;
    }
}
