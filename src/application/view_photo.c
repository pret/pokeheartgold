#include "data/resdat.naix"
#include "global.h"
#include "application/view_photo.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "msgdata/msg.naix"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_020183F0.h"
#include "field_take_photo.h"
#include "message_format.h"
#include "field/ov01_021E7FDC.h"
#include "unk_02068F84.h"

typedef enum ViewPhotoInputResponse {
    INPUT_NOTHING,
    INPUT_END,
    INPUT_PREV,
    INPUT_NEXT,
} ViewPhotoInputResponse;

typedef struct ViewPhotoSysTaskData {
    HeapID heapId;
    int unk_004;
    int unk_008;
    ViewPhotoInputResponse lastInput;
    SaveData *saveData;
    FieldSystem *fieldSystem;
    BgConfig *bgConfig;
    FieldTakePhoto2 *unk_01C;
    u8 filler_020[4];
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *strBuf;
    String *exitMsg;
    String *photoDescStringTemplates[2];
    Window windows[2];
    UnkStruct_ov01_021E7FDC unk_05C;
    Sprite *sprites[3];
    u8 unk_1CC;
    UnkStruct_0206A8C0 unk_1D0;
} ViewPhotoSysTaskData;

static void ov19_02259950(SysTask *task, void *taskData);
static void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto);
static void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259AD8(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259B90(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259BC0(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259C64(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259C68(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259CBC(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259CF4(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259D24(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259D44(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259DF4(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259E20(ViewPhotoSysTaskData *viewPhoto, int spriteNo);
static BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259E64(PHOTO *a0, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData);
static void ov19_02259F0C(ViewPhotoSysTaskData *viewPhoto);
static void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto);
static u8 ov19_0225A008(PHOTO *a0);

static const WindowTemplate ov19_0225A04E[2] = {
    {
        .bgId = GF_BG_LYR_SUB_1,
        .left = 24,
        .top = 21,
        .width = 8,
        .height = 2,
        .palette = 1,
        .baseTile = 0x1F0
    }, {
        .bgId = GF_BG_LYR_SUB_1,
        .left = 1,
        .top = 8,
        .width = 28,
        .height = 8,
        .palette = 10,
        .baseTile = 0x110
    }
};

static const TouchscreenHitbox ov19_0225A05E[] = {
    { .rect = { 162, 188, 194, 254 } },
    { .rect = { 24, 56, 80, 96 } },
    { .rect = { 24, 56, 160, 176 }},
    { { TOUCHSCREEN_RECTLIST_END } },
};

static const u16 ov19_0225A040[] = {
    2, 3, 1, 0, -1, -1, NARC_resdat_resdat_00000072_bin
};

static const SpriteTemplate_ov01_021E81F0 ov19_0225A0C4[3] = {
    {
        1,
        0xE0,
        0xB0,
        0,
        8,
        0xFF,
        0,
        2,
        1,
    }, {
        1,
        0x58,
        0x28,
        0,
        0,
        2,
        0,
        2,
        1,
    }, {
        1,
        0xA8,
        0x28,
        0,
        3,
        2,
        0,
        2,
        1
    }
};

static const u8 _0225A03C[3] = {9, 1, 4};

SysTask *ov19_022598C0(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = AllocFromHeap(HEAP_ID_FIELD, sizeof(ViewPhotoSysTaskData));
    MI_CpuClear8(viewPhoto, sizeof(ViewPhotoSysTaskData));
    viewPhoto->heapId = HEAP_ID_FIELD;
    viewPhoto->fieldSystem = fieldSystem;
    viewPhoto->bgConfig = fieldSystem->bgConfig;
    viewPhoto->saveData = fieldSystem->saveData;
    viewPhoto->unk_01C = fieldSystem->unk_DC;
    viewPhoto->unk_008 = sub_020183F0(&fieldSystem->unk_10C);
    sub_0206A8C0(viewPhoto->unk_01C, &viewPhoto->unk_1D0);
    return SysTask_CreateOnMainQueue(ov19_02259950, viewPhoto, 1);
}

void ov19_02259918(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)SysTask_GetData(fieldSystem->unk_D8);

    sub_02018410(&fieldSystem->unk_10C, viewPhoto->unk_008);
    ov19_022599D4(viewPhoto);
    FreeToHeap(viewPhoto);
    SysTask_Destroy(fieldSystem->unk_D8);
    fieldSystem->unk_D8 = NULL;
}

static void ov19_02259950(SysTask *task, void *taskData) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)taskData;
    switch (viewPhoto->unk_004) {
    case 0:
        ov19_022599AC(viewPhoto);
        ++viewPhoto->unk_004;
        return;
    case 1:
        if (GX_GetMasterBrightness() == 0 && ov19_022599F8(viewPhoto) != INPUT_NOTHING) {
            ++viewPhoto->unk_004;
        }
        break;
    case 2:
        if (ov19_02259E44(viewPhoto)) {
            sub_0206A8DC(viewPhoto->unk_01C, viewPhoto->lastInput);
        }
        break;
    }
    sub_0202457C(viewPhoto->unk_05C.spriteList);
}

static void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259AD8(viewPhoto);
    ov19_02259BC0(viewPhoto);
    ov19_02259C68(viewPhoto);
    ov19_02259CF4(viewPhoto);
    ov19_02259D44(viewPhoto);
    ov19_02259F64(viewPhoto);
}

static void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259DF4(viewPhoto);
    ov19_02259D24(viewPhoto);
    ov19_02259CBC(viewPhoto);
    ov19_02259C64(viewPhoto);
    ov19_02259B90(viewPhoto);
}

static ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoInputResponse response = ov19_02259ABC(viewPhoto);
    if (response == INPUT_NOTHING) {
        response = ov19_02259A94(viewPhoto);
        if (response == INPUT_NOTHING) {
            viewPhoto->unk_008 = FALSE;
        }
    } else {
        viewPhoto->unk_008 = TRUE;
    }
    switch (response) {
    case INPUT_END:
        ov19_02259E20(viewPhoto, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        viewPhoto->lastInput = INPUT_END;
        break;
    case INPUT_PREV:
        if (viewPhoto->unk_1D0.unk_4 == 0) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 1);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->lastInput = INPUT_PREV;
        break;
    case INPUT_NEXT:
        if (viewPhoto->unk_1D0.unk_4 >= viewPhoto->unk_1D0.unk_5 - 1) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 2);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->lastInput = INPUT_NEXT;
        break;
    default:
        return INPUT_NOTHING;
    }

    return response;
}

static ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto) {
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        return INPUT_END;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        return INPUT_PREV;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return INPUT_NEXT;
    } else {
        return INPUT_NOTHING;
    }
}

static ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(ov19_0225A05E);
    if (hitbox == -1) {
        return INPUT_NOTHING;
    }

    return (ViewPhotoInputResponse)(hitbox + 1);
}

static void ov19_02259AD8(ViewPhotoSysTaskData *viewPhoto) {
    GXS_SetGraphicsMode(GX_BGMODE_3);

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x7800,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0,
        };
        InitBgFromTemplate(viewPhoto->bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_1);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x7000,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0,
        };
        InitBgFromTemplate(viewPhoto->bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_2);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_256,
            .screenBase = GX_BG_SCRBASE_0x6800,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0,
        };
        InitBgFromTemplate(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_256x16PLTT);
        BgClearTilemapBufferAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_3);
    }

    BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 0x20, 0, viewPhoto->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x40, 0, viewPhoto->heapId);
    BgSetPosTextAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, -4);
}

static void ov19_02259B90(ViewPhotoSysTaskData *viewPhoto) {
    BgSetPosTextAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, 0);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_1);
    GXS_SetGraphicsMode(GX_BGMODE_0);
}

static void ov19_02259BC0(ViewPhotoSysTaskData *viewPhoto) {
    NARC *narc = NARC_New(NARC_a_1_7_1, viewPhoto->heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 4, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0, viewPhoto->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 11, viewPhoto->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 12, viewPhoto->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->heapId);

    void *ncgrFile;
    NNSG2dCharacterData *pCharData;
    u8 r3;
    ncgrFile = GfGfxLoader_GetCharDataFromOpenNarc(narc, 5, FALSE, &pCharData, viewPhoto->heapId);
    r3 = viewPhoto->unk_1D0.unk_0->unk_4_1 + 1;
    BG_LoadCharTilesData(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, pCharData->pRawData + ((25 * r3 + 64) * 64), 0x640, 1);
    FreeToHeap(ncgrFile);
    NARC_Delete(narc);
}

static void ov19_02259C64(ViewPhotoSysTaskData *viewPhoto) {
}

static void ov19_02259C68(ViewPhotoSysTaskData *viewPhoto) {
    FontID_Alloc(4, viewPhoto->heapId);
    viewPhoto->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0000_bin, viewPhoto->heapId);
    viewPhoto->msgFormat = MessageFormat_New_Custom(6, 22, viewPhoto->heapId);
    viewPhoto->strBuf = String_New(128, viewPhoto->heapId);
    viewPhoto->exitMsg = NewString_ReadMsgData(viewPhoto->msgData, 0);
    for (int i = 0; i < 2; ++i) {
        viewPhoto->photoDescStringTemplates[i] = NewString_ReadMsgData(viewPhoto->msgData, 10 + i);
    }
}

static void ov19_02259CBC(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        String_Delete(viewPhoto->photoDescStringTemplates[i]);
    }
    String_Delete(viewPhoto->exitMsg);
    String_Delete(viewPhoto->strBuf);
    MessageFormat_Delete(viewPhoto->msgFormat);
    DestroyMsgData(viewPhoto->msgData);
    FontID_Release(4);
}

static void ov19_02259CF4(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        AddWindow(viewPhoto->bgConfig, &viewPhoto->windows[i], &ov19_0225A04E[i]);
        FillWindowPixelBuffer(&viewPhoto->windows[i], 0);
    }
}

static void ov19_02259D24(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        ClearWindowTilemapAndCopyToVram(&viewPhoto->windows[i]);
        RemoveWindow(&viewPhoto->windows[i]);
    }
}

static void ov19_02259D44(ViewPhotoSysTaskData *viewPhoto) {
    ov01_021E7FDC(&viewPhoto->unk_05C, ov19_0225A040, 3, viewPhoto->heapId);
    for (int i = 0; i < 3; ++i) {
        viewPhoto->sprites[i] = ov01_021E81F0(&viewPhoto->unk_05C, &ov19_0225A0C4[i]);
        Set2dSpriteVisibleFlag(viewPhoto->sprites[i], TRUE);
        Set2dSpriteAnimActiveFlag(viewPhoto->sprites[i], TRUE);
    }
    if (viewPhoto->unk_1D0.unk_4 == 0) {
        Set2dSpriteAnimSeqNo(viewPhoto->sprites[1], 2);
    } else {
        Set2dSpriteAnimSeqNo(viewPhoto->sprites[1], 0);
    }
    if (viewPhoto->unk_1D0.unk_4 >= viewPhoto->unk_1D0.unk_5 - 1) {
        Set2dSpriteAnimSeqNo(viewPhoto->sprites[2], 5);
    } else {
        Set2dSpriteAnimSeqNo(viewPhoto->sprites[2], 3);
    }
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void ov19_02259DF4(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 3; ++i) {
        Sprite_Delete(viewPhoto->sprites[i]);
    }
    ov01_021E8194(&viewPhoto->unk_05C);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
}

static void ov19_02259E20(ViewPhotoSysTaskData *viewPhoto, int spriteNo) {
    viewPhoto->unk_1CC = spriteNo;
    Set2dSpriteAnimSeqNo(viewPhoto->sprites[spriteNo], _0225A03C[spriteNo]);
    Sprite_ResetAnimCtrlState(viewPhoto->sprites[spriteNo]);
}

static BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto) {
    return !Sprite_IsCellAnimationRunning(viewPhoto->sprites[viewPhoto->unk_1CC]);
}

static void ov19_02259E64(PHOTO *a0, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData) {
    BufferPlayersName(msgFormat, 0, Save_PlayerData_GetProfileAddr(saveData));
    sub_02068F98(a0->unk_32, heapId, strBuf);
    BufferString(msgFormat, 1, strBuf, 2, 0, 2);
    CopyU16ArrayToString(strBuf, a0->leadMonNick);
    BufferString(msgFormat, 2, strBuf, 2, 0, 2);
    u8 year = a0->date >> 24;
    BufferIntegerAsString(msgFormat, 3, year + 2000, 4, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 month = a0->date >> 16;
    BufferIntegerAsString(msgFormat, 4, month, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 day = a0->date >> 8;
    BufferIntegerAsString(msgFormat, 5, day, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
}

static void ov19_02259F0C(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            FillBgTilemapRect(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, 5 * i + j + 1, 13 + j, 2 + i, 1, 1, TILEMAP_COPY_SRC_FLAT);
        }
    }
    ScheduleBgTilemapBufferTransfer(viewPhoto->bgConfig, GF_BG_LYR_SUB_3);
}

static void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto) {
    // EXIT (print centered)
    AddTextPrinterParameterizedWithColor(&viewPhoto->windows[0], 4, viewPhoto->exitMsg, (64 - FontID_String_GetWidth(4, viewPhoto->exitMsg, 0)) / 2u, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 5, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->windows[0]);

    ov19_02259E64(viewPhoto->unk_1D0.unk_0, viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->heapId, viewPhoto->saveData);
    u8 numPokemon = ov19_0225A008(viewPhoto->unk_1D0.unk_0);
    if (numPokemon > 1) {
        StringExpandPlaceholders(viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->photoDescStringTemplates[1]);
    } else {
        StringExpandPlaceholders(viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->photoDescStringTemplates[0]);
    }
    AddTextPrinterParameterizedWithColor(&viewPhoto->windows[1], 0, viewPhoto->strBuf, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->windows[1]);
    ov19_02259F0C(viewPhoto);
}

static u8 ov19_0225A008(PHOTO *a0) {
    u8 answer = 0;
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        int species = a0->party[i].species;
        if (species > SPECIES_NONE && species <= SPECIES_ARCEUS) {
            ++answer;
        }
    }
    return answer;
}
