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

#define min(a, b) ((a) <= (b) ? (a) : (b))

typedef enum Overlay121WindowId {
    OV121_WINDOW_0,
    OV121_WINDOW_1,
    OV121_WINDOW_2,
    OV121_WINDOW_3,
    OV121_WINDOW_4,
    OV121_WINDOW_5,
} Overlay121WindowId;

typedef enum Overlay121SpriteId {
    OV121_SPRITE_0,
    OV121_SPRITE_1,
    OV121_SPRITE_2,
    OV121_SPRITE_3,
    OV121_SPRITE_4,
} Overlay121SpriteId;

typedef enum Overlay121State {
    OV121_STATE_INIT,
    OV121_STATE_1,
    OV121_STATE_YESNO,
    OV121_STATE_3,
    OV121_STATE_4,
} Overlay121State;

typedef enum Overlay121Input {
    OV121_INPUT_NONE,
    OV121_INPUT_CURSOR_UP,
    OV121_INPUT_CURSOR_DOWN,
    OV121_INPUT_TAP_RECORD,
    OV121_INPUT_B_BUTTON,
    OV121_INPUT_X_BUTTON,
    OV121_INPUT_CURSOR_LEFT,
    OV121_INPUT_CURSOR_RIGHT,
    OV121_INPUT_A_BUTTON,
} Overlay121Input;

typedef struct UnkStruct_ov121_021E7014 {
    u32 unk_0;
    u16 unk_4;
    u16 unk_6;
} UnkStruct_ov121_021E7014;

typedef struct Overlay121Sub258 {
    UnkStruct_0202E9FC_sub *unk_00;
    u16 unk_04;
    u8 unk_06;
} Overlay121Sub258;

typedef struct Overlay121Sub254 {
    int unk_00;
    Overlay121Sub258 unk_04[7];
} Overlay121Sub254;

typedef struct Overlay121Appdata {
    BgConfig *bgConfig;
    Window windows[6];
    MsgData *msgData;
    MessageFormat *msgFormat;
    String *unk_06C;
    String *unk_070;
    String *unk_074;
    String *unk_078[7];
    YesNoPrompt *yesNoPrompt;
    SpriteList *spriteList;
    GF_G2dRenderer g2dRenderer;
    GF_2DGfxResMan *gf2dGfxResManagers[6];
    GF_2DGfxResObj *gf2dGfxResObjects[6];
    SpriteResourcesHeader spriteResourcesHeader;
    Sprite *sprites[5];
    TouchscreenHitbox *touchscreenHitboxes;
    u8 unk_230;
    u8 unk_231;
    s8 unk_232;
    u8 state;
    UnkStruct_0202E4B0 *unk_234;
    UnkStruct_0202E9FC *unk_238[7];
    Overlay121Sub254 *unk_254;
    Overlay121Sub258 *unk_258;
    u8 page;
    u8 unk_25D;
    u8 unk_25E;
    u8 unk_25F;
    u8 unk_260;
    u8 unk_261;
    u8 unk_262[6];
    u8 unk_268;
} Overlay121AppData;

typedef struct UnkStruct_Overlay121_021E7140 {
    int x;
    int y;
    int anim;
} UnkStruct_Overlay121_021E7140;

static const UnkStruct_Overlay121_021E7140 ov121_021E7140[] = {
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

static const UnkStruct_ov121_021E7014 ov121_021E7110[] = {
    {
        .unk_0 = 9999,
        .unk_4 = 4,
        .unk_6 = 44,
    },
    {
        .unk_0 = 9999,
        .unk_4 = 4,
        .unk_6 = 44,
    },
    {
        .unk_0 = 9999,
        .unk_4 = 4,
        .unk_6 = 44,
    },
    {
        .unk_0 = 9999,
        .unk_4 = 4,
        .unk_6 = 44,
    },
    {
        .unk_0 = 9999,
        .unk_4 = 4,
        .unk_6 = 44,
    },
    {
        .unk_0 = 7,
        .unk_4 = 0x0001,
        .unk_6 = 0x002D,
    },
};

static const UnkStruct_ov121_021E7014 ov121_021E70C8[] = {
    {
        .unk_0 = 999999,
	    .unk_4 = 6,
        .unk_6 = 47,
    },
    {
        .unk_0 = 999999,
	    .unk_4 = 6,
        .unk_6 = 47,
    },
    {
        .unk_0 = 999999,
	    .unk_4 = 6,
        .unk_6 = 0x002E,
    },
    {
        .unk_0 = 999999,
	    .unk_4 = 6,
        .unk_6 = 47,
    },
};

static const UnkStruct_ov121_021E7014 *const ov121_021E7014[] = {
    ov121_021E7110,
    ov121_021E70C8,
};

static void ov121_021E5AEC(OVY_MANAGER *man, int *pState);
static BOOL ov121_021E5C50(Overlay121AppData *appData);
static void ov121_021E5CB4(Overlay121AppData *appData);
static BOOL ov121_021E5CC4(Overlay121AppData *appData);
static void Overlay121_HandleYesNoInput(Overlay121AppData *appData);
static BOOL ov121_021E5D5C(Overlay121AppData *appData);
static void Overlay121_SetGfxBanks(void);
static void Overlay121_InitBgLayers(BgConfig *bgConfig);
static void Overlay121_InitObjCharTransfer(void);
static void Overlay121_CreateOamManager(void);
static void VBlankCB_Overlay121(void *cbData);
static void Overlay121_LoadBgGraphics(BgConfig *bgConfig, HeapID heapId);
static void Overlay121_LoadSpriteGraphics(Overlay121AppData *appData, HeapID heapId);
static void Overlay121_CreateSpriteResourcesHeader(Overlay121AppData *appData);
static void Overlay121_DestroySprites(Overlay121AppData *appData);
static void setSpriteTemplate(SpriteTemplate *spriteTemplate, Overlay121AppData *appData);
static void Overlay121_CreateSprites(Overlay121AppData *appData);
static void Overlay121_CreateTouchscreenHitboxes(Overlay121AppData *appData, HeapID heapId);
static Overlay121Input Overlay121_PollInput(Overlay121AppData *appData, int *pSelection);
static BOOL ov121_021E6404(Overlay121AppData *appData, Overlay121Input input, int selection);
static void ov121_021E6478(Overlay121AppData *appData, Overlay121Input input, int selection);
static void ov121_021E6544(Overlay121AppData *appData, int direction);
static void ov121_021E65A8(Overlay121AppData *appData, int selection);
static void ov121_021E65D8(Overlay121AppData *appData);
static void ov121_021E662C(Overlay121AppData *appData, int direction);
static void ov121_021E6690(Overlay121AppData *appData, BOOL selection);
static void Overlay121_CreateWindows(Overlay121AppData *appData);
static void ov121_021E67E4(Overlay121AppData *appData);
static void ov121_021E67FC(Overlay121AppData *appData, SaveData *saveData);
static void ov121_021E69F0(Overlay121AppData *appData);
static void ov121_021E6A4C(Overlay121AppData *appData);
static void ov121_021E6A84(Overlay121AppData *appData);
static void Overlay121_PrintDeleteRecordText(Overlay121AppData *appData);
static void Overlay121_PrintReturnText(Overlay121AppData *appData);
static void Overlay121_PrintDeleteXsRecordAreYouSure(Overlay121AppData *appData);
static void Overlay121_PrintYourOwnRecordCantBeDeleted(Overlay121AppData *appData);
static void Overlay121_PrintRecordStatHeaderText(Overlay121AppData *appData);
static void Overlay121_PrintSelectRecordToDeleteText(Overlay121AppData *appData);
static void ov121_021E6EC0(Overlay121AppData *appData);
static void dimAllMainBgsExceptLyr0(void);
static void resetMainBgsBrightness(void);
static void ov121_021E6F78(Overlay121AppData *appData);

BOOL ov121_021E5900(OVY_MANAGER *man, int *pState) {
    ov121_021E5AEC(man, pState);
    return TRUE;
}

BOOL ov121_021E590C(OVY_MANAGER *man, int *pState) {
    Overlay121AppData *appData = OverlayManager_GetData(man);
    switch (appData->unk_230) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->unk_230 = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            appData->unk_230 = 2;
        }
        break;
    case 2:
        if (ov121_021E5C50(appData)) {
            appData->unk_230 = 3;
        }
        break;
    case 3:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->unk_230 = 4;
        break;
    case 4:
        if (IsPaletteFadeFinished()) {
            ov121_021E6F78(appData);
            return TRUE;
        }
        break;
    }

    ov121_021E5CB4(appData);
    return FALSE;
}

BOOL ov121_021E59BC(OVY_MANAGER *man, int *pState) {
    Overlay121AppData *appData = OverlayManager_GetData(man);

    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    Main_SetVBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    ov121_021E6A4C(appData);
    RemoveWindow(&appData->windows[OV121_WINDOW_0]);
    RemoveWindow(&appData->windows[OV121_WINDOW_1]);
    RemoveWindow(&appData->windows[OV121_WINDOW_2]);
    RemoveWindow(&appData->windows[OV121_WINDOW_3]);
    RemoveWindow(&appData->windows[OV121_WINDOW_4]);
    RemoveWindow(&appData->windows[OV121_WINDOW_5]);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_SUB_0);
    Overlay121_DestroySprites(appData);
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
    for (int i = 0; i < appData->unk_25E + 1; ++i) {
        sub_0202EAFC(appData->unk_238[i]);
    }
    FreeToHeap(appData->unk_254);
    FreeToHeap(appData);
    DestroyHeap(HEAP_ID_9E);
    return TRUE;
}

static void ov121_021E5AEC(OVY_MANAGER *man, int *pState) {
    UnkStruct_02097D56 *args = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_9E, 0x10000);
    Overlay121AppData *data = OverlayManager_CreateAndGetData(man, sizeof(Overlay121AppData), HEAP_ID_9E);
    memset(data, 0, sizeof(Overlay121AppData));
    data->bgConfig = BgConfig_Alloc(HEAP_ID_9E);
    Overlay121_SetGfxBanks();
    Overlay121_InitBgLayers(data->bgConfig);
    Overlay121_InitObjCharTransfer();
    Overlay121_CreateOamManager();
    Overlay121_LoadSpriteGraphics(data, HEAP_ID_9E);
    Overlay121_CreateSpriteResourcesHeader(data);
    data->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_9E);
    data->unk_268 = Options_GetFrame(Save_PlayerData_GetOptionsAddr(args->saveData));
    Main_SetVBlankIntrCB(VBlankCB_Overlay121, data->bgConfig);
    data->unk_230 = 0;
    ResetAllTextPrinters();
    FontID_Alloc(4, HEAP_ID_9E);
    Overlay121_LoadBgGraphics(data->bgConfig, HEAP_ID_9E);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    Overlay121_CreateWindows(data);
    Overlay121_CreateSprites(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    Overlay121_CreateTouchscreenHitboxes(data, HEAP_ID_9E);
    data->state = 1;
    data->unk_234 = sub_0202E530(args->saveData);
    data->page = args->unk_0 % 3;
    data->unk_25D = args->unk_0 / 3;
    data->unk_25E = sub_0202E4B0(data->page);
    data->unk_25F = sub_0202E4BC(data->page);
    ov121_021E67FC(data, args->saveData);
    data->unk_260 = args->unk_2;
    if (data->unk_260 >= data->unk_25E) {
        GF_ASSERT(FALSE);
        data->unk_260 = 0;
    }
    ov121_021E69F0(data);
    ov121_021E6690(data, 0);
    ov121_021E6A84(data);
    Overlay121_PrintDeleteRecordText(data);
    Overlay121_PrintReturnText(data);
    Overlay121_PrintRecordStatHeaderText(data);
}

static BOOL ov121_021E5C50(Overlay121AppData *appData) {
    switch (appData->state) {
    case OV121_STATE_INIT:
        ov121_021E6A84(appData);
        appData->state = OV121_STATE_1;
        break;
    case OV121_STATE_1:
        if (ov121_021E5CC4(appData)) {
            return TRUE;
        }
        break;
    case OV121_STATE_YESNO:
        Overlay121_HandleYesNoInput(appData);
        break;
    case OV121_STATE_3:
        if (ov121_021E5D5C(appData)) {
            appData->state = OV121_STATE_1;
        }
        break;
    case OV121_STATE_4:
        appData->unk_258->unk_04 = 0;
        appData->state = OV121_STATE_INIT;
        break;
    }
    return FALSE;
}

static void ov121_021E5CB4(Overlay121AppData *appData) {
    if (appData->spriteList != NULL) {
        sub_0202457C(appData->spriteList);
    }
}

static BOOL ov121_021E5CC4(Overlay121AppData *appData) {
    int selection;
    Overlay121Input input = Overlay121_PollInput(appData, &selection);
    if (input == 0) {
        return FALSE;
    }
    if (appData->unk_231 == 0) {
        if (ov121_021E6404(appData, input, selection)) {
            return TRUE;
        }
    } else {
        ov121_021E6478(appData, input, selection);
    }
    return FALSE;
}

static void Overlay121_HandleYesNoInput(Overlay121AppData *appData) {
    switch (YesNoPrompt_HandleInput(appData->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = OV121_STATE_4;
        Overlay121_PrintSelectRecordToDeleteText(appData);
        break;
    case YESNORESPONSE_NO:
        YesNoPrompt_Reset(appData->yesNoPrompt);
        resetMainBgsBrightness();
        appData->state = OV121_STATE_1;
        Overlay121_PrintSelectRecordToDeleteText(appData);
        break;
    }
}

static BOOL ov121_021E5D5C(Overlay121AppData *appData) {
    if (gSystem.newKeys != 0 || System_GetTouchNew()) {
        Overlay121_PrintSelectRecordToDeleteText(appData);
        return TRUE;
    }
    return FALSE;
}

static void Overlay121_SetGfxBanks(void) {
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

static void Overlay121_InitBgLayers(BgConfig *bgConfig) {
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

static void Overlay121_InitObjCharTransfer(void) {
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

static void Overlay121_CreateOamManager(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 0, 126, 0, 32, HEAP_ID_9E);
}

static void VBlankCB_Overlay121(void *cbData) {
    BgConfig *bgConfig = (BgConfig *)cbData;

    OamManager_ApplyAndResetBuffers();
    DoScheduledBgGpuUpdates(bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void Overlay121_LoadBgGraphics(BgConfig *bgConfig, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 1, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x40, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 3, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x1000, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 5, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_3);

    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 2, bgConfig, GF_BG_LYR_SUB_0, 0, 0x400, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 4, bgConfig, GF_BG_LYR_SUB_0, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_0);
}

static void Overlay121_LoadSpriteGraphics(Overlay121AppData *appData, HeapID heapId) {
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

static void Overlay121_CreateSpriteResourcesHeader(Overlay121AppData *appData) {
    CreateSpriteResourcesHeader(&appData->spriteResourcesHeader, 0, 0, 0, 0, -1, -1, 0, 3, appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CHAR], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_PLTT], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_CELL], appData->gf2dGfxResManagers[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
}

static void Overlay121_DestroySprites(Overlay121AppData *appData) {
    if (appData->sprites[OV121_SPRITE_0] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_0]);
    }
    if (appData->sprites[OV121_SPRITE_1] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_1]);
    }
    if (appData->sprites[OV121_SPRITE_2] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_2]);
    }
    if (appData->sprites[OV121_SPRITE_3] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_3]);
    }
    if (appData->sprites[OV121_SPRITE_4] != NULL) {
        Sprite_Delete(appData->sprites[OV121_SPRITE_4]);
    }
}

static void setSpriteTemplate(SpriteTemplate *spriteTemplate, Overlay121AppData *appData) {
    spriteTemplate->spriteList = appData->spriteList;
    spriteTemplate->header = &appData->spriteResourcesHeader;
    spriteTemplate->position.z = 0;
    SetVecFx32(spriteTemplate->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate->rotation = 0;
    spriteTemplate->priority = 0;
    spriteTemplate->whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate->heapId = HEAP_ID_9E;
}

static void Overlay121_CreateSprites(Overlay121AppData *appData) {
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
    appData->sprites[OV121_SPRITE_0] = sprite;

    spriteTemplate.position.x = FX32_CONST(16);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 3);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_2] = sprite;

    spriteTemplate.position.x = FX32_CONST(240);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 5);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_1] = sprite;

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 0);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_3] = sprite;

    spriteTemplate.position.x = FX32_CONST(64);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 8);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->sprites[OV121_SPRITE_4] = sprite;
}

static void Overlay121_CreateTouchscreenHitboxes(Overlay121AppData *appData, HeapID heapId) {
    appData->touchscreenHitboxes = AllocFromHeap(heapId, 10 * sizeof(TouchscreenHitbox));
    for (int i = 0; i < 6; ++i) {
        TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[i], 56 + 16 * i, 40, 16, 176);
    }
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[6], 168, 8, 16, 128);
    TouchscreenHitbox_SetRect(&appData->touchscreenHitboxes[7], 168, 192, 16, 64);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[8], 16, 96, 16);
    TouchscreenHitbox_SetCircle(&appData->touchscreenHitboxes[9], 240, 96, 16);
}

static Overlay121Input Overlay121_PollInput(Overlay121AppData *appData, int *a1) {
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

static BOOL ov121_021E6404(Overlay121AppData *appData, Overlay121Input input, int selection) {
    switch (input) {
    case OV121_INPUT_NONE:
    case OV121_INPUT_CURSOR_UP:
    case OV121_INPUT_CURSOR_DOWN:
    case OV121_INPUT_TAP_RECORD:
        break;
    case OV121_INPUT_CURSOR_LEFT:
        ov121_021E662C(appData, -1);
        break;
    case OV121_INPUT_CURSOR_RIGHT:
        ov121_021E662C(appData,  1);
        break;
    case OV121_INPUT_X_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_4], 9);
        ov121_021E6690(appData, 1);
        break;
    case OV121_INPUT_B_BUTTON:
    case OV121_INPUT_A_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_3], 1);
        return TRUE;
    }

    return FALSE;
}

static void ov121_021E6478(Overlay121AppData *appData, Overlay121Input input, int selection) {
    switch (input) {
    case OV121_INPUT_NONE:
    case OV121_INPUT_CURSOR_LEFT:
    case OV121_INPUT_CURSOR_RIGHT:
        break;
    case OV121_INPUT_CURSOR_UP:
        ov121_021E6544(appData, -1);
        break;
    case OV121_INPUT_CURSOR_DOWN:
        ov121_021E6544(appData,  1);
        break;
    case OV121_INPUT_TAP_RECORD:
        ov121_021E65A8(appData, selection);
        break;
    case OV121_INPUT_X_BUTTON:
        if (appData->unk_232 < appData->unk_261) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ov121_021E6EC0(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_3], 1);
            ov121_021E6690(appData, 0);
        }
        break;
    case OV121_INPUT_B_BUTTON:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_3], 1);
        ov121_021E6690(appData, 0);
        break;
    case OV121_INPUT_A_BUTTON:
        if (appData->unk_232 < appData->unk_261) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ov121_021E6EC0(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_3], 1);
            ov121_021E6690(appData, 0);
        }
        break;
    }
}

static void ov121_021E6544(Overlay121AppData *appData, int direction) {
    if (direction > 0) {
        if (appData->unk_232 == 6) {
            appData->unk_232 = 0;
        } else if (appData->unk_232 + direction >= appData->unk_261) {
            appData->unk_232 = 6;
        } else {
            appData->unk_232 += direction;
        }
    } else if (direction < 0) {
        if (appData->unk_232 == 6) {
            appData->unk_232 = appData->unk_261 - 1;
        } else if (appData->unk_232 + direction < 0) {
            appData->unk_232 = 6;
        } else {
            appData->unk_232 += direction;
        }
    }
    PlaySE(SEQ_SE_DP_SELECT);
    ov121_021E65D8(appData);
}

static void ov121_021E65A8(Overlay121AppData *appData, int selection) {
    if (selection == 6 || selection < appData->unk_261) {
        PlaySE(SEQ_SE_DP_SELECT);
        appData->unk_232 = selection;
        ov121_021E65D8(appData);
    }
}

static void ov121_021E65D8(Overlay121AppData *appData) {
    VecFx32 pos = {};
    u8 idx = appData->unk_232;
    pos.x = ov121_021E7140[idx].x * FX32_ONE;
    pos.y = ov121_021E7140[idx].y * FX32_ONE;
    Sprite_SetMatrix(appData->sprites[OV121_SPRITE_0], &pos);
    Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_0], ov121_021E7140[idx].anim);
}

static void ov121_021E662C(Overlay121AppData *appData, int direction) {
    int new = appData->unk_260 + direction;
    if (new < 0) {
        new = appData->unk_25E - 1;
    } else if (new >= appData->unk_25E) {
        new = 0;
    }
    appData->unk_260 = new;
    PlaySE(SEQ_SE_DP_SELECT78);
    if (direction > 0) {
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_1], 6);
    } else if (direction < 0) {
        Set2dSpriteAnimSeqNo(appData->sprites[OV121_SPRITE_2], 4);
    }
    Overlay121_PrintRecordStatHeaderText(appData);
    appData->state = OV121_STATE_INIT;
}

static void ov121_021E6690(Overlay121AppData *appData, BOOL selection) {
    appData->unk_231 = selection;
    if (selection == 0) {
        appData->unk_232 = 6;
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_1], TRUE);
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_2], TRUE);
        ov121_021E67E4(appData);
    } else {
        appData->unk_232 = 0;
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_1], FALSE);
        Set2dSpriteVisibleFlag(appData->sprites[OV121_SPRITE_2], FALSE);
        Overlay121_PrintSelectRecordToDeleteText(appData);
    }
    ov121_021E65D8(appData);
}

static void Overlay121_CreateWindows(Overlay121AppData *appData) {
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_0], GF_BG_LYR_MAIN_1, 5, 7, 2, 12, 15, 0x1);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_1], GF_BG_LYR_MAIN_1, 7, 7, 20, 12, 15, 0x19);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_2], GF_BG_LYR_MAIN_2, 2, 1, 28, 4, 15, 0x109);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_3], GF_BG_LYR_MAIN_2, 25, 21, 6, 2, 1, 0x179);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_4], GF_BG_LYR_MAIN_2, 4, 21, 12, 2, 1, 0x185);
    AddWindowParameterized(appData->bgConfig, &appData->windows[OV121_WINDOW_5], GF_BG_LYR_MAIN_0, 2, 1, 28, 4, 15, 0x1F);
    LoadUserFrameGfx2(appData->bgConfig, GF_BG_LYR_MAIN_0, 0x1, 12, appData->unk_268, HEAP_ID_9E);
}

static void ov121_021E67E4(Overlay121AppData *appData) {
    ClearFrameAndWindow2(&appData->windows[OV121_WINDOW_5], TRUE);
    ClearWindowTilemapAndCopyToVram(&appData->windows[OV121_WINDOW_5]);
}

static void ov121_021E67FC(Overlay121AppData *appData, SaveData *saveData) {
    int j;
    int i;
    BOOL inserted;
    UnkStruct_0202E9FC *ptr;
    int cnt;

    appData->unk_254 = AllocFromHeap(HEAP_ID_9E, appData->unk_25E * sizeof(Overlay121Sub254));
    MI_CpuClear8(appData->unk_254, appData->unk_25E * sizeof(Overlay121Sub254));
    appData->unk_238[0] = sub_0202E9FC(saveData, appData->page, HEAP_ID_9E);
    for (i = 0; i < appData->unk_25E; ++i) {
        appData->unk_238[1 + i] = sub_0202EA80(appData->unk_234, appData->unk_25F + appData->unk_25D * 13 + i, HEAP_ID_9E);
        cnt = 0;
        inserted = FALSE;
        ptr = appData->unk_238[1 + i];
        if (ptr->count == 0) {
            appData->unk_254[i].unk_04[0].unk_00 = &appData->unk_238[0]->unk_04[i];
            appData->unk_254[i].unk_04[0].unk_04 = 1;
            appData->unk_254[i].unk_04[0].unk_06 = 0xFF;
            appData->unk_254[i].unk_00 = 1;
        } else {
            for (j = 0; j < ptr->count; ++j) {
                if (!inserted && appData->unk_238[0]->unk_04[i].unk_4 >= ptr->unk_04[j].unk_4) {
                    appData->unk_254[i].unk_04[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = 0xFF;
                    ++cnt;
                    appData->unk_254[i].unk_04[cnt].unk_00 = &ptr->unk_04[j];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = j;
                    inserted = TRUE;
                } else {
                    appData->unk_254[i].unk_04[cnt].unk_00 = &ptr->unk_04[j];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = j;
                }
                ++cnt;
            }
            if (!inserted) {
                appData->unk_254[i].unk_04[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                appData->unk_254[i].unk_04[cnt].unk_06 = 0xFF;
            }
            appData->unk_254[i].unk_00 = ptr->count + 1;
        }
    }
}

static void ov121_021E69F0(Overlay121AppData *appData) {
    appData->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0421_bin, HEAP_ID_9E);
    appData->msgFormat = MessageFormat_New_Custom(2, 76, HEAP_ID_9E);
    appData->unk_06C = String_New(76, HEAP_ID_9E);
    appData->unk_070 = NewString_ReadMsgData(appData->msgData, msg_0421_00043);
    appData->unk_074 = NewString_ReadMsgData(appData->msgData, msg_0421_00042);
    for (int i = 0; i < 7; ++i) {
        appData->unk_078[i] = NewString_ReadMsgData(appData->msgData, msg_0421_00044 + i);
    }
}

static void ov121_021E6A4C(Overlay121AppData *appData) {
    for (int i = 0; i < 7; ++i) {
        String_Delete(appData->unk_078[i]);
    }
    String_Delete(appData->unk_070);
    String_Delete(appData->unk_074);
    String_Delete(appData->unk_06C);
    MessageFormat_Delete(appData->msgFormat);
    DestroyMsgData(appData->msgData);
}

static void ov121_021E6A84(Overlay121AppData *appData) {
    int i;
    int sp18;
    int sp14;
    const UnkStruct_ov121_021E7014 *sp10;
    Overlay121Sub254 *sp24_plus_sp20;
    int r0;
    int r5;

    sp24_plus_sp20= &appData->unk_254[appData->unk_260];
    sp10 = &ov121_021E7014[appData->page][appData->unk_260];

    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_1], 0);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_0], 0);
    sp18 = 1;
    sp14 = 0;
    r0 = 0;
    i = 0;
    appData->unk_261 = 0;
    for (; i < sp24_plus_sp20->unk_00; ++i) {
        if (sp24_plus_sp20->unk_04[i].unk_04 != 0) {
            r5 = min(sp24_plus_sp20->unk_04[i].unk_00->unk_4, sp10->unk_0);
            if (r5 < r0) {
                ++sp18;
            }
            BufferIntegerAsString(appData->msgFormat, 0, sp18, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->unk_06C, appData->unk_074);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_0], 0, appData->unk_06C, 0, 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferString(appData->msgFormat, 1, sp24_plus_sp20->unk_04[i].unk_00->playerName, 2, 1, 2);
            StringExpandPlaceholders(appData->msgFormat, appData->unk_06C, appData->unk_070);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_1], 0, appData->unk_06C, 0, 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferIntegerAsString(appData->msgFormat, 0, r5, sp10->unk_4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->unk_06C, appData->unk_078[sp10->unk_6 - 44]);
            AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_1], 0, appData->unk_06C, 160 - FontID_String_GetWidth(0, appData->unk_06C, 0), 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            appData->unk_262[sp14] = i;
            r0 = r5;
            if (++sp14 >= 6) {
                break;
            }
        }
    }
    CopyWindowToVram(&appData->windows[OV121_WINDOW_1]);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_0]);
    appData->unk_261 = sp14;
    if (appData->unk_231 == 1 && appData->unk_232 >= appData->unk_261) {
        GF_ASSERT(appData->unk_232 != 7);
        appData->unk_232 = appData->unk_261 - 1;
        ov121_021E65D8(appData);
    }
}

static void Overlay121_PrintDeleteRecordText(Overlay121AppData *appData) {
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_4], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00040);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_4], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_4]);
}

static void Overlay121_PrintReturnText(Overlay121AppData *appData) {
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_3], 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0421_00041);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_3], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_3]);
}

static void Overlay121_PrintDeleteXsRecordAreYouSure(Overlay121AppData *appData) {
    Overlay121Sub254 *r6;
    u8 r4;
    String *string;

    r4 = appData->unk_262[appData->unk_232];
    r6 = &appData->unk_254[appData->unk_260];
    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_5], 0xFF);
    BufferString(appData->msgFormat, 0, r6->unk_04[r4].unk_00->playerName, 2, 1, 2);
    string = ReadMsgData_ExpandPlaceholders(appData->msgFormat, appData->msgData, msg_0421_00049, HEAP_ID_9E);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_5]);
}

static void Overlay121_PrintYourOwnRecordCantBeDeleted(Overlay121AppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_5], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00052);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_5]);
}

static void Overlay121_PrintRecordStatHeaderText(Overlay121AppData *appData) {
    String *string;
    String *string2;
    int msgNo;

    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_2], 0);
    msgNo = (appData->page == 0 ? msg_0421_00053 : msg_0421_00065) + appData->unk_260 * 2;
    string = NewString_ReadMsgData(appData->msgData, msgNo);
    string2 = NewString_ReadMsgData(appData->msgData, msgNo + 1);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_2], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_2], 0, string2, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    String_Delete(string2);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_2]);
}

static void Overlay121_PrintSelectRecordToDeleteText(Overlay121AppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->windows[OV121_WINDOW_5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->windows[OV121_WINDOW_5], 0xFF);
    string = NewString_ReadMsgData(appData->msgData, msg_0421_00048);
    AddTextPrinterParameterizedWithColor(&appData->windows[OV121_WINDOW_5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->windows[OV121_WINDOW_5]);
}

static void ov121_021E6EC0(Overlay121AppData *appData) {
    YesNoPromptTemplate template;

    appData->unk_258 = &appData->unk_254[appData->unk_260].unk_04[appData->unk_262[appData->unk_232]];
    if (appData->unk_258->unk_06 == 0xFF) {
        appData->state = OV121_STATE_3;
        Overlay121_PrintYourOwnRecordCantBeDeleted(appData);
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
        Overlay121_PrintDeleteXsRecordAreYouSure(appData);
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

static void ov121_021E6F78(Overlay121AppData *appData) {
    int i;
    int j;
    int r6;
    Overlay121Sub258 *r1;
    for (i = 0; i < appData->unk_25E; ++i) {
        r6 = 0;
        for (j = 0; j < appData->unk_254[i].unk_00; ++j) {
            r1 = &appData->unk_254[i].unk_04[j];
            if (r1->unk_06 != 0xFF && r1->unk_04 == 0) {
                sub_0202E544(appData->unk_234, appData->unk_25F + appData->unk_25D * 13 + i, r1->unk_06 - r6);
                ++r6;
            }
        }
    }
}
