#include "certificates_app.h"

#include <nitro/os/cache.h>

#include "global.h"

#include "constants/mmodel.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0004.h"

#include "bg_window.h"
#include "follow_mon.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "msgdata.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"
#include "save.h"
#include "system.h"
#include "text.h"
#include "unk_0200FA24.h"
#include "unk_02013FDC.h"
#include "unk_0205BB1C.h"

typedef struct CertificatesApp_Data {
    enum HeapID heapID;
    u32 certificateId;
    SaveData *savedata;
    PlayerProfile *profile;
    Pokemon *frontPokemon;
    BgConfig *bgConfig;
    Window window1;
    Window window2;
    MsgData *msgData;
    MessageFormat *msgFmt;
    s16 unk40;
    u16 waitFrames;
    SpriteSystem *spriteRenderer;
    SpriteManager *spriteGfxHandler;
    ManagedSprite *unk4C[3];
    u32 unk58;
} CertificatesApp_Data; // size: 0x5c

static const WindowTemplate ov78_021E67D8 = {
    .bgId = 0,
    .left = 0,
    .top = 0,
    .width = 32,
    .height = 24,
    .palette = 2,
    .baseTile = 0x0001,
};

static const GraphicsModes ov78_021E67E0 = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const OamCharTransferParam sOamTransferParam = {
    .maxTasks = 0,
    .sizeMain = 0x20000,
    .sizeSub = 0x4000,
    .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
    .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
};

static const SpriteResourceCountsListUnion sSpriteResourceCounts = {
    .numChar = 3,
    .numPltt = 3,
    .numCell = 3,
    .numAnim = 3,
    .numMcel = 0,
    .numManm = 0,
};

static const BgTemplate ov78_021E681C = {
    .x = 0,
    .y = 0,
    .bufferSize = 0,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const OamManagerParam sOamManagerParam = {
    .fromOBJmain = 0,
    .numOBJmain = 128,
    .fromAffineMain = 0,
    .numAffineMain = 32,
    .fromOBJsub = 0,
    .numOBJsub = 128,
    .fromAffineSub = 0,
    .numAffineSub = 32,
};

static const GraphicsBanks ov78_021E6858 = {
    .bg = GX_VRAM_BG_128_B,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_128_A,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_NONE,
    .texpltt = GX_VRAM_TEXPLTT_NONE,
};

static const ManagedSpriteTemplate ov78_021E68B4 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 1,
    .pal = 3,
    .vram = NNS_G2D_VRAM_TYPE_2DBOTH,
    .resIdList = { 2, 2, 2, 2, 0, 0 },
    .bgPriority = 0,
    .vramTransfer = 0,
};

static const ManagedSpriteTemplate ov78_021E6880 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 0,
    .pal = 0xFFFF,
    .vram = NNS_G2D_VRAM_TYPE_2DBOTH,
    .resIdList = {},
    .bgPriority = 0,
    .vramTransfer = 0,
};

static const ManagedSpriteTemplate ov78_021E68E8 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 0,
    .pal = 2,
    .vram = NNS_G2D_VRAM_TYPE_2DBOTH,
    .resIdList = { 1, 1, 1, 1, 0, 0 },
    .bgPriority = 0,
    .vramTransfer = 0,
};

static s16 ov78_021E6920[3][2] = {
    { 128, 16  },
    { 116, 180 },
    { 140, 180 },
};

static void CertificatesApp_OnVBlank(CertificatesApp_Data *data);
static void CertificatesApp_SetupBgConfig(CertificatesApp_Data *data);
static void CertificatesApp_FreeBgConfig(CertificatesApp_Data *data);
static void CertificatesApp_SetupWindowsAndText(CertificatesApp_Data *data);
static void CertificatesApp_FreeWindowsAndText(CertificatesApp_Data *data);
static void ov78_021E5E44(CertificatesApp_Data *data);
static void ov78_021E5E54(CertificatesApp_Data *data);
static void ov78_021E5EA4(CertificatesApp_Data *data);
static void ov78_021E6068(CertificatesApp_Data *data);
static ManagedSprite *ov78_021E61C4(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y, u8 animation, u8 spritePriority);
static ManagedSprite *ov78_021E6214(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y);
static ManagedSprite *ov78_021E6250(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y);
static void CertificatesApp_SetupSpriteRenderer(CertificatesApp_Data *data);
static void CertificatesApp_FreeSpriteRenderer(CertificatesApp_Data *data);
static void ov78_021E636C(CertificatesApp_Data *data);
static void ov78_021E652C(CertificatesApp_Data *data);
static void ov78_021E656C(Sprite *sprite, void *unkBuffer, u32 unkBufferSize, u32 srcOffset);
static void ov78_021E65BC(Sprite *sprite, s32 narcMemberNum, u8 a2, enum HeapID heapID);
static void ov78_021E6664(Sprite *sprite, PlayerProfile *profile, enum HeapID heapID);
static u32 ov78_021E6688(int species, int form, int gender);
static void ov78_021E66D4(Sprite *sprite, Pokemon *pokemon, enum HeapID heapID, u32 a3);

BOOL Certificates_Init(OverlayManager *manager, int *state) {
    Heap_Create(HEAP_ID_3, HEAP_ID_CERTIFICATES, 0x20000);

    CertificatesApp_Data *data = OverlayManager_CreateAndGetData(manager, sizeof(CertificatesApp_Data), HEAP_ID_CERTIFICATES);
    memset(data, 0, sizeof(CertificatesApp_Data));
    CertificatesArgs *args = OverlayManager_GetArgs(manager);

    int slot = Save_GetPartyLeadAlive(args->saveData);

    // kinda late for this, isn't it?
    GF_ASSERT(args != NULL);
    GF_ASSERT(args->saveData != NULL);

    Party *party = SaveArray_Party_Get(args->saveData);

    data->heapID = HEAP_ID_CERTIFICATES;
    data->savedata = args->saveData;
    data->certificateId = args->certificateId;
    data->profile = Save_PlayerData_GetProfile(data->savedata);
    data->frontPokemon = Party_GetMonByIndex(party, slot);

    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);

    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);

    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(GX_PLANEMASK_NONE);
    GXS_SetVisiblePlane(GX_PLANEMASK_NONE);

    SetKeyRepeatTimers(4, 8);

    CertificatesApp_SetupBgConfig(data);
    CertificatesApp_SetupWindowsAndText(data);
    Main_SetVBlankIntrCB((GFIntrCB)CertificatesApp_OnVBlank, data);

    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        CertificatesApp_SetupSpriteRenderer(data);
        ov78_021E636C(data);
    }

    GfGfx_BothDispOn();

    return TRUE;
}

BOOL Certificates_Main(OverlayManager *manager, int *state) {
    CertificatesApp_Data *data = OverlayManager_GetData(manager);
    BOOL ret = FALSE;

    switch (*state) {
    case CERTIFICATES_EXECSTATE_SETUP:
        ov78_021E5E44(data);
        ov78_021E5EA4(data);
        ov78_021E6068(data);

        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);

        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapID);

        *state = CERTIFICATES_EXECSTATE_FADE_IN;
        break;
    case CERTIFICATES_EXECSTATE_FADE_IN:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }

        data->waitFrames = 0;
        *state = CERTIFICATES_EXECSTATE_WAIT_ONE_SECOND;
        break;
    case CERTIFICATES_EXECSTATE_WAIT_ONE_SECOND:
        if (data->waitFrames < 60) {
            data->waitFrames++;
        } else {
            *state = CERTIFICATES_EXECSTATE_MOVE_TO_BOTTOM_SCREEN;
        }
        break;
    case CERTIFICATES_EXECSTATE_MOVE_TO_BOTTOM_SCREEN:
        if (data->unk40 > -192) {
            data->unk40 -= 4;
            ov78_021E5E54(data);
        } else {
            data->unk40 = -192;
            ov78_021E5E54(data);
            *state = CERTIFICATES_EXECSTATE_WAIT_FOR_INPUT;
        }
        break;
    case CERTIFICATES_EXECSTATE_WAIT_FOR_INPUT:
        if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_B) == PAD_BUTTON_B || gSystem.touchNew != 0) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = CERTIFICATES_EXECSTATE_FADE_OUT;
        }
        break;
    case CERTIFICATES_EXECSTATE_FADE_OUT:
        if (IsPaletteFadeFinished() == TRUE) {
            ret = TRUE;
        }
        break;
    }

    return ret;
}

BOOL Certificates_Exit(OverlayManager *manager, int *state) {
    CertificatesApp_Data *data = OverlayManager_GetData(manager);
    enum HeapID heapID = data->heapID;

    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        CertificatesApp_FreeSpriteRenderer(data);
    }

    CertificatesApp_FreeWindowsAndText(data);
    CertificatesApp_FreeBgConfig(data);

    Main_SetVBlankIntrCB(NULL, NULL);

    OverlayManager_FreeData(manager);

    Heap_Destroy(heapID);

    return TRUE;
}

static void CertificatesApp_OnVBlank(CertificatesApp_Data *data) {
    GF_ASSERT(data != NULL);
    GF_ASSERT(data->bgConfig != NULL);

    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        GF_ASSERT(data->spriteGfxHandler != NULL);
        SpriteSystem_DrawSprites(data->spriteGfxHandler);

        SpriteSystem_TransferOam();
    }

    DoScheduledBgGpuUpdates(data->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

static void CertificatesApp_SetupBgConfig(CertificatesApp_Data *data) {
    GraphicsBanks banks = ov78_021E6858;
    GfGfx_SetBanks(&banks);

    data->bgConfig = BgConfig_Alloc(data->heapID);

    GraphicsModes modes = ov78_021E67E0;
    SetBothScreensModesAndDisable(&modes);

    BgTemplate template = ov78_021E681C;

    template.screenBase = GX_BG_SCRBASE_0x0000;
    template.charBase = GX_BG_CHARBASE_0x10000;
    template.bufferSize = 0x1000;
    template.size = GX_BG_SCRSIZE_TEXT_256x512;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);

    template.screenBase = GX_BG_SCRBASE_0x1000;
    template.charBase = GX_BG_CHARBASE_0x08000;
    template.bufferSize = 0x1000;
    template.size = GX_BG_SCRSIZE_TEXT_256x512;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);

    template.screenBase = GX_BG_SCRBASE_0x2000;
    template.charBase = GX_BG_CHARBASE_0x04000;
    template.bufferSize = 0x800;
    template.size = 1;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_3);

    template.screenBase = GX_BG_SCRBASE_0x0000;
    template.charBase = GX_BG_CHARBASE_0x10000;
    template.bufferSize = 0x1000;
    template.size = GX_BG_SCRSIZE_TEXT_256x512;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_0, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);

    template.screenBase = GX_BG_SCRBASE_0x1000;
    template.charBase = GX_BG_CHARBASE_0x08000;
    template.bufferSize = 0x1000;
    template.size = GX_BG_SCRSIZE_TEXT_256x512;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);

    template.screenBase = GX_BG_SCRBASE_0x2000;
    template.charBase = GX_BG_CHARBASE_0x04000;
    template.bufferSize = 0x800;
    template.size = GX_BG_SCRSIZE_TEXT_512x256;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &template, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_3);

    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
}

static void CertificatesApp_FreeBgConfig(CertificatesApp_Data *data) {
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);

    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);

    Heap_Free(data->bgConfig);
}

static void CertificatesApp_SetupWindowsAndText(CertificatesApp_Data *data) {
    WindowTemplate template = ov78_021E67D8;

    ResetAllTextPrinters();

    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0004_bin, data->heapID);
    data->msgFmt = MessageFormat_New(data->heapID);

    template.bgId = GF_BG_LYR_MAIN_0;
    AddWindow(data->bgConfig, &data->window1, &template);
    FillWindowPixelRect(&data->window1, 0x00, 0, 0, GX_LCD_SIZE_X, GX_LCD_SIZE_Y);

    template.bgId = GF_BG_LYR_SUB_0;
    AddWindow(data->bgConfig, &data->window2, &template);
    FillWindowPixelRect(&data->window2, 0x00, 0, 0, GX_LCD_SIZE_X, GX_LCD_SIZE_Y);
}

static void CertificatesApp_FreeWindowsAndText(CertificatesApp_Data *data) {
    RemoveWindow(&data->window2);
    RemoveWindow(&data->window1);

    MessageFormat_Delete(data->msgFmt);
    DestroyMsgData(data->msgData);
}

void ov78_021E5E44(CertificatesApp_Data *data) {
    data->unk40 = 0;
    ov78_021E5E54(data);
}

static void ov78_021E5E54(CertificatesApp_Data *data) {
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, data->unk40);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, data->unk40 + GX_LCD_SIZE_Y);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, data->unk40);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_Y, data->unk40 + GX_LCD_SIZE_Y);

    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        ov78_021E652C(data);
    }
}

static void ov78_021E5EA4(CertificatesApp_Data *data) {
    u32 nscrFileNum;
    u32 ncgrFileNum;
    u32 nclrFileNum;
    u32 nscrFileNum2;
    u32 ncgrFileNum2;
    u32 nclrFileNum2;

    if (data->certificateId == CERTIFICATE_JOHTO_DEX) {
        nscrFileNum = 15;
        ncgrFileNum = 3;
        nclrFileNum = 9;
        nscrFileNum2 = 12;
        ncgrFileNum2 = 0;
        nclrFileNum2 = 6;
    } else if (data->certificateId == CERTIFICATE_NATIONAL_DEX) {
        nscrFileNum = 16;
        ncgrFileNum = 4;
        nclrFileNum = 10;
        nscrFileNum2 = 13;
        ncgrFileNum2 = 1;
        nclrFileNum2 = 7;
    } else { // CERTIFICATE_SHINY_LEAVES
        nscrFileNum = 17;
        ncgrFileNum = 5;
        nclrFileNum = 11;
        nscrFileNum2 = 14;
        ncgrFileNum2 = 2;
        nclrFileNum2 = 8;
    }

    GfGfxLoader_LoadScrnData(NARC_a_1_2_6, nscrFileNum, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapID);
    GfGfxLoader_LoadCharData(NARC_a_1_2_6, ncgrFileNum, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapID);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_6, nclrFileNum, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x20, data->heapID);
    GfGfxLoader_LoadScrnData(NARC_a_1_2_6, nscrFileNum, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapID);
    GfGfxLoader_LoadCharData(NARC_a_1_2_6, ncgrFileNum, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapID);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_6, nclrFileNum, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0x20, data->heapID);
    GfGfxLoader_LoadScrnData(NARC_a_1_2_6, nscrFileNum2, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapID);
    BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 32, 24, 1);
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_MAIN_1);

    GfGfxLoader_LoadCharData(NARC_a_1_2_6, ncgrFileNum2, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapID);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_6, nclrFileNum2, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, 0x20, data->heapID);
    GfGfxLoader_LoadScrnData(NARC_a_1_2_6, nscrFileNum2, data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapID);
    BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, 32, 24, 1);
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_1);

    GfGfxLoader_LoadCharData(NARC_a_1_2_6, ncgrFileNum2, data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapID);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_6, nclrFileNum2, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_1_OFFSET, 0x20, data->heapID);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, data->heapID);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, data->heapID);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_2_OFFSET, data->heapID);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_2_OFFSET, data->heapID);
}

static void ov78_021E6068(CertificatesApp_Data *data) {
    String *string = String_New(512, data->heapID);

    u32 x1, x2, y1, y2;
    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        x1 = 0;
        y1 = 36;
        x2 = 0;
        y2 = 56;
    } else {
        x1 = 48;
        y1 = 32;
        x2 = 64;
        y2 = 64;
    }

    String *tempString = String_New(512, data->heapID);

    if (data->certificateId == CERTIFICATE_SHINY_LEAVES) {
        GF_ASSERT(data->frontPokemon != NULL);
        BoxPokemon *boxMon = Mon_GetBoxMon(data->frontPokemon);
        ReadMsgDataIntoString(data->msgData, msg_0004_00004, tempString);
        BufferBoxMonNickname(data->msgFmt, 1, boxMon);
    } else {
        ReadMsgDataIntoString(data->msgData, msg_0004_00000, tempString);
    }

    BufferPlayersName(data->msgFmt, 0, data->profile);
    StringExpandPlaceholders(data->msgFmt, string, tempString);
    AddTextPrinterParameterizedWithColor(&data->window1, 0, string, x1, y1, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&data->window2, 0, string, x1, y1, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(tempString);

    u32 msgNum;
    if (data->certificateId == CERTIFICATE_JOHTO_DEX) {
        msgNum = msg_0004_00001;
    } else if (data->certificateId == CERTIFICATE_NATIONAL_DEX) {
        msgNum = msg_0004_00002;
    } else {
        msgNum = msg_0004_00005;
    }
    ReadMsgDataIntoString(data->msgData, msgNum, string);
    AddTextPrinterParameterizedWithColor(&data->window1, 0, string, x2, y2, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(&data->window2, 0, string, x2, y2, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    if (data->certificateId != CERTIFICATE_SHINY_LEAVES) {
        ReadMsgDataIntoString(data->msgData, msg_0004_00003, string);
        AddTextPrinterParameterizedWithColor(&data->window1, 0, string, 138, 144, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        AddTextPrinterParameterizedWithColor(&data->window2, 0, string, 138, 144, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    }

    String_Delete(string);
}

static ManagedSprite *ov78_021E61C4(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y, u8 animation, u8 spritePriority) {
    ManagedSpriteTemplate template = ov78_021E6880;
    template.x = x;
    template.y = y;
    template.drawPriority = spritePriority;
    template.animation = animation;

    ManagedSprite *unk = SpriteSystem_NewSpriteWithYOffset(renderer, gfxHandler, &template, FX32_CONST(GX_LCD_SIZE_Y));
    ManagedSprite_SetAnimateFlag(unk, FALSE);
    return unk;
}

static ManagedSprite *ov78_021E6214(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y) {
    ManagedSpriteTemplate template = ov78_021E68B4;
    template.x = x;
    template.y = y;

    return SpriteSystem_NewSpriteWithYOffset(renderer, gfxHandler, &template, FX32_CONST(GX_LCD_SIZE_Y));
}

static ManagedSprite *ov78_021E6250(SpriteSystem *renderer, SpriteManager *gfxHandler, s16 x, s16 y) {
    ManagedSpriteTemplate template = ov78_021E68E8;
    template.x = x;
    template.y = y;

    return SpriteSystem_NewSpriteWithYOffset(renderer, gfxHandler, &template, FX32_CONST(GX_LCD_SIZE_Y));
}

static void CertificatesApp_SetupSpriteRenderer(CertificatesApp_Data *data) {
    data->spriteRenderer = SpriteSystem_Alloc(data->heapID);
    data->spriteGfxHandler = SpriteManager_New(data->spriteRenderer);

    OamManagerParam oamManagerParam = sOamManagerParam;
    OamCharTransferParam oamTransferParam = sOamTransferParam;
    oamTransferParam.maxTasks = 0x20;
    SpriteSystem_Init(data->spriteRenderer, &oamManagerParam, &oamTransferParam, 0x20);
    SpriteSystem_InitSprites(data->spriteRenderer, data->spriteGfxHandler, 0x20);

    SpriteResourceCountsListUnion counts = sSpriteResourceCounts;
    SpriteSystem_InitManagerWithCapacities(data->spriteRenderer, data->spriteGfxHandler, &counts);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(data->spriteRenderer), FX32_CONST(0), FX32_CONST(GX_LCD_SIZE_Y));

    u8 tp_param_data[4];
    ReadWholeNarcMemberByIdPair(tp_param_data, NARC_fielddata_tsurepoke_tp_param, SpeciesToOverworldModelIndexOffset(GetMonData(data->frontPokemon, MON_DATA_SPECIES, NULL)));
    data->unk58 = tp_param_data[1];
}

static void CertificatesApp_FreeSpriteRenderer(CertificatesApp_Data *data) {
    SpriteSystem *renderer = data->spriteRenderer;
    SpriteManager *gfxHandler = data->spriteGfxHandler;

    for (int i = 0; i < (int)NELEMS(data->unk4C); i++) {
        GF_ASSERT(data->unk4C[i] != NULL);
        Sprite_DeleteAndFreeResources(data->unk4C[i]);
    }

    SpriteSystem_FreeResourcesAndManager(renderer, gfxHandler);
    SpriteSystem_Free(renderer);
}

static void ov78_021E636C(CertificatesApp_Data *data) {
    SpriteSystem *renderer = data->spriteRenderer;
    SpriteManager *gfxHandler = data->spriteGfxHandler;

    {
        NARC *narc = NARC_New(NARC_a_1_6_2, data->heapID);

        SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, narc, 65, FALSE, 2, NNS_G2D_VRAM_TYPE_2DBOTH, 0);
        SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, 66, FALSE, NNS_G2D_VRAM_TYPE_2DBOTH, 0);
        SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, 67, FALSE, 0);
        SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, 68, FALSE, 0);

        NARC_Delete(narc);
    }

    {
        NARC *narc = NARC_New(NARC_a_1_2_6, data->heapID);

        SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, narc, 18, FALSE, 1, NNS_G2D_VRAM_TYPE_2DBOTH, 1);
        SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, 19, FALSE, NNS_G2D_VRAM_TYPE_2DBOTH, 1);
        SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, 20, FALSE, 1);
        SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, 21, FALSE, 1);

        SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, narc, 18, FALSE, 1, NNS_G2D_VRAM_TYPE_2DBOTH, 2);
        SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, 19 + (data->unk58 * 3), FALSE, NNS_G2D_VRAM_TYPE_2DBOTH, 2);
        SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, 20 + (data->unk58 * 3), FALSE, 2);
        SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, 21 + (data->unk58 * 3), FALSE, 2);

        NARC_Delete(narc);
    }

    data->unk4C[0] = ov78_021E61C4(data->spriteRenderer, data->spriteGfxHandler, ov78_021E6920[0][0], ov78_021E6920[1][1], 7, 0);
    data->unk4C[1] = ov78_021E6250(data->spriteRenderer, data->spriteGfxHandler, ov78_021E6920[1][0], ov78_021E6920[1][1]);
    data->unk4C[2] = ov78_021E6214(data->spriteRenderer, data->spriteGfxHandler, ov78_021E6920[2][0], ov78_021E6920[2][1]);

    ManagedSprite_SetDrawFlag(data->unk4C[0], FALSE);
    ov78_021E6664(data->unk4C[1]->sprite, data->profile, data->heapID);
    ov78_021E66D4(data->unk4C[2]->sprite, data->frontPokemon, data->heapID, data->unk58);

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void ov78_021E652C(CertificatesApp_Data *data) {
    for (int i = 0; i < (int)NELEMS(data->unk4C); i++) {
        GF_ASSERT(data->unk4C[i] != NULL);
        ManagedSprite_SetPositionXYWithSubscreenOffset(data->unk4C[i], ov78_021E6920[i][0], ov78_021E6920[i][1] - data->unk40, FX32_CONST(GX_LCD_SIZE_Y));
    }
}

static void ov78_021E656C(Sprite *sprite, void *unkBuffer, u32 unkBufferSize, u32 srcOffset) {
    GF_ASSERT(Sprite_GetVramType(sprite) == NNS_G2D_VRAM_TYPE_2DBOTH);

    DC_FlushRange(unkBuffer, unkBufferSize);

    NNSG2dImageProxy *proxy = Sprite_GetImageProxy(sprite);
    GX_LoadOBJ(unkBuffer, (u32)((void *)NNS_G2dGetImageLocation(proxy, NNS_G2D_VRAM_TYPE_2DMAIN) + srcOffset), unkBufferSize);
    GXS_LoadOBJ(unkBuffer, (u32)((void *)NNS_G2dGetImageLocation(proxy, NNS_G2D_VRAM_TYPE_2DSUB) + srcOffset), unkBufferSize);
}

void ov78_021E65BC(Sprite *sprite, s32 narcMemberNum, u8 a2, enum HeapID heapID) {
    thunk_Sprite_SetDrawFlag(sprite, FALSE);

    NARC *narc = NARC_New(NARC_data_mmodel_mmodel, heapID);
    NNSG3dResFileHeader *header = NARC_AllocAndReadWholeMember(narc, narcMemberNum, heapID);
    NNSG3dResTex *tex = NNS_G3dGetTex(header);

    const void *address = NNS_G3dGetTexData(tex);
    void *buffer = Heap_AllocAtEnd(heapID, 0x200);
    sub_020145B4(address + (a2 * 0x200), 4, 0, 0, 4, 4, buffer);
    ov78_021E656C(sprite, buffer, 0x200, 0);
    Heap_Free(buffer);

    Sprite_GetVramType(sprite);
    address = NNS_G3dGetPlttData(tex);
    DC_FlushRange(address, 0x20);
    Sprite_GetPaletteProxy(sprite);
    GX_LoadOBJPltt(address, 0x40, 0x20);
    GXS_LoadOBJPltt(address, 0x40, 0x20);

    Heap_Free(header);
    NARC_Delete(narc);

    thunk_Sprite_SetDrawFlag(sprite, TRUE);
}

static void ov78_021E6664(Sprite *sprite, PlayerProfile *profile, enum HeapID heapID) {
    u32 narcMemberNum = (PlayerProfile_GetTrainerGender(profile) == PLAYER_GENDER_MALE) ? MMODEL_HERO : MMODEL_HEROINE;
    ov78_021E65BC(sprite, narcMemberNum, 21, heapID);
}

static u32 ov78_021E6688(int species, int form, int gender) {
    u32 ret;
    if (species <= SPECIES_NONE || species > MAX_SPECIES) {
        ret = 1;
    } else {
        ret = MMODEL_FOLLOWER_MON_BASE + SpeciesToOverworldModelIndexOffset(species);
        if (OverworldModelLookupHasFemaleForm(species)) {
            if (gender == MON_FEMALE) {
                ret++;
            }
        } else {
            if (form > OverworldModelLookupFormCount(species)) {
                form = 0;
            }
            ret += form;
        }
    }
    return ret;
}

static void ov78_021E66D4(Sprite *sprite, Pokemon *pokemon, enum HeapID heapID, u32 a3) {
    u32 species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    u32 form = GetMonData(pokemon, MON_DATA_FORM, NULL);
    u32 gender = GetMonGender(pokemon);
    BOOL shiny = MonIsShiny(pokemon);

    u32 bufferSize, unk;
    if (a3 != 0) {
        bufferSize = 0x800;
        unk = 8;
    } else {
        bufferSize = 0x200;
        unk = 4;
    }

    NARC *narc = NARC_New(NARC_data_mmodel_mmodel, heapID);

    if (sub_02070438(species, form) == 0) {
        form = 0;
    }

    u32 member = ov78_021E6688(species, (u16)form, gender);
    NNSG3dResFileHeader *header = NARC_AllocAndReadWholeMember(narc, member, heapID);
    NNSG3dResTex *tex = NNS_G3dGetTex(header);
    void *address = (void *)tex + tex->texInfo.ofsTex;
    void *buffer = Heap_AllocAtEnd(heapID, bufferSize);
    sub_020145B4(address + (bufferSize * 2), unk, 0, 0, unk, unk, buffer);
    ov78_021E656C(sprite, buffer, bufferSize, 0);
    Heap_Free(buffer);
    Sprite_GetVramType(sprite);
    void *pointer = (void *)tex + tex->plttInfo.ofsPlttData;
    if (shiny) {
        pointer += 0x20;
    }

    DC_FlushRange(pointer, 0x20);
    Sprite_GetPaletteProxy(sprite);
    GX_LoadOBJPltt(pointer, 0x60, 0x20);
    GXS_LoadOBJPltt(pointer, 0x60, 0x20);

    Heap_Free(header);
    NARC_Delete(narc);

    thunk_Sprite_SetDrawFlag(sprite, TRUE);
}
