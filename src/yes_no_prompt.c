#include "yes_no_prompt.h"

#include "global.h"

#include "constants/sndseq.h"

#include "gf_gfx_loader.h"
#include "sys_task_api.h"
#include "system.h"
#include "unk_02005D10.h"

struct UnkStruct_02016C28 {
    BgConfig *bgConfig;
    fx32 *unk4;
    u16 screenDataNarcId;
    u16 scrnDataFileNo[2];
    u16 baseTile;
    u16 plttNum;
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

static void YesNoPrompt_InitFromTemplate_Internal(YesNoPrompt *yesno, const YesNoPromptTemplate *template);
static void YesNoPrompt_UpdateButtonGraphicalState(YesNoPrompt *yesno, u8 a1, int a2);
static void YesNoPrompt_HighlightSelectedButton(YesNoPrompt *yesno);
static BOOL YesNoPrompt_HandleButtonInput(YesNoPrompt *yesno, int joyInput);
static BOOL YesNoPrompt_HandleInput_Internal(YesNoPrompt *yesno);
static void YesNoPrompt_Init(YesNoPrompt *yesno, enum HeapID heapID);
static void YesNoPrompt_InitPixelDataFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template);
static void YesNoPrompt_InitPlttFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template);
static void YesNoPrompt_InitButtonsFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template);
static void SetupTouchHitboxesController(YesNoPrompt *yesno, const YesNoPromptTemplate *template);
static void YesNoButton_TouchHitboxCB(u32 index, u32 event, YesNoPrompt *yesno);
static void YesNoPromptButton_Draw(YesNoPromptButton *button, const struct UnkStruct_02016C28 *arg, enum HeapID heapID);
static void YesNoPromptButton_Clear(YesNoPromptButton *button);
static SysTask *LoadPixelDataFromNarcAndScheduleTransfer(NarcId narcId, s32 fileId, BgConfig *bgConfig, int bgId, u32 tileStart, enum HeapID heapID);
static SysTask *LoadPlttFromNarcAndScheduleTransfer(NarcId narcId, s32 fileId, int bgId, u32 offset, u32 size, enum HeapID heapID);
static void SysTask_LoadBGPixels(SysTask *task, void *data);
static void SysTask_LoadBGPltt(SysTask *task, void *data);
static void ScreenPushGraphicsRect(BgConfig *bgConfig, int bgId, NNSG2dScreenData *screenData, int x, int y);
static void ScreenSetBaseTile(NNSG2dScreenData *scrnData, int baseTile);
static void ScreenSetPalette(NNSG2dScreenData *scrnData, int plttNum);

YesNoPrompt *YesNoPrompt_Create(enum HeapID heapID) {
    YesNoPrompt *out = (YesNoPrompt *)Heap_Alloc(heapID, sizeof(YesNoPrompt));
    YesNoPrompt_Init(out, heapID);
    return out;
}

void YesNoPrompt_Destroy(YesNoPrompt *yesno) {
    if (yesno->buttonsAreInit == 1) {
        YesNoPrompt_Reset(yesno);
    }
    Heap_Free(yesno);
}

static void YesNoPrompt_InitFromTemplate_Internal(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    static const u8 dimensions[2][2] = {
        { 6,  4 },
        { 16, 6 },
    };

    yesno->bgConfig = template->bgConfig;
    yesno->bgId = template->bgId;
    yesno->x = template->x;
    yesno->y = template->y;
    yesno->inTouchMode = FALSE;
    if (template->initialCursorPos < 2) {
        yesno->cursorPos = template->initialCursorPos;
    } else {
        yesno->cursorPos = 0;
    }
    yesno->width = dimensions[template->shapeParam][0];
    yesno->height = dimensions[template->shapeParam][1];
    YesNoPrompt_InitPixelDataFromTemplate(yesno, template);
    YesNoPrompt_InitPlttFromTemplate(yesno, template);
    YesNoPrompt_InitButtonsFromTemplate(yesno, template);
    SetupTouchHitboxesController(yesno, template);
    yesno->buttonsAreInit = 1;
    yesno->lastTouchEvent = 8;
    YesNoPrompt_HighlightSelectedButton(yesno);
}

void YesNoPrompt_InitFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    YesNoPrompt_InitFromTemplate_Internal(yesno, template);
}

void YesNoPrompt_InitFromTemplateWithPalette(YesNoPrompt *yesno, const YesNoPromptTemplate *template, PaletteData *plttData) {
    YesNoPrompt_InitFromTemplate_Internal(yesno, template);
    if (plttData != NULL) {
        NNSG2dPaletteData *plttDataOut;
        void *raw = GfGfxLoader_GetPlttData(NARC_system_touch_subwindow, 0, &plttDataOut, yesno->heapID);
        PaletteData_LoadPalette(plttData, plttDataOut->pRawData, (PaletteBufferId)(yesno->bgId / 4), template->plttSlot * 16, 64);
        Heap_Free(raw);
    }
}

YesNoResponse YesNoPrompt_HandleInputForSave(YesNoPrompt *yesno) {
    yesno->lastTouchEvent = 8;
    YesNoResponse result = YesNoPrompt_HandleInput(yesno);
    if (result == YESNORESPONSE_WAIT && yesno->lastTouchEvent == 0) {
        if (yesno->result == 0) {
            result = YESNORESPONSE_YES_TOUCH;
        } else {
            result = YESNORESPONSE_NO_TOUCH;
        }
    }
    return result;
}

static void YesNoPrompt_UpdateButtonGraphicalState(YesNoPrompt *yesno, u8 whichButton, int whichScreen) {
    YesNoPromptButton *button = &yesno->buttons[whichButton];
    ScreenPushGraphicsRect(button->bgConfig, button->bgId, button->screenDataPtrs[whichScreen], button->x, button->y);
    ScheduleBgTilemapBufferTransfer(button->bgConfig, button->bgId);
}

static void YesNoPrompt_HighlightSelectedButton(YesNoPrompt *yesno) {
    if (!yesno->inTouchMode) {
        YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->cursorPos, 1);
        YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->cursorPos ^ 1, 0);
    } else {
        YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->cursorPos, 0);
    }
}

static BOOL YesNoPrompt_HandleButtonInput(YesNoPrompt *yesno, int joyInput) {
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
        YesNoPrompt_HighlightSelectedButton(yesno);
        PlaySE(SEQ_SE_DP_SELECT);
        return FALSE;
    }
    return FALSE;
}

static BOOL YesNoPrompt_HandleInput_Internal(YesNoPrompt *yesno) {
    if (yesno->ignoreTouch == 0 && TouchHitboxController_IsTriggered(yesno->touchHitboxController)) {
        yesno->inTouchMode = TRUE;
        return TRUE;
    }
    if (yesno->inTouchMode == TRUE && gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN)) {
        yesno->inTouchMode = FALSE;
        YesNoPrompt_HighlightSelectedButton(yesno);
        return FALSE;
    }
    return YesNoPrompt_HandleButtonInput(yesno, gSystem.newKeys);
}

YesNoResponse YesNoPrompt_HandleInput(YesNoPrompt *yesno) {
    GF_ASSERT(yesno->buttonsAreInit == 1);
    if (yesno->result == 3) {
        if (!YesNoPrompt_HandleInput_Internal(yesno)) {
            return YESNORESPONSE_WAIT;
        }
        YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->result, 1);
        YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->result ^ 1, 0);
        return YESNORESPONSE_WAIT;
    }
    if (yesno->confirmSelectionTimer == 8) {
        if (yesno->result == 0) {
            return YESNORESPONSE_YES;
        }
        return YESNORESPONSE_NO;
    }
    if (!(yesno->confirmSelectionTimer % 2)) {
        if (!((yesno->confirmSelectionTimer / 2) % 2)) {
            YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->result, 1);
        } else {
            YesNoPrompt_UpdateButtonGraphicalState(yesno, yesno->result, 0);
        }
    }
    ++yesno->confirmSelectionTimer;
    return YESNORESPONSE_WAIT;
}

MenuInputState YesNoPrompt_IsInTouchMode(YesNoPrompt *yesno) {
    return (MenuInputState)yesno->inTouchMode;
}

void YesNoPrompt_Reset(YesNoPrompt *yesno) {
    TouchHitboxController_Destroy(yesno->touchHitboxController);
    for (int i = 0; i < 2; ++i) {
        YesNoPromptButton_Clear(&yesno->buttons[i]);
    }
    YesNoPrompt_Init(yesno, yesno->heapID);
}

void YesNoPrompt_SetIgnoreTouch(YesNoPrompt *yesno, int a1) {
    GF_ASSERT(yesno != NULL);
    yesno->ignoreTouch = a1;
}

static void YesNoPrompt_Init(YesNoPrompt *yesno, enum HeapID heapID) {
    memset(yesno, 0, sizeof(YesNoPrompt));
    yesno->buttonsAreInit = 0;
    yesno->heapID = heapID;
    yesno->result = 3;
    yesno->lastTouchEvent = 8;
}

static void YesNoPrompt_InitPixelDataFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    LoadPixelDataFromNarcAndScheduleTransfer(NARC_system_touch_subwindow, 1, yesno->bgConfig, yesno->bgId, template->tileStart, yesno->heapID);
}

static void YesNoPrompt_InitPlttFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    LoadPlttFromNarcAndScheduleTransfer(NARC_system_touch_subwindow, 0, yesno->bgId < 4 ? 0 : 4, template->plttSlot * 32, 64, yesno->heapID);
}

static void YesNoPrompt_InitButtonsFromTemplate(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    int i;
    int j;
    struct UnkStruct_02016C28 sp4;

    for (i = 0; i < 2; ++i) {
        yesno->unk68[i] = (i + 1) * FX32_ONE;
    }

    sp4.bgConfig = yesno->bgConfig;
    sp4.bgId = yesno->bgId;
    sp4.screenDataNarcId = NARC_system_touch_subwindow;
    sp4.baseTile = template->tileStart;
    sp4.plttNum = template->plttSlot;
    sp4.unk4 = yesno->unk68;
    sp4.unk13 = 2;
    sp4.x = yesno->x;

    u8 baseFileNo;
    if (template->shapeParam) {
        baseFileNo = 6;
    } else {
        baseFileNo = 2;
    }

    for (i = 0; i < 2; ++i) {
        for (j = 0; j < 2; ++j) {
            sp4.scrnDataFileNo[j] = baseFileNo + j + i * 2;
        }
        sp4.y = i * yesno->height + yesno->y;
        sp4.plttNum += i;
        YesNoPromptButton_Draw(&yesno->buttons[i], &sp4, yesno->heapID);
    }
}

static void SetupTouchHitboxesController(YesNoPrompt *yesno, const YesNoPromptTemplate *template) {
    int i;
    for (i = 0; i < 2; ++i) {
        yesno->hitboxes[i].rect.top = (yesno->y * 8) + (i * yesno->height * 8);
        yesno->hitboxes[i].rect.left = (yesno->x * 8);
        yesno->hitboxes[i].rect.bottom = (yesno->y * 8) + (i * yesno->height * 8) + (yesno->height * 8);
        yesno->hitboxes[i].rect.right = (yesno->x * 8) + (yesno->width * 8);
    }
    yesno->touchHitboxController = TouchHitboxController_Create(yesno->hitboxes, 2, (TouchHitboxControllerCallback)YesNoButton_TouchHitboxCB, yesno, yesno->heapID);
}

static void YesNoButton_TouchHitboxCB(u32 index, u32 event, YesNoPrompt *yesno) {
    yesno->lastTouchEvent = event;
    if (event == 0) {
        yesno->result = index;
        YesNoPromptButton *r3 = &yesno->buttons[index];
        ScreenPushGraphicsRect(r3->bgConfig, r3->bgId, r3->screenDataPtrs[1], r3->x, r3->y);
        PlaySE(SEQ_SE_DP_BUTTON9);
    }
}

static void YesNoPromptButton_Draw(YesNoPromptButton *button, const struct UnkStruct_02016C28 *arg, enum HeapID heapID) {
    struct YesNoPromptSubstruct00_18 *r2 = &button->unk18;
    r2->unk0 = arg->unk4;
    r2->unk4 = arg->unk13;
    r2->unk8 = 0;
    button->bgConfig = arg->bgConfig;
    button->bgId = arg->bgId;
    button->x = arg->x;
    button->y = arg->y;
    for (int i = 0; i < 2; ++i) {
        button->scrnDataRaw[i] = GfGfxLoader_GetScrnData((NarcId)arg->screenDataNarcId, arg->scrnDataFileNo[i], TRUE, &button->screenDataPtrs[i], heapID);
        ScreenSetBaseTile(button->screenDataPtrs[i], arg->baseTile);
        ScreenSetPalette(button->screenDataPtrs[i], arg->plttNum);
    }
    ScreenPushGraphicsRect(button->bgConfig, button->bgId, button->screenDataPtrs[0], button->x, button->y);
    button->unk26 = 0;
}

static void YesNoPromptButton_Clear(YesNoPromptButton *button) {
    FillBgTilemapRect(button->bgConfig, button->bgId, 0, button->x, button->y, button->screenDataPtrs[0]->screenWidth / 8, button->screenDataPtrs[0]->screenHeight / 8, TILEMAP_COPY_SRC_FLAT);
    ScheduleBgTilemapBufferTransfer(button->bgConfig, button->bgId);
    for (int i = 0; i < 2; ++i) {
        Heap_Free(button->scrnDataRaw[i]);
    }
    memset(button, 0, sizeof(YesNoPromptButton));
}

static SysTask *LoadPixelDataFromNarcAndScheduleTransfer(NarcId narcId, s32 fileId, BgConfig *bgConfig, int bgId, u32 tileStart, enum HeapID heapID) {
    struct SysTaskState_02016DBC *buffer = (struct SysTaskState_02016DBC *)Heap_Alloc(heapID, sizeof(struct SysTaskState_02016DBC));
    memset(buffer, 0, sizeof(struct SysTaskState_02016DBC));
    buffer->charDataRaw = GfGfxLoader_GetCharData(narcId, fileId, TRUE, &buffer->charData, heapID);
    buffer->bgConfig = bgConfig;
    buffer->bgId = bgId;
    buffer->tileStart = tileStart;
    return SysTask_CreateOnVWaitQueue(SysTask_LoadBGPixels, buffer, 0x80);
}

static SysTask *LoadPlttFromNarcAndScheduleTransfer(NarcId narcId, s32 fileId, int bgId, u32 offset, u32 size, enum HeapID heapID) {
    struct SysTaskState_02016DF8 *buffer = (struct SysTaskState_02016DF8 *)Heap_Alloc(heapID, sizeof(struct SysTaskState_02016DF8));
    memset(buffer, 0, sizeof(struct SysTaskState_02016DF8));
    buffer->plttDataRaw = GfGfxLoader_GetPlttData(narcId, fileId, &buffer->plttData, heapID);
    buffer->bgId = bgId;
    buffer->offset = offset;
    buffer->size = size;
    return SysTask_CreateOnVWaitQueue(SysTask_LoadBGPltt, buffer, 0x80);
}

static void SysTask_LoadBGPixels(SysTask *task, void *voidptr) {
    struct SysTaskState_02016DBC *data = (struct SysTaskState_02016DBC *)voidptr;
    DC_FlushRange(data->charData->pRawData, data->charData->szByte);
    BG_LoadCharTilesData(data->bgConfig, data->bgId, data->charData->pRawData, data->charData->szByte, data->tileStart);
    SysTask_Destroy(task);
    Heap_Free(data->charDataRaw);
    Heap_Free(data);
}

static void SysTask_LoadBGPltt(SysTask *task, void *voidptr) {
    struct SysTaskState_02016DF8 *data = (struct SysTaskState_02016DF8 *)voidptr;
    DC_FlushRange(data->plttData->pRawData, data->size);
    if (data->bgId == 0) {
        GX_LoadBGPltt(data->plttData->pRawData, data->offset, data->size);
    } else if (data->bgId == 4) {
        GXS_LoadBGPltt(data->plttData->pRawData, data->offset, data->size);
    }
    SysTask_Destroy(task);
    Heap_Free(data->plttDataRaw);
    Heap_Free(data);
}

static void ScreenPushGraphicsRect(BgConfig *bgConfig, int bgId, NNSG2dScreenData *screenData, int x, int y) {
    CopyToBgTilemapRect(bgConfig, bgId, x, y, screenData->screenWidth / 8, screenData->screenHeight / 8, screenData->rawData, 0, 0, screenData->screenWidth / 8, screenData->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
}

static void ScreenSetBaseTile(NNSG2dScreenData *scrnData, int baseTile) {
    int i;
    u16 *data;
    int ntiles = scrnData->szByte / 2;

    data = (u16 *)scrnData->rawData;
    for (i = 0; i < ntiles; ++i) {
        data[i] += baseTile;
    }
}

static void ScreenSetPalette(NNSG2dScreenData *scrnData, int plttNum) {
    int i;
    u16 *data;
    int ntiles = scrnData->szByte / 2;

    data = (u16 *)scrnData->rawData;
    for (i = 0; i < ntiles; ++i) {
        data[i] &= 0xFFF;
        data[i] |= plttNum << 12;
    }
}
