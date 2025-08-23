#include "application/view_rankings.h"

#include "global.h"

#include "constants/ranking.h"

#include "application/guinness.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0421.h"

#include "bg_window.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "math_util.h"
#include "msgdata.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "player_data.h"
#include "render_window.h"
#include "save_rankings.h"
#include "sprite.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_02009D48.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02097D3C.h"
#include "vram_transfer_manager.h"
#include "yes_no_prompt.h"

#define min(a, b) ((a) <= (b) ? (a) : (b))

typedef enum ViewRankingsWindowId {
    VIEW_RANKINGS_APP_WINDOW_RANKING,
    VIEW_RANKINGS_APP_WINDOW_RECORDS,
    VIEW_RANKINGS_APP_WINDOW_HEADER,
    VIEW_RANKINGS_APP_WINDOW_RETURN,
    VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD,
    VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE,
    VIEW_RANKINGS_APP_WINDOW_MAX,
} ViewRankingsWindowId;

typedef enum ViewRankingsSpriteId {
    VIEW_RANKINGS_APP_SPRITE_CURSOR,
    VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW,
    VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW,
    VIEW_RANKINGS_APP_SPRITE_RETURN,
    VIEW_RANKINGS_APP_SPRITE_DELETE_RECORD,
    VIEW_RANKINGS_APP_SPRITE_MAX,
} ViewRankingsSpriteId;

typedef enum ViewRankingsMiscStringId {
    VIEW_RANKINGS_MISC_STRING_0,
    VIEW_RANKINGS_MISC_STRING_1,
    VIEW_RANKINGS_MISC_STRING_2,
    VIEW_RANKINGS_MISC_STRING_3,
    VIEW_RANKINGS_MISC_STRING_4,
    VIEW_RANKINGS_MISC_STRING_5,
    VIEW_RANKINGS_MISC_STRING_6,
    VIEW_RANKINGS_MISC_STRING_MAX,
} ViewRankingsMiscStringId;

typedef enum ViewRankingsMainState {
    VIEW_RANKINGS_APP_MAIN_STATE_FADE_IN,
    VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_IN,
    VIEW_RANKINGS_APP_MAIN_STATE_MAIN,
    VIEW_RANKINGS_APP_MAIN_STATE_FADE_OUT,
    VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_OUT,
} ViewRankingsMainState;

typedef enum ViewRankingsState {
    VIEW_RANKINGS_APP_STATE_REDRAW,
    VIEW_RANKINGS_APP_STATE_HANDLE_INPUT,
    VIEW_RANKINGS_APP_STATE_YESNO,
    VIEW_RANKINGS_APP_STATE_DELETE_FAILED_CANT_DELETE_OWN,
    VIEW_RANKINGS_APP_STATE_DO_DELETE_RECORD,
} ViewRankingsState;

typedef enum ViewRankingsInput {
    VIEW_RANKINGS_APP_INPUT_NONE,
    VIEW_RANKINGS_APP_INPUT_CURSOR_UP,
    VIEW_RANKINGS_APP_INPUT_CURSOR_DOWN,
    VIEW_RANKINGS_APP_INPUT_TAP_RECORD,
    VIEW_RANKINGS_APP_INPUT_B_BUTTON,
    VIEW_RANKINGS_APP_INPUT_X_BUTTON,
    VIEW_RANKINGS_APP_INPUT_CURSOR_LEFT,
    VIEW_RANKINGS_APP_INPUT_CURSOR_RIGHT,
    VIEW_RANKINGS_APP_INPUT_A_BUTTON,
} ViewRankingsInput;

typedef struct RecordPageParam {
    u32 max;
    u16 numDigits;
    u16 msgId;
} RecordPageParam;

typedef struct ViewRankingsAppPageEntry {
    ViewRankingsPageEntry *pageEntry;
    u16 active;
    u8 friendIdx;
} ViewRankingsAppPageEntry;

typedef struct ViewRankingsAppPage {
    int count;
    ViewRankingsAppPageEntry entries[7];
} ViewRankingsAppPage;

typedef struct ViewRankingsAppdata {
    BgConfig *bgConfig;
    Window windows[VIEW_RANKINGS_APP_WINDOW_MAX];
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *formatedStrBuf;
    String *playerNameString;
    String *rankingString;
    String *miscStrings[VIEW_RANKINGS_MISC_STRING_MAX];
    YesNoPrompt *yesNoPrompt;
    SpriteList *spriteList;
    G2dRenderer g2dRenderer;
    GF_2DGfxResMan *gf2dGfxResManagers[GF_GFX_RES_TYPE_MAX];
    SpriteResource *gf2dGfxResObjects[GF_GFX_RES_TYPE_MAX];
    SpriteResourcesHeader spriteResourcesHeader;
    Sprite *sprites[VIEW_RANKINGS_APP_SPRITE_MAX];
    TouchscreenHitbox *touchscreenHitboxes;
    u8 mainState;
    u8 isDeleteMode;
    s8 cursorPos;
    u8 state;
    SaveRankings *saveRankings;
    ViewRankingsPage *pages[RANKINGS_PER_STAT + 1];
    ViewRankingsAppPage *records;
    ViewRankingsAppPageEntry *recordToDelete;
    u8 page;
    u8 scope;
    u8 pageLength;
    u8 pageOffset;
    u8 recordIdx;
    u8 numRecords;
    u8 recordEntryIdxs[RANKINGS_PER_STAT];
    u8 frame;
} ViewRankingsAppData;

typedef struct ViewRankingsCursorPositionParam {
    int x;
    int y;
    int anim;
} ViewRankingsCursorPositionParam;

static const ViewRankingsCursorPositionParam sCursorPositionParams[] = {
    {
     .x = 128,
     .y = 64,
     .anim = 7,
     },
    {
     .x = 128,
     .y = 80,
     .anim = 7,
     },
    {
     .x = 128,
     .y = 96,
     .anim = 7,
     },
    {
     .x = 128,
     .y = 112,
     .anim = 7,
     },
    {
     .x = 128,
     .y = 128,
     .anim = 7,
     },
    {
     .x = 128,
     .y = 144,
     .anim = 7,
     },
    {
     .x = 224,
     .y = 176,
     .anim = 2,
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

static void ViewRankingsApp_Init_Internal(OverlayManager *man, int *pState);
static BOOL ViewRankingsApp_Main_Internal(ViewRankingsAppData *appData);
static void ViewRankingsApp_RunSpriteAnimations(ViewRankingsAppData *appData);
static BOOL ViewRankings_PollAndHandleInput(ViewRankingsAppData *appData);
static void ViewRankings_HandleYesNoInput(ViewRankingsAppData *appData);
static BOOL ViewRankings_WaitButtonOrTouch(ViewRankingsAppData *appData);
static void ViewRankings_SetGfxBanks(void);
static void ViewRankings_InitBgLayers(BgConfig *bgConfig);
static void ViewRankings_InitObjCharTransfer(void);
static void ViewRankings_CreateOamManager(void);
static void VBlankCB_ViewRankings(void *cbData);
static void ViewRankings_LoadBgGraphics(BgConfig *bgConfig, enum HeapID heapID);
static void ViewRankings_LoadSpriteGraphics(ViewRankingsAppData *appData, enum HeapID heapID);
static void ViewRankings_CreateSpriteResourcesHeader(ViewRankingsAppData *appData);
static void ViewRankings_DestroySprites(ViewRankingsAppData *appData);
static void setSpriteTemplate(SpriteTemplate *spriteTemplate, ViewRankingsAppData *appData);
static void ViewRankings_CreateSprites(ViewRankingsAppData *appData);
static void ViewRankings_CreateTouchscreenHitboxes(ViewRankingsAppData *appData, enum HeapID heapID);
static ViewRankingsInput ViewRankings_PollInput(ViewRankingsAppData *appData, int *pSelection);
static BOOL ViewRankings_HandleInput_BrowsePages(ViewRankingsAppData *appData, ViewRankingsInput input, int selection);
static void ViewRankings_HandleInput_SelectRecordToDelete(ViewRankingsAppData *appData, ViewRankingsInput input, int selection);
static void ViewRankings_MoveCursorInDirection(ViewRankingsAppData *appData, int direction);
static void ViewRankings_TrySetCursorPosition(ViewRankingsAppData *appData, int selection);
static void ViewRankings_DrawCursor(ViewRankingsAppData *appData);
static void ViewRankings_SwitchPage(ViewRankingsAppData *appData, int direction);
static void ViewRankings_ToggleDeleteMode(ViewRankingsAppData *appData, BOOL selection);
static void ViewRankings_CreateWindows(ViewRankingsAppData *appData);
static void ViewRankings_HideSelectRecordToDeleteText(ViewRankingsAppData *appData);
static void ViewRankingsApp_GetRankingsFromSave(ViewRankingsAppData *appData, SaveData *saveData);
static void ViewRankings_CreateStrings(ViewRankingsAppData *appData);
static void ViewRankings_DeleteStrings(ViewRankingsAppData *appData);
static void ViewRankings_PrintRecords(ViewRankingsAppData *appData);
static void ViewRankings_PrintDeleteRecordText(ViewRankingsAppData *appData);
static void ViewRankings_PrintReturnText(ViewRankingsAppData *appData);
static void ViewRankings_PrintDeleteXsRecordAreYouSure(ViewRankingsAppData *appData);
static void ViewRankings_PrintYourOwnRecordCantBeDeleted(ViewRankingsAppData *appData);
static void ViewRankings_PrintRecordStatHeaderText(ViewRankingsAppData *appData);
static void ViewRankings_PrintSelectRecordToDeleteText(ViewRankingsAppData *appData);
static void ViewRankings_AskConfirmDeleteRecord(ViewRankingsAppData *appData);
static void dimAllMainBgsExceptLyr0(void);
static void resetMainBgsBrightness(void);
static void ViewRankingsApp_CommitChanges(ViewRankingsAppData *appData);

BOOL ViewRankingsApp_Init(OverlayManager *man, int *pState) {
    ViewRankingsApp_Init_Internal(man, pState);
    return TRUE;
}

BOOL ViewRankingsApp_Main(OverlayManager *man, int *pState) {
    ViewRankingsAppData *appData = OverlayManager_GetData(man);
    switch (appData->mainState) {
    case VIEW_RANKINGS_APP_MAIN_STATE_FADE_IN:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_RANKINGS_APP);
        appData->mainState = VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_IN;
        break;
    case VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_IN:
        if (IsPaletteFadeFinished()) {
            appData->mainState = VIEW_RANKINGS_APP_MAIN_STATE_MAIN;
        }
        break;
    case VIEW_RANKINGS_APP_MAIN_STATE_MAIN:
        if (ViewRankingsApp_Main_Internal(appData)) {
            appData->mainState = VIEW_RANKINGS_APP_MAIN_STATE_FADE_OUT;
        }
        break;
    case VIEW_RANKINGS_APP_MAIN_STATE_FADE_OUT:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_RANKINGS_APP);
        appData->mainState = VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_OUT;
        break;
    case VIEW_RANKINGS_APP_MAIN_STATE_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            ViewRankingsApp_CommitChanges(appData);
            return TRUE;
        }
        break;
    }

    ViewRankingsApp_RunSpriteAnimations(appData);
    return FALSE;
}

BOOL ViewRankingsApp_Exit(OverlayManager *man, int *pState) {
    ViewRankingsAppData *appData = OverlayManager_GetData(man);

    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    Main_SetVBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    ViewRankings_DeleteStrings(appData);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RANKING]);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS]);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER]);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RETURN]);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD]);
    RemoveWindow(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE]);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_SUB_0);
    ViewRankings_DestroySprites(appData);
    sub_0200AEB0(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT]);
    for (int i = 0; i < 6; ++i) {
        Destroy2DGfxResObjMan(appData->gf2dGfxResManagers[i]);
    }
    SpriteList_Delete(appData->spriteList);
    FontID_Release(4);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    YesNoPrompt_Destroy(appData->yesNoPrompt);
    Heap_Free(appData->touchscreenHitboxes);
    Heap_Free(appData->bgConfig);
    for (int i = 0; i < appData->pageLength + 1; ++i) {
        ViewRankingsPage_Delete(appData->pages[i]);
    }
    Heap_Free(appData->records);
    Heap_Free(appData);
    Heap_Destroy(HEAP_ID_RANKINGS_APP);
    return TRUE;
}

static void ViewRankingsApp_Init_Internal(OverlayManager *man, int *pState) {
    ViewRankingsArgs *args = OverlayManager_GetArgs(man);
    Heap_Create(HEAP_ID_3, HEAP_ID_RANKINGS_APP, 0x10000);
    ViewRankingsAppData *data = OverlayManager_CreateAndGetData(man, sizeof(ViewRankingsAppData), HEAP_ID_RANKINGS_APP);
    memset(data, 0, sizeof(ViewRankingsAppData));
    data->bgConfig = BgConfig_Alloc(HEAP_ID_RANKINGS_APP);
    ViewRankings_SetGfxBanks();
    ViewRankings_InitBgLayers(data->bgConfig);
    ViewRankings_InitObjCharTransfer();
    ViewRankings_CreateOamManager();
    ViewRankings_LoadSpriteGraphics(data, HEAP_ID_RANKINGS_APP);
    ViewRankings_CreateSpriteResourcesHeader(data);
    data->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_RANKINGS_APP);
    data->frame = Options_GetFrame(Save_PlayerData_GetOptionsAddr(args->saveData));
    Main_SetVBlankIntrCB(VBlankCB_ViewRankings, data->bgConfig);
    data->mainState = 0;
    ResetAllTextPrinters();
    FontID_Alloc(4, HEAP_ID_RANKINGS_APP);
    ViewRankings_LoadBgGraphics(data->bgConfig, HEAP_ID_RANKINGS_APP);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_RANKINGS_APP);
    ViewRankings_CreateWindows(data);
    ViewRankings_CreateSprites(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    ViewRankings_CreateTouchscreenHitboxes(data, HEAP_ID_RANKINGS_APP);
    data->state = 1;
    data->saveRankings = Save_Rankings_Get(args->saveData);
    data->page = args->page_scroll % 3;
    data->scope = args->page_scroll / 3;
    data->pageLength = RankingsViewSys_GetNumRecordsPerPage(data->page);
    data->pageOffset = RankingsViewSys_GetFirstRecordIndexOnPage(data->page);
    ViewRankingsApp_GetRankingsFromSave(data, args->saveData);
    data->recordIdx = args->cursorPos;
    if (data->recordIdx >= data->pageLength) {
        GF_ASSERT(FALSE);
        data->recordIdx = 0;
    }
    ViewRankings_CreateStrings(data);
    ViewRankings_ToggleDeleteMode(data, 0);
    ViewRankings_PrintRecords(data);
    ViewRankings_PrintDeleteRecordText(data);
    ViewRankings_PrintReturnText(data);
    ViewRankings_PrintRecordStatHeaderText(data);
}

static BOOL ViewRankingsApp_Main_Internal(ViewRankingsAppData *appData) {
    switch (appData->state) {
    case VIEW_RANKINGS_APP_STATE_REDRAW:
        ViewRankings_PrintRecords(appData);
        appData->state = VIEW_RANKINGS_APP_STATE_HANDLE_INPUT;
        break;
    case VIEW_RANKINGS_APP_STATE_HANDLE_INPUT:
        if (ViewRankings_PollAndHandleInput(appData)) {
            return TRUE;
        }
        break;
    case VIEW_RANKINGS_APP_STATE_YESNO:
        ViewRankings_HandleYesNoInput(appData);
        break;
    case VIEW_RANKINGS_APP_STATE_DELETE_FAILED_CANT_DELETE_OWN:
        if (ViewRankings_WaitButtonOrTouch(appData)) {
            appData->state = VIEW_RANKINGS_APP_STATE_HANDLE_INPUT;
        }
        break;
    case VIEW_RANKINGS_APP_STATE_DO_DELETE_RECORD:
        appData->recordToDelete->active = FALSE;
        appData->state = VIEW_RANKINGS_APP_STATE_REDRAW;
        break;
    }
    return FALSE;
}

static void ViewRankingsApp_RunSpriteAnimations(ViewRankingsAppData *appData) {
    if (appData->spriteList != NULL) {
        SpriteList_RenderAndAnimateSprites(appData->spriteList);
    }
}

static BOOL ViewRankings_PollAndHandleInput(ViewRankingsAppData *appData) {
    int selection;
    ViewRankingsInput input = ViewRankings_PollInput(appData, &selection);
    if (input == 0) {
        return FALSE;
    }
    if (appData->isDeleteMode == 0) {
        if (ViewRankings_HandleInput_BrowsePages(appData, input, selection)) {
            return TRUE;
        }
    } else {
        ViewRankings_HandleInput_SelectRecordToDelete(appData, input, selection);
    }
    return FALSE;
}

static void ViewRankings_HandleYesNoInput(ViewRankingsAppData *appData) {
    switch (YesNoPrompt_HandleInput(appData->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = VIEW_RANKINGS_APP_STATE_DO_DELETE_RECORD;
        ViewRankings_PrintSelectRecordToDeleteText(appData);
        break;
    case YESNORESPONSE_NO:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = VIEW_RANKINGS_APP_STATE_HANDLE_INPUT;
        ViewRankings_PrintSelectRecordToDeleteText(appData);
        break;
    }
}

static BOOL ViewRankings_WaitButtonOrTouch(ViewRankingsAppData *appData) {
    if (gSystem.newKeys != 0 || System_GetTouchNew()) {
        ViewRankings_PrintSelectRecordToDeleteText(appData);
        return TRUE;
    }
    return FALSE;
}

static void ViewRankings_SetGfxBanks(void) {
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

static void ViewRankings_InitBgLayers(BgConfig *bgConfig) {
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
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0xf800, .charBase = GX_BG_CHARBASE_0x00000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 0, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0xf000, .charBase = GX_BG_CHARBASE_0x08000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0xe000, .charBase = GX_BG_CHARBASE_0x08000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0xd800, .charBase = GX_BG_CHARBASE_0x10000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0xf000, .charBase = GX_BG_CHARBASE_0x00000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 0, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = 0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    }

    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_0, 0, 1, 0);
    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_1, 0, 1, 0);
    BG_FillCharDataRange(bgConfig, GF_BG_LYR_MAIN_2, 0, 1, 0);
}

static void ViewRankings_InitObjCharTransfer(void) {
    ObjCharTransferTemplate template = {
        .maxTasks = 10,
        .sizeMain = 0x10000,
        .sizeSub = 0x4000,
        .heapID = HEAP_ID_RANKINGS_APP
    };
    ObjCharTransfer_Init(&template);
    ObjPlttTransfer_Init(1, HEAP_ID_RANKINGS_APP);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

static void ViewRankings_CreateOamManager(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 0, 126, 0, 32, HEAP_ID_RANKINGS_APP);
}

static void VBlankCB_ViewRankings(void *cbData) {
    BgConfig *bgConfig = (BgConfig *)cbData;

    OamManager_ApplyAndResetBuffers();
    DoScheduledBgGpuUpdates(bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void ViewRankings_LoadBgGraphics(BgConfig *bgConfig, enum HeapID heapID) {
    GfGfxLoader_GXLoadPal(NARC_application_guinness, NARC_guinness_guinness_00000001_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x40, heapID);
    GfGfxLoader_LoadCharData(NARC_application_guinness, NARC_guinness_guinness_00000003_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x1000, TRUE, heapID);
    GfGfxLoader_LoadScrnData(NARC_application_guinness, NARC_guinness_guinness_00000005_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x600, TRUE, heapID);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_3);

    GfGfxLoader_GXLoadPal(NARC_application_guinness, NARC_guinness_guinness_00000000_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, heapID);
    GfGfxLoader_LoadCharData(NARC_application_guinness, NARC_guinness_guinness_00000002_NCGR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0x400, TRUE, heapID);
    GfGfxLoader_LoadScrnData(NARC_application_guinness, NARC_guinness_guinness_00000004_NSCR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0x600, TRUE, heapID);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_0);
}

static void ViewRankings_LoadSpriteGraphics(ViewRankingsAppData *appData, enum HeapID heapID) {
    appData->spriteList = G2dRenderer_Init(5, &appData->g2dRenderer, heapID);
    for (int i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        appData->gf2dGfxResManagers[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, heapID);
    }
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CHAR], NARC_application_guinness, NARC_guinness_guinness_00000009_NCGR_lz, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, heapID);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_PLTT], NARC_application_guinness, NARC_guinness_guinness_00000006_NCLR, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 4, heapID);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CELL], NARC_application_guinness, NARC_guinness_guinness_00000008_NCER_lz, TRUE, 0, GF_GFX_RES_TYPE_CELL, heapID);
    appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_ANIM], NARC_application_guinness, NARC_guinness_guinness_00000007_NANR_lz, TRUE, 0, GF_GFX_RES_TYPE_ANIM, heapID);
    sub_0200ADA4(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(appData->gf2dGfxResObjects[GF_GFX_RES_TYPE_PLTT]);
}

static void ViewRankings_CreateSpriteResourcesHeader(ViewRankingsAppData *appData) {
    CreateSpriteResourcesHeader(&appData->spriteResourcesHeader, 0, 0, 0, 0, -1, -1, 0, 3, appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CHAR], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_PLTT], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CELL], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
}

static void ViewRankings_DestroySprites(ViewRankingsAppData *appData) {
    if (appData->sprites[VIEW_RANKINGS_APP_SPRITE_CURSOR] != NULL) {
        Sprite_Delete(appData->sprites[VIEW_RANKINGS_APP_SPRITE_CURSOR]);
    }
    if (appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW] != NULL) {
        Sprite_Delete(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW]);
    }
    if (appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW] != NULL) {
        Sprite_Delete(appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW]);
    }
    if (appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN] != NULL) {
        Sprite_Delete(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN]);
    }
    if (appData->sprites[VIEW_RANKINGS_APP_SPRITE_DELETE_RECORD] != NULL) {
        Sprite_Delete(appData->sprites[VIEW_RANKINGS_APP_SPRITE_DELETE_RECORD]);
    }
}

static void setSpriteTemplate(SpriteTemplate *spriteTemplate, ViewRankingsAppData *appData) {
    spriteTemplate->spriteList = appData->spriteList;
    spriteTemplate->header = &appData->spriteResourcesHeader;
    spriteTemplate->position.z = 0;
    SetVecFx32(spriteTemplate->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate->rotation = 0;
    spriteTemplate->drawPriority = 0;
    spriteTemplate->whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate->heapID = HEAP_ID_RANKINGS_APP;
}

static void ViewRankings_CreateSprites(ViewRankingsAppData *appData) {
    Sprite *sprite;
    SpriteTemplate spriteTemplate;
    setSpriteTemplate(&spriteTemplate, appData);

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sprite, TRUE);
    Sprite_SetAnimCtrlSeq(sprite, 2);
    Sprite_SetPriority(sprite, 1);
    Sprite_SetDrawFlag(sprite, TRUE);
    appData->sprites[VIEW_RANKINGS_APP_SPRITE_CURSOR] = sprite;

    spriteTemplate.position.x = FX32_CONST(16);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sprite, TRUE);
    Sprite_SetAnimCtrlSeq(sprite, 3);
    Sprite_SetDrawFlag(sprite, TRUE);
    appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW] = sprite;

    spriteTemplate.position.x = FX32_CONST(240);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sprite, TRUE);
    Sprite_SetAnimCtrlSeq(sprite, 5);
    Sprite_SetDrawFlag(sprite, TRUE);
    appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW] = sprite;

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sprite, TRUE);
    Sprite_SetAnimCtrlSeq(sprite, 0);
    Sprite_SetDrawFlag(sprite, TRUE);
    appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN] = sprite;

    spriteTemplate.position.x = FX32_CONST(64);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sprite, TRUE);
    Sprite_SetAnimCtrlSeq(sprite, 8);
    Sprite_SetDrawFlag(sprite, TRUE);
    appData->sprites[VIEW_RANKINGS_APP_SPRITE_DELETE_RECORD] = sprite;
}

static void ViewRankings_CreateTouchscreenHitboxes(ViewRankingsAppData *appData, enum HeapID heapID) {
    appData->touchscreenHitboxes = Heap_Alloc(heapID, 10 * sizeof(TouchscreenHitbox));
    for (int i = 0; i < 6; ++i) {
        TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[i], 56 + 16 * i, 40, 16, 176);
    }
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[6], 168, 8, 16, 128);
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[7], 168, 192, 16, 64);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[8], 16, 96, 16);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[9], 240, 96, 16);
}

static ViewRankingsInput ViewRankings_PollInput(ViewRankingsAppData *appData, int *pSelection) {
    int input = 0;
    if (!System_GetTouchHeld()) {
        input = gSystem.newKeys;
        if (input != 0) {
            switch (input) {
            case PAD_KEY_LEFT:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_LEFT;
            case PAD_KEY_RIGHT:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_RIGHT;
            case PAD_KEY_UP:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_UP;
            case PAD_KEY_DOWN:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_DOWN;
            case PAD_BUTTON_X:
                return VIEW_RANKINGS_APP_INPUT_X_BUTTON;
            case PAD_BUTTON_A:
                return VIEW_RANKINGS_APP_INPUT_A_BUTTON;
            case PAD_BUTTON_B:
                return VIEW_RANKINGS_APP_INPUT_B_BUTTON;
            }
        }
    }
    if (input == 0 && System_GetTouchNew()) {
        // Potential UB: TouchscreenHitbox_FindRectAtTouchNew expects touchscreenHitboxes to be terminated with {0xFF,0,0,0} but ViewRankings_CreateTouchscreenHitboxes never sets that up
        input = TouchscreenHitbox_FindHitboxAtTouchNew(appData->touchscreenHitboxes);
        if (input != -1) {
            switch (input) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                *pSelection = input;
                return VIEW_RANKINGS_APP_INPUT_TAP_RECORD;
            case 6:
                return VIEW_RANKINGS_APP_INPUT_X_BUTTON;
            case 7:
                *pSelection = input;
                return VIEW_RANKINGS_APP_INPUT_B_BUTTON;
            case 8:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_LEFT;
            case 9:
                return VIEW_RANKINGS_APP_INPUT_CURSOR_RIGHT;
            }
        }
    }
    return VIEW_RANKINGS_APP_INPUT_NONE;
}

static BOOL ViewRankings_HandleInput_BrowsePages(ViewRankingsAppData *appData, ViewRankingsInput input, int selection) {
    switch (input) {
    case VIEW_RANKINGS_APP_INPUT_NONE:
    case VIEW_RANKINGS_APP_INPUT_CURSOR_UP:
    case VIEW_RANKINGS_APP_INPUT_CURSOR_DOWN:
    case VIEW_RANKINGS_APP_INPUT_TAP_RECORD:
        break;
    case VIEW_RANKINGS_APP_INPUT_CURSOR_LEFT:
        ViewRankings_SwitchPage(appData, -1);
        break;
    case VIEW_RANKINGS_APP_INPUT_CURSOR_RIGHT:
        ViewRankings_SwitchPage(appData, 1);
        break;
    case VIEW_RANKINGS_APP_INPUT_X_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_DELETE_RECORD], 9);
        ViewRankings_ToggleDeleteMode(appData, 1);
        break;
    case VIEW_RANKINGS_APP_INPUT_B_BUTTON:
    case VIEW_RANKINGS_APP_INPUT_A_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN], 1);
        return TRUE;
    }

    return FALSE;
}

static void ViewRankings_HandleInput_SelectRecordToDelete(ViewRankingsAppData *appData, ViewRankingsInput input, int selection) {
    switch (input) {
    case VIEW_RANKINGS_APP_INPUT_NONE:
    case VIEW_RANKINGS_APP_INPUT_CURSOR_LEFT:
    case VIEW_RANKINGS_APP_INPUT_CURSOR_RIGHT:
        break;
    case VIEW_RANKINGS_APP_INPUT_CURSOR_UP:
        ViewRankings_MoveCursorInDirection(appData, -1);
        break;
    case VIEW_RANKINGS_APP_INPUT_CURSOR_DOWN:
        ViewRankings_MoveCursorInDirection(appData, 1);
        break;
    case VIEW_RANKINGS_APP_INPUT_TAP_RECORD:
        ViewRankings_TrySetCursorPosition(appData, selection);
        break;
    case VIEW_RANKINGS_APP_INPUT_X_BUTTON:
        if (appData->cursorPos < appData->numRecords) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ViewRankings_AskConfirmDeleteRecord(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN], 1);
            ViewRankings_ToggleDeleteMode(appData, 0);
        }
        break;
    case VIEW_RANKINGS_APP_INPUT_B_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN], 1);
        ViewRankings_ToggleDeleteMode(appData, 0);
        break;
    case VIEW_RANKINGS_APP_INPUT_A_BUTTON:
        if (appData->cursorPos < appData->numRecords) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ViewRankings_AskConfirmDeleteRecord(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RETURN], 1);
            ViewRankings_ToggleDeleteMode(appData, 0);
        }
        break;
    }
}

static void ViewRankings_MoveCursorInDirection(ViewRankingsAppData *appData, int direction) {
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
    ViewRankings_DrawCursor(appData);
}

static void ViewRankings_TrySetCursorPosition(ViewRankingsAppData *appData, int selection) {
    if (selection == 6 || selection < appData->numRecords) {
        PlaySE(SEQ_SE_DP_SELECT);
        appData->cursorPos = selection;
        ViewRankings_DrawCursor(appData);
    }
}

static void ViewRankings_DrawCursor(ViewRankingsAppData *appData) {
    VecFx32 pos = {};
    u8 idx = appData->cursorPos;
    pos.x = sCursorPositionParams[idx].x * FX32_ONE;
    pos.y = sCursorPositionParams[idx].y * FX32_ONE;
    Sprite_SetMatrix(appData->sprites[VIEW_RANKINGS_APP_SPRITE_CURSOR], &pos);
    Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_CURSOR], sCursorPositionParams[idx].anim);
}

static void ViewRankings_SwitchPage(ViewRankingsAppData *appData, int direction) {
    int new = appData->recordIdx + direction;
    if (new < 0) {
        new = appData->pageLength - 1;
    } else if (new >= appData->pageLength) {
        new = 0;
    }
    appData->recordIdx = new;
    PlaySE(SEQ_SE_DP_SELECT78);
    if (direction > 0) {
        Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW], 6);
    } else if (direction < 0) {
        Sprite_SetAnimCtrlSeq(appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW], 4);
    }
    ViewRankings_PrintRecordStatHeaderText(appData);
    appData->state = VIEW_RANKINGS_APP_STATE_REDRAW;
}

static void ViewRankings_ToggleDeleteMode(ViewRankingsAppData *appData, BOOL selection) {
    appData->isDeleteMode = selection;
    if (selection == FALSE) {
        appData->cursorPos = 6;
        Sprite_SetDrawFlag(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW], TRUE);
        Sprite_SetDrawFlag(appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW], TRUE);
        ViewRankings_HideSelectRecordToDeleteText(appData);
    } else {
        appData->cursorPos = 0;
        Sprite_SetDrawFlag(appData->sprites[VIEW_RANKINGS_APP_SPRITE_RIGHT_ARROW], FALSE);
        Sprite_SetDrawFlag(appData->sprites[VIEW_RANKINGS_APP_SPRITE_LEFT_ARROW], FALSE);
        ViewRankings_PrintSelectRecordToDeleteText(appData);
    }
    ViewRankings_DrawCursor(appData);
}

static void ViewRankings_CreateWindows(ViewRankingsAppData *appData) {
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_RANKINGS_APP);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_RANKING], GF_BG_LYR_MAIN_1, 5, 7, 2, 12, 15, 0x1);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS], GF_BG_LYR_MAIN_1, 7, 7, 20, 12, 15, 0x19);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER], GF_BG_LYR_MAIN_2, 2, 1, 28, 4, 15, 0x109);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_RETURN], GF_BG_LYR_MAIN_2, 25, 21, 6, 2, 1, 0x179);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD], GF_BG_LYR_MAIN_2, 4, 21, 12, 2, 1, 0x185);
    AddWindowParameterized(appData->bgConfig, &appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], GF_BG_LYR_MAIN_0, 2, 1, 28, 4, 15, 0x1F);
    LoadUserFrameGfx2(appData->bgConfig, GF_BG_LYR_MAIN_0, 0x1, 12, appData->frame, HEAP_ID_RANKINGS_APP);
}

static void ViewRankings_HideSelectRecordToDeleteText(ViewRankingsAppData *appData) {
    ClearFrameAndWindow2(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], TRUE);
    ClearWindowTilemapAndCopyToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewRankingsApp_GetRankingsFromSave(ViewRankingsAppData *appData, SaveData *saveData) {
    int j;
    int i;
    BOOL inserted;
    ViewRankingsPage *ptr;
    int cnt;

    appData->records = Heap_Alloc(HEAP_ID_RANKINGS_APP, appData->pageLength * sizeof(ViewRankingsAppPage));
    MI_CpuClear8(appData->records, appData->pageLength * sizeof(ViewRankingsAppPage));
    appData->pages[0] = Save_GetPlayerViewRankingPage(saveData, appData->page, HEAP_ID_RANKINGS_APP);
    for (i = 0; i < appData->pageLength; ++i) {
        appData->pages[1 + i] = Save_GetReceivedViewRankingPage(appData->saveRankings, appData->pageOffset + appData->scope * RANKINGS_COUNT + i, HEAP_ID_RANKINGS_APP);
        cnt = 0;
        inserted = FALSE;
        ptr = appData->pages[1 + i];
        if (ptr->count == 0) {
            appData->records[i].entries[0].pageEntry = &appData->pages[0]->entries[i];
            appData->records[i].entries[0].active = TRUE;
            appData->records[i].entries[0].friendIdx = 0xFF;
            appData->records[i].count = 1;
        } else {
            for (j = 0; j < ptr->count; ++j) {
                if (!inserted && appData->pages[0]->entries[i].stat >= ptr->entries[j].stat) {
                    appData->records[i].entries[cnt].pageEntry = &appData->pages[0]->entries[i];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = 0xFF;
                    ++cnt;
                    appData->records[i].entries[cnt].pageEntry = &ptr->entries[j];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = j;
                    inserted = TRUE;
                } else {
                    appData->records[i].entries[cnt].pageEntry = &ptr->entries[j];
                    appData->records[i].entries[cnt].active = TRUE;
                    appData->records[i].entries[cnt].friendIdx = j;
                }
                ++cnt;
            }
            if (!inserted) {
                appData->records[i].entries[cnt].pageEntry = &appData->pages[0]->entries[i];
                appData->records[i].entries[cnt].active = TRUE;
                appData->records[i].entries[cnt].friendIdx = 0xFF;
            }
            appData->records[i].count = ptr->count + 1;
        }
    }
}

static void ViewRankings_CreateStrings(ViewRankingsAppData *appData) {
    appData->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0421_bin, HEAP_ID_RANKINGS_APP);
    appData->msgFormat = MessageFormat_New_Custom(2, 76, HEAP_ID_RANKINGS_APP);
    appData->formatedStrBuf = String_New(76, HEAP_ID_RANKINGS_APP);
    appData->playerNameString = NewString_ReadMsgData(appData->msgData, msg_0421_00043);
    appData->rankingString = NewString_ReadMsgData(appData->msgData, msg_0421_00042);
    for (int i = 0; i < VIEW_RANKINGS_MISC_STRING_MAX; ++i) {
        appData->miscStrings[i] = NewString_ReadMsgData(appData->msgData, msg_0421_00044 + i);
    }
}

static void ViewRankings_DeleteStrings(ViewRankingsAppData *appData) {
    for (int i = 0; i < VIEW_RANKINGS_MISC_STRING_MAX; ++i) {
        String_Delete(appData->miscStrings[i]);
    }
    String_Delete(appData->playerNameString);
    String_Delete(appData->rankingString);
    String_Delete(appData->formatedStrBuf);
    MessageFormat_Delete(appData->msgFormat);
    DestroyMsgData(appData->msgData);
}

static void ViewRankings_PrintRecords(ViewRankingsAppData *appData) {
    int i;
    int ranking;
    int y;
    const RecordPageParam *pageParam;
    ViewRankingsAppPage *pRecord;
    int prev;
    int cur;

    pRecord = &appData->records[appData->recordIdx];
    pageParam = &sRecordPageParams[appData->page][appData->recordIdx];

    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS], 0);
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RANKING], 0);
    ranking = 1;
    y = 0;
    prev = 0;
    i = 0;
    appData->numRecords = 0;
    for (; i < pRecord->count; ++i) {
        if (pRecord->entries[i].active != 0) {
            cur = min(pRecord->entries[i].pageEntry->stat, pageParam->max);
            if (cur < prev) {
                ++ranking;
            }
            BufferIntegerAsString(appData->msgFormat, 0, ranking, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->rankingString);
            AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RANKING], 0, appData->formatedStrBuf, 0, 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferString(appData->msgFormat, 1, pRecord->entries[i].pageEntry->playerName, 2, 1, 2);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->playerNameString);
            AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS], 0, appData->formatedStrBuf, 0, 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferIntegerAsString(appData->msgFormat, 0, cur, pageParam->numDigits, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formatedStrBuf, appData->miscStrings[pageParam->msgId - msg_0421_00044]);
            AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS], 0, appData->formatedStrBuf, 160 - FontID_String_GetWidth(0, appData->formatedStrBuf, 0), 16 * y, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            appData->recordEntryIdxs[y] = i;
            prev = cur;
            if (++y >= 6) {
                break;
            }
        }
    }
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RECORDS]);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RANKING]);
    appData->numRecords = y;
    if (appData->isDeleteMode == 1 && appData->cursorPos >= appData->numRecords) {
        GF_ASSERT(appData->cursorPos != 7);
        appData->cursorPos = appData->numRecords - 1;
        ViewRankings_DrawCursor(appData);
    }
}

static void ViewRankings_PrintDeleteRecordText(ViewRankingsAppData *appData) {
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00040);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_DELETE_RECORD]);
}

static void ViewRankings_PrintReturnText(ViewRankingsAppData *appData) {
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RETURN], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00041);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RETURN], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_RETURN]);
}

static void ViewRankings_PrintDeleteXsRecordAreYouSure(ViewRankingsAppData *appData) {
    ViewRankingsAppPage *page;
    u8 entryIdx;
    String *string;

    entryIdx = appData->recordEntryIdxs[appData->cursorPos];
    page = &appData->records[appData->recordIdx];
    DrawFrameAndWindow2(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    BufferString(appData->msgFormat, 0, page->entries[entryIdx].pageEntry->playerName, 2, 1, 2);
    string = ReadMsgData_ExpandPlaceholders(appData->msgFormat, appData->msgData, msg_0421_00049, HEAP_ID_RANKINGS_APP);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewRankings_PrintYourOwnRecordCantBeDeleted(ViewRankingsAppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00052);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewRankings_PrintRecordStatHeaderText(ViewRankingsAppData *appData) {
    String *string;
    String *string2;
    int msgNo;

    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER], 0);
    msgNo = (appData->page == 0 ? msg_0421_00053 : msg_0421_00065) + appData->recordIdx * 2;
    string = NewString_ReadMsgData(appData->msgData, msgNo);
    string2 = NewString_ReadMsgData(appData->msgData, msgNo + 1);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER], 0, string2, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    String_Delete(string2);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_HEADER]);
}

static void ViewRankings_PrintSelectRecordToDeleteText(ViewRankingsAppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00048);
    AddTextPrinterParameterizedWithColor(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[VIEW_RANKINGS_APP_WINDOW_SELECT_RECORD_TO_DELETE]);
}

static void ViewRankings_AskConfirmDeleteRecord(ViewRankingsAppData *appData) {
    YesNoPromptTemplate template;

    appData->recordToDelete = &appData->records[appData->recordIdx].entries[appData->recordEntryIdxs[appData->cursorPos]];
    if (appData->recordToDelete->friendIdx == 0xFF) {
        appData->state = VIEW_RANKINGS_APP_STATE_DELETE_FAILED_CANT_DELETE_OWN;
        ViewRankings_PrintYourOwnRecordCantBeDeleted(appData);
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
        ViewRankings_PrintDeleteXsRecordAreYouSure(appData);
        dimAllMainBgsExceptLyr0();
        appData->state = VIEW_RANKINGS_APP_STATE_YESNO;
    }
}

static void dimAllMainBgsExceptLyr0(void) {
    G2_SetBlendBrightness(GX_PLANEMASK_ALL & ~GX_PLANEMASK_BG0, -7);
}

static void resetMainBgsBrightness(void) {
    G2_BlendNone();
}

static void ViewRankingsApp_CommitChanges(ViewRankingsAppData *appData) {
    int i;
    int j;
    int count;
    ViewRankingsAppPageEntry *entry;
    for (i = 0; i < appData->pageLength; ++i) {
        count = 0;
        for (j = 0; j < appData->records[i].count; ++j) {
            entry = &appData->records[i].entries[j];
            if (entry->friendIdx != 0xFF && entry->active == FALSE) {
                Save_Rankings_DeleteEntryByIndex(appData->saveRankings, appData->pageOffset + appData->scope * RANKINGS_COUNT + i, entry->friendIdx - count);
                ++count;
            }
        }
    }
}
