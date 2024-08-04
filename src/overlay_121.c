#include "bg_window.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "overlay_121.h"
#include "math_util.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "obj_char_transfer.h"
#include "render_window.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_02009D48.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02022588.h"
#include "unk_02023694.h"
#include "unk_0202E4B0.h"
#include "unk_02097D3C.h"
#include "vram_transfer_manager.h"
#include "yes_no_prompt.h"
#include "player_data.h"
#include "msgdata/msg/msg_0421.h"
#include "constants/ranking.h"

#define min(a, b) ((a) <= (b) ? (a) : (b))

typedef enum ViewFriendRecordsWindowId {
    OV121_WINDOW_RANKING,
    OV121_WINDOW_RECORDS,
    OV121_WINDOW_HEADER,
    OV121_WINDOW_RETURN,
    OV121_WINDOW_DELETE_RECORD,
    OV121_WINDOW_SELECT_RECORD_TO_DELETE,
} ViewFriendRecordsWindowId;

typedef enum ViewFriendRecordsSpriteId {
    OV121_SPRITE_CURSOR,
    OV121_SPRITE_RIGHT_ARROW,
    OV121_SPRITE_LEFT_ARROW,
    OV121_SPRITE_RETURN,
    OV121_SPRITE_DELETE_RECORD,
} ViewFriendRecordsSpriteId;

typedef enum ViewFriendRecordsMainState {
    OV121_MAIN_STATE_FADE_IN,
    OV121_MAIN_STATE_WAIT_FADE_IN,
    OV121_MAIN_STATE_MAIN,
    OV121_MAIN_STATE_FADE_OUT,
    OV121_MAIN_STATE_WAIT_FADE_OUT,
} ViewFriendRecordsMainState;

typedef enum ViewFriendRecordsState {
    OV121_STATE_REDRAW,
    OV121_STATE_HANDLE_INPUT,
    OV121_STATE_YESNO,
    OV121_STATE_DELETE_FAILED_CANT_DELETE_OWN,
    OV121_STATE_DO_DELETE_RECORD,
} ViewFriendRecordsState;

typedef enum ViewFriendRecordsInput {
    OV121_INPUT_NONE,
    OV121_INPUT_CURSOR_UP,
    OV121_INPUT_CURSOR_DOWN,
    OV121_INPUT_TAP_RECORD,
    OV121_INPUT_B_BUTTON,
    OV121_INPUT_X_BUTTON,
    OV121_INPUT_CURSOR_LEFT,
    OV121_INPUT_CURSOR_RIGHT,
    OV121_INPUT_A_BUTTON,
} ViewFriendRecordsInput;

typedef struct RecordPageParam {
    u32 max;
    u16 numDigits;
    u16 msgId;
} RecordPageParam;

typedef struct ViewFriendRecordsSub258 {
    UnkStruct_0202E9FC_sub *unk_00;
    u16 active;
    u8 friendIdx;
} ViewFriendRecordsSub258;

typedef struct ViewFriendRecordsSub254 {
    int count;
    ViewFriendRecordsSub258 entries[7];
} ViewFriendRecordsSub254;

typedef struct ViewFriendRecordsAppdata {
    BgConfig *bgConfig;
    Window windows[6];
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *formatedStrBuf;
    String *playerNameString;
    String *rankingString;
    String *miscStrings[7];
    YesNoPrompt *yesNoPrompt;
    SpriteList *spriteList;
    GF_G2dRenderer g2dRenderer;
    GF_2DGfxResMan *gf2dGfxResManagers[6];
    GF_2DGfxResObj *gf2dGfxResObjects[6];
    SpriteResourcesHeader spriteResourcesHeader;
    Sprite *sprites[5];
    TouchscreenHitbox *touchscreenHitboxes;
    u8 mainState;
    u8 isDeleteMode;
    s8 cursorPos;
    u8 state;
    SaveRankings *unk_234;
    UnkStruct_0202E9FC *unk_238[7];
    ViewFriendRecordsSub254 *records;
    ViewFriendRecordsSub258 *recordToDelete;
    u8 page;
    u8 unk_25D;
    u8 pageLength;
    u8 pageOffset;
    u8 recordIdx;
    u8 numRecords;
    u8 recordEntryIdxs[6];
    u8 unk_268;
} ViewFriendRecordsAppData;

typedef struct ViewFriendRecordsCursorPositionParam {
    int x;
    int y;
    int anim;
} ViewFriendRecordsCursorPositionParam;

static const ViewFriendRecordsCursorPositionParam sCursorPositionParams[] = {
    {
        .x = 128,
        .y = 64,
        .anim = 7
    },
    {
        .x = 128,
        .y = 80,
        .anim = 7
    },
    {
        .x = 128,
        .y = 96,
        .anim = 7
    },
    {
        .x = 128,
        .y = 112,
        .anim = 7
    },
    {
        .x = 128,
        .y = 128,
        .anim = 7
    },
    {
        .x = 128,
        .y = 144,
        .anim = 7
    },
    {
        .x = 224,
        .y = 176,
        .anim = 2
    },
};

static const RecordPageParam sRecordPageParam_BattleTower[] = {
    {
        .max = 9999,
        .numDigits = 4,
        .msgId = msg_0421_00044,
    },
    {
        .max = 9999,
        .numDigits = 4,
        .msgId = msg_0421_00044,
    },
    {
        .max = 9999,
        .numDigits = 4,
        .msgId = msg_0421_00044,
    },
    {
        .max = 9999,
        .numDigits = 4,
        .msgId = msg_0421_00044,
    },
    {
        .max = 9999,
        .numDigits = 4,
        .msgId = msg_0421_00044,
    },
    {
        .max = 7,
        .numDigits = 1,
        .msgId = msg_0421_00045,
    },
};

static const RecordPageParam sRecordPageParam_Pokemon[] = {
    // mons fainted
    {
        .max = 999999,
	    .numDigits = 6,
        .msgId = msg_0421_00047,
    },
    // mons caught
    {
        .max = 999999,
	    .numDigits = 6,
        .msgId = msg_0421_00047,
    },
    // eggs hatched
    {
        .max = 999999,
	    .numDigits = 6,
        .msgId = msg_0421_00046,
    },
    // fishing landed
    {
        .max = 999999,
	    .numDigits = 6,
        .msgId = msg_0421_00047,
    },
};

static const RecordPageParam *const sRecordPageParams[] = {
    sRecordPageParam_BattleTower,
    sRecordPageParam_Pokemon,
};

static void ViewFriendRecordsApp_Init_Internal(OVY_MANAGER *man, int *pState);
static BOOL ViewFriendRecordsApp_Main_Internal(ViewFriendRecordsAppData *appData);
static void ov121_021E5CB4(ViewFriendRecordsAppData *appData);
static BOOL ViewFriendRecords_PollAndHandleInput(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_HandleYesNoInput(ViewFriendRecordsAppData *appData);
static BOOL ViewFriendRecords_WaitButtonOrTouch(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_SetGfxBanks(void);
static void ViewFriendRecords_InitBgLayers(BgConfig *bgConfig);
static void ViewFriendRecords_InitObjCharTransfer(void);
static void ViewFriendRecords_CreateOamManager(void);
static void VBlankCB_ViewFriendRecords(void *cbData);
static void ViewFriendRecords_LoadBgGraphics(BgConfig *bgConfig, HeapID heapId);
static void ViewFriendRecords_LoadSpriteGraphics(ViewFriendRecordsAppData *appData, HeapID heapId);
static void ViewFriendRecords_CreateSpriteResourcesHeader(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_DestroySprites(ViewFriendRecordsAppData *appData);
static void setSpriteTemplate(SpriteTemplate *spriteTemplate, ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_CreateSprites(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_CreateTouchscreenHitboxes(ViewFriendRecordsAppData *appData, HeapID heapId);
static ViewFriendRecordsInput ViewFriendRecords_PollInput(ViewFriendRecordsAppData *appData, int *pSelection);
static BOOL ViewFriendRecords_HandleInput_BrowsePages(ViewFriendRecordsAppData *appData, ViewFriendRecordsInput input, int selection);
static void ViewFriendRecords_HandleInput_SelectRecordToDelete(ViewFriendRecordsAppData *appData, ViewFriendRecordsInput input, int selection);
static void ViewFriendRecords_MoveCursorInDirection(ViewFriendRecordsAppData *appData, int direction);
static void ViewFriendRecords_TrySetCursorPosition(ViewFriendRecordsAppData *appData, int selection);
static void ViewFriendRecords_DrawCursor(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_SwitchPage(ViewFriendRecordsAppData *appData, int direction);
static void ViewFriendRecords_ToggleDeleteMode(ViewFriendRecordsAppData *appData, BOOL selection);
static void ViewFriendRecords_CreateWindows(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_HideSelectRecordToDeleteText(ViewFriendRecordsAppData *appData);
static void ov121_021E67FC(ViewFriendRecordsAppData *appData, SaveData *saveData);
static void ViewFriendRecords_CreateStrings(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_DeleteStrings(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintRecords(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintDeleteRecordText(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintReturnText(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintDeleteXsRecordAreYouSure(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintYourOwnRecordCantBeDeleted(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintRecordStatHeaderText(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_PrintSelectRecordToDeleteText(ViewFriendRecordsAppData *appData);
static void ViewFriendRecords_AskConfirmDeleteRecord(ViewFriendRecordsAppData *appData);
static void dimAllMainBgsExceptLyr0(void);
static void resetMainBgsBrightness(void);
static void ViewFriendRecordsApp_CommitChanges(ViewFriendRecordsAppData *appData);

BOOL ViewFriendRecordsApp_Init(OVY_MANAGER *man, int *pState) {
    ViewFriendRecordsApp_Init_Internal(man, pState);
    return TRUE;
}

BOOL ViewFriendRecordsApp_Main(OVY_MANAGER *man, int *pState) {
    ViewFriendRecordsAppData *appData = OverlayManager_GetData(man);
    switch (appData->mainState) {
    case OV121_MAIN_STATE_FADE_IN:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->mainState = OV121_MAIN_STATE_WAIT_FADE_IN;
        break;
    case OV121_MAIN_STATE_WAIT_FADE_IN:
        if (IsPaletteFadeFinished()) {
            appData->mainState = OV121_MAIN_STATE_MAIN;
        }
        break;
    case OV121_MAIN_STATE_MAIN:
        if (ViewFriendRecordsApp_Main_Internal(appData)) {
            appData->mainState = OV121_MAIN_STATE_FADE_OUT;
        }
        break;
    case OV121_MAIN_STATE_FADE_OUT:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->mainState = OV121_MAIN_STATE_WAIT_FADE_OUT;
        break;
    case OV121_MAIN_STATE_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            ViewFriendRecordsApp_CommitChanges(appData);
            return TRUE;
        }
        break;
    }

    ov121_021E5CB4(appData);
    return FALSE;
}

BOOL ViewFriendRecordsApp_Exit(OVY_MANAGER *man, int *pState) {
    ViewFriendRecordsAppData *appData = OverlayManager_GetData(man);

    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    Main_SetVBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    ViewFriendRecords_DeleteStrings(appData);
    RemoveWindow(&appData->windows[OV121_WINDOW_RANKING]);
    RemoveWindow(&appData->windows[OV121_WINDOW_RECORDS]);
    RemoveWindow(&appData->windows[OV121_WINDOW_HEADER]);
    RemoveWindow(&appData->windows[OV121_WINDOW_RETURN]);
    RemoveWindow(&appData->windows[OV121_WINDOW_DELETE_RECORD]);
    RemoveWindow(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE]);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_SUB_0);
    ViewFriendRecords_DestroySprites(appData);
    sub_0200AEB0(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT]);
    for (int i = 0; i < 6; ++i) {
        Destroy2DGfxResObjMan(appData->gf2dGfxResManagers[i]);
    }
    SpriteList_Delete(appData->spriteList);
    FontID_Release(4);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    sub_02022608();
    YesNoPrompt_Destroy(appData->yesNoPrompt);
    FreeToHeap(appData->touchscreenHitboxes);
    FreeToHeap(appData->bgConfig);
    for (int i = 0; i < appData->pageLength + 1; ++i) {
        sub_0202EAFC(appData->unk_238[i]);
    }
    FreeToHeap(appData->records);
    FreeToHeap(appData);
    DestroyHeap(HEAP_ID_9E);
    return TRUE;
}

static void ViewFriendRecordsApp_Init_Internal(OVY_MANAGER *man, int *pState) {
    ViewFriendRecordsArgs *args = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_9E, 0x10000);
    ViewFriendRecordsAppData *data = OverlayManager_CreateAndGetData(man, sizeof(ViewFriendRecordsAppData), HEAP_ID_9E);
    memset(data, 0, sizeof(ViewFriendRecordsAppData));
    data->bgConfig = BgConfig_Alloc(HEAP_ID_9E);
    ViewFriendRecords_SetGfxBanks();
    ViewFriendRecords_InitBgLayers(data->bgConfig);
    ViewFriendRecords_InitObjCharTransfer();
    ViewFriendRecords_CreateOamManager();
    ViewFriendRecords_LoadSpriteGraphics(data, HEAP_ID_9E);
    ViewFriendRecords_CreateSpriteResourcesHeader(data);
    data->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_9E);
    data->unk_268 = Options_GetFrame(Save_PlayerData_GetOptionsAddr(args->saveData));
    Main_SetVBlankIntrCB(VBlankCB_ViewFriendRecords, data->bgConfig);
    data->mainState = 0;
    ResetAllTextPrinters();
    FontID_Alloc(4, HEAP_ID_9E);
    ViewFriendRecords_LoadBgGraphics(data->bgConfig, HEAP_ID_9E);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    ViewFriendRecords_CreateWindows(data);
    ViewFriendRecords_CreateSprites(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    ViewFriendRecords_CreateTouchscreenHitboxes(data, HEAP_ID_9E);
    data->state = 1;
    data->unk_234 = sub_0202E530(args->saveData);
    data->page = args->page_scroll % 3;
    data->unk_25D = args->page_scroll / 3;
    data->pageLength = RankingsViewSys_GetNumRecordsPerPage(data->page);
    data->pageOffset = RankingsViewSys_GetFirstRecordIndexOnPage(data->page);
    ov121_021E67FC(data, args->saveData);
    data->recordIdx = args->cursorPos;
    if (data->recordIdx >= data->pageLength) {
        GF_ASSERT(FALSE);
        data->recordIdx = 0;
    }
    ViewFriendRecords_CreateStrings(data);
    ViewFriendRecords_ToggleDeleteMode(data, 0);
    ViewFriendRecords_PrintRecords(data);
    ViewFriendRecords_PrintDeleteRecordText(data);
    ViewFriendRecords_PrintReturnText(data);
    ViewFriendRecords_PrintRecordStatHeaderText(data);
}

static BOOL ViewFriendRecordsApp_Main_Internal(ViewFriendRecordsAppData *appData) {
    switch (appData->state) {
    case OV121_STATE_REDRAW:
        ViewFriendRecords_PrintRecords(appData);
        appData->state = OV121_STATE_HANDLE_INPUT;
        break;
    case OV121_STATE_HANDLE_INPUT:
        if (ViewFriendRecords_PollAndHandleInput(appData)) {
            return TRUE;
        }
        break;
    case OV121_STATE_YESNO:
        ViewFriendRecords_HandleYesNoInput(appData);
        break;
    case OV121_STATE_DELETE_FAILED_CANT_DELETE_OWN:
        if (ViewFriendRecords_WaitButtonOrTouch(appData)) {
            appData->state = OV121_STATE_HANDLE_INPUT;
        }
        break;
    case OV121_STATE_DO_DELETE_RECORD:
        appData->recordToDelete->active = FALSE;
        appData->state = OV121_STATE_REDRAW;
        break;
    }
    return FALSE;
}

static void ov121_021E5CB4(ViewFriendRecordsAppData *appData) {
    if (appData->spriteList != NULL) {
        sub_0202457C(appData->spriteList);
    }
}

static BOOL ViewFriendRecords_PollAndHandleInput(ViewFriendRecordsAppData *appData) {
    int selection;
    ViewFriendRecordsInput input = ViewFriendRecords_PollInput(appData, &selection);
    if (input == 0) {
        return FALSE;
    }
    if (appData->isDeleteMode == 0) {
        if (ViewFriendRecords_HandleInput_BrowsePages(appData, input, selection)) {
            return TRUE;
        }
    } else {
        ViewFriendRecords_HandleInput_SelectRecordToDelete(appData, input, selection);
    }
    return FALSE;
}

static void ViewFriendRecords_HandleYesNoInput(ViewFriendRecordsAppData *appData) {
    switch (YesNoPrompt_HandleInput(appData->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = OV121_STATE_DO_DELETE_RECORD;
        ViewFriendRecords_PrintSelectRecordToDeleteText(appData);
        break;
    case YESNORESPONSE_NO:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = OV121_STATE_HANDLE_INPUT;
        ViewFriendRecords_PrintSelectRecordToDeleteText(appData);
        break;
    }
}

static BOOL ViewFriendRecords_WaitButtonOrTouch(ViewFriendRecordsAppData *appData) {
    if (gSystem.newKeys != 0 || System_GetTouchNew()) {
        ViewFriendRecords_PrintSelectRecordToDeleteText(appData);
        return TRUE;
    }
    return FALSE;
}

static void ViewFriendRecords_SetGfxBanks(void) {
    GraphicsBanks graphicsBanks = {
        .bg = GX_VRAM_BG_128_A,
        .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
        .subbg = GX_VRAM_SUB_BG_128_C,
        .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
        .obj = GX_VRAM_OBJ_64_E,
        .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
        .subobj = GX_VRAM_SUB_OBJ_16_I,
        .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
        .tex = GX_VRAM_TEX_0_B,
        .texpltt = GX_VRAM_TEXPLTT_01_FG,
    };
    GfGfx_SetBanks(&graphicsBanks);
}

static void ViewFriendRecords_InitBgLayers(BgConfig *bgConfig) {
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();

    {
        GraphicsModes graphicsModes = {
            .dispMode = GX_DISPMODE_GRAPHICS,
            .bgMode = GX_BGMODE_0,
            .subMode = GX_BGMODE_0,
            ._2d3dMode = GX_BG0_AS_2D
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf800,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf000,
            .charBase = GX_BG_CHARBASE_0x08000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe000,
            .charBase = GX_BG_CHARBASE_0x08000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xd800,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf000,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    }

    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_0, 0, 1, 0);
    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_1, 0, 1, 0);
    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_2, 0, 1, 0);
}

static void ViewFriendRecords_InitObjCharTransfer(void) {
    ObjCharTransferTemplate template = {
        .maxTasks = 10,
        .sizeMain = 0x10000,
        .sizeSub = 0x4000,
        .heapId = HEAP_ID_9E
    };
    ObjCharTransfer_Init(&template);
    sub_02022588(1, HEAP_ID_9E);
    ObjCharTransfer_ClearBuffers();
    sub_02022638();
}

static void ViewFriendRecords_CreateOamManager(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 0, 126, 0, 32, HEAP_ID_9E);
}

static void VBlankCB_ViewFriendRecords(void *cbData) {
    BgConfig *bgConfig = (BgConfig *)cbData;

    OamManager_ApplyAndResetBuffers();
    DoScheduledBgGpuUpdates(bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void ViewFriendRecords_LoadBgGraphics(BgConfig *bgConfig, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 1, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x40, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 3, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x1000, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 5, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_3);

    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 2, bgConfig, GF_BG_LYR_SUB_0, 0, 0x400, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 4, bgConfig, GF_BG_LYR_SUB_0, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_0);
}

static void ViewFriendRecords_LoadSpriteGraphics(ViewFriendRecordsAppData *appData, HeapID heapId) {
    appData->spriteList = G2dRenderer_Init(5, &appData->g2dRenderer, heapId);
    for (int i = 0; i < 6; ++i) {
        appData->gf2dGfxResManagers[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, heapId);
    }
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CHAR], NARC_a_2_6_0, 9, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, heapId);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_PLTT], NARC_a_2_6_0, 6, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 4, heapId);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CELL], NARC_a_2_6_0, 8, TRUE, 0, GF_GFX_RES_TYPE_CELL, heapId);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_ANIM], NARC_a_2_6_0, 7, TRUE, 0, GF_GFX_RES_TYPE_ANIM, heapId);
    sub_0200ADA4(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT]);
}

static void ViewFriendRecords_CreateSpriteResourcesHeader(ViewFriendRecordsAppData *appData) {
    CreateSpriteResourcesHeader(&appData->spriteResourcesHeader, 0, 0, 0, 0, -1, -1, 0, 3, appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CHAR], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_PLTT], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CELL], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
}

static void ViewFriendRecords_DestroySprites(ViewFriendRecordsAppData *appData) {
    if (appData->sprites[OV121_SPRITE_CURSOR] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_CURSOR]);
    }
    if (appData->sprites[OV121_SPRITE_RIGHT_ARROW] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_RIGHT_ARROW]);
    }
    if (appData->sprites[OV121_SPRITE_LEFT_ARROW] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_LEFT_ARROW]);
    }
    if (appData->sprites[OV121_SPRITE_RETURN] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_RETURN]);
    }
    if (appData->sprites[OV121_SPRITE_DELETE_RECORD] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_DELETE_RECORD]);
    }
}

static void setSpriteTemplate(SpriteTemplate *spriteTemplate, ViewFriendRecordsAppData *appData) {
    spriteTemplate->spriteList = appData->spriteList;
    spriteTemplate->header = &appData->spriteResourcesHeader;
    spriteTemplate->position.z = 0;
    SetVecFx32(spriteTemplate->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate->rotation = 0;
    spriteTemplate->priority = 0;
    spriteTemplate->whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate->heapId = HEAP_ID_9E;
}

static void ViewFriendRecords_CreateSprites(ViewFriendRecordsAppData *appData) {
    Sprite *sprite;
    SpriteTemplate spriteTemplate;
    setSpriteTemplate(&spriteTemplate, appData);

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 2);
    Sprite_SetPriority(sprite, 1);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_CURSOR] = sprite;

    spriteTemplate.position.x = FX32_CONST(16);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 3);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_LEFT_ARROW] = sprite;

    spriteTemplate.position.x = FX32_CONST(240);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 5);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_RIGHT_ARROW] = sprite;

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 0);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_RETURN] = sprite;

    spriteTemplate.position.x = FX32_CONST(64);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 8);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_DELETE_RECORD] = sprite;
}

static void ViewFriendRecords_CreateTouchscreenHitboxes(ViewFriendRecordsAppData *appData, HeapID heapId) {
    appData->touchscreenHitboxes = AllocFromHeap(heapId, 10 * sizeof(TouchscreenHitbox));
    for (int i = 0; i < 6; ++i) {
        TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[i], 56 + 16 * i, 40, 16, 176);
    }
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[6], 168, 8, 16, 128);
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[7], 168, 192, 16, 64);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[8], 16, 96, 16);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[9], 240, 96, 16);
}

static ViewFriendRecordsInput ViewFriendRecords_PollInput(ViewFriendRecordsAppData *appData, int *a1) {
    int input = 0;
    if (!System_GetTouchHeld()) {
        input = gSystem.newKeys;
        if (input != 0) {
            switch (input) {
            case PAD_KEY_LEFT:
                return OV121_INPUT_CURSOR_LEFT;
            case PAD_KEY_RIGHT:
                return OV121_INPUT_CURSOR_RIGHT;
            case PAD_KEY_UP:
                return OV121_INPUT_CURSOR_UP;
            case PAD_KEY_DOWN:
                return OV121_INPUT_CURSOR_DOWN;
            case PAD_BUTTON_X:
                return OV121_INPUT_X_BUTTON;
            case PAD_BUTTON_A:
                return OV121_INPUT_A_BUTTON;
            case PAD_BUTTON_B:
                return OV121_INPUT_B_BUTTON;
            }
        }
    }
    if (input == 0 && System_GetTouchNew()) {
        // Potential UB: TouchscreenHitbox_FindRectAtTouchNew expects unk_22C to be terminated with {0xFF,0,0,0} but ov121_021E62A0 never sets that up
        input = TouchscreenHitbox_FindHitboxAtTouchNew(appData->touchscreenHitboxes);
        if (input != -1) {
            switch (input) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                *a1 = input;
                return OV121_INPUT_TAP_RECORD;
            case 6:
                return OV121_INPUT_X_BUTTON;
            case 7:
                *a1 = input;
                return OV121_INPUT_B_BUTTON;
            case 8:
                return OV121_INPUT_CURSOR_LEFT;
            case 9:
                return OV121_INPUT_CURSOR_RIGHT;
            }
        }
    }
    return OV121_INPUT_NONE;
}

static BOOL ViewFriendRecords_HandleInput_BrowsePages(ViewFriendRecordsAppData *appData, ViewFriendRecordsInput input, int selection) {
    switch (input) {
    case OV121_INPUT_NONE:
    case OV121_INPUT_CURSOR_UP:
    case OV121_INPUT_CURSOR_DOWN:
    case OV121_INPUT_TAP_RECORD:
        break;
    case OV121_INPUT_CURSOR_LEFT:
        ViewFriendRecords_SwitchPage(appData, -1);
        break;
    case OV121_INPUT_CURSOR_RIGHT:
        ViewFriendRecords_SwitchPage(appData,  1);
        break;
    case OV121_INPUT_X_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_DELETE_RECORD], 9);
        ViewFriendRecords_ToggleDeleteMode(appData, 1);
        break;
    case OV121_INPUT_B_BUTTON:
    case OV121_INPUT_A_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_RETURN], 1);
        return TRUE;
    }

    return FALSE;
}

static void ViewFriendRecords_HandleInput_SelectRecordToDelete(ViewFriendRecordsAppData *appData, ViewFriendRecordsInput input, int selection) {
    switch (input) {
    case OV121_INPUT_NONE:
    case OV121_INPUT_CURSOR_LEFT:
    case OV121_INPUT_CURSOR_RIGHT:
        break;
    case OV121_INPUT_CURSOR_UP:
        ViewFriendRecords_MoveCursorInDirection(appData, -1);
        break;
    case OV121_INPUT_CURSOR_DOWN:
        ViewFriendRecords_MoveCursorInDirection(appData,  1);
        break;
    case OV121_INPUT_TAP_RECORD:
        ViewFriendRecords_TrySetCursorPosition(appData, selection);
        break;
    case OV121_INPUT_X_BUTTON:
        if (appData->cursorPos < appData->numRecords) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ViewFriendRecords_AskConfirmDeleteRecord(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_RETURN], 1);
            ViewFriendRecords_ToggleDeleteMode(appData, 0);
        }
        break;
    case OV121_INPUT_B_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_RETURN], 1);
        ViewFriendRecords_ToggleDeleteMode(appData, 0);
        break;
    case OV121_INPUT_A_BUTTON:
        if (appData->cursorPos < appData->numRecords) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ViewFriendRecords_AskConfirmDeleteRecord(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_RETURN], 1);
            ViewFriendRecords_ToggleDeleteMode(appData, 0);
        }
        break;
    }
}

static void ViewFriendRecords_MoveCursorInDirection(ViewFriendRecordsAppData *appData, int direction) {
    if (direction > 0) {
        if (appData->cursorPos == 6) {
            appData->cursorPos = 0;
        } else if (appData->cursorPos + direction >= appData->numRecords) {
            appData->cursorPos = 6;
        } else {
            appData->cursorPos += direction;
        }
    } else if (direction < 0) {
        if (appData->cursorPos == 6) {
            appData->cursorPos = appData->numRecords - 1;
        } else if (appData->cursorPos + direction < 0) {
            appData->cursorPos = 6;
        } else {
            appData->cursorPos += direction;
        }
    }
    PlaySE(SEQ_SE_DP_SELECT);
    ViewFriendRecords_DrawCursor(appData);
}

static void ViewFriendRecords_TrySetCursorPosition(ViewFriendRecordsAppData *appData, int selection) {
    if (selection == 6 || selection < appData->numRecords) {
        PlaySE(SEQ_SE_DP_SELECT);
        appData->cursorPos = selection;
        ViewFriendRecords_DrawCursor(appData);
    }
}

static void ViewFriendRecords_DrawCursor(ViewFriendRecordsAppData *appData) {
    VecFx32 pos = {};
    u8 idx = appData->cursorPos;
    pos.x = sCursorPositionParams[idx].x * FX32_ONE;
    pos.y = sCursorPositionParams[idx].y * FX32_ONE;
    Sprite_SetMatrix(appData->sprites[OV121_SPRITE_CURSOR], &pos);
    Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_CURSOR], sCursorPositionParams[idx].anim);
}

static void ViewFriendRecords_SwitchPage(ViewFriendRecordsAppData *appData, int direction) {
    int new = appData->recordIdx + direction;
    if (new < 0) {
        new = appData->pageLength - 1;
    } else if (new >= appData->pageLength) {
        new = 0;
    }
    appData->recordIdx = new;
    PlaySE(SEQ_SE_DP_SELECT78);
    if (direction > 0) {
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_RIGHT_ARROW], 6);
    } else if (direction < 0) {
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_LEFT_ARROW], 4);
    }
    ViewFriendRecords_PrintRecordStatHeaderText(appData);
    appData->state = OV121_STATE_REDRAW;
}

static void ViewFriendRecords_ToggleDeleteMode(ViewFriendRecordsAppData *appData, BOOL selection) {
    appData->isDeleteMode = selection;
    if (selection == FALSE) {
        appData->cursorPos = 6;
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_RIGHT_ARROW], TRUE);
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_LEFT_ARROW], TRUE);
        ViewFriendRecords_HideSelectRecordToDeleteText(appData);
    } else {
        appData->cursorPos = 0;
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_RIGHT_ARROW], FALSE);
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_LEFT_ARROW], FALSE);
        ViewFriendRecords_PrintSelectRecordToDeleteText(appData);
    }
    ViewFriendRecords_DrawCursor(appData);
}

static void ViewFriendRecords_CreateWindows(ViewFriendRecordsAppData *appData) {
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_RANKING], GF_BG_LYR_MAIN_1, 5, 7, 2, 12, 15, 0x1);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_RECORDS], GF_BG_LYR_MAIN_1, 7, 7, 20, 12, 15, 0x19);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_HEADER], GF_BG_LYR_MAIN_2, 2, 1, 28, 4, 15, 0x109);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_RETURN], GF_BG_LYR_MAIN_2, 25, 21, 6, 2, 1, 0x179);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_DELETE_RECORD], GF_BG_LYR_MAIN_2, 4, 21, 12, 2, 1, 0x185);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], GF_BG_LYR_MAIN_0, 2, 1, 28, 4, 15, 0x1F);
    LoadUserFrameGfx2(appData->bgConfig, GF_BG_LYR_MAIN_0, 0x1, 12, appData->unk_268, HEAP_ID_9E);
}

static void ViewFriendRecords_HideSelectRecordToDeleteText(ViewFriendRecordsAppData *appData) {
    ClearFrameAndWindow2(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], TRUE);
    ClearWindowTilemapAndCopyToVram(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ov121_021E67FC(ViewFriendRecordsAppData *appData, SaveData *saveData) {
    int j;
    int i;
    BOOL inserted;
    UnkStruct_0202E9FC *ptr;
    int cnt;

    appData->records = AllocFromHeap(HEAP_ID_9E, appData->pageLength * sizeof(ViewFriendRecordsSub254));
    MI_CpuClear8(appData->records, appData->pageLength * sizeof(ViewFriendRecordsSub254));
    appData->unk_238[0] = sub_0202E9FC(saveData, appData->page, HEAP_ID_9E);
    for (i = 0; i < appData->pageLength; ++i) {
        appData->unk_238[1 + i] = sub_0202EA80(appData->unk_234, appData->pageOffset + appData->unk_25D * RANKINGS_COUNT + i, HEAP_ID_9E);
        cnt = 0;
        inserted = FALSE;
        ptr = appData->unk_238[1 + i];
        if (ptr->count == 0) {
            appData->records[i].entries[0].unk_00 = &appData->unk_238[0]->unk_04[i];
            appData->records[i].entries[0].active = TRUE;
            appData->records[i].entries[0].friendIdx = 0xFF;
            appData->records[i].count = 1;
        } else {
            for (j = 0; j < ptr->count; ++j) {
                if (!inserted && appData->unk_238[0]->unk_04[i].stat >= ptr->unk_04[j].stat) {
                    appData->records[i].entries[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = 0xFF;
                    ++cnt;
                    appData->records[i].entries[cnt].unk_00 = &ptr->unk_04[j];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = j;
                    inserted = TRUE;
                } else {
                    appData->records[i].entries[cnt].unk_00 = &ptr->unk_04[j];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = j;
                }
                ++cnt;
            }
            if (!inserted) {
                appData->records[i].entries[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                appData->records[i].entries[cnt].active = TRUE;
                appData->records[i].entries[cnt].friendIdx = 0xFF;
            }
            appData->records[i].count = ptr->count + 1;
        }
    }
}

static void ViewFriendRecords_CreateStrings(ViewFriendRecordsAppData *appData) {
    appData->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0421_bin, HEAP_ID_9E);
    appData->msgFormat = MessageFormat_New_Custom(2, 76, HEAP_ID_9E);
    appData->formatedStrBuf = String_New(76, HEAP_ID_9E);
    appData->playerNameString = NewString_ReadMsgData(appData->msgData, msg_0421_00043);
    appData->rankingString = NewString_ReadMsgData(appData->msgData, msg_0421_00042);
    for (int i = 0; i < 7; ++i) {
        appData->miscStrings[i] = NewString_ReadMsgData(appData->msgData, msg_0421_00044 + i);
    }
}

static void ViewFriendRecords_DeleteStrings(ViewFriendRecordsAppData *appData) {
    for (int i = 0; i < 7; ++i) {
        String_Delete(appData->miscStrings[i]);
    }
    String_Delete(appData->playerNameString);
    String_Delete(appData->rankingString);
    String_Delete(appData->formatedStrBuf);
    MessageFormat_Delete(appData->msgFormat);
    DestroyMsgData(appData->msgData);
}

static void ViewFriendRecords_PrintRecords(ViewFriendRecordsAppData *appData) {
    int i;
    int ranking;
    int y;
    const RecordPageParam *sp10;
    ViewFriendRecordsSub254 *pRecord;
    int prev;
    int cur;

    pRecord= &appData->records[appData->recordIdx];
    sp10 = &sRecordPageParams[appData->page][appData->recordIdx];

    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_RECORDS], 0);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_RANKING], 0);
    ranking = 1;
    y = 0;
    prev = 0;
    i = 0;
    appData->numRecords = 0;
    for (; i < pRecord->count; ++i) {
        if (pRecord->entries[i].active != 0) {
            cur = min(pRecord->entries[i].unk_00->stat, sp10->max);
            if (cur < prev) {
                ++ranking;
            }
            BufferIntegerAsString(appData->msgFormat, 0, ranking, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->rankingString);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_RANKING], 0, appData->formatedStrBuf, 0, 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferString(appData->msgFormat, 1, pRecord->entries[i].unk_00->playerName, 2, 1, 2);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->playerNameString);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_RECORDS], 0, appData->formatedStrBuf, 0, 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferIntegerAsString(appData->msgFormat, 0, cur, sp10->numDigits, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->miscStrings[sp10->msgId - msg_0421_00044]);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_RECORDS], 0, appData->formatedStrBuf, 160 - FontID_String_GetWidth(0, appData->formatedStrBuf, 0), 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            appData->recordEntryIdxs[y] = i;
            prev = cur;
            if (++y >= 6) {
                break;
            }
        }
    }
    CopyWindowToVram(&appData->windows[OV121_WINDOW_RECORDS]);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_RANKING]);
    appData->numRecords = y;
    if (appData->isDeleteMode == 1 && appData->cursorPos >= appData->numRecords) {
        GF_ASSERT(appData->cursorPos != 7);
        appData->cursorPos = appData->numRecords - 1;
        ViewFriendRecords_DrawCursor(appData);
    }
}

static void ViewFriendRecords_PrintDeleteRecordText(ViewFriendRecordsAppData *appData) {
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_DELETE_RECORD], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00040);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_DELETE_RECORD], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_DELETE_RECORD]);
}

static void ViewFriendRecords_PrintReturnText(ViewFriendRecordsAppData *appData) {
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_RETURN], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00041);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_RETURN], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_RETURN]);
}

static void ViewFriendRecords_PrintDeleteXsRecordAreYouSure(ViewFriendRecordsAppData *appData) {
    ViewFriendRecordsSub254 *r6;
    u8 r4;
    String *string;

    r4 = appData->recordEntryIdxs[appData->cursorPos];
    r6 = &appData->records[appData->recordIdx];
    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    BufferString(appData->msgFormat, 0, r6->entries[r4].unk_00->playerName, 2, 1, 2);
    string = ReadMsgData_ExpandPlaceholders(appData->msgFormat, appData->msgData, msg_0421_00049, HEAP_ID_9E);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewFriendRecords_PrintYourOwnRecordCantBeDeleted(ViewFriendRecordsAppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00052);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewFriendRecords_PrintRecordStatHeaderText(ViewFriendRecordsAppData *appData) {
    String *string;
    String *string2;
    int msgNo;

    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_HEADER], 0);
    msgNo = (appData->page == 0 ? msg_0421_00053 : msg_0421_00065) + appData->recordIdx * 2;
    string = NewString_ReadMsgData(appData->msgData, msgNo);
    string2 = NewString_ReadMsgData(appData->msgData, msgNo + 1);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_HEADER], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_HEADER], 0, string2, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    String_Delete(string2);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_HEADER]);
}

static void ViewFriendRecords_PrintSelectRecordToDeleteText(ViewFriendRecordsAppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00048);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewFriendRecords_AskConfirmDeleteRecord(ViewFriendRecordsAppData *appData) {
    YesNoPromptTemplate template;

    appData->recordToDelete = &appData->records[appData->recordIdx].entries[appData->recordEntryIdxs[appData->cursorPos]];
    if (appData->recordToDelete->friendIdx == 0xFF) {
        appData->state = OV121_STATE_DELETE_FAILED_CANT_DELETE_OWN;
        ViewFriendRecords_PrintYourOwnRecordCantBeDeleted(appData);
        PlaySE(SEQ_SE_DP_CUSTOM06);
    } else {
        MI_CpuClear8(&template, sizeof(YesNoPromptTemplate));
        template.bgConfig = appData->bgConfig;
        template.bgId = GF_BG_LYR_MAIN_0;
        template.tileStart = 0x08F;
        template.plttSlot = 13;
        template.x = 25;
        template.y = 6;
        YesNoPrompt_InitFromTemplate(appData->yesNoPrompt, &template);
        ViewFriendRecords_PrintDeleteXsRecordAreYouSure(appData);
        dimAllMainBgsExceptLyr0();
        appData->state = OV121_STATE_YESNO;
    }
}

static void dimAllMainBgsExceptLyr0(void) {
    G2_SetBlendBrightness(
        GX_PLANEMASK_ALL & ~GX_PLANEMASK_BG0,
        -7
    );
}

static void resetMainBgsBrightness(void) {
    G2_BlendNone();
}

static void ViewFriendRecordsApp_CommitChanges(ViewFriendRecordsAppData *appData) {
    int i;
    int j;
    int count;
    ViewFriendRecordsSub258 *r1;
    for (i = 0; i < appData->pageLength; ++i) {
        count = 0;
        for (j = 0; j < appData->records[i].count; ++j) {
            r1 = &appData->records[i].entries[j];
            if (r1->friendIdx != 0xFF && r1->active == FALSE) {
                sub_0202E544(appData->unk_234, appData->pageOffset + appData->unk_25D * RANKINGS_COUNT + i, r1->friendIdx - count);
                ++count;
            }
        }
    }
}
