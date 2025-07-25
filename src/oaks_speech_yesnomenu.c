#include "global.h"

#include "gf_gfx_loader.h"
#include "oaks_speech_internal.h"
#include "text.h"
#include "unk_02005D10.h"
#include "yes_no_prompt.h"

struct OakSpeechYesNo {
    enum HeapID heapID;
    u8 filler_04[0x8];
    BgConfig *bgConfig;
    Sprite *sprite;
    MessageFormat *msgFormat;
    u8 buttonPalette;
    u8 backgroundBgId;
    u8 buttonBgId;
    u8 state : 4;
    u8 result : 4;
    Window windows[2];
};

static void OakSpeechYesNo_CreateWindows(OakSpeechYesNo *yesnoMenu);
static void OakSpeechYesNo_RemoveWindows(OakSpeechYesNo *yesnoMenu);
static void OakSpeechYesNo_PrintMessageOnWindow(OakSpeechYesNo *yesnoMenu, Window *window, int msgId, int msgBank);
static void OakSpeechYesNo_SetCursorSpritePos(OakSpeechYesNo *yesnoMenu);
static BOOL OakSpeechYesNo_HandleInput(OakSpeechYesNo *yesnoMenu);
static BOOL OakSpeechYesNo_WaitCursorSpriteAnim(OakSpeechYesNo *yesnoMenu);

OakSpeechYesNo *OakSpeechYesNo_Create(BgConfig *bgConfig, Sprite *sprite, int backgroundBgId, int buttonBgId, int buttonPalette, enum HeapID heapID) {
    GF_ASSERT(bgConfig != NULL);
    volatile enum HeapID heapId_2 = heapID;
    OakSpeechYesNo *ret = Heap_Alloc(heapID, sizeof(OakSpeechYesNo));
    MI_CpuClear8(ret, sizeof(OakSpeechYesNo));
    ret->heapID = heapID;
    ret->bgConfig = bgConfig;
    ret->sprite = sprite;
    ret->backgroundBgId = backgroundBgId;
    ret->buttonBgId = buttonBgId;
    ret->buttonPalette = buttonPalette;
    ret->msgFormat = MessageFormat_New(heapId_2);
    Sprite_SetAnimActiveFlag(sprite, 1);
    OakSpeechYesNo_CreateWindows(ret);
    return ret;
}

void OakSpeechYesNo_Delete(OakSpeechYesNo *yesnoMenu) {
    GF_ASSERT(yesnoMenu != NULL);
    OakSpeechYesNo_RemoveWindows(yesnoMenu);
    MessageFormat_Delete(yesnoMenu->msgFormat);
    Heap_Free(yesnoMenu);
}

void OakSpeechYesNo_SetBackgroundPalette(OakSpeechYesNo *yesnoMenu, int palette) {
    NARC *narc;
    u8 bgId;
    enum HeapID heapID;

    heapID = yesnoMenu->heapID;
    bgId = yesnoMenu->backgroundBgId;
    narc = NARC_New(NARC_a_2_3_7, heapID);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)(32 * palette), 0x20, heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 1, yesnoMenu->bgConfig, (GFBgLayer)bgId, 0, 0, FALSE, heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 10, yesnoMenu->bgConfig, (GFBgLayer)bgId, 0, 0, FALSE, heapID);
    BgTilemapRectChangePalette(yesnoMenu->bgConfig, bgId, 0, 0, 32, 24, palette);
    BgCommitTilemapBufferToVram(yesnoMenu->bgConfig, bgId);
    ToggleBgLayer(bgId, GF_PLANE_TOGGLE_OFF);
    NARC_Delete(narc);
}

void OakSpeechYesNo_Start(OakSpeechYesNo *yesnoMenu, int msgBank, int msgId_Yes, int msgId_No) {
    OakSpeechYesNo_PrintMessageOnWindow(yesnoMenu, &yesnoMenu->windows[0], msgId_Yes, msgBank);
    OakSpeechYesNo_PrintMessageOnWindow(yesnoMenu, &yesnoMenu->windows[1], msgId_No, msgBank);
    yesnoMenu->state = 0;
    yesnoMenu->result = YESNORESPONSE_YES;
    OakSpeechYesNo_SetCursorSpritePos(yesnoMenu);
    ToggleBgLayer(yesnoMenu->backgroundBgId, GF_PLANE_TOGGLE_ON);
    ToggleBgLayer(yesnoMenu->buttonBgId, GF_PLANE_TOGGLE_ON);
    Sprite_SetDrawFlag(yesnoMenu->sprite, TRUE);
}

int OakSpeechYesNo_Main(OakSpeechYesNo *yesnoMenu) {
    switch (yesnoMenu->state) {
    case 0:
        if (OakSpeechYesNo_HandleInput(yesnoMenu)) {
            ++yesnoMenu->state;
        }
        break;
    case 1:
        if (OakSpeechYesNo_WaitCursorSpriteAnim(yesnoMenu)) {
            GF_ASSERT(yesnoMenu->result != YESNORESPONSE_WAIT);
            ToggleBgLayer(yesnoMenu->backgroundBgId, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(yesnoMenu->buttonBgId, GF_PLANE_TOGGLE_OFF);
            Sprite_SetDrawFlag(yesnoMenu->sprite, FALSE);
            return yesnoMenu->result;
        }
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return FALSE;
}

static void OakSpeechYesNo_CreateWindows(OakSpeechYesNo *yesnoMenu) {
    GF_ASSERT(yesnoMenu != NULL);
    AddWindowParameterized(yesnoMenu->bgConfig, &yesnoMenu->windows[0], yesnoMenu->buttonBgId, 4, 8, 24, 2, yesnoMenu->buttonPalette, 0x50);
    AddWindowParameterized(yesnoMenu->bgConfig, &yesnoMenu->windows[1], yesnoMenu->buttonBgId, 4, 14, 24, 2, yesnoMenu->buttonPalette, 0x80);
}

static void OakSpeechYesNo_RemoveWindows(OakSpeechYesNo *yesnoMenu) {
    GF_ASSERT(yesnoMenu != NULL);
    for (int i = 0; i < 2; ++i) {
        RemoveWindow(&yesnoMenu->windows[i]);
    }
}

static void OakSpeechYesNo_PrintMessageOnWindow(OakSpeechYesNo *yesnoMenu, Window *window, int msgId, int msgBank) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msgBank, yesnoMenu->heapID);
    String *string = ReadMsgData_ExpandPlaceholders(yesnoMenu->msgFormat, msgData, msgId, yesnoMenu->heapID);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 4, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
    CopyWindowToVram(window);
    DestroyMsgData(msgData);
    String_Delete(string);
}

static const s16 sCoords[2][2] = {
    {
     128,
     72,
     },
    {
     128,
     120,
     },
};

static void OakSpeechYesNo_SetCursorSpritePos(OakSpeechYesNo *yesnoMenu) {
    GF_ASSERT(yesnoMenu->sprite != NULL);
    int r4;
    switch (yesnoMenu->result) {
    case YESNORESPONSE_YES:
        r4 = 0;
        break;
    case YESNORESPONSE_NO:
        r4 = 1;
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
    Sprite_SetPositionXY(yesnoMenu->sprite, sCoords[r4][0], sCoords[r4][1]);
}

static const TouchscreenHitbox sHitboxes[] = {
    {
     .rect = {
            50,
            92,
            3,
            251,
        },
     },
    {
     .rect = {
            99,
            140,
            3,
            251,
        },
     },
    {
     .rect = {
            TOUCHSCREEN_RECTLIST_END,
        },
     },
};

static BOOL OakSpeechYesNo_HandleInput(OakSpeechYesNo *yesnoMenu) {
    BOOL ret = FALSE;
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(sHitboxes);
    if (hitbox != -1) {
        PlaySE(SEQ_SE_DP_SELECT);
        switch (hitbox) {
        case 0:
            ret = TRUE;
            yesnoMenu->result = YESNORESPONSE_YES;
            break;
        case 1:
            ret = TRUE;
            yesnoMenu->result = YESNORESPONSE_NO;
            break;
        default:
            GF_ASSERT(FALSE);
            break;
        }
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (yesnoMenu->result != YESNORESPONSE_YES) {
            yesnoMenu->result = YESNORESPONSE_YES;
            OakSpeechYesNo_SetCursorSpritePos(yesnoMenu);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (yesnoMenu->result != YESNORESPONSE_NO) {
            yesnoMenu->result = YESNORESPONSE_NO;
            OakSpeechYesNo_SetCursorSpritePos(yesnoMenu);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        if (yesnoMenu->result == YESNORESPONSE_WAIT) {
            GF_ASSERT(FALSE);
            yesnoMenu->result = YESNORESPONSE_NO;
        }
        ret = TRUE;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        ret = TRUE;
        yesnoMenu->result = YESNORESPONSE_NO;
    }
    if (ret) {
        OakSpeechYesNo_SetCursorSpritePos(yesnoMenu);
        Sprite_SetAnimCtrlSeq(yesnoMenu->sprite, 3);
        PlaySE(SEQ_SE_DP_SELECT);
    }
    return ret;
}

static BOOL OakSpeechYesNo_WaitCursorSpriteAnim(OakSpeechYesNo *yesnoMenu) {
    GF_ASSERT(Sprite_GetAnimationNumber(yesnoMenu->sprite) == 3);
    return !Sprite_IsAnimated(yesnoMenu->sprite);
}
