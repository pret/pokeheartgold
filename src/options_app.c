#include "options_app.h"

#include <nitro/spi/ARM9/pm.h>

#include "global.h"

#include "data/resdat.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0045.h"

#include "bg_window.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "menu_input_state.h"
#include "msgdata.h"
#include "options.h"
#include "render_text.h"
#include "render_window.h"
#include "sound.h"
#include "sprite.h"
#include "sprite_system.h"
#include "system.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"
#include "vram_transfer_manager.h"

// Not to be confused with `Options`, which is almost exactly the same, save for two members being swapped. SMH
typedef struct OptionsApp_Options {
    u16 textSpeed : 4;
    u16 soundMethod : 2;
    u16 battleScene : 1;
    u16 battleStyle : 1;
    u16 buttonMode : 2;
    u16 frame : 5;
} OptionsApp_Options;

typedef struct OptionsApp_MenuEntry {
    u16 numStrings;
    u16 value;
    String *strings[20];
} OptionsApp_MenuEntry;

enum {
    MENU_ENTRY_TEXT_SPEED,
    MENU_ENTRY_BATTLE_SCENE,
    MENU_ENTRY_BATTLE_STYLE,
    MENU_ENTRY_SOUND_METHOD,
    MENU_ENTRY_BUTTON_MODE,
    MENU_ENTRY_FRAME,
    MENU_ENTRY_6,

    MENU_ENTRY_COUNT,
};

typedef struct OptionsApp_Data {
    HeapID heapId;
    u32 exitState;
    u32 setupAndFreeState;
    u32 fadeUnused; // unused, game writes 0 here when it's about to start a fade, but never reads from here
    u32 unk10_0 : 2;
    u32 currentMenuEntryId : 3;
    u32 unk10_5 : 16; // unused
    u32 unk10_21 : 1;
    u32 unk10_22 : 10; // unused
    BgConfig *bgConfig;
    OptionsApp_Options options;
    Options *playerOptionsUnused; // unused copy of playerOptions
    MenuInputStateMgr *menuInputPtr;
    Options *playerOptions;
    MsgData *msgData;
    u8 filler2C[0x8];
    union {
        Window asArray[5];
        struct {
            Window optionsTitle;
            Window selectedOption;
            Window frameAndTextSpeedTest;
            Window quitButton;
            Window confirmButton;
        };
    } windows;
    OptionsApp_MenuEntry menuEntries[MENU_ENTRY_COUNT];
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler;
    Sprite *sprites[9];
    u8 filler2FC[36];
    u32 menuInputState;
    String *frameNumText;
    u8 textPrinter;
} OptionsApp_Data; // size: 0x32c

static const s8 sOptionsApp_UnkWindowWidthOffsets[MENU_ENTRY_COUNT] = {
    0,
    0,
    0,
    0,
    0,
    -0x10,
    0,
};

static const u32 sOptionsAppBgLayers[5] = {
    GF_BG_LYR_MAIN_0,
    GF_BG_LYR_MAIN_1,
    GF_BG_LYR_MAIN_2,
    GF_BG_LYR_SUB_0,
    GF_BG_LYR_SUB_1,
};

static const int sNumChoicesPerMenuEntry[MENU_ENTRY_COUNT] = {
    3, 2, 2, 2, 2, 20, 2
};

static const int sMenuEntryBorderYCoords[MENU_ENTRY_COUNT] = {
    -8, -32, -56, -80, -104, -128, -156
};

static const u16 sOptionChoiceLabelXCoords[MENU_ENTRY_COUNT][3] = {
    { 124, 172, 220 },
    { 124, 172, 0   },
    { 132, 212, 0   },
    { 132, 212, 0   },
    { 132, 212, 0   },
    { 172, 0,   0   },
    { 0,   0,   0   },
};

static const int sActiveButtonXCoords[5][3] = {
    { 112, 160, 208 },
    { 112, 160, 208 },
    { 112, 192, 0   },
    { 112, 192, 0   },
    { 112, 192, 0   },
};

static const TouchscreenHitbox sOptionsAppTouchscreenHitboxes[16] = {
    { .rect = { .top = 26, .bottom = 46, .left = 112, .right = 151 } },
    { .rect = { .top = 26, .bottom = 46, .left = 160, .right = 200 } },
    { .rect = { .top = 26, .bottom = 46, .left = 208, .right = 248 } },
    { .rect = { .top = 50, .bottom = 70, .left = 112, .right = 151 } },
    { .rect = { .top = 50, .bottom = 70, .left = 160, .right = 200 } },
    { .rect = { .top = 74, .bottom = 93, .left = 112, .right = 167 } },
    { .rect = { .top = 74, .bottom = 93, .left = 192, .right = 247 } },
    { .rect = { .top = 98, .bottom = 117, .left = 112, .right = 167 } },
    { .rect = { .top = 98, .bottom = 117, .left = 192, .right = 247 } },
    { .rect = { .top = 122, .bottom = 142, .left = 112, .right = 167 } },
    { .rect = { .top = 122, .bottom = 142, .left = 192, .right = 247 } },
    { .rect = { .top = 146, .bottom = 166, .left = 110, .right = 150 } },
    { .rect = { .top = 146, .bottom = 166, .left = 208, .right = 253 } },
    { .rect = { .top = 172, .bottom = 191, .left = 128, .right = 180 } },
    { .rect = { .top = 172, .bottom = 191, .left = 183, .right = 255 } },
    { TOUCHSCREEN_RECTLIST_END },
};

static const u32 ov54_021E6DA8[15][2] = {
    { MENU_ENTRY_TEXT_SPEED,   0 },
    { MENU_ENTRY_TEXT_SPEED,   1 },
    { MENU_ENTRY_TEXT_SPEED,   2 },
    { MENU_ENTRY_BATTLE_SCENE, 0 },
    { MENU_ENTRY_BATTLE_SCENE, 1 },
    { MENU_ENTRY_BATTLE_STYLE, 0 },
    { MENU_ENTRY_BATTLE_STYLE, 1 },
    { MENU_ENTRY_SOUND_METHOD, 0 },
    { MENU_ENTRY_SOUND_METHOD, 1 },
    { MENU_ENTRY_BUTTON_MODE,  0 },
    { MENU_ENTRY_BUTTON_MODE,  1 },
    { MENU_ENTRY_FRAME,        3 },
    { MENU_ENTRY_FRAME,        4 },
    { MENU_ENTRY_6,            5 },
    { MENU_ENTRY_6,            6 },
};

static const UnmanagedSpriteTemplate ov54_021E6EAC[9] = {
    {
     .resourceSet = 0,
     .x = 112,
     .y = 24,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 112,
     .y = 48,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 112,
     .y = 72,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 112,
     .y = 96,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 112,
     .y = 120,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 1,
     .x = 115,
     .y = 144,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 2,
     .x = 213,
     .y = 144,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 3,
     .x = 188,
     .y = 170,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 3,
     .x = 116,
     .y = 170,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

static void OptionsApp_SetupGraphicsBanks(void);
static void OptionsApp_OnVBlank(OptionsApp_Data *data);
static BOOL ov54_021E5CE4(OptionsApp_Data *data);
static BOOL ov54_021E5DBC(OptionsApp_Data *data);
static void OptionsApp_SetupBgConfig(OptionsApp_Data *data);
static void OptionsApp_FreeBgConfig(OptionsApp_Data *data);
static void OptionsApp_SetupGraphicsData(OptionsApp_Data *data);
static void ov54_021E6000(OptionsApp_Data *data);
static void OptionsApp_SetupWindows(OptionsApp_Data *data);
static void OptionsApp_FreeWindows(OptionsApp_Data *data);
static void OptionsApp_PrintTextFrameString(OptionsApp_Data *data, String *frameNumText, BOOL instantTextSpeed);
static void OptionsApp_SetupInterfaceText(OptionsApp_Data *data);
static void OptionsApp_LoadMenuEntriesData(OptionsApp_Data *data);
static void ov54_021E6418(OptionsApp_Data *data, u16 menuEntryId);
static void OptionsApp_UpdateMenuEntryCarousel(OptionsApp_Data *data, u32 menuEntryId, OptionsApp_MenuEntry *menuEntry, s32 offset);
static void OptionsApp_HandleKeyInput(OptionsApp_Data *data, OptionsApp_MenuEntry *menuEntry);
static void OptionsApp_HandleInput(OptionsApp_Data *data);
static void ov54_021E69D4(OptionsApp_Data *data, u32 menuEntryId);
static void ov54_021E6A64(OptionsApp_Data *data);
static void OptionsApp_SetupSpriteRenderer(OptionsApp_Data *data);
static void OptionsApp_FreeSpriteRenderer(OptionsApp_Data *data);
static void OptionsApp_SetupSprites(OptionsApp_Data *data);
static void OptionsApp_SetActiveButtonsXPosition(OptionsApp_Data *data);
static BOOL OptionsApp_ConfirmAndQuitButtonsAreDoneAnimating(OptionsApp_Data *data);

BOOL OptionsMenu_Init(OverlayManager *manager, int *state) {
    OptionsApp_Args *args = OverlayManager_GetArgs(manager);
    CreateHeap(HEAP_ID_3, HEAP_ID_OPTIONS_APP, 0x30000);

    OptionsApp_Data *data = OverlayManager_CreateAndGetData(manager, sizeof(OptionsApp_Data), HEAP_ID_OPTIONS_APP);
    memset(data, 0, sizeof(OptionsApp_Data));

    data->options.textSpeed = Options_GetTextSpeed(args->options);
    data->options.battleScene = Options_GetBattleScene(args->options);
    data->options.battleStyle = Options_GetBattleStyle(args->options);
    data->options.soundMethod = Options_GetSoundMethod(args->options);
    data->options.buttonMode = Options_GetButtonMode(args->options);
    data->options.frame = Options_GetFrame(args->options);

    data->menuInputPtr = args->menuInputStateMgr;
    data->playerOptionsUnused = args->options;
    data->heapId = HEAP_ID_OPTIONS_APP;
    data->playerOptions = args->options;
    data->menuInputState = MenuInputStateMgr_GetState(data->menuInputPtr);
    data->frameNumText = String_New(40, data->heapId);

    TextFlags_SetCanABSpeedUpPrint(FALSE);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);

    sub_0200FBF4(PM_LCD_TOP, 0);
    sub_0200FBF4(PM_LCD_BOTTOM, 0);

    return TRUE;
}

BOOL OptionsMenu_Exit(OverlayManager *manager, int *state) {
    OptionsApp_Data *data = OverlayManager_GetData(manager);

    if (data->unk10_0 == 1) {
        data->options.textSpeed = data->menuEntries[MENU_ENTRY_TEXT_SPEED].value;
        data->options.battleScene = data->menuEntries[MENU_ENTRY_BATTLE_SCENE].value;
        data->options.battleStyle = data->menuEntries[MENU_ENTRY_BATTLE_STYLE].value;
        data->options.soundMethod = data->menuEntries[MENU_ENTRY_SOUND_METHOD].value;
        data->options.buttonMode = data->menuEntries[MENU_ENTRY_BUTTON_MODE].value;
        data->options.frame = data->menuEntries[MENU_ENTRY_FRAME].value;

        Options_SetTextSpeed(data->playerOptions, data->options.textSpeed);
        Options_SetBattleScene(data->playerOptions, data->options.battleScene);
        Options_SetBattleStyle(data->playerOptions, data->options.battleStyle);
        Options_SetSoundMethod(data->playerOptions, data->options.soundMethod);
        Options_SetButtonMode(data->playerOptions, data->options.buttonMode);
        Options_SetFrame(data->playerOptions, data->options.frame);
    } else if (data->unk10_0 == 2) {
        GF_SndSetMonoFlag(data->options.soundMethod);
        Options_SetButtonModeOnMain(NULL, data->options.buttonMode);
        Options_SetTextSpeed(data->playerOptions, data->options.textSpeed);
    }

    String_Delete(data->frameNumText);

    TextFlags_SetCanABSpeedUpPrint(TRUE);
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);

    OverlayManager_FreeData(manager);
    DestroyHeap(data->heapId);

    return TRUE;
}

BOOL OptionsMenu_Main(OverlayManager *manager, int *state) {
    OptionsApp_Data *data = OverlayManager_GetData(manager);
    switch (data->exitState) {
    case 0:
        if (!ov54_021E5CE4(data)) {
            return FALSE;
        }

        data->fadeUnused = 0;
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        OptionsApp_SetActiveButtonsXPosition(data);
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
        break;
    case 1:
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        break;
    case 2:
        if (data->unk10_0 != 0) {
            SpriteSystem_DrawSprites(data->spriteGfxHandler);
            break;
        }
        OptionsApp_HandleInput(data);
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
        return FALSE;
    case 3:
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
        if (!OptionsApp_ConfirmAndQuitButtonsAreDoneAnimating(data)) {
            data->fadeUnused = 0;
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            break;
        }
        return FALSE;
    case 4:
        if (TextPrinterCheckActive(data->textPrinter)) {
            RemoveTextPrinter(data->textPrinter);
        }
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        break;
    case 5:
        if (ov54_021E5DBC(data)) {
            return TRUE;
        }
        return FALSE;
    }

    data->exitState++;
    return FALSE;
}

static void OptionsApp_SetupGraphicsBanks(void) {
    GraphicsBanks banks = {
        .bg = GX_VRAM_BG_128_A,
        .subbg = GX_VRAM_SUB_BG_128_C,
        .obj = GX_VRAM_OBJ_16_G,
        .subobj = GX_VRAM_SUB_OBJ_16_I,
    };
    GfGfx_SetBanks(&banks);
}

static void OptionsApp_OnVBlank(OptionsApp_Data *data) {
    if (data->unk10_21) {
        LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_SUB_1, 0x6D, 15, data->menuEntries[MENU_ENTRY_FRAME].value, data->heapId);
        data->unk10_21 = FALSE;
    }

    SpriteSystem_TransferOam();
    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(data->bgConfig);
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

static BOOL ov54_021E5CE4(OptionsApp_Data *data) {
    switch (data->setupAndFreeState) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();

        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(GX_PLANEMASK_NONE);
        GXS_SetVisiblePlane(GX_PLANEMASK_NONE);

        OptionsApp_SetupGraphicsBanks();

        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

        sub_0200FBDC(0);
        sub_0200FBDC(1);

        OptionsApp_SetupBgConfig(data);
        OptionsApp_SetupSpriteRenderer(data);
        break;

    case 1:
        OptionsApp_SetupGraphicsData(data);
        data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0045_bin, data->heapId);
        OptionsApp_LoadMenuEntriesData(data);
        break;

    case 2:
        OptionsApp_SetupWindows(data);
        OptionsApp_SetupInterfaceText(data);
        GF_CreateVramTransferManager(32, data->heapId);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        sub_0203A964();
        OptionsApp_SetupSprites(data);

        Main_SetVBlankIntrCB((GFIntrCB)OptionsApp_OnVBlank, data);
        data->setupAndFreeState = 0;
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        return TRUE;
    }

    data->setupAndFreeState++;
    return FALSE;
}

static BOOL ov54_021E5DBC(OptionsApp_Data *data) {
    switch (data->setupAndFreeState) {
    case 0:
        GF_DestroyVramTransferManager();
        OptionsApp_FreeWindows(data);

        for (int i = 0; i < MENU_ENTRY_COUNT - 1; i++) {
            for (int j = 0; j < data->menuEntries[i].numStrings; j++) {
                String_Delete(data->menuEntries[i].strings[j]);
            }
        }

        DestroyMsgData(data->msgData);
        ov54_021E6000(data);
        OptionsApp_FreeBgConfig(data);
        OptionsApp_FreeSpriteRenderer(data);
        break;
    case 1:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(GX_PLANEMASK_NONE);
        GXS_SetVisiblePlane(GX_PLANEMASK_NONE);
        data->setupAndFreeState = 0;
        return TRUE;
    }

    data->setupAndFreeState++;
    return FALSE;
}

static void OptionsApp_SetupBgConfig(OptionsApp_Data *data) {
    data->bgConfig = BgConfig_Alloc(data->heapId);
    GraphicsModes modes = {
        .dispMode = GX_DISPMODE_GRAPHICS,
        .bgMode = GX_BGMODE_0,
        .subMode = GX_BGMODE_0,
        ._2d3dMode = GX_BG0_AS_2D,
    };
    SetBothScreensModesAndDisable(&modes);

    BgTemplate templates[5] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = FALSE,
         },
    };

    for (int i = 0; i < 5; i++) {
        InitBgFromTemplate(data->bgConfig, sOptionsAppBgLayers[i], &templates[i], GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, sOptionsAppBgLayers[i]);
    }

    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 32, 0, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 32, 0, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 32, 0, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 32, 0, data->heapId);
}

static void OptionsApp_FreeBgConfig(OptionsApp_Data *data) {
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    Heap_Free(data->bgConfig);
}

static void OptionsApp_SetupGraphicsData(OptionsApp_Data *data) {
    GfGfxLoader_GXLoadPal(NARC_a_0_7_2, 3, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0x40, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_0_7_2, 8, data->bgConfig, GF_BG_LYR_SUB_0, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_7_2, 19, data->bgConfig, GF_BG_LYR_SUB_0, 0, 0, FALSE, data->heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_7_2, 2, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x40, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_0_7_2, 7, data->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_7_2, 17, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_7_2, 18, data->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, FALSE, data->heapId);

    BgSetPosTextAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, sMenuEntryBorderYCoords[data->currentMenuEntryId]);
}

static void ov54_021E6000(OptionsApp_Data *data) {
    // empty, maybe would've been used to free graphics data?
}

static void OptionsApp_SetupWindows(OptionsApp_Data *data) {
    AddWindowParameterized(data->bgConfig, &data->windows.optionsTitle, GF_BG_LYR_MAIN_1, 1, 0, 12, 3, 13, 0xA);
    AddWindowParameterized(data->bgConfig, &data->windows.selectedOption, GF_BG_LYR_MAIN_1, 1, 3, 30, 18, 13, 0x2E);
    AddWindowParameterized(data->bgConfig, &data->windows.quitButton, GF_BG_LYR_MAIN_1, 24, 21, 7, 3, 13, 0x24A);
    AddWindowParameterized(data->bgConfig, &data->windows.frameAndTextSpeedTest, GF_BG_LYR_SUB_1, 2, 19, 27, 4, 12, 0x1);
    AddWindowParameterized(data->bgConfig, &data->windows.confirmButton, GF_BG_LYR_MAIN_1, 15, 21, 7, 3, 13, 0x25F);

    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_SUB_1, 0x6D, 15, data->options.frame, data->heapId);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_13_OFFSET, data->heapId);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_13_OFFSET, data->heapId);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_12_OFFSET, data->heapId);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_12_OFFSET, data->heapId);

    FillWindowPixelBuffer(&data->windows.optionsTitle, 0x00);
    FillWindowPixelBuffer(&data->windows.selectedOption, 0x00);
    FillWindowPixelBuffer(&data->windows.quitButton, 0x00);
    FillWindowPixelBuffer(&data->windows.confirmButton, 0x00);
    FillWindowPixelBuffer(&data->windows.frameAndTextSpeedTest, 0xFF);

    ClearWindowTilemap(&data->windows.frameAndTextSpeedTest);
    ClearWindowTilemap(&data->windows.selectedOption);
    ClearWindowTilemap(&data->windows.optionsTitle);

    DrawFrameAndWindow2(&data->windows.frameAndTextSpeedTest, TRUE, 0x6D, 15);
}

static void OptionsApp_FreeWindows(OptionsApp_Data *data) {
    sub_0200E5D4(&data->windows.selectedOption, FALSE);
    ClearFrameAndWindow2(&data->windows.frameAndTextSpeedTest, FALSE);

    for (u16 i = 0; i < NELEMS(data->windows.asArray); i++) {
        ClearWindowTilemapAndCopyToVram(&data->windows.asArray[i]);
        FillWindowPixelBuffer(&data->windows.asArray[i], 0x00);
        ClearWindowTilemap(&data->windows.asArray[i]);
        RemoveWindow(&data->windows.asArray[i]);
    }
}

static void OptionsApp_PrintTextFrameString(OptionsApp_Data *data, String *frameNumText, BOOL instantTextSpeed) {
    u32 textFrameDelay = Options_GetTextFrameDelay(data->playerOptions);

    if (TextPrinterCheckActive(data->textPrinter)) {
        RemoveTextPrinter(data->textPrinter);
    }

    ReadMsgDataIntoString(data->msgData, msg_0045_00040 + data->menuEntries[MENU_ENTRY_FRAME].value, frameNumText); // WINDOW TYPE XX

    FillWindowPixelBuffer(&data->windows.frameAndTextSpeedTest, 0xFF);

    if (instantTextSpeed) {
        AddTextPrinterParameterizedWithColor(&data->windows.frameAndTextSpeedTest, 1, frameNumText, 4, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 15), NULL);
    } else {
        data->textPrinter = AddTextPrinterParameterizedWithColor(&data->windows.frameAndTextSpeedTest, 1, frameNumText, 4, 0, textFrameDelay, MAKE_TEXT_COLOR(1, 2, 15), NULL);
    }
}

static void OptionsApp_SetupInterfaceText(OptionsApp_Data *data) {
    u16 i;
    String *tmpString = String_New(40, data->heapId);

    ReadMsgDataIntoString(data->msgData, msg_0045_00000, tmpString); // OPTIONS
    AddTextPrinterParameterizedWithColor(&data->windows.optionsTitle, 0, tmpString, 2, 5, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    String_SetEmpty(tmpString);
    OptionsApp_PrintTextFrameString(data, tmpString, TRUE);

    for (i = 0; i < MENU_ENTRY_COUNT - 1; i++) {
        String_SetEmpty(tmpString);
        ReadMsgDataIntoString(data->msgData, msg_0045_00001 + i, tmpString); // Option names
        AddTextPrinterParameterizedWithColor(&data->windows.selectedOption, 0, tmpString, 4, i * 24 + 5, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    }

    String_SetEmpty(tmpString);
    ReadMsgDataIntoString(data->msgData, msg_0045_00008, tmpString); // QUIT
    AddTextPrinterParameterizedWithColor(&data->windows.quitButton, 0, tmpString, 0, 6, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);
    String_SetEmpty(tmpString);
    ReadMsgDataIntoString(data->msgData, msg_0045_00007, tmpString); // CONFIRM
    AddTextPrinterParameterizedWithColor(&data->windows.confirmButton, 0, tmpString, 0, 6, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 2, 0), NULL);

    for (i = 0; i < MENU_ENTRY_COUNT; i++) {
        ov54_021E6418(data, i);
    }

    CopyWindowToVram(&data->windows.optionsTitle);
    CopyWindowToVram(&data->windows.selectedOption);
    CopyWindowToVram(&data->windows.quitButton);
    CopyWindowToVram(&data->windows.confirmButton);
    CopyWindowToVram(&data->windows.frameAndTextSpeedTest);

    String_Delete(tmpString);
}

static void OptionsApp_LoadMenuEntriesData(OptionsApp_Data *data) {
    u16 i, j;
    u16 msgNum = 0;
    for (i = 0; i < MENU_ENTRY_COUNT - 1; i++) {
        data->menuEntries[i].numStrings = sNumChoicesPerMenuEntry[i];
        for (j = 0; j < sNumChoicesPerMenuEntry[i]; j++) {
            data->menuEntries[i].strings[j] = NewString_ReadMsgData(data->msgData, msg_0045_00009 + msgNum++); // Option values
        }
    }

    data->menuEntries[MENU_ENTRY_TEXT_SPEED].value = data->options.textSpeed;
    data->menuEntries[MENU_ENTRY_BATTLE_SCENE].value = data->options.battleScene;
    data->menuEntries[MENU_ENTRY_BATTLE_STYLE].value = data->options.battleStyle;
    data->menuEntries[MENU_ENTRY_SOUND_METHOD].value = data->options.soundMethod;
    data->menuEntries[MENU_ENTRY_BUTTON_MODE].value = data->options.buttonMode;
    data->menuEntries[MENU_ENTRY_FRAME].value = data->options.frame;
    data->menuEntries[MENU_ENTRY_6].value = 0;
}

static void ov54_021E6418(OptionsApp_Data *data, u16 menuEntryId) {
    u32 selectedColor = MAKE_TEXT_COLOR(1, 2, 0);
    u32 notSelectedColor = MAKE_TEXT_COLOR(15, 2, 0);
    u32 color;
    u16 i;
    u8 frameDelay;
    u16 x = 0;
    FillWindowPixelRect(&data->windows.selectedOption, 0, 108 + sOptionsApp_UnkWindowWidthOffsets[menuEntryId], menuEntryId * 24 + 5, 384, 24);

    switch (menuEntryId) {
    case MENU_ENTRY_FRAME:
        x = sOptionChoiceLabelXCoords[menuEntryId][0] - FontID_String_GetWidth(0, data->menuEntries[menuEntryId].strings[data->menuEntries[menuEntryId].value], 0) / 2;
        AddTextPrinterParameterizedWithColor(&data->windows.selectedOption, 0, data->menuEntries[menuEntryId].strings[data->menuEntries[menuEntryId].value], x, menuEntryId * 24 + 5, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        CopyWindowToVram(&data->windows.selectedOption);
        OptionsApp_PrintTextFrameString(data, data->frameNumText, TRUE);
        data->unk10_21 = TRUE;
        return;
    case MENU_ENTRY_SOUND_METHOD:
        GF_SndSetMonoFlag(data->menuEntries[menuEntryId].value);
        break;
    case MENU_ENTRY_BUTTON_MODE:
        Options_SetButtonModeOnMain(NULL, data->menuEntries[menuEntryId].value);
        break;
    case MENU_ENTRY_TEXT_SPEED:
        Options_SetTextSpeed(data->playerOptions, data->menuEntries[menuEntryId].value);
        OptionsApp_PrintTextFrameString(data, data->frameNumText, FALSE);
        break;
    }

    x = 0;
    for (i = 0; i < data->menuEntries[menuEntryId].numStrings; i++) {
        if (i == data->menuEntries[menuEntryId].value) {
            color = selectedColor;
        } else {
            color = notSelectedColor;
        }
        // required to match a double `bls` above
        if (i == data->menuEntries[menuEntryId].numStrings - 1) {
            frameDelay = TEXT_SPEED_NOTRANSFER;
        } else {
            frameDelay = TEXT_SPEED_NOTRANSFER;
        }
        x = sOptionChoiceLabelXCoords[menuEntryId][i] - (FontID_String_GetWidth(0, data->menuEntries[menuEntryId].strings[i], 0) / 2);
        AddTextPrinterParameterizedWithColor(&data->windows.selectedOption, 0, data->menuEntries[menuEntryId].strings[i], x, menuEntryId * 24 + 5, frameDelay, color, NULL);
    }

    CopyWindowToVram(&data->windows.selectedOption);
}

static void OptionsApp_UpdateMenuEntryCarousel(OptionsApp_Data *data, u32 menuEntryId, OptionsApp_MenuEntry *menuEntry, s32 offset) {
    if (menuEntryId == MENU_ENTRY_FRAME) {
        if (offset == -1) {
            Sprite_SetAnimCtrlSeq(data->sprites[5], 1);
        } else if (offset == 1) {
            Sprite_SetAnimCtrlSeq(data->sprites[6], 1);
        }
    }

    if (offset > 0) {
        menuEntry->value = (menuEntry->value + offset) % menuEntry->numStrings;
    } else if (offset < 0) {
        menuEntry->value = (menuEntry->value + menuEntry->numStrings - 1) % menuEntry->numStrings;
    }
}

static void OptionsApp_HandleKeyInput(OptionsApp_Data *data, OptionsApp_MenuEntry *menuEntry) {
    if (data->currentMenuEntryId != MENU_ENTRY_6) {
        if (gSystem.newKeys & PAD_KEY_RIGHT) {
            OptionsApp_UpdateMenuEntryCarousel(data, data->currentMenuEntryId, menuEntry, 1);
            ov54_021E6418(data, data->currentMenuEntryId);
            PlaySE(SEQ_SE_DP_SELECT);
        } else if (gSystem.newKeys & PAD_KEY_LEFT) {
            OptionsApp_UpdateMenuEntryCarousel(data, data->currentMenuEntryId, menuEntry, -1);
            ov54_021E6418(data, data->currentMenuEntryId);
            PlaySE(SEQ_SE_DP_SELECT);
        }
        OptionsApp_SetActiveButtonsXPosition(data);
    } else {
        if (gSystem.newKeys & PAD_KEY_LEFT) {
            if (data->menuEntries[data->currentMenuEntryId].value == 0) {
                data->menuEntries[data->currentMenuEntryId].value = 1;
                ov54_021E69D4(data, data->currentMenuEntryId);
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            if (data->menuEntries[data->currentMenuEntryId].value == 1) {
                data->menuEntries[data->currentMenuEntryId].value = 0;
                ov54_021E69D4(data, data->currentMenuEntryId);
                PlaySE(SEQ_SE_DP_SELECT);
            }
        }
    }

    if (gSystem.newKeys & PAD_KEY_UP) {
        data->currentMenuEntryId = (data->currentMenuEntryId + (MENU_ENTRY_COUNT - 1)) % MENU_ENTRY_COUNT;
        ov54_021E69D4(data, data->currentMenuEntryId);
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        data->currentMenuEntryId = (data->currentMenuEntryId + 1) % MENU_ENTRY_COUNT;
        ov54_021E69D4(data, data->currentMenuEntryId);
        PlaySE(SEQ_SE_DP_SELECT);
    } else if ((gSystem.newKeys & PAD_BUTTON_A) && data->currentMenuEntryId == MENU_ENTRY_6) {
        if (data->menuEntries[data->currentMenuEntryId].value == 1) {
            MenuInputStateMgr_SetState(data->menuInputPtr, MENU_INPUT_STATE_BUTTONS);
            PlaySE(SEQ_SE_DP_SAVE);
            Sprite_SetAnimCtrlSeq(data->sprites[8], 3);
            data->unk10_0 = 1;
        } else {
            MenuInputStateMgr_SetState(data->menuInputPtr, MENU_INPUT_STATE_BUTTONS);
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            Sprite_SetAnimCtrlSeq(data->sprites[7], 3);
            data->unk10_0 = 2;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        MenuInputStateMgr_SetState(data->menuInputPtr, MENU_INPUT_STATE_BUTTONS);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        if (data->currentMenuEntryId == MENU_ENTRY_6 && data->menuEntries[data->currentMenuEntryId].value == 0) {
            Sprite_SetAnimCtrlSeq(data->sprites[7], 3);
        } else {
            Sprite_SetAnimCtrlSeq(data->sprites[7], 2);
        }
        data->unk10_0 = 2;
    }
}

static void OptionsApp_HandleInput(OptionsApp_Data *data) {
    if (gSystem.touchNew != 0) {
        const int hitboxIndex = TouchscreenHitbox_FindRectAtTouchNew(sOptionsAppTouchscreenHitboxes);
        switch (hitboxIndex) {
        case -1:
            break;

        case 13: // Confirm button
            data->currentMenuEntryId = ov54_021E6DA8[hitboxIndex][0];
            OptionsApp_SetActiveButtonsXPosition(data);
            ov54_021E6A64(data);
            data->unk10_0 = 1;
            PlaySE(SEQ_SE_DP_SAVE);
            data->menuInputState = 1;
            MenuInputStateMgr_SetState(data->menuInputPtr, MENU_INPUT_STATE_TOUCH);
            data->menuEntries[data->currentMenuEntryId].value = 1;
            ov54_021E69D4(data, data->currentMenuEntryId);
            Sprite_SetAnimCtrlSeq(data->sprites[8], 3);
            break;

        case 14: // Quit button
            data->currentMenuEntryId = ov54_021E6DA8[hitboxIndex][0];
            OptionsApp_SetActiveButtonsXPosition(data);
            ov54_021E6A64(data);
            data->unk10_0 = 2;
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            data->menuInputState = 1;
            MenuInputStateMgr_SetState(data->menuInputPtr, MENU_INPUT_STATE_TOUCH);
            data->menuEntries[data->currentMenuEntryId].value = 0;
            ov54_021E69D4(data, data->currentMenuEntryId);
            Sprite_SetAnimCtrlSeq(data->sprites[7], 3);
            break;

        default: {
            data->currentMenuEntryId = ov54_021E6DA8[hitboxIndex][0];
            OptionsApp_MenuEntry *entry = &data->menuEntries[data->currentMenuEntryId];

            u32 value = ov54_021E6DA8[hitboxIndex][1];
            if (value == 3) {
                OptionsApp_UpdateMenuEntryCarousel(data, data->currentMenuEntryId, entry, -1);
            } else if (value == 4) {
                OptionsApp_UpdateMenuEntryCarousel(data, data->currentMenuEntryId, entry, 1);
            } else {
                entry->value = value;
            }
            ov54_021E6418(data, data->currentMenuEntryId);
            ov54_021E69D4(data, data->currentMenuEntryId);
            OptionsApp_SetActiveButtonsXPosition(data);
            ov54_021E6A64(data);
            data->menuInputState = 1;
            PlaySE(SEQ_SE_DP_SELECT);
            break;
        }
        }
    } else if (gSystem.newKeys != 0) {
        OptionsApp_HandleKeyInput(data, &data->menuEntries[data->currentMenuEntryId]);
    }
}

static void ov54_021E69D4(OptionsApp_Data *data, u32 menuEntryId) {
    if (menuEntryId == MENU_ENTRY_6) {
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        if (data->menuEntries[menuEntryId].value == 0) {
            Sprite_SetAnimCtrlSeq(data->sprites[7], 1);
            Sprite_SetAnimCtrlSeq(data->sprites[8], 0);
        } else {
            Sprite_SetAnimCtrlSeq(data->sprites[7], 0);
            Sprite_SetAnimCtrlSeq(data->sprites[8], 1);
        }
    } else {
        BgSetPosTextAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, sMenuEntryBorderYCoords[data->currentMenuEntryId]);
        Sprite_SetAnimCtrlSeq(data->sprites[7], 0);
        Sprite_SetAnimCtrlSeq(data->sprites[8], 0);
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
    }
}

static void ov54_021E6A64(OptionsApp_Data *data) {
    if (data->currentMenuEntryId == MENU_ENTRY_6) {
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    }
}

static void OptionsApp_SetupSpriteRenderer(OptionsApp_Data *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);

    data->spriteRenderer = SpriteSystem_Alloc(data->heapId);
    data->spriteGfxHandler = SpriteManager_New(data->spriteRenderer);

    const OamManagerParam unk1 = {
        .fromOBJmain = 0,
        .numOBJmain = 128,
        .fromAffineMain = 0,
        .numAffineMain = 32,
        .fromOBJsub = 0,
        .numOBJsub = 128,
        .fromAffineSub = 0,
        .numAffineSub = 32,
    };
    const OamCharTransferParam unk2 = {
        .maxTasks = 9,
        .sizeMain = 0x400,
        .sizeSub = 0x400,
        .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
        .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
    };
    SpriteSystem_Init(data->spriteRenderer, &unk1, &unk2, 32);
    SpriteSystem_InitSprites(data->spriteRenderer, data->spriteGfxHandler, 9);

    u16 fileIdList[7] = {
        NARC_resdat_resdat_00000022_bin,
        NARC_resdat_resdat_00000023_bin,
        NARC_resdat_resdat_00000021_bin,
        NARC_resdat_resdat_00000020_bin,
        0xFFFF,
        0xFFFF,
        NARC_resdat_resdat_00000077_bin,
    };
    sub_0200D294(data->spriteRenderer, data->spriteGfxHandler, fileIdList);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(data->spriteRenderer), FX32_CONST(0), FX32_CONST(256));
}

static void OptionsApp_FreeSpriteRenderer(OptionsApp_Data *data) {
    SpriteSystem_DestroySpriteManager(data->spriteRenderer, data->spriteGfxHandler);
    SpriteSystem_Free(data->spriteRenderer);
    data->spriteGfxHandler = NULL;
}

static void OptionsApp_SetupSprites(OptionsApp_Data *data) {
    for (u16 i = 0; i < NELEMS(data->sprites); i++) {
        data->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(data->spriteRenderer, data->spriteGfxHandler, &ov54_021E6EAC[i]);
        thunk_Sprite_SetPriority(data->sprites[i], 2);
        Sprite_SetAnimActiveFlag(data->sprites[i], TRUE);
    }

    Sprite_SetDrawFlag(data->sprites[7], TRUE);
}

static void OptionsApp_SetActiveButtonsXPosition(OptionsApp_Data *data) {
    for (int i = 0; i < 5; i++) {
        s16 x, y;
        Sprite_GetPositionXY(data->sprites[i], &x, &y);
        x = sActiveButtonXCoords[i][data->menuEntries[i].value];
        Sprite_SetPositionXY(data->sprites[i], x, y);
    }
}

static BOOL OptionsApp_ConfirmAndQuitButtonsAreDoneAnimating(OptionsApp_Data *data) {
    if (Sprite_IsAnimated(data->sprites[7]) == 0 && Sprite_IsAnimated(data->sprites[8]) == 0) {
        return FALSE;
    }

    return TRUE;
}
