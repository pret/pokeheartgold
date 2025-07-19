#include "application/pokegear/map/pgmap_gra.naix"
#include "application/pokegear/map/pokegear_map_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0273.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "text.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "unk_0208805C.h"

void ov101_021EDE4C(PokegearMapAppData *mapApp);
void ov101_021EDF54(PokegearMapAppData *mapApp);
void ov101_021EDFF8(PokegearMapAppData *mapApp);
void ov101_021EE190(PokegearMapAppData *mapApp);
void ov101_021EE1C4(PokegearMapAppData *mapApp);
void ov101_021EE210(PokegearMapAppData *mapApp);
void ov101_021EE230(PokegearMapAppData *mapApp);
void ov101_021EE2E8(PokegearMapAppData *mapApp);
void PokegearMap_LoadFlyContextMenuStrings(PokegearMapAppData *mapApp);
void PokegearMap_UnloadFlyContextMenuStrings(PokegearMapAppData *mapApp);
void ov101_021EE394(PokegearMapAppData *mapApp);
void ov101_021EE3D8(PokegearMapAppData *mapApp);
void ov101_021EE410(PokegearMapAppData *mapApp);
void ov101_021EE664(PokegearMapAppData *mapApp);
void ov101_021EE670(PokegearMapAppData *mapApp);

const WindowTemplate ov101_021F7F54[] = {
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 8,
     .width = 5,
     .height = 3,
     .palette = 1,
     .baseTile = 0x3F0,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 3,
     .top = 11,
     .width = 12,
     .height = 2,
     .palette = 1,
     .baseTile = 0x3D8,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 14,
     .width = 28,
     .height = 4,
     .palette = 1,
     .baseTile = 0x368,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 5,
     .top = 18,
     .width = 11,
     .height = 5,
     .palette = 1,
     .baseTile = 0x331,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 18,
     .top = 18,
     .width = 11,
     .height = 5,
     .palette = 1,
     .baseTile = 0x2FA,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 5,
     .top = 20,
     .width = 11,
     .height = 2,
     .palette = 1,
     .baseTile = 0x2E4,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 18,
     .top = 22,
     .width = 11,
     .height = 2,
     .palette = 1,
     .baseTile = 0x2CE,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0,
     .top = 21,
     .width = 25,
     .height = 2,
     .palette = 0xA,
     .baseTile = 0x5C,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 25,
     .top = 21,
     .width = 6,
     .height = 2,
     .palette = 0xA,
     .baseTile = 0x8E,
     },
};

const UnmanagedSpriteTemplate ov101_021F807C[] = {
    {
     .resourceSet = 0,
     .x = 0x20,
     .y = 0x60,
     .z = 0,
     .animation = 0,
     .drawPriority = 0,
     .pal = 0,
     .vram = NNS_G2D_VRAM_TYPE_2DSUB,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0x10,
     .y = 0x90,
     .z = 0,
     .animation = 1,
     .drawPriority = 0,
     .pal = 0,
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
     .pal = 0,
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
     .drawPriority = 2,
     .pal = 0,
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
     .drawPriority = 2,
     .pal = 0,
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
     .animation = 5,
     .drawPriority = 1,
     .pal = 2,
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
     .animation = 6,
     .drawPriority = 1,
     .pal = 2,
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
     .animation = 7,
     .drawPriority = 1,
     .pal = 2,
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
     .animation = 8,
     .drawPriority = 1,
     .pal = 2,
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
     .animation = 9,
     .drawPriority = 3,
     .pal = 0,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

BOOL ov101_021EDCE0(PokegearMapAppData *mapApp) {
    switch (mapApp->substate) {
    case 0:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        sub_0200FBF4(0, 0);
        sub_0200FBF4(1, 0);
        sub_0200FBDC(0);
        sub_0200FBDC(1);
        sub_020210BC();
        sub_02021148(2);
        break;
    case 1:
        break;
    case 2:
        ov101_021EDE4C(mapApp);
        ov101_021EDFF8(mapApp);
        ov101_021EE1C4(mapApp);
        ov101_021EE230(mapApp);
        break;
    case 3:
        ov101_021EE394(mapApp);
        ov101_021EE410(mapApp);
        PokegearMap_LoadFlyContextMenuStrings(mapApp);
        break;
    case 4:
        ov101_021EE670(mapApp);
        Main_SetVBlankIntrCB(PokegearApp_VBlankCB, mapApp->pokegear);
        mapApp->pokegear->vblankCB = PokegearMap_VBlankCB;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021EDDB0(PokegearMapAppData *mapApp) {
    mapApp->pokegear->vblankCB = NULL;
    PokegearMap_UnloadFlyContextMenuStrings(mapApp);
    ov101_021EE664(mapApp);
    ov101_021EE3D8(mapApp);
    ov101_021EE2E8(mapApp);
    ov101_021EE210(mapApp);
    ov101_021EE190(mapApp);
    ov101_021EDF54(mapApp);
    sub_02021238();
    Main_SetVBlankIntrCB(NULL, NULL);
    return TRUE;
}

int ov101_021EDDF4(PokegearMapAppData *mapApp) {
    u8 isTouch;
    int ret = TouchscreenListMenu_HandleInput(mapApp->listMenu);
    if (ret != TOUCH_MENU_NO_INPUT) {
        isTouch = mapApp->listMenu->isTouch;
        TouchscreenListMenu_Destroy(mapApp->listMenu);
        if (isTouch != mapApp->pokegear->menuInputState) {
            mapApp->pokegear->menuInputState = (MenuInputState)isTouch;
        }
        if (ret == 0) {
            mapApp->pokegear->args->setFlyDestination = TRUE;
            return 5;
        } else {
            PokegearMap_PrintLandmarkNameAndFlavorText(mapApp, -1);
            return 1;
        }
    }

    return 12;
}

void ov101_021EDE4C(PokegearMapAppData *mapApp) {
    int i;

    ov100_021E5FDC();
    mapApp->pokegear->bgConfig = BgConfig_Alloc(mapApp->heapId);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    {
        GraphicsModes graphicsModes = {
            .dispMode = GX_DISPMODE_GRAPHICS,
            .bgMode = GX_BGMODE_5,
            .subMode = GX_BGMODE_0,
            ._2d3dMode = GX_BG0_AS_2D,
        }; // ov101_021F7F44
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplates[8] = {
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
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
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = 0,
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
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
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
             .charBase = 0,
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
             .charBase = 0,
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
        }; // ov101_021F7F9C
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplates[0], GF_BG_TYPE_TEXT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[1], GF_BG_TYPE_TEXT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[2], GF_BG_TYPE_256x16PLTT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[3], GF_BG_TYPE_256x16PLTT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_0, &bgTemplates[4], GF_BG_TYPE_TEXT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[5], GF_BG_TYPE_TEXT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[6], GF_BG_TYPE_TEXT);
        InitBgFromTemplate(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[7], GF_BG_TYPE_TEXT);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    for (i = 0; i < 8; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i);
        BG_ClearCharDataRange(i, 0x20, 0, mapApp->heapId);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, i);
    }
}

void ov101_021EDF54(PokegearMapAppData *mapApp) {
    BG_LoadBlankPltt(GF_PAL_LOCATION_MAIN_OBJ, 0x1C0, 0, mapApp->heapId);
    BG_LoadBlankPltt(GF_PAL_LOCATION_SUB_OBJ, 0x180, 0, mapApp->heapId);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_0);
    FreeToHeap(mapApp->pokegear->bgConfig);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    G2_SetBlendAlpha(0, 0, 0, 0);
}

void ov101_021EDFF8(PokegearMapAppData *mapApp) {
    NARC *narc = NARC_New(NARC_application_pokegear_map_pgmap_gra, mapApp->heapId);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000066_NCGR, GF_BG_LYR_MAIN_1, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000010_NCGR, GF_BG_LYR_MAIN_2, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000064_NCGR, GF_BG_LYR_SUB_0, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000068_NCGR, GF_BG_LYR_SUB_2, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000012_NCGR, GF_BG_LYR_SUB_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000063_NCLR, GF_BG_LYR_MAIN_1, GF_BG_GFX_TYPE_PLTT, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000062_NCLR, GF_BG_LYR_SUB_0, GF_BG_GFX_TYPE_PLTT, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_application_pokegear_map_pgmap_gra, NARC_pgmap_gra_pgmap_gra_00000065_NSCR, GF_BG_LYR_SUB_0, GF_BG_GFX_TYPE_SCRN, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000069_NSCR, FALSE, &mapApp->unk_16C, mapApp->heapId);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000011_NSCR, FALSE, &mapApp->unk_170, mapApp->heapId);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000013_NSCR, FALSE, &mapApp->unk_174, mapApp->heapId);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgmap_gra_pgmap_gra_00000067_NSCR, FALSE, &mapApp->unk_178, mapApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    FontID_Alloc(4, mapApp->heapId);
}

void ov101_021EE190(PokegearMapAppData *mapApp) {
    FontID_Release(4);
    FreeToHeap(mapApp->unk_154[3]);
    FreeToHeap(mapApp->unk_154[2]);
    FreeToHeap(mapApp->unk_154[1]);
    FreeToHeap(mapApp->unk_154[0]);
}

void ov101_021EE1C4(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 9; ++i) {
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->windows[i], ov101_021F7F54[i].bgId, ov101_021F7F54[i].left, ov101_021F7F54[i].top, ov101_021F7F54[i].width, ov101_021F7F54[i].height, ov101_021F7F54[i].palette, ov101_021F7F54[i].baseTile);
        FillWindowPixelBuffer(&mapApp->windows[i], 0);
    }
}

void ov101_021EE210(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 9; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->windows[i]);
        RemoveWindow(&mapApp->windows[i]);
    }
}

void ov101_021EE230(PokegearMapAppData *mapApp) {
    mapApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0273_bin, mapApp->heapId);
    mapApp->msgFormat = MessageFormat_New_Custom(2, 91, mapApp->heapId);
    mapApp->flavorTextString = String_New(91, mapApp->heapId);
    mapApp->regionNameStrings[0] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00001);
    mapApp->regionNameStrings[1] = NewString_ReadMsgData(mapApp->msgData, msg_0273_00000);
    mapApp->mapNameString = String_New(40, mapApp->heapId);
    mapApp->chooseDestinationString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00004);
    mapApp->flyToLocationString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00005);
    mapApp->closeString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00006);
    mapApp->formatFlavorTextString = NewString_ReadMsgData(mapApp->msgData, msg_0273_00003);
    mapApp->unk_0B8 = 2;
}

void ov101_021EE2E8(PokegearMapAppData *mapApp) {
    String_Delete(mapApp->formatFlavorTextString);
    String_Delete(mapApp->closeString);
    String_Delete(mapApp->flyToLocationString);
    String_Delete(mapApp->chooseDestinationString);
    String_Delete(mapApp->mapNameString);
    String_Delete(mapApp->regionNameStrings[1]);
    String_Delete(mapApp->regionNameStrings[0]);
    String_Delete(mapApp->flavorTextString);
    MessageFormat_Delete(mapApp->msgFormat);
    DestroyMsgData(mapApp->msgData);
}

void PokegearMap_LoadFlyContextMenuStrings(PokegearMapAppData *mapApp) {
    int i;

    mapApp->listMenuItems = ListMenuItems_New(2, mapApp->heapId);
    for (i = 0; i < 2; ++i) {
        ListMenuItems_AppendFromMsgData(mapApp->listMenuItems, mapApp->msgData, msg_0273_00007 + i, i);
    }
}

void PokegearMap_UnloadFlyContextMenuStrings(PokegearMapAppData *mapApp) {
    ListMenuItems_Delete(mapApp->listMenuItems);
    mapApp->listMenuItems = NULL;
}

void ov101_021EE394(PokegearMapAppData *mapApp) {
    ov100_021E6914(mapApp->pokegear);
    PokegearApp_CreateSpriteManager(mapApp->pokegear, GEAR_APP_MAP);
    mapApp->objManager = PokegearObjectsManager_Create(42, mapApp->heapId);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(0xF0));
    mapApp->listMenuSpawner = TouchscreenListMenuSpawner_Create(mapApp->heapId, mapApp->pokegear->plttData);
}

void ov101_021EE3D8(PokegearMapAppData *mapApp) {
    TouchscreenListMenuSpawner_Destroy(mapApp->listMenuSpawner);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(0xC0));
    PokegearObjectsManager_Release(mapApp->objManager);
    PokegearApp_DestroySpriteManager(mapApp->pokegear);
    ov100_021E6950(mapApp->pokegear);
}

void ov101_021EE410(PokegearMapAppData *mapApp) {
    int i;
    u16 index;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    // Common sprites
    // Markers
    for (i = 0; i < 4; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[0]));
        Sprite_SetPositionXY(objects[i].sprite, 32 + 104 * (i % 2), 203 + 21 * (i / 2));
        thunk_Sprite_SetPriority(objects[i].sprite, 0);
    }
    // Battle or gift indicator
    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[1]));
    thunk_Sprite_SetPriority(objects[4].sprite, 0);
    // Cursor
    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[2]));
    // Player sprite
    PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[3]));
    // Roamers
    for (i = 0; i < 4; ++i) {
        PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[4]));
        Sprite_UpdateAnim(objects[7 + i].sprite, FX32_CONST(i));
    }

    // Fly menu specific sprites
    for (i = 0; i < 4; ++i) {
        index = PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[5 + i]));
        Sprite_GetPositionXY(objects[index].sprite, &objects[index].pos.x, &objects[index].pos.y);
        thunk_Sprite_SetPriority(objects[index].sprite, 0);
        Sprite_SetAnimActiveFlag(objects[index].sprite, TRUE);
        Sprite_SetDrawFlag(objects[index].sprite, FALSE);
    }
    // Flypoint indicators
    for (i = 0; i < PGMAP_NUM_FLYPOINTS; ++i) {
        index = PokegearObjectsManager_AppendSprite(mapApp->objManager, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[9]));
        Sprite_GetPositionXY(objects[index].sprite, &objects[index].pos.x, &objects[index].pos.y);
        Sprite_SetDrawFlag(objects[index].sprite, FALSE);
        Sprite_SetAnimActiveFlag(objects[index].sprite, FALSE);
    }

    // Hide sprites initially
    for (i = 0; i < PGMAP_SPRITE_ALWAYS_END; ++i) {
        index = i;
        Sprite_GetPositionXY(objects[index].sprite, &objects[index].pos.x, &objects[index].pos.y);
        Sprite_SetDrawFlag(objects[index].sprite, FALSE);
    }
    Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    Sprite_SetAnimActiveFlag(objects[PGMAP_SPRITE_PLAYER].sprite, FALSE);
    Sprite_SetAnimationFrame(objects[PGMAP_SPRITE_PLAYER].sprite, mapApp->pokegear->args->playerGender);
    Sprite_SetAffineOverwriteMode(objects[PGMAP_SPRITE_CURSOR].sprite, NNS_G2D_RND_AFFINE_OVERWRITE_DOUBLE);
}

void ov101_021EE664(PokegearMapAppData *mapApp) {
    PokegearObjectsManager_Reset(mapApp->objManager);
}

void ov101_021EE670(PokegearMapAppData *mapApp) {
    int i;
    s16 textX;
    PokegearManagedObject *objects = mapApp->objManager->objects;

    G2_SetBlendAlpha(4, 8, 10, 6);
    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i, BG_POS_OP_SET_Y, 0);
    }
    mapApp->pokegear->reselectAppCB = PokegearMap_ShowMapCursor;
    mapApp->pokegear->deselectAppCB = PokegearMap_DeselectApp;
    ov101_021E990C(mapApp);
    ov101_021E9B70(mapApp, &mapApp->cursorSpriteState);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 32, 24, mapApp->unk_178->rawData, 0, 0, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    ov101_021EAF40(mapApp);
    mapApp->flyDestination = -1;
    if (mapApp->unk_00D == 2) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 8, 32, 6, mapApp->unk_16C->rawData, 0, 8, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        ov101_021EA794(mapApp, &mapApp->selectedMap, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 1);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, -81);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, -81);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_Y, -81);
    } else {
        ov101_021EA4D0(mapApp, 0);
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 8, 32, 16, mapApp->unk_16C->rawData, 0, 8, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        ov101_021EA8A8(mapApp, &mapApp->selectedMap, mapApp->playerX, mapApp->playerY);
        ov101_021EAD90(mapApp, 0);
        PokegearMap_PrintLandmarkNameAndFlavorText(mapApp, -1);
    }
    ov101_021EB1E0(mapApp, 1);
    ov101_021EA608(mapApp, 1);
    textX = FontID_String_GetWidth(4, mapApp->closeString, 0);
    textX = (48 - textX) / 2;
    AddTextPrinterParameterizedWithColor(&mapApp->windows[8], 4, mapApp->closeString, textX, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    Sprite_SetDrawFlag(objects[PGMAP_SPRITE_CURSOR].sprite, TRUE);
    PokegearObjectsManager_UpdateAllSpritesPos(mapApp->objManager);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}
