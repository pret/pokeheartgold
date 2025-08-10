#include "application/view_photo.h"

#include "global.h"

#include "data/resdat.naix"
#include "field/ov01_021E7FDC.h"
#include "msgdata/msg.naix"

#include "field_take_photo.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_02068F84.h"

typedef enum ViewPhotoTaskState {
    VIEW_PHOTO_TASK_STATE_0,
    VIEW_PHOTO_TASK_STATE_1,
    VIEW_PHOTO_TASK_STATE_2,
} ViewPhotoTaskState;

typedef struct ViewPhotoSysTaskData {
    HeapID heapId;
    int state;
    MenuInputState menuInputState;
    ViewPhotoInputResponse lastInput;
    SaveData *saveData;
    FieldSystem *fieldSystem;
    BgConfig *bgConfig;
    FieldViewPhoto *parent;
    u8 filler_020[4];
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *strBuf;
    String *exitMsg;
    String *photoDescStringTemplates[2];
    Window windows[2];
    UnkStruct_ov01_021E7FDC spriteRender;
    Sprite *sprites[3];
    u8 animSpriteNo;
    PhotoAlbumScroll scrollData;
} ViewPhotoSysTaskData;

static void SysTask_ViewPhoto(SysTask *task, void *taskData);
static void ViewPhotoSysTask_Setup(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_Teardown(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ViewPhotoSysTask_HandleInput(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ViewPhotoSysTask_GetKeyInput(ViewPhotoSysTaskData *viewPhoto);
static ViewPhotoInputResponse ViewPhotoSysTask_GetTouchInput(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_InitBgLayers(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_ReleaseBgLayers(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_LoadBgGraphics(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_UnloadBgGraphics(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_InitMessages(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_ReleaseMessages(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_InitWindows(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_ReleaseWindows(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_CreateSprites(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_DeleteSprites(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_AnimateButtonSelect(ViewPhotoSysTaskData *viewPhoto, int spriteNo);
static BOOL ViewPhotoSysTask_IsButtonAnimPlaying(ViewPhotoSysTaskData *viewPhoto);
static void formatPhotoFlavorText(Photo *a0, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData);
static void ViewPhotoSysTask_DrawLyr3Icon(ViewPhotoSysTaskData *viewPhoto);
static void ViewPhotoSysTask_PrintTextOnWindows(ViewPhotoSysTaskData *viewPhoto);
static u8 Photo_CountValidMons(Photo *a0);

static const WindowTemplate ov19_0225A04E[2] = {
    { .bgId = GF_BG_LYR_SUB_1,
     .left = 24,
     .top = 21,
     .width = 8,
     .height = 2,
     .palette = 1,
     .baseTile = 0x1F0 },
    { .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 8,
     .width = 28,
     .height = 8,
     .palette = 10,
     .baseTile = 0x110 }
};

static const TouchscreenHitbox ov19_0225A05E[] = {
    { .rect = { 162, 188, 194, 254 } },
    { .rect = { 24, 56, 80, 96 } },
    { .rect = { 24, 56, 160, 176 } },
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
     },
    {
     1,
     0x58,
     0x28,
     0,
     0,
     2,
     0,
     2,
     1,
     },
    { 1,
     0xA8,
     0x28,
     0,
     3,
     2,
     0,
     2,
     1 }
};

static const u8 _0225A03C[3] = { 9, 1, 4 };

SysTask *FieldSystem_CreateViewPhotoTask(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = AllocFromHeap(HEAP_ID_FIELD, sizeof(ViewPhotoSysTaskData));
    MI_CpuClear8(viewPhoto, sizeof(ViewPhotoSysTaskData));
    viewPhoto->heapId = HEAP_ID_FIELD;
    viewPhoto->fieldSystem = fieldSystem;
    viewPhoto->bgConfig = fieldSystem->bgConfig;
    viewPhoto->saveData = fieldSystem->saveData;
    viewPhoto->parent = fieldSystem->viewPhotoTask;
    viewPhoto->menuInputState = MenuInputStateMgr_GetState(&fieldSystem->menuInputState);
    FieldViewPhoto_GetAlbumScrollParam(viewPhoto->parent, &viewPhoto->scrollData);
    return SysTask_CreateOnMainQueue(SysTask_ViewPhoto, viewPhoto, 1);
}

void FieldSystem_DestroyViewPhotoTask(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)SysTask_GetData(fieldSystem->unk_D8);

    MenuInputStateMgr_SetState(&fieldSystem->menuInputState, viewPhoto->menuInputState);
    ViewPhotoSysTask_Teardown(viewPhoto);
    Heap_Free(viewPhoto);
    SysTask_Destroy(fieldSystem->unk_D8);
    fieldSystem->unk_D8 = NULL;
}

static void SysTask_ViewPhoto(SysTask *task, void *taskData) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)taskData;
    switch (viewPhoto->state) {
    case VIEW_PHOTO_TASK_STATE_0:
        ViewPhotoSysTask_Setup(viewPhoto);
        ++viewPhoto->state;
        return;
    case VIEW_PHOTO_TASK_STATE_1:
        if (GX_GetMasterBrightness() == 0 && ViewPhotoSysTask_HandleInput(viewPhoto) != VIEW_PHOTO_INPUT_NOTHING) {
            ++viewPhoto->state;
        }
        break;
    case VIEW_PHOTO_TASK_STATE_2:
        if (ViewPhotoSysTask_IsButtonAnimPlaying(viewPhoto)) {
            FieldViewPhoto_SetPlayerInput(viewPhoto->parent, viewPhoto->lastInput);
        }
        break;
    }
    SpriteList_RenderAndAnimateSprites(viewPhoto->spriteRender.spriteList);
}

static void ViewPhotoSysTask_Setup(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoSysTask_InitBgLayers(viewPhoto);
    ViewPhotoSysTask_LoadBgGraphics(viewPhoto);
    ViewPhotoSysTask_InitMessages(viewPhoto);
    ViewPhotoSysTask_InitWindows(viewPhoto);
    ViewPhotoSysTask_CreateSprites(viewPhoto);
    ViewPhotoSysTask_PrintTextOnWindows(viewPhoto);
}

static void ViewPhotoSysTask_Teardown(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoSysTask_DeleteSprites(viewPhoto);
    ViewPhotoSysTask_ReleaseWindows(viewPhoto);
    ViewPhotoSysTask_ReleaseMessages(viewPhoto);
    ViewPhotoSysTask_UnloadBgGraphics(viewPhoto);
    ViewPhotoSysTask_ReleaseBgLayers(viewPhoto);
}

static ViewPhotoInputResponse ViewPhotoSysTask_HandleInput(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoInputResponse response = ViewPhotoSysTask_GetTouchInput(viewPhoto);
    if (response == VIEW_PHOTO_INPUT_NOTHING) {
        response = ViewPhotoSysTask_GetKeyInput(viewPhoto);
        if (response == VIEW_PHOTO_INPUT_NOTHING) {
            viewPhoto->menuInputState = MENU_INPUT_STATE_BUTTONS;
        }
    } else {
        viewPhoto->menuInputState = MENU_INPUT_STATE_TOUCH;
    }
    switch (response) {
    case VIEW_PHOTO_INPUT_END:
        ViewPhotoSysTask_AnimateButtonSelect(viewPhoto, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        viewPhoto->lastInput = VIEW_PHOTO_INPUT_END;
        break;
    case VIEW_PHOTO_INPUT_PREV:
        if (viewPhoto->scrollData.curPhoto == 0) {
            return VIEW_PHOTO_INPUT_NOTHING;
        }
        ViewPhotoSysTask_AnimateButtonSelect(viewPhoto, 1);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->lastInput = VIEW_PHOTO_INPUT_PREV;
        break;
    case VIEW_PHOTO_INPUT_NEXT:
        if (viewPhoto->scrollData.curPhoto >= viewPhoto->scrollData.numPhotos - 1) {
            return VIEW_PHOTO_INPUT_NOTHING;
        }
        ViewPhotoSysTask_AnimateButtonSelect(viewPhoto, 2);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->lastInput = VIEW_PHOTO_INPUT_NEXT;
        break;
    default:
        return VIEW_PHOTO_INPUT_NOTHING;
    }

    return response;
}

static ViewPhotoInputResponse ViewPhotoSysTask_GetKeyInput(ViewPhotoSysTaskData *viewPhoto) {
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        return VIEW_PHOTO_INPUT_END;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        return VIEW_PHOTO_INPUT_PREV;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return VIEW_PHOTO_INPUT_NEXT;
    } else {
        return VIEW_PHOTO_INPUT_NOTHING;
    }
}

static ViewPhotoInputResponse ViewPhotoSysTask_GetTouchInput(ViewPhotoSysTaskData *viewPhoto) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(ov19_0225A05E);
    if (hitbox == -1) {
        return VIEW_PHOTO_INPUT_NOTHING;
    }

    return (ViewPhotoInputResponse)(hitbox + 1);
}

static void ViewPhotoSysTask_InitBgLayers(ViewPhotoSysTaskData *viewPhoto) {
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

static void ViewPhotoSysTask_ReleaseBgLayers(ViewPhotoSysTaskData *viewPhoto) {
    BgSetPosTextAndCommit(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, 0);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(viewPhoto->bgConfig, GF_BG_LYR_SUB_1);
    GXS_SetGraphicsMode(GX_BGMODE_0);
}

static void ViewPhotoSysTask_LoadBgGraphics(ViewPhotoSysTaskData *viewPhoto) {
    NARC *narc = NARC_New(NARC_a_1_7_1, viewPhoto->heapId);
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 4, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0, viewPhoto->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 11, viewPhoto->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, 12, viewPhoto->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, viewPhoto->heapId);

    void *ncgrFile;
    NNSG2dCharacterData *pCharData;
    u8 r3;
    ncgrFile = GfGfxLoader_GetCharDataFromOpenNarc(narc, 5, FALSE, &pCharData, viewPhoto->heapId);
    r3 = viewPhoto->scrollData.photo->iconId + 1;
    BG_LoadCharTilesData(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, pCharData->pRawData + ((25 * r3 + 64) * 64), 0x640, 1);
    Heap_Free(ncgrFile);
    NARC_Delete(narc);
}

static void ViewPhotoSysTask_UnloadBgGraphics(ViewPhotoSysTaskData *viewPhoto) {
}

static void ViewPhotoSysTask_InitMessages(ViewPhotoSysTaskData *viewPhoto) {
    FontID_Alloc(4, viewPhoto->heapId);
    viewPhoto->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0000_bin, viewPhoto->heapId);
    viewPhoto->msgFormat = MessageFormat_New_Custom(6, 22, viewPhoto->heapId);
    viewPhoto->strBuf = String_New(128, viewPhoto->heapId);
    viewPhoto->exitMsg = NewString_ReadMsgData(viewPhoto->msgData, 0);
    for (int i = 0; i < 2; ++i) {
        viewPhoto->photoDescStringTemplates[i] = NewString_ReadMsgData(viewPhoto->msgData, 10 + i);
    }
}

static void ViewPhotoSysTask_ReleaseMessages(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        String_Delete(viewPhoto->photoDescStringTemplates[i]);
    }
    String_Delete(viewPhoto->exitMsg);
    String_Delete(viewPhoto->strBuf);
    MessageFormat_Delete(viewPhoto->msgFormat);
    DestroyMsgData(viewPhoto->msgData);
    FontID_Release(4);
}

static void ViewPhotoSysTask_InitWindows(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        AddWindow(viewPhoto->bgConfig, &viewPhoto->windows[i], &ov19_0225A04E[i]);
        FillWindowPixelBuffer(&viewPhoto->windows[i], 0);
    }
}

static void ViewPhotoSysTask_ReleaseWindows(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 2; ++i) {
        ClearWindowTilemapAndCopyToVram(&viewPhoto->windows[i]);
        RemoveWindow(&viewPhoto->windows[i]);
    }
}

static void ViewPhotoSysTask_CreateSprites(ViewPhotoSysTaskData *viewPhoto) {
    UnkFieldSpriteRenderer_ov01_021E7FDC_Init(&viewPhoto->spriteRender, ov19_0225A040, 3, viewPhoto->heapId);
    for (int i = 0; i < 3; ++i) {
        viewPhoto->sprites[i] = ov01_021E81F0(&viewPhoto->spriteRender, &ov19_0225A0C4[i]);
        Sprite_SetDrawFlag(viewPhoto->sprites[i], TRUE);
        Sprite_SetAnimActiveFlag(viewPhoto->sprites[i], TRUE);
    }
    if (viewPhoto->scrollData.curPhoto == 0) {
        Sprite_SetAnimCtrlSeq(viewPhoto->sprites[1], 2);
    } else {
        Sprite_SetAnimCtrlSeq(viewPhoto->sprites[1], 0);
    }
    if (viewPhoto->scrollData.curPhoto >= viewPhoto->scrollData.numPhotos - 1) {
        Sprite_SetAnimCtrlSeq(viewPhoto->sprites[2], 5);
    } else {
        Sprite_SetAnimCtrlSeq(viewPhoto->sprites[2], 3);
    }
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void ViewPhotoSysTask_DeleteSprites(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 3; ++i) {
        Sprite_Delete(viewPhoto->sprites[i]);
    }
    UnkFieldSpriteRenderer_ov01_021E7FDC_Release(&viewPhoto->spriteRender);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
}

static void ViewPhotoSysTask_AnimateButtonSelect(ViewPhotoSysTaskData *viewPhoto, int spriteNo) {
    viewPhoto->animSpriteNo = spriteNo;
    Sprite_SetAnimCtrlSeq(viewPhoto->sprites[spriteNo], _0225A03C[spriteNo]);
    Sprite_ResetAnimCtrlState(viewPhoto->sprites[spriteNo]);
}

static BOOL ViewPhotoSysTask_IsButtonAnimPlaying(ViewPhotoSysTaskData *viewPhoto) {
    return !Sprite_IsAnimated(viewPhoto->sprites[viewPhoto->animSpriteNo]);
}

static void formatPhotoFlavorText(Photo *photo, MessageFormat *msgFormat, String *strBuf, HeapID heapId, SaveData *saveData) {
    BufferPlayersName(msgFormat, 0, Save_PlayerData_GetProfile(saveData));
    sub_02068F98(photo->mapId, heapId, strBuf);
    BufferString(msgFormat, 1, strBuf, 2, 0, 2);
    CopyU16ArrayToString(strBuf, photo->leadMonNick);
    BufferString(msgFormat, 2, strBuf, 2, 0, 2);
    u8 year = photo->date >> 24;
    BufferIntegerAsString(msgFormat, 3, year + 2000, 4, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 month = photo->date >> 16;
    BufferIntegerAsString(msgFormat, 4, month, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
    u8 day = photo->date >> 8;
    BufferIntegerAsString(msgFormat, 5, day, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
}

static void ViewPhotoSysTask_DrawLyr3Icon(ViewPhotoSysTaskData *viewPhoto) {
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 5; ++j) {
            FillBgTilemapRect(viewPhoto->bgConfig, GF_BG_LYR_SUB_3, 5 * i + j + 1, 13 + j, 2 + i, 1, 1, TILEMAP_COPY_SRC_FLAT);
        }
    }
    ScheduleBgTilemapBufferTransfer(viewPhoto->bgConfig, GF_BG_LYR_SUB_3);
}

static void ViewPhotoSysTask_PrintTextOnWindows(ViewPhotoSysTaskData *viewPhoto) {
    // EXIT (print centered)
    AddTextPrinterParameterizedWithColor(&viewPhoto->windows[0], 4, viewPhoto->exitMsg, (64 - FontID_String_GetWidth(4, viewPhoto->exitMsg, 0)) / 2u, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 5, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->windows[0]);

    formatPhotoFlavorText(viewPhoto->scrollData.photo, viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->heapId, viewPhoto->saveData);
    u8 numPokemon = Photo_CountValidMons(viewPhoto->scrollData.photo);
    if (numPokemon > 1) {
        StringExpandPlaceholders(viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->photoDescStringTemplates[1]);
    } else {
        StringExpandPlaceholders(viewPhoto->msgFormat, viewPhoto->strBuf, viewPhoto->photoDescStringTemplates[0]);
    }
    AddTextPrinterParameterizedWithColor(&viewPhoto->windows[1], 0, viewPhoto->strBuf, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    ScheduleWindowCopyToVram(&viewPhoto->windows[1]);
    ViewPhotoSysTask_DrawLyr3Icon(viewPhoto);
}

static u8 Photo_CountValidMons(Photo *photo) {
    u8 answer = 0;
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        int species = photo->party[i].species;
        if (species > SPECIES_NONE && species <= SPECIES_ARCEUS) {
            ++answer;
        }
    }
    return answer;
}
