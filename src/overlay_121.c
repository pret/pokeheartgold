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
    BgConfig *unk_000;
    Window unk_004[6];
    MsgData *unk_064;
    MessageFormat *unk_068;
    String *unk_06C;
    String *unk_070;
    String *unk_074;
    String *unk_078[7];
    YesNoPrompt *unk_094;
    SpriteList *unk_098;
    GF_G2dRenderer unk_09C;
    GF_2DGfxResMan *unk_1C4[6];
    GF_2DGfxResObj *unk_1DC[6];
    SpriteResourcesHeader unk_1F4;
    Sprite *unk_218[5];
    TouchscreenHitbox *unk_22C;
    u8 unk_230;
    u8 unk_231;
    s8 unk_232;
    u8 unk_233;
    UnkStruct_0202E4B0 *unk_234;
    UnkStruct_0202E9FC *unk_238[7];
    Overlay121Sub254 *unk_254;
    Overlay121Sub258 *unk_258;
    u8 unk_25C;
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
        .x = 0x80,
        .y = 0x40,
        .anim = 7
    },
    {
        .x = 0x80,
        .y = 0x50,
        .anim = 7
    },
    {
        .x = 0x80,
        .y = 0x60,
        .anim = 7
    },
    {
        .x = 0x80,
        .y = 0x70,
        .anim = 7
    },
    {
        .x = 0x80,
        .y = 0x80,
        .anim = 7
    },
    {
        .x = 0x80,
        .y = 0x90,
        .anim = 7
    },
    {
        .x = 0xE0,
        .y = 0xB0,
        .anim = 2
    },
};

static const UnkStruct_ov121_021E7014 ov121_021E7110[] = {
    {
        .unk_0 = 0x0000270F,
        .unk_4 = 0x0004,
        .unk_6 = 0x002C,
    },
    {
        .unk_0 = 0x0000270F,
        .unk_4 = 0x0004,
        .unk_6 = 0x002C,
    },
    {
        .unk_0 = 0x0000270F,
        .unk_4 = 0x0004,
        .unk_6 = 0x002C,
    },
    {
        .unk_0 = 0x0000270F,
        .unk_4 = 0x0004,
        .unk_6 = 0x002C,
    },
    {
        .unk_0 = 0x0000270F,
        .unk_4 = 0x0004,
        .unk_6 = 0x002C,
    },
    {
        .unk_0 = 0x00000007,
        .unk_4 = 0x0001,
        .unk_6 = 0x002D,
    },
};

static const UnkStruct_ov121_021E7014 ov121_021E70C8[] = {
    {
        .unk_0 = 0x000F423F,
	    .unk_4 = 0x0006,
        .unk_6 = 0x002F,
    },
    {
        .unk_0 = 0x000F423F,
	    .unk_4 = 0x0006,
        .unk_6 = 0x002F,
    },
    {
        .unk_0 = 0x000F423F,
	    .unk_4 = 0x0006,
        .unk_6 = 0x002E,
    },
    {
        .unk_0 = 0x000F423F,
	    .unk_4 = 0x0006,
        .unk_6 = 0x002F,
    },
};

static const UnkStruct_ov121_021E7014 *const ov121_021E7014[] = {
    ov121_021E7110,
    ov121_021E70C8,
};

void ov121_021E5AEC(OVY_MANAGER *man, int *pState);
BOOL ov121_021E5C50(Overlay121AppData *appData);
void ov121_021E5CB4(Overlay121AppData *appData);
BOOL ov121_021E5CC4(Overlay121AppData *appData);
void ov121_021E5D08(Overlay121AppData *appData);
BOOL ov121_021E5D5C(Overlay121AppData *appData);
void ov121_021E5D84(void);
void ov121_021E5DA4(BgConfig *bgConfig);
void ov121_021E5EDC(void);
void ov121_021E5F0C(void);
void ov121_021E5F30(void *cbData);
void ov121_021E5F58(BgConfig *bgConfig, HeapID heapId);
void ov121_021E600C(Overlay121AppData *appData, HeapID heapId);
void ov121_021E60D4(Overlay121AppData *appData);
void ov121_021E611C(Overlay121AppData *appData);
void ov121_021E6168(SpriteTemplate *spriteTemplate, Overlay121AppData *appData);
void ov121_021E6194(Overlay121AppData *appData);
void ov121_021E62A0(Overlay121AppData *appData, HeapID heapId);
int ov121_021E633C(Overlay121AppData *appData, int *a1);
BOOL ov121_021E6404(Overlay121AppData *appData, int a1, int a2);
void ov121_021E6478(Overlay121AppData *appData, int a1, int a2);
void ov121_021E6544(Overlay121AppData *appData, int a1);
void ov121_021E65A8(Overlay121AppData *appData, int a1);
void ov121_021E65D8(Overlay121AppData *appData);
void ov121_021E662C(Overlay121AppData *appData, int a1);
void ov121_021E6690(Overlay121AppData *appData, int a1);
void ov121_021E66EC(Overlay121AppData *appData);
void ov121_021E67E4(Overlay121AppData *appData);
void ov121_021E67FC(Overlay121AppData *appData, SaveData *saveData);
void ov121_021E69F0(Overlay121AppData *appData);
void ov121_021E6A4C(Overlay121AppData *appData);
void ov121_021E6A84(Overlay121AppData *appData);
void ov121_021E6C5C(Overlay121AppData *appData);
void ov121_021E6CA4(Overlay121AppData *appData);
void ov121_021E6CEC(Overlay121AppData *appData);
void ov121_021E6D80(Overlay121AppData *appData);
void ov121_021E6DD8(Overlay121AppData *appData);
void ov121_021E6E68(Overlay121AppData *appData);
void ov121_021E6EC0(Overlay121AppData *appData);
void ov121_021E6F58(void);
void ov121_021E6F6C(void);
void ov121_021E6F78(Overlay121AppData *appData);

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
    RemoveWindow(&appData->unk_004[0]);
    RemoveWindow(&appData->unk_004[1]);
    RemoveWindow(&appData->unk_004[2]);
    RemoveWindow(&appData->unk_004[3]);
    RemoveWindow(&appData->unk_004[4]);
    RemoveWindow(&appData->unk_004[5]);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_SUB_0);
    ov121_021E611C(appData);
    sub_0200AEB0(appData->unk_1DC[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(appData->unk_1DC[GF_GFX_RES_TYPE_PLTT]);
    for (int i = 0; i < 6; ++i) {
        Destroy2DGfxResObjMan(appData->unk_1C4[i]);
    }
    SpriteList_Delete(appData->unk_098);
    FontID_Release(4);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    sub_02022608();
    YesNoPrompt_Destroy(appData->unk_094);
    FreeToHeap(appData->unk_22C);
    FreeToHeap(appData->unk_000);
    for (int i = 0; i < appData->unk_25E + 1; ++i) {
        sub_0202EAFC(appData->unk_238[i]);
    }
    FreeToHeap(appData->unk_254);
    FreeToHeap(appData);
    DestroyHeap(HEAP_ID_9E);
    return TRUE;
}

void ov121_021E5AEC(OVY_MANAGER *man, int *pState) {
    UnkStruct_02097D56 *args = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_9E, 0x10000);
    Overlay121AppData *data = OverlayManager_CreateAndGetData(man, sizeof(Overlay121AppData), HEAP_ID_9E);
    memset(data, 0, sizeof(Overlay121AppData));
    data->unk_000 = BgConfig_Alloc(HEAP_ID_9E);
    ov121_021E5D84();
    ov121_021E5DA4(data->unk_000);
    ov121_021E5EDC();
    ov121_021E5F0C();
    ov121_021E600C(data, HEAP_ID_9E);
    ov121_021E60D4(data);
    data->unk_094 = YesNoPrompt_Create(HEAP_ID_9E);
    data->unk_268 = Options_GetFrame(Save_PlayerData_GetOptionsAddr(args->saveData));
    Main_SetVBlankIntrCB(ov121_021E5F30, data->unk_000);
    data->unk_230 = 0;
    ResetAllTextPrinters();
    FontID_Alloc(4, HEAP_ID_9E);
    ov121_021E5F58(data->unk_000, HEAP_ID_9E);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    ov121_021E66EC(data);
    ov121_021E6194(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    ov121_021E62A0(data, HEAP_ID_9E);
    data->unk_233 = 1;
    data->unk_234 = sub_0202E530(args->saveData);
    data->unk_25C = args->unk_0 % 3;
    data->unk_25D = args->unk_0 / 3;
    data->unk_25E = sub_0202E4B0(data->unk_25C);
    data->unk_25F = sub_0202E4BC(data->unk_25C);
    ov121_021E67FC(data, args->saveData);
    data->unk_260 = args->unk_2;
    if (data->unk_260 >= data->unk_25E) {
        GF_ASSERT(FALSE);
        data->unk_260 = 0;
    }
    ov121_021E69F0(data);
    ov121_021E6690(data, 0);
    ov121_021E6A84(data);
    ov121_021E6C5C(data);
    ov121_021E6CA4(data);
    ov121_021E6DD8(data);
}

BOOL ov121_021E5C50(Overlay121AppData *appData) {
    switch (appData->unk_233) {
    case 0:
        ov121_021E6A84(appData);
        appData->unk_233 = 1;
        break;
    case 1:
        if (ov121_021E5CC4(appData)) {
            return TRUE;
        }
        break;
    case 2:
        ov121_021E5D08(appData);
        break;
    case 3:
        if (ov121_021E5D5C(appData)) {
            appData->unk_233 = 1;
        }
        break;
    case 4:
        appData->unk_258->unk_04 = 0;
        appData->unk_233 = 0;
        break;
    }
    return FALSE;
}

void ov121_021E5CB4(Overlay121AppData *appData) {
    if (appData->unk_098 != NULL) {
        sub_0202457C(appData->unk_098);
    }
}

BOOL ov121_021E5CC4(Overlay121AppData *appData) {
    int sp0;
    int r1 = ov121_021E633C(appData, &sp0);
    if (r1 == 0) {
        return FALSE;
    }
    if (appData->unk_231 == 0) {
        if (ov121_021E6404(appData, r1, sp0)) {
            return TRUE;
        }
    } else {
        ov121_021E6478(appData, r1, sp0);
    }
    return FALSE;
}

void ov121_021E5D08(Overlay121AppData *appData) {
    switch (YesNoPrompt_HandleInput(appData->unk_094)) {
    case YESNORESPONSE_YES:
        YesNoPrompt_Reset(appData->unk_094);
        ov121_021E6F6C();
        appData->unk_233 = 4;
        ov121_021E6E68(appData);
        break;
    case YESNORESPONSE_NO:
        YesNoPrompt_Reset(appData->unk_094);
        ov121_021E6F6C();
        appData->unk_233 = 1;
        ov121_021E6E68(appData);
        break;
    }
}

BOOL ov121_021E5D5C(Overlay121AppData *appData) {
    if (gSystem.newKeys != 0 || System_GetTouchNew()) {
        ov121_021E6E68(appData);
        return TRUE;
    }
    return FALSE;
}

void ov121_021E5D84(void) {
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

void ov121_021E5DA4(BgConfig *bgConfig) {
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

void ov121_021E5EDC(void) {
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

void ov121_021E5F0C(void) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 0, 126, 0, 32, HEAP_ID_9E);
}

void ov121_021E5F30(void *cbData) {
    BgConfig *bgConfig = (BgConfig *)cbData;

    OamManager_ApplyAndResetBuffers();
    DoScheduledBgGpuUpdates(bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov121_021E5F58(BgConfig *bgConfig, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 1, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x40, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 3, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x1000, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 5, bgConfig, GF_BG_LYR_MAIN_3, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_3);

    GfGfxLoader_GXLoadPal(NARC_a_2_6_0, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_0, 2, bgConfig, GF_BG_LYR_SUB_0, 0, 0x400, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_0, 4, bgConfig, GF_BG_LYR_SUB_0, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_0);
}

void ov121_021E600C(Overlay121AppData *appData, HeapID heapId) {
    appData->unk_098 = G2dRenderer_Init(5, &appData->unk_09C, heapId);
    for (int i = 0; i < 6; ++i) {
        appData->unk_1C4[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, heapId);
    }
    appData->unk_1DC[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(appData->unk_1C4[GF_GFX_RES_TYPE_CHAR], NARC_a_2_6_0, 9, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, heapId);
    appData->unk_1DC[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(appData->unk_1C4[GF_GFX_RES_TYPE_PLTT], NARC_a_2_6_0, 6, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 4, heapId);
    appData->unk_1DC[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(appData->unk_1C4[GF_GFX_RES_TYPE_CELL], NARC_a_2_6_0, 8, TRUE, 0, GF_GFX_RES_TYPE_CELL, heapId);
    appData->unk_1DC[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(appData->unk_1C4[GF_GFX_RES_TYPE_ANIM], NARC_a_2_6_0, 7, TRUE, 0, GF_GFX_RES_TYPE_ANIM, heapId);
    sub_0200ADA4(appData->unk_1DC[GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(appData->unk_1DC[GF_GFX_RES_TYPE_PLTT]);
}

void ov121_021E60D4(Overlay121AppData *appData) {
    CreateSpriteResourcesHeader(&appData->unk_1F4, 0, 0, 0, 0, -1, -1, 0, 3, appData->unk_1C4[GF_GFX_RES_TYPE_CHAR], appData->unk_1C4[GF_GFX_RES_TYPE_PLTT], appData->unk_1C4[GF_GFX_RES_TYPE_CELL], appData->unk_1C4[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
}

void ov121_021E611C(Overlay121AppData *appData) {
    if (appData->unk_218[0] != NULL) {
        Sprite_Delete(appData->unk_218[0]);
    }
    if (appData->unk_218[1] != NULL) {
        Sprite_Delete(appData->unk_218[1]);
    }
    if (appData->unk_218[2] != NULL) {
        Sprite_Delete(appData->unk_218[2]);
    }
    if (appData->unk_218[3] != NULL) {
        Sprite_Delete(appData->unk_218[3]);
    }
    if (appData->unk_218[4] != NULL) {
        Sprite_Delete(appData->unk_218[4]);
    }
}

void ov121_021E6168(SpriteTemplate *spriteTemplate, Overlay121AppData *appData) {
    spriteTemplate->spriteList = appData->unk_098;
    spriteTemplate->header = &appData->unk_1F4;
    spriteTemplate->position.z = 0;
    SetVecFx32(spriteTemplate->scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate->rotation = 0;
    spriteTemplate->priority = 0;
    spriteTemplate->whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate->heapId = HEAP_ID_9E;
}

void ov121_021E6194(Overlay121AppData *appData) {
    Sprite *sprite;
    SpriteTemplate spriteTemplate;
    ov121_021E6168(&spriteTemplate, appData);

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 2);
    Sprite_SetPriority(sprite, 1);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->unk_218[0] = sprite;

    spriteTemplate.position.x = FX32_CONST(16);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 3);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->unk_218[2] = sprite;

    spriteTemplate.position.x = FX32_CONST(240);
    spriteTemplate.position.y = FX32_CONST(96);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 5);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->unk_218[1] = sprite;

    spriteTemplate.position.x = FX32_CONST(224);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 0);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->unk_218[3] = sprite;

    spriteTemplate.position.x = FX32_CONST(64);
    spriteTemplate.position.y = FX32_CONST(176);
    sprite = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sprite, TRUE);
    Set2dSpriteAnimSeqNo(sprite, 8);
    Set2dSpriteVisibleFlag(sprite, TRUE);
    appData->unk_218[4] = sprite;
}

void ov121_021E62A0(Overlay121AppData *appData, HeapID heapId) {
    appData->unk_22C = AllocFromHeap(heapId, 10 * sizeof(TouchscreenHitbox));
    for (int i = 0; i < 6; ++i) {
        TouchscreenHitbox_SetRect(&appData->unk_22C[i], 56 + 16 * i, 40, 16, 176);
    }
    TouchscreenHitbox_SetRect(&appData->unk_22C[6], 168, 8, 16, 128);
    TouchscreenHitbox_SetRect(&appData->unk_22C[7], 168, 192, 16, 64);
    TouchscreenHitbox_SetCircle(&appData->unk_22C[8], 16, 96, 16);
    TouchscreenHitbox_SetCircle(&appData->unk_22C[9], 240, 96, 16);
}

int ov121_021E633C(Overlay121AppData *appData, int *a1) {
    int input = 0;
    if (!System_GetTouchHeld()) {
        input = gSystem.newKeys;
        if (input != 0) {
            switch (input) {
            case PAD_KEY_LEFT:
                return 6;
            case PAD_KEY_RIGHT:
                return 7;
            case PAD_KEY_UP:
                return 1;
            case PAD_KEY_DOWN:
                return 2;
            case PAD_BUTTON_X:
                return 5;
            case PAD_BUTTON_A:
                return 8;
            case PAD_BUTTON_B:
                return 4;
            }
        }
    }
    if (input == 0 && System_GetTouchNew()) {
        // Potential UB: TouchscreenHitbox_FindRectAtTouchNew expects unk_22C to be terminated with {0xFF,0,0,0} but ov121_021E62A0 never sets that up
        input = TouchscreenHitbox_FindHitboxAtTouchNew(appData->unk_22C);
        if (input != -1) {
            switch (input) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                *a1 = input;
                return 3;
            case 6:
                return 5;
            case 7:
                *a1 = input;
                return 4;
            case 8:
                return 6;
            case 9:
                return 7;
            }
        }
    }
    return 0;
}

BOOL ov121_021E6404(Overlay121AppData *appData, int a1, int a2) {
    switch (a1) {
    case 0:
    case 1:
    case 2:
    case 3:
        break;
    case 6:
        ov121_021E662C(appData, -1);
        break;
    case 7:
        ov121_021E662C(appData,  1);
        break;
    case 5:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->unk_218[4], 9);
        ov121_021E6690(appData, 1);
        break;
    case 4:
    case 8:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->unk_218[3], 1);
        return TRUE;
    }

    return FALSE;
}

void ov121_021E6478(Overlay121AppData *appData, int a1, int a2) {
    switch (a1) {
    case 0:
    case 6:
    case 7:
        break;
    case 1:
        ov121_021E6544(appData, -1);
        break;
    case 2:
        ov121_021E6544(appData,  1);
        break;
    case 3:
        ov121_021E65A8(appData, a2);
        break;
    case 5:
        if (appData->unk_232 < appData->unk_261) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ov121_021E6EC0(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->unk_218[3], 1);
            ov121_021E6690(appData, 0);
        }
        break;
    case 4:
        PlaySE(SEQ_SE_DP_DECIDE);
        Set2dSpriteAnimSeqNo(appData->unk_218[3], 1);
        ov121_021E6690(appData, 0);
        break;
    case 8:
        if (appData->unk_232 < appData->unk_261) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ov121_021E6EC0(appData);
        } else {
            PlaySE(SEQ_SE_DP_DECIDE);
            Set2dSpriteAnimSeqNo(appData->unk_218[3], 1);
            ov121_021E6690(appData, 0);
        }
        break;
    }
}

void ov121_021E6544(Overlay121AppData *appData, int a1) {
    if (a1 > 0) {
        if (appData->unk_232 == 6) {
            appData->unk_232 = 0;
        } else if (appData->unk_232 + a1 >= appData->unk_261) {
            appData->unk_232 = 6;
        } else {
            appData->unk_232 += a1;
        }
    } else if (a1 < 0) {
        if (appData->unk_232 == 6) {
            appData->unk_232 = appData->unk_261 - 1;
        } else if (appData->unk_232 + a1 < 0) {
            appData->unk_232 = 6;
        } else {
            appData->unk_232 += a1;
        }
    }
    PlaySE(SEQ_SE_DP_SELECT);
    ov121_021E65D8(appData);
}

void ov121_021E65A8(Overlay121AppData *appData, int a1) {
    if (a1 == 6 || a1 < appData->unk_261) {
        PlaySE(SEQ_SE_DP_SELECT);
        appData->unk_232 = a1;
        ov121_021E65D8(appData);
    }
}

void ov121_021E65D8(Overlay121AppData *appData) {
    VecFx32 pos = {};
    u8 idx = appData->unk_232;
    pos.x = ov121_021E7140[idx].x * FX32_ONE;
    pos.y = ov121_021E7140[idx].y * FX32_ONE;
    Sprite_SetMatrix(appData->unk_218[0], &pos);
    Set2dSpriteAnimSeqNo(appData->unk_218[0], ov121_021E7140[idx].anim);
}

void ov121_021E662C(Overlay121AppData *appData, int a1) {
    int new = appData->unk_260 + a1;
    if (new < 0) {
        new = appData->unk_25E - 1;
    } else if (new >= appData->unk_25E) {
        new = 0;
    }
    appData->unk_260 = new;
    PlaySE(SEQ_SE_DP_SELECT78);
    if (a1 > 0) {
        Set2dSpriteAnimSeqNo(appData->unk_218[1], 6);
    } else if (a1 < 0) {
        Set2dSpriteAnimSeqNo(appData->unk_218[2], 4);
    }
    ov121_021E6DD8(appData);
    appData->unk_233 = 0;
}

void ov121_021E6690(Overlay121AppData *appData, int a1) {
    appData->unk_231 = a1;
    if (a1 == 0) {
        appData->unk_232 = 6;
        Set2dSpriteVisibleFlag(appData->unk_218[1], TRUE);
        Set2dSpriteVisibleFlag(appData->unk_218[2], TRUE);
        ov121_021E67E4(appData);
    } else {
        appData->unk_232 = 0;
        Set2dSpriteVisibleFlag(appData->unk_218[1], FALSE);
        Set2dSpriteVisibleFlag(appData->unk_218[2], FALSE);
        ov121_021E6E68(appData);
    }
    ov121_021E65D8(appData);
}

void ov121_021E66EC(Overlay121AppData *appData) {
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1E0, HEAP_ID_9E);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[0], GF_BG_LYR_MAIN_1, 5, 7, 2, 12, 15, 0x1);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[1], GF_BG_LYR_MAIN_1, 7, 7, 20, 12, 15, 0x19);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[2], GF_BG_LYR_MAIN_2, 2, 1, 28, 4, 15, 0x109);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[3], GF_BG_LYR_MAIN_2, 25, 21, 6, 2, 1, 0x179);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[4], GF_BG_LYR_MAIN_2, 4, 21, 12, 2, 1, 0x185);
    AddWindowParameterized(appData->unk_000, &appData->unk_004[5], GF_BG_LYR_MAIN_0, 2, 1, 28, 4, 15, 0x1F);
    LoadUserFrameGfx2(appData->unk_000, GF_BG_LYR_MAIN_0, 0x1, 12, appData->unk_268, HEAP_ID_9E);
}

void ov121_021E67E4(Overlay121AppData *appData) {
    ClearFrameAndWindow2(&appData->unk_004[5], TRUE);
    ClearWindowTilemapAndCopyToVram(&appData->unk_004[5]);
}

void ov121_021E67FC(Overlay121AppData *appData, SaveData *saveData) {
    int j;
    int i;
    BOOL ip;
    UnkStruct_0202E9FC *ptr;
    int cnt;

    appData->unk_254 = AllocFromHeap(HEAP_ID_9E, appData->unk_25E * sizeof(Overlay121Sub254));
    MI_CpuClear8(appData->unk_254, appData->unk_25E * sizeof(Overlay121Sub254));
    appData->unk_238[0] = sub_0202E9FC(saveData, appData->unk_25C, HEAP_ID_9E);
    for (i = 0; i < appData->unk_25E; ++i) {
        appData->unk_238[1 + i] = sub_0202EA80(appData->unk_234, appData->unk_25F + appData->unk_25D * 13 + i, HEAP_ID_9E);
        cnt = 0;
        ip = FALSE;
        ptr = appData->unk_238[1 + i];
        if (ptr->unk_00 == 0) {
            appData->unk_254[i].unk_04[0].unk_00 = &appData->unk_238[0]->unk_04[i];
            appData->unk_254[i].unk_04[0].unk_04 = 1;
            appData->unk_254[i].unk_04[0].unk_06 = 0xFF;
            appData->unk_254[i].unk_00 = 1;
        } else {
            for (j = 0; j < ptr->unk_00; ++j) {
                if (!ip && appData->unk_238[0]->unk_04[i].unk_4 >= ptr->unk_04[j].unk_4) {
                    appData->unk_254[i].unk_04[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = 0xFF;
                    ++cnt;
                    appData->unk_254[i].unk_04[cnt].unk_00 = &ptr->unk_04[j];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = j;
                    ip = TRUE;
                } else {
                    appData->unk_254[i].unk_04[cnt].unk_00 = &ptr->unk_04[j];
                    appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                    appData->unk_254[i].unk_04[cnt].unk_06 = j;
                }
                ++cnt;
            }
            if (!ip) {
                appData->unk_254[i].unk_04[cnt].unk_00 = &appData->unk_238[0]->unk_04[i];
                appData->unk_254[i].unk_04[cnt].unk_04 = 1;
                appData->unk_254[i].unk_04[cnt].unk_06 = 0xFF;
            }
            appData->unk_254[i].unk_00 = ptr->unk_00 + 1;
        }
    }
}

void ov121_021E69F0(Overlay121AppData *appData) {
    appData->unk_064 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0421_bin, HEAP_ID_9E);
    appData->unk_068 = MessageFormat_New_Custom(2, 76, HEAP_ID_9E);
    appData->unk_06C = String_New(76, HEAP_ID_9E);
    appData->unk_070 = NewString_ReadMsgData(appData->unk_064, msg_0421_00043);
    appData->unk_074 = NewString_ReadMsgData(appData->unk_064, msg_0421_00042);
    for (int i = 0; i < 7; ++i) {
        appData->unk_078[i] = NewString_ReadMsgData(appData->unk_064, msg_0421_00044 + i);
    }
}

void ov121_021E6A4C(Overlay121AppData *appData) {
    for (int i = 0; i < 7; ++i) {
        String_Delete(appData->unk_078[i]);
    }
    String_Delete(appData->unk_070);
    String_Delete(appData->unk_074);
    String_Delete(appData->unk_06C);
    MessageFormat_Delete(appData->unk_068);
    DestroyMsgData(appData->unk_064);
}

void ov121_021E6A84(Overlay121AppData *appData) {
    int i;
    int sp18;
    int sp14;
    const UnkStruct_ov121_021E7014 *sp10;
    Overlay121Sub254 *sp24_plus_sp20;
    int r0;
    int r5;

    sp24_plus_sp20= &appData->unk_254[appData->unk_260];
    sp10 = &ov121_021E7014[appData->unk_25C][appData->unk_260];

    FillWindowPixelBuffer(&appData->unk_004[1], 0);
    FillWindowPixelBuffer(&appData->unk_004[0], 0);
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
            BufferIntegerAsString(appData->unk_068, 0, sp18, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->unk_068, appData->unk_06C, appData->unk_074);
            AddTextPrinterParameterizedWithColor(&appData->unk_004[0], 0, appData->unk_06C, 0, 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferString(appData->unk_068, 1, sp24_plus_sp20->unk_04[i].unk_00->unk_8, 2, 1, 2);
            StringExpandPlaceholders(appData->unk_068, appData->unk_06C, appData->unk_070);
            AddTextPrinterParameterizedWithColor(&appData->unk_004[1], 0, appData->unk_06C, 0, 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            BufferIntegerAsString(appData->unk_068, 0, r5, sp10->unk_4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->unk_068, appData->unk_06C, appData->unk_078[sp10->unk_6 - 44]);
            AddTextPrinterParameterizedWithColor(&appData->unk_004[1], 0, appData->unk_06C, 160 - FontID_String_GetWidth(0, appData->unk_06C, 0), 16 * sp14, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

            appData->unk_262[sp14] = i;
            r0 = r5;
            if (++sp14 >= 6) {
                break;
            }
        }
    }
    CopyWindowToVram(&appData->unk_004[1]);
    CopyWindowToVram(&appData->unk_004[0]);
    appData->unk_261 = sp14;
    if (appData->unk_231 == 1 && appData->unk_232 >= appData->unk_261) {
        GF_ASSERT(appData->unk_232 != 7);
        appData->unk_232 = appData->unk_261 - 1;
        ov121_021E65D8(appData);
    }
}

void ov121_021E6C5C(Overlay121AppData *appData) {
    FillWindowPixelBuffer(&appData->unk_004[4], 0);
    String *string = NewString_ReadMsgData(appData->unk_064, msg_0421_00040);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[4], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->unk_004[4]);
}

void ov121_021E6CA4(Overlay121AppData *appData) {
    FillWindowPixelBuffer(&appData->unk_004[3], 0);
    String *string = NewString_ReadMsgData(appData->unk_064, msg_0421_00041);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[3], 4, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->unk_004[3]);
}

void ov121_021E6CEC(Overlay121AppData *appData) {
    Overlay121Sub254 *r6;
    u8 r4;
    String *string;

    r4 = appData->unk_262[appData->unk_232];
    r6 = &appData->unk_254[appData->unk_260];
    DrawFrameAndWindow2(&appData->unk_004[5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->unk_004[5], 0xFF);
    BufferString(appData->unk_068, 0, r6->unk_04[r4].unk_00->unk_8, 2, 1, 2);
    string = ReadMsgData_ExpandPlaceholders(appData->unk_068, appData->unk_064, msg_0421_00049, HEAP_ID_9E);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->unk_004[5]);
}

void ov121_021E6D80(Overlay121AppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->unk_004[5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->unk_004[5], 0xFF);
    string = NewString_ReadMsgData(appData->unk_064, msg_0421_00052);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->unk_004[5]);
}

void ov121_021E6DD8(Overlay121AppData *appData) {
    String *string;
    String *string2;
    int msgNo;

    FillWindowPixelBuffer(&appData->unk_004[2], 0);
    msgNo = (appData->unk_25C == 0 ? msg_0421_00053 : msg_0421_00065) + appData->unk_260 * 2;
    string = NewString_ReadMsgData(appData->unk_064, msgNo);
    string2 = NewString_ReadMsgData(appData->unk_064, msgNo + 1);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[2], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[2], 0, string2, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    String_Delete(string2);
    CopyWindowToVram(&appData->unk_004[2]);
}

void ov121_021E6E68(Overlay121AppData *appData) {
    String *string;

    DrawFrameAndWindow2(&appData->unk_004[5], TRUE, 0x1, 12);
    FillWindowPixelBuffer(&appData->unk_004[5], 0xFF);
    string = NewString_ReadMsgData(appData->unk_064, msg_0421_00048);
    AddTextPrinterParameterizedWithColor(&appData->unk_004[5], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
    CopyWindowToVram(&appData->unk_004[5]);
}

void ov121_021E6EC0(Overlay121AppData *appData) {
    YesNoPromptTemplate template;

    appData->unk_258 = &appData->unk_254[appData->unk_260].unk_04[appData->unk_262[appData->unk_232]];
    if (appData->unk_258->unk_06 == 0xFF) {
        appData->unk_233 = 3;
        ov121_021E6D80(appData);
        PlaySE(SEQ_SE_DP_CUSTOM06);
    } else {
        MI_CpuClear8(&template, sizeof(YesNoPromptTemplate));
        template.bgConfig = appData->unk_000;
        template.bgId = GF_BG_LYR_MAIN_0;
        template.tileStart = 0x8F;
        template.plttSlot = 13;
        template.x = 25;
        template.y = 6;
        YesNoPrompt_InitFromTemplate(appData->unk_094, &template);
        ov121_021E6CEC(appData);
        ov121_021E6F58();
        appData->unk_233 = 2;
    }
}

void ov121_021E6F58(void) {
    G2_SetBlendBrightness(
        GX_PLANEMASK_ALL & ~GX_PLANEMASK_BG0,
        -7
    );
}

void ov121_021E6F6C(void) {
    G2_BlendNone();
}

void ov121_021E6F78(Overlay121AppData *appData) {
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
