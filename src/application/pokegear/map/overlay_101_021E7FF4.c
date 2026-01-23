#include "global.h"

#include "application/pokegear/map/pgmap_gra.naix"
#include "application/pokegear/map/pokegear_map_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0273.h"

#include "gf_gfx_loader.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02013534.h"
#include "unk_0208805C.h"

static void PokegearMap_InitBGs(PokegearMapAppData *mapApp);
static void PokegearMap_UnloadBGs(PokegearMapAppData *mapApp);
static void PokegearMap_LoadGraphics(PokegearMapAppData *mapApp, u8 frame);
static void PokegearMap_UnloadGraphics(PokegearMapAppData *mapApp);
static void PokegearMap_InitWindows(PokegearMapAppData *mapApp);
static void PokegearMap_RemoveWindows(PokegearMapAppData *mapApp);
static void PokegearMap_InitMsg(PokegearMapAppData *mapApp);
static void PokegearMap_DeleteMsg(PokegearMapAppData *mapApp);
static void PokegearMap_InitUIButtons(PokegearMapAppData *mapApp);
static void PokegearMap_RemoveUIButtons(PokegearMapAppData *mapApp);
static void PokegearMap_LoadPalettes(PokegearMapAppData *mapApp, u8 frame);
static void PokegearMap_CreateObjectsManager(PokegearMapAppData *mapApp);
static void PokegearMap_DestroyObjectsManager(PokegearMapAppData *mapApp);
static void PokegearMap_CreatePersistentSprites(PokegearMapAppData *mapApp);
static void PokegearMap_LoadMapHasMarkingsIndicatorSprites(PokegearMapAppData *mapApp);
static void PokegearMap_CreateMarkingsECWordTextOBJs(PokegearMapAppData *mapApp);
static void PokegearMap_DestroyMarkingsECWordTextOBJs(PokegearMapAppData *mapApp);
static void PokegearMap_CreateAuxSprites_MarkingsMode(PokegearMapAppData *mapApp);
static void PokegearMap_RemoveAuxSprites_MarkingsMode(PokegearMapAppData *mapApp);
static void PokegearMap_LoadSprites(PokegearMapAppData *mapApp);
static void PokegearMap_RemoveAuxSprites_MapMode(PokegearMapAppData *mapApp);
static void PokegearMap_RemoveAllSprites(PokegearMapAppData *mapApp);
static void PokegearMap_SetBgParam_MapMode(PokegearMapAppData *mapApp);
static void PokegearMap_SetBgParam_MarkingsMode(PokegearMapAppData *mapApp);
static void ov101_021E9264(PokegearMapAppData *mapApp, BOOL a1);

BOOL PokegearMap_LoadGFX(PokegearMapAppData *mapApp) {
    switch (mapApp->substate) {
    case 0:
        PokegearMap_InitBGs(mapApp);
        break;
    case 1:
        PokegearMap_LoadGraphics(mapApp, mapApp->pokegear->skin);
        PokegearMap_InitWindows(mapApp);
        PokegearMap_InitMsg(mapApp);
        break;
    case 2:
        PokegearMap_CreateObjectsManager(mapApp);
        PokegearMap_LoadPalettes(mapApp, mapApp->pokegear->skin);
        PokegearMap_LoadSprites(mapApp);
        break;
    case 3:
        if (mapApp->inMarkingsMode == TRUE) {
            PokegearMap_SetBgParam_MarkingsMode(mapApp);
        } else {
            PokegearMap_SetBgParam_MapMode(mapApp);
        }
        mapApp->pokegear->vblankCB = PokegearMap_VBlankCB;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL PokegearMap_UnloadGFX(PokegearMapAppData *mapApp) {
    mapApp->pokegear->vblankCB = NULL;
    if (mapApp->pokegear->appReturnCode == GEAR_RETURN_CANCEL) {
        PokegearMap_RemoveUIButtons(mapApp);
        PokegearMap_RemoveAuxSprites_MarkingsMode(mapApp);
    }
    PokegearMap_RemoveAllSprites(mapApp);
    PokegearMap_DestroyObjectsManager(mapApp);
    PokegearMap_DeleteMsg(mapApp);
    PokegearMap_RemoveWindows(mapApp);
    PokegearMap_UnloadGraphics(mapApp);
    PokegearMap_UnloadBGs(mapApp);
    return TRUE;
}

BOOL PokegearMap_AnimateSwitchToMarkingMode(PokegearMapAppData *mapApp) {
    BOOL plttFadeFinished;
    BOOL bgScrollFinished;

    switch (mapApp->substate) {
    case 0:
        PokegearMap_SaveState(mapApp);
        PokegearMap_BeginScrollMarkingsPanelTopScreen(mapApp, 1);
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapID);
        break;
    case 1:
        plttFadeFinished = IsPaletteFadeFinished();
        bgScrollFinished = PokegearMap_RunScrollMarkingsPanelTopScreen(mapApp, 1);
        if (!plttFadeFinished || !bgScrollFinished) {
            return FALSE;
        }
        PokegearMap_RemoveAuxSprites_MapMode(mapApp);
        break;
    case 2:
        ov101_021E9264(mapApp, TRUE);
        PokegearMap_SetBgParam_MarkingsMode(mapApp);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapID);
        PokegearMap_BeginScrollMarkingsPanelBottomScreen(mapApp, 0);
        break;
    case 3:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 4:
        if (!PokegearMap_RunScrollMarkingsPanelBottomScreen(mapApp, 0)) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL PokegearMap_AnimateSwitchFromMarkingMode(PokegearMapAppData *mapApp) {
    BOOL plttFadeFinished;
    BOOL bgScrollFinished;

    switch (mapApp->substate) {
    case 0:
        PokegearMap_BeginScrollMarkingsPanelBottomScreen(mapApp, 1);
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 1:
        if (!PokegearMap_RunScrollMarkingsPanelBottomScreen(mapApp, 1)) {
            return FALSE;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapID);
        break;
    case 2:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PokegearMap_RemoveUIButtons(mapApp);
        PokegearMap_RemoveAuxSprites_MarkingsMode(mapApp);
        break;
    case 3:
        ov101_021E9264(mapApp, FALSE);
        PokegearMap_SetBgParam_MapMode(mapApp);
        PokegearMap_BeginScrollMarkingsPanelTopScreen(mapApp, 0);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapID);
        break;
    case 4:
        plttFadeFinished = IsPaletteFadeFinished();
        bgScrollFinished = PokegearMap_RunScrollMarkingsPanelTopScreen(mapApp, 0);
        if (!plttFadeFinished || !bgScrollFinished) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

static void PokegearMap_InitBGs(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    {
        BgTemplate bgTemplates[6] = {
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xd000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xb000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 0,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0,
             .mosaic = 0,
             },
        };

        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x40, 0, mapApp->heapID);
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, mapApp->heapID);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
    }
}

static void PokegearMap_UnloadBGs(PokegearMapAppData *mapApp) {
    Pokegear_ClearAppBgLayers(mapApp->pokegear);
    G2_SetBlendAlpha(0, 0, 0, 0);
}

static void PokegearMap_LoadGraphics(PokegearMapAppData *mapApp, u8 frame) {
    NARC *narc = NARC_New(NARC_application_pokegear_map_pgmap_gra, mapApp->heapID);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapID, narc, NARC_application_pokegear_map_pgmap_gra, frame + NARC_pgmap_gra_pgmap_gra_00000026_NCGR, GF_BG_LYR_MAIN_1, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapID, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000010_NCGR, GF_BG_LYR_MAIN_2, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapID, narc, NARC_application_pokegear_map_pgmap_gra, frame + NARC_pgmap_gra_pgmap_gra_00000050_NCGR, GF_BG_LYR_SUB_2, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapID, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000012_NCGR, GF_BG_LYR_SUB_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, frame + NARC_pgmap_gra_pgmap_gra_00000056_NSCR, FALSE, &mapApp->unk_16C, mapApp->heapID);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000011_NSCR, FALSE, &mapApp->unk_170, mapApp->heapID);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000013_NSCR, FALSE, &mapApp->unk_174, mapApp->heapID);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, frame + NARC_pgmap_gra_pgmap_gra_00000032_NSCR, FALSE, &mapApp->unk_178, mapApp->heapID);
    mapApp->unk_154[4] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, frame + NARC_pgmap_gra_pgmap_gra_00000038_NSCR, FALSE, &mapApp->unk_17C, mapApp->heapID);
    mapApp->unk_154[5] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, frame + NARC_pgmap_gra_pgmap_gra_00000044_NSCR, FALSE, &mapApp->unk_180, mapApp->heapID);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

static void PokegearMap_UnloadGraphics(PokegearMapAppData *mapApp) {
    Heap_Free(mapApp->unk_154[5]);
    Heap_Free(mapApp->unk_154[4]);
    Heap_Free(mapApp->unk_154[3]);
    Heap_Free(mapApp->unk_154[2]);
    Heap_Free(mapApp->unk_154[1]);
    Heap_Free(mapApp->unk_154[0]);
}

static void PokegearMap_InitWindows(PokegearMapAppData *mapApp) {
    int i;

    static const WindowTemplate sWindowTemplates[] = {
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x01,
         .top = 0x08,
         .width = 0x05,
         .height = 0x03,
         .palette = 0x01,
         .baseTile = 0x03F0,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x03,
         .top = 0x0C,
         .width = 0x0C,
         .height = 0x02,
         .palette = 0x01,
         .baseTile = 0x03D8,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x01,
         .top = 0x0E,
         .width = 0x1C,
         .height = 0x04,
         .palette = 0x01,
         .baseTile = 0x0368,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x05,
         .top = 0x12,
         .width = 0x0B,
         .height = 0x05,
         .palette = 0x01,
         .baseTile = 0x0331,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x12,
         .top = 0x12,
         .width = 0x0B,
         .height = 0x05,
         .palette = 0x01,
         .baseTile = 0x02FA,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x05,
         .top = 0x14,
         .width = 0x0B,
         .height = 0x02,
         .palette = 0x01,
         .baseTile = 0x02E4,
         },
        {
         .bgId = GF_BG_LYR_SUB_1,
         .left = 0x12,
         .top = 0x16,
         .width = 0x0B,
         .height = 0x02,
         .palette = 0x01,
         .baseTile = 0x02CE,
         },
        {
         .bgId = GF_BG_LYR_MAIN_1,
         .left = 0x03,
         .top = 0x00,
         .width = 0x0C,
         .height = 0x03,
         .palette = 0x0A,
         .baseTile = 0x03DB,
         },
    };

    for (i = 0; i <= 7; ++i) {
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->windows[i], sWindowTemplates[i].bgId, sWindowTemplates[i].left, sWindowTemplates[i].top, sWindowTemplates[i].width, sWindowTemplates[i].height, sWindowTemplates[i].palette, sWindowTemplates[i].baseTile);
        FillWindowPixelBuffer(&mapApp->windows[i], 0);
    }
    InitWindow(&mapApp->windows[8]);
    AddTextWindowTopLeftCorner(mapApp->pokegear->bgConfig, &mapApp->windows[8], 11, 2, 0x3C5, 0);
    FillWindowPixelBufferText_AssumeTileSize32(&mapApp->windows[8], 0);
}

static void PokegearMap_RemoveWindows(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 8; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->windows[i]);
        RemoveWindow(&mapApp->windows[i]);
    }
    RemoveWindow(&mapApp->windows[8]);
}

static void PokegearMap_InitMsg(PokegearMapAppData *mapApp) {
    mapApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0273_bin, mapApp->heapID);
    mapApp->msgFormat = MessageFormat_New_Custom(2, 91, mapApp->heapID);
    mapApp->flavorTextString = String_New(91, mapApp->heapID);
    mapApp->regionNameStrings[0] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00001);
    mapApp->regionNameStrings[1] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00000);
    mapApp->mapNameString = String_New(40, mapApp->heapID);
    mapApp->formatFlavorTextString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00003);
    mapApp->unk_0B8 = 2;
}

static void PokegearMap_DeleteMsg(PokegearMapAppData *mapApp) {
    String_Delete(mapApp->formatFlavorTextString);
    String_Delete(mapApp->mapNameString);
    String_Delete(mapApp->regionNameStrings[1]);
    String_Delete(mapApp->regionNameStrings[0]);
    String_Delete(mapApp->flavorTextString);
    MessageFormat_Delete(mapApp->msgFormat);
    DestroyMsgData(mapApp->msgData);
}

static void PokegearMap_InitUIButtons(PokegearMapAppData *mapApp) {
    PokegearManagedObject *objects = mapApp->objManager->objects;

    static const PokegearCursorGrid buttonSpecsMarkingsMenu[9] = {
        {
         .appId = 0,
         .buttonLeft = 0x03,
         .buttonRight = 0x01,
         .buttonUp = 0x04,
         .buttonDown = 0x04,
         .x = 0x20,
         .y = 0x20,
         .leftOffset = 0xFA,
         .rightOffset = 0x06,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 1,
         .buttonLeft = 0x00,
         .buttonRight = 0x02,
         .buttonUp = 0x05,
         .buttonDown = 0x05,
         .x = 0x28,
         .y = 0x1F,
         .leftOffset = 0x06,
         .rightOffset = 0x50,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 2,
         .buttonLeft = 0x01,
         .buttonRight = 0x03,
         .buttonUp = 0x06,
         .buttonDown = 0x06,
         .x = 0x88,
         .y = 0x20,
         .leftOffset = 0xFA,
         .rightOffset = 0x06,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 3,
         .buttonLeft = 0x02,
         .buttonRight = 0x00,
         .buttonUp = 0x08,
         .buttonDown = 0x07,
         .x = 0x90,
         .y = 0x1F,
         .leftOffset = 0x06,
         .rightOffset = 0x50,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 4,
         .buttonLeft = 0x07,
         .buttonRight = 0x05,
         .buttonUp = 0x00,
         .buttonDown = 0x00,
         .x = 0x20,
         .y = 0x35,
         .leftOffset = 0xFA,
         .rightOffset = 0x06,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 5,
         .buttonLeft = 0x04,
         .buttonRight = 0x06,
         .buttonUp = 0x01,
         .buttonDown = 0x01,
         .x = 0x28,
         .y = 0x34,
         .leftOffset = 0x06,
         .rightOffset = 0x50,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 6,
         .buttonLeft = 0x05,
         .buttonRight = 0x07,
         .buttonUp = 0x02,
         .buttonDown = 0x02,
         .x = 0x88,
         .y = 0x35,
         .leftOffset = 0xFA,
         .rightOffset = 0x06,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 7,
         .buttonLeft = 0x06,
         .buttonRight = 0x04,
         .buttonUp = 0x03,
         .buttonDown = 0x08,
         .x = 0x90,
         .y = 0x34,
         .leftOffset = 0x06,
         .rightOffset = 0x50,
         .topOffset = 0xFA,
         .bottomOffset = 0x06,
         },
        {
         .appId = 8,
         .buttonLeft = 0xFF,
         .buttonRight = 0xFF,
         .buttonUp = 0x07,
         .buttonDown = 0x03,
         .x = 0xD0,
         .y = 0x54,
         .leftOffset = 0xF0,
         .rightOffset = 0x10,
         .topOffset = 0xF7,
         .bottomOffset = 0x03,
         },
    };

    static const PokegearCursorGrid buttonSpecsSelectIcon[8] = {
        {
         .appId = 0,
         .buttonLeft = 0x07,
         .buttonRight = 0x01,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x28,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 1,
         .buttonLeft = 0x00,
         .buttonRight = 0x02,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x40,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 2,
         .buttonLeft = 0x01,
         .buttonRight = 0x03,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x58,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 3,
         .buttonLeft = 0x02,
         .buttonRight = 0x04,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x70,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 4,
         .buttonLeft = 0x03,
         .buttonRight = 0x05,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x88,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 5,
         .buttonLeft = 0x04,
         .buttonRight = 0x06,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0xA0,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 6,
         .buttonLeft = 0x05,
         .buttonRight = 0x07,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0xB8,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
        {
         .appId = 7,
         .buttonLeft = 0x06,
         .buttonRight = 0x00,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0xD0,
         .y = 0x84,
         .leftOffset = -8,
         .rightOffset = 8,
         .topOffset = -8,
         .bottomOffset = 8,
         },
    };

    static const PokegearCursorGrid buttonSpecsTrashCan[1] = {
        {
         .appId = 0,
         .buttonLeft = 0xFF,
         .buttonRight = 0xFF,
         .buttonUp = 0xFF,
         .buttonDown = 0xFF,
         .x = 0x48,
         .y = 0x54,
         .leftOffset = -18,
         .rightOffset = 18,
         .topOffset = -12,
         .bottomOffset = 6,
         },
    };

    PokegearCursorManager_AddButtons(mapApp->pokegear->cursorManager, buttonSpecsMarkingsMenu, NELEMS(buttonSpecsMarkingsMenu), 0, FALSE, mapApp->heapID, objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_1].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_2].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_3].sprite);
    PokegearCursorManager_AddButtons(mapApp->pokegear->cursorManager, buttonSpecsSelectIcon, NELEMS(buttonSpecsSelectIcon), 0, FALSE, mapApp->heapID, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_0].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_1].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_2].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_3].sprite);
    PokegearCursorManager_AddButtons(mapApp->pokegear->cursorManager, buttonSpecsTrashCan, NELEMS(buttonSpecsTrashCan), 0, FALSE, mapApp->heapID, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_0].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_1].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_2].sprite, objects[PGMAP_SPRITE_MARKINGS_CURSOR_SUB_3].sprite);

    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 1, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 2, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 3, FALSE);

    if (mapApp->inMarkingsMode == TRUE) {
        PokegearCursorManager_SetSpecIndexAndCursorPos(mapApp->pokegear->cursorManager, 1, mapApp->sessionState.index * 2 + 1);
    } else {
        PokegearCursorManager_SetSpecIndexAndCursorPos(mapApp->pokegear->cursorManager, 1, 0);
    }
}

static void PokegearMap_RemoveUIButtons(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 3; ++i) {
        PokegearCursorManager_RemoveCursor(mapApp->pokegear->cursorManager, i + 1);
    }
}

static void PokegearMap_LoadPalettes(PokegearMapAppData *mapApp, u8 frame) {
    NARC *narc = NARC_New(NARC_application_pokegear_map_pgmap_gra, mapApp->heapID);

    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, NARC_pgmap_gra_pgmap_gra_00000020_NCLR + frame, mapApp->heapID, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, NARC_pgmap_gra_pgmap_gra_00000014_NCLR + frame, mapApp->heapID, PLTTBUF_SUB_BG, 0x180, 0, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, NARC_pgmap_gra_pgmap_gra_00000000_NCLR, mapApp->heapID, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
    PaletteData_LoadFromOpenNarc(mapApp->pokegear->plttData, narc, NARC_pgmap_gra_pgmap_gra_00000000_NCLR, mapApp->heapID, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);

    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
    PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
    PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

static void PokegearMap_CreateObjectsManager(PokegearMapAppData *mapApp) {
    PokegearApp_CreateSpriteManager(mapApp->pokegear, GEAR_APP_MAP);
    mapApp->objManager = PokegearObjectsManager_Create(PGMAP_SPRITE_MAX, mapApp->heapID);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(240));
    mapApp->unk_03C = FontSystem_NewInit(4, mapApp->heapID);
}

static void PokegearMap_DestroyObjectsManager(PokegearMapAppData *mapApp) {
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(192));
    sub_020135AC(mapApp->unk_03C);
    PokegearObjectsManager_Release(mapApp->objManager);
    PokegearApp_DestroySpriteManager(mapApp->pokegear);
}

static void PokegearMap_CreatePersistentSprites(PokegearMapAppData *mapApp) {
    int i;
    u16 idx;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    static const UnmanagedSpriteTemplate spriteTemplates[5] = {
        {
         .resourceSet = 0,
         .x = 0x20,
         .y = 0x60,
         .z = 0,
         .animation = 0,
         .drawPriority = 0,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DSUB,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 0,
         .x = 0x10,
         .y = 0x98,
         .z = 0,
         .animation = 1,
         .drawPriority = 0,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DSUB,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 1,
         .x = 0x20,
         .y = 0x80,
         .z = 0,
         .animation = 0,
         .drawPriority = 1,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 1,
         .x = 0x20,
         .y = 0x60,
         .z = 0,
         .animation = 1,
         .drawPriority = 1,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 1,
         .x = 0x20,
         .y = 0x60,
         .z = 0,
         .animation = 2,
         .drawPriority = 1,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
    };

    // Marker icons
    for (i = 0; i < 4; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[0]));
        Sprite_SetPositionXY(objects[PGMAP_SPRITE_MARKER0 + i].sprite, 104 * (i % 2) + 32, 21 * (i / 2) + 203);
        thunk_Sprite_SetPriority(objects[PGMAP_SPRITE_MARKER0 + i].sprite, 0);
    }

    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[1]));
    thunk_Sprite_SetPriority(objects[PGMAP_SPRITE_GEAR_BATTLE].sprite, 0);

    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[2]));

    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[3]));

    for (i = 0; i < ROAMER_MAX; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[4]));
        Sprite_UpdateAnim(objects[i + PGMAP_SPRITE_ROAMER_RAIKOU].sprite, FX32_CONST(i));
    }

    for (i = 0; i < PGMAP_SPRITE_ALWAYS_END; ++i) {
        idx = i;
        Sprite_GetPositionXY(objects[idx].sprite, &objects[idx].pos.x, &objects[idx].pos.y);
        Sprite_SetDrawFlag(objects[idx].sprite, FALSE);
    }

    Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_PLAYER].sprite, FALSE);
    Sprite_SetAnimationFrame(objects[PGMAP_SPRITE_PLAYER].sprite, mapApp->pokegear->args->playerGender);
    Sprite_SetAffineOverwriteMode(objects[PGMAP_SPRITE_CURSOR].sprite, NNS_G2D_RND_AFFINE_OVERWRITE_DOUBLE);
}

static void PokegearMap_LoadMapHasMarkingsIndicatorSprites(PokegearMapAppData *mapApp) {
    u16 i;
    u16 idx;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    static const UnmanagedSpriteTemplate spriteTemplates[] = {
        {
         .resourceSet = 1,
         .x = 0,
         .y = 0,
         .z = 0,
         .animation = 4,
         .drawPriority = 1,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
    };

    for (i = 0; i < PGMAP_NUM_LOCATIONS; ++i) {
        idx = PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[0]));
        Sprite_GetPositionXY(objects[idx].sprite, &objects[idx].pos.x, &objects[idx].pos.y);
        Sprite_SetDrawFlag(objects[idx].sprite, FALSE);
        Sprite_SetAnimActiveFlag(objects[idx].sprite, FALSE);
    }
}

static void PokegearMap_CreateMarkingsECWordTextOBJs(PokegearMapAppData *mapApp) {
    TextOBJTemplate template;
    u32 size;
    int i;

    mapApp->unk_040 = sub_02013910(&mapApp->windows[8], mapApp->heapID);
    size = sub_02013948(mapApp->unk_040, NNS_G2D_VRAM_TYPE_2DMAIN);
    AddTextPrinterParameterizedWithColor(&mapApp->windows[8], 0, mapApp->regionNameStrings[1], 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);

    template.fontSystem = mapApp->unk_03C;
    template.window = &mapApp->windows[8];
    template.spriteList = SpriteManager_GetSpriteList(mapApp->pokegear->spriteManager);
    template.plttResourceProxy = SpriteManager_FindPlttResourceProxy(mapApp->pokegear->spriteManager, 0);
    template.unk_20 = 0;
    template.unk_24 = 3;
    template.x = 4;
    template.y = -6;
    template.vram = 1;
    template.heapID = mapApp->heapID;

    for (i = 0; i < 4; ++i) {
        sub_02021AC8(size, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, &mapApp->unk_044[i].unk_4);
        template.offset = mapApp->unk_044[i].unk_4.offset;
        template.sprite = mapApp->objManager->objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0 + i].sprite;
        mapApp->unk_044[i].textOBJ = TextOBJ_Create(&template, mapApp->unk_040);
        TextOBJ_SetSpritesDrawFlag(mapApp->unk_044[i].textOBJ, FALSE);
        TextOBJ_SetPaletteNum(mapApp->unk_044[i].textOBJ, 7);
    }
}

static void PokegearMap_DestroyMarkingsECWordTextOBJs(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 4; ++i) {
        TextOBJ_Destroy(mapApp->unk_044[i].textOBJ);
        sub_02021B5C(&mapApp->unk_044[i].unk_4);
        mapApp->unk_044[i].textOBJ = NULL;
    }
    sub_02013938(mapApp->unk_040);
}

static void PokegearMap_CreateAuxSprites_MarkingsMode(PokegearMapAppData *mapApp) {
    u16 i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    static const UnmanagedSpriteTemplate spriteTemplates[4] = {
        {
         .resourceSet = 1,
         .x = 0,
         .y = 0,
         .z = 0,
         .animation = 3,
         .drawPriority = 4,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 1,
         .x = 0,
         .y = 0,
         .z = 0,
         .animation = 0,
         .drawPriority = 4,
         .pal = 6,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 0,
         .x = 0,
         .y = 0,
         .z = 0,
         .animation = 0,
         .drawPriority = 4,
         .pal = 4,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
        {
         .resourceSet = 2,
         .x = 0,
         .y = 0,
         .z = 0,
         .animation = 0,
         .drawPriority = 4,
         .pal = 5,
         .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
         .paletteMode = 0,
         .unk_1C = 0,
         .unk_20 = 0,
         .unk_24 = 0,
         },
    };

    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[0]));
    objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].pos.x = 128;
    objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].pos.y = 108;
    Sprite_SetDrawFlag(objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].sprite, TRUE);

    // Cursor sprites
    // 0-3 select slot
    // 4-7 select action
    for (i = 0; i < 8; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[1]));
        objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].pos.x = 0;
        objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].pos.y = 0;
        Sprite_SetAnimCtrlSeq(objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].sprite, 5 + (i % 4));
        Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].sprite, TRUE);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].sprite, FALSE);
        Sprite_SetPriority(objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].sprite, 0);
        objects[PGMAP_SPRITE_MARKINGS_CURSOR_MAIN_0 + i].autoUpdateDisabled = 1;
    }

    // Icons
    for (i = 0; i < 4; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[2]));
        objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0 + i].pos.x = 32 + (i % 2) * 104;
        objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0 + i].pos.y = 32 + (i / 2) * 21;
        Sprite_SetPriority(objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0 + i].sprite, 0);
    }

    // Words
    for (i = 0; i < 4; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[3]));
        objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0 + i].pos.x = 40 + (i % 2) * 104;
        objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0 + i].pos.y = 31 + (i / 2) * 21;
        Sprite_SetPriority(objects[PGMAP_SPRITE_MARKINGS_MENU_SLOT_WORD_0 + i].sprite, 0);
    }

    // Icons to select
    for (i = 0; i < 8; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &spriteTemplates[2]));
        objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + i].pos.x = 40 + i * 24;
        objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + i].pos.y = 132;
        Sprite_SetAnimationFrame(objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + i].sprite, i);
        Sprite_SetPriority(objects[PGMAP_SPRITE_MARKINGS_MENU_ICON_POKEBALL + i].sprite, 0);
    }

    for (i = PGMAP_SPRITE_MARKINGS_MENU_SLOT_MARK_0; i <= PGMAP_SPRITE_MARKINGS_MENU_ICON_TMHM; ++i) {
        Sprite_SetDrawFlag(objects[i].sprite, TRUE);
        Sprite_SetAnimActiveFlag(objects[i].sprite, FALSE);
    }

    Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_MARKINGS_BLINKING_ARROW].sprite, TRUE);
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    PokegearMap_CreateMarkingsECWordTextOBJs(mapApp);
}

static void PokegearMap_RemoveAuxSprites_MarkingsMode(PokegearMapAppData *mapApp) {
    PokegearMap_DestroyMarkingsECWordTextOBJs(mapApp);
    PokegearObjectsManager_DeleteSpritesFromIndexToEnd(mapApp->objManager, PGMAP_SPRITE_ALWAYS_END);
}

static void PokegearMap_LoadSprites(PokegearMapAppData *mapApp) {
    PokegearMap_CreatePersistentSprites(mapApp);
}

static void PokegearMap_RemoveAuxSprites_MapMode(PokegearMapAppData *mapApp) {
    PokegearObjectsManager_DeleteSpritesFromIndexToEnd(mapApp->objManager, PGMAP_SPRITE_ALWAYS_END);
}

static void PokegearMap_RemoveAllSprites(PokegearMapAppData *mapApp) {
    PokegearObjectsManager_Reset(mapApp->objManager);
}

static void PokegearMap_SetBgParam_MapMode(PokegearMapAppData *mapApp) {
    int i;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    for (i = 0; i < 2; ++i) {
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_SCREEN_SIZE, GF_BG_SCR_SIZE_256x512);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_CHAR_BASE, GX_BG_CHARBASE_0x10000);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
    }

    G2_SetBlendAlpha(4, 8, 10, 6);
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0);
    }

    mapApp->pokegear->reselectAppCB = PokegearMap_ShowMapCursor;
    mapApp->pokegear->deselectAppCB = PokegearMap_DeselectApp;
    ov101_021E990C(mapApp);
    PokegearMap_OnVBlank_UpdateCursorAffine(mapApp, &mapApp->cursorSpriteState);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 32, 20, mapApp->unk_178->rawData, 0, 0, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);

    ov101_021EAF40(mapApp);
    ov101_021EB38C(mapApp, 1, mapApp->zoomed);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 7, 32, 17, mapApp->unk_16C->rawData, 0, 7, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);

    ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->playerX, mapApp->playerY);
    ov101_021EAD90(mapApp, FALSE);
    ov101_021EB1E0(mapApp, 1);
    PokegearMap_LoadMapHasMarkingsIndicatorSprites(mapApp);
    ov101_021EA238(mapApp, 0);
    ov101_021EA608(mapApp, 1);
    if (mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
        PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 0, TRUE);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_CURSOR].sprite, FALSE);
    } else {
        PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 0, FALSE);
        Sprite_SetDrawFlag(objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    }

    PokegearCursorManager_SetSpecIndexAndCursorPos(mapApp->pokegear->cursorManager, 0, PokegearApp_AppIdToButtonIndex(mapApp->pokegear));
    if (mapApp->pokegear->isSwitchApp) {
        PokegearMap_BeginScrollMarkingsPanelTopScreen(mapApp, 0);
    }
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}

static void PokegearMap_SetBgParam_MarkingsMode(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    for (i = 0; i < 2; ++i) {
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_SCREEN_SIZE, GF_BG_SCR_SIZE_128x128);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_CHAR_BASE, GX_BG_CHARBASE_0x00000);
        SetBgControlParam(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, GF_BG_CNT_SET_COLOR_MODE, GX_BG_COLORMODE_16);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0);
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    G2_SetBlendAlpha(0, 0, 0, 0);

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
    }

    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 14, mapApp->unk_17C->rawData, 0, 0, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 24, mapApp->unk_180->rawData, 0, 0, mapApp->unk_180->screenWidth / 8, mapApp->unk_180->screenHeight / 8);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_ON);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    PokegearMap_CreateAuxSprites_MarkingsMode(mapApp);
    PokegearMap_InitUIButtons(mapApp);
    ov101_021EA608(mapApp, 0);

    if (mapApp->inMarkingsMode == TRUE) {
        ov101_021EA794(mapApp, &mapApp->selectedLoc, mapApp->sessionState.playerX, mapApp->sessionState.playerY);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 1, TRUE);
        } else {
            PokegearCursorManager_SetCursorSpritesDrawState(mapApp->pokegear->cursorManager, 1, FALSE);
        }
    }

    PokegearMap_PrintSelectedMapDetail(mapApp, TRUE);
    mapApp->draggingType = 0;
    mapApp->trashcanIconState = FALSE;
    mapApp->pokegear->reselectAppCB = PokegearMap_InMarkingsMode_ShowCursor;
    mapApp->pokegear->deselectAppCB = PokegearMap_InMarkingsMode_HideCursor;
}

static void ov101_021E9264(PokegearMapAppData *mapApp, BOOL a1) {
    if (!a1) {
        mapApp->sessionState.index = 0;
        mapApp->inMarkingsMode = FALSE;
    }
}
