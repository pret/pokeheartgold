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
void ov101_021EE350(PokegearMapAppData *mapApp);
void ov101_021EE380(PokegearMapAppData *mapApp);
void ov101_021EE394(PokegearMapAppData *mapApp);
void ov101_021EE3D8(PokegearMapAppData *mapApp);
void ov101_021EE410(PokegearMapAppData *mapApp);
void ov101_021EE664(PokegearMapAppData *mapApp);
void ov101_021EE670(PokegearMapAppData *mapApp);

const WindowTemplate ov101_021F7F54[] = {
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x01,
     .top = 0x08,
     .width = 0x05,
     .height = 0x03,
     .palette = 0x01,
     .baseTile = 0x3F0,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x03,
     .top = 0x0B,
     .width = 0x0C,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x3D8,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x01,
     .top = 0x0E,
     .width = 0x1C,
     .height = 0x04,
     .palette = 0x01,
     .baseTile = 0x368,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x05,
     .top = 0x12,
     .width = 0x0B,
     .height = 0x05,
     .palette = 0x01,
     .baseTile = 0x331,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x12,
     .top = 0x12,
     .width = 0x0B,
     .height = 0x05,
     .palette = 0x01,
     .baseTile = 0x2FA,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x05,
     .top = 0x14,
     .width = 0x0B,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x2E4,
     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 0x12,
     .top = 0x16,
     .width = 0x0B,
     .height = 0x02,
     .palette = 0x01,
     .baseTile = 0x2CE,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0x00,
     .top = 0x15,
     .width = 0x19,
     .height = 0x02,
     .palette = 0x0A,
     .baseTile = 0x05C,
     },
    {
     .bgId = GF_BG_LYR_MAIN_0,
     .left = 0x19,
     .top = 0x15,
     .width = 0x06,
     .height = 0x02,
     .palette = 0x0A,
     .baseTile = 0x08E,
     },
};

const UnmanagedSpriteTemplate ov101_021F807C[] = {
    {
     .resourceSet = 0x00000000,
     .x = 0x0020,
     .y = 0x0060,
     .z = 0x0000,
     .animSeqNo = 0x0000,
     .rotation = 0x00000000,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000000,
     .x = 0x0010,
     .y = 0x0090,
     .z = 0x0000,
     .animSeqNo = 0x0001,
     .rotation = 0x00000000,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0020,
     .y = 0x0080,
     .z = 0x0000,
     .animSeqNo = 0x0000,
     .rotation = 0x00000001,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0020,
     .y = 0x0060,
     .z = 0x0000,
     .animSeqNo = 0x0001,
     .rotation = 0x00000002,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0020,
     .y = 0x0060,
     .z = 0x0000,
     .animSeqNo = 0x0002,
     .rotation = 0x00000002,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0005,
     .rotation = 0x00000001,
     .palIndex = 0x00000002,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0006,
     .rotation = 0x00000001,
     .palIndex = 0x00000002,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0007,
     .rotation = 0x00000001,
     .palIndex = 0x00000002,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0008,
     .rotation = 0x00000001,
     .palIndex = 0x00000002,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
     },
    {
     .resourceSet = 0x00000001,
     .x = 0x0000,
     .y = 0x0000,
     .z = 0x0000,
     .animSeqNo = 0x0009,
     .rotation = 0x00000003,
     .palIndex = 0x00000000,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0x00000000,
     .unk_1C = 0x00000000,
     .unk_20 = 0x00000000,
     .unk_24 = 0x00000000,
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
        ov101_021EE350(mapApp);
        break;
    case 4:
        ov101_021EE670(mapApp);
        Main_SetVBlankIntrCB(PokegearApp_VBlankCB, mapApp->pokegear);
        mapApp->pokegear->unk_058 = ov101_021E9270;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021EDDB0(PokegearMapAppData *mapApp) {
    mapApp->pokegear->unk_058 = NULL;
    ov101_021EE380(mapApp);
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
    u8 r4;
    int ret = TouchscreenListMenu_HandleInput(mapApp->unk_0C4);
    if (ret != TOUCH_MENU_NO_INPUT) {
        r4 = mapApp->unk_0C4->isTouch;
        TouchscreenListMenu_Destroy(mapApp->unk_0C4);
        if (r4 != mapApp->pokegear->menuInputState) {
            mapApp->pokegear->menuInputState = (MenuInputState)r4;
        }
        if (ret == 0) {
            mapApp->pokegear->args->unk_14 = 1;
            return 5;
        } else {
            ov101_021EB4C4(mapApp, -1);
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
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 0,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xd000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_512x512_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_512x512,
             .colorMode = GX_BG_COLORMODE_256,
             .screenBase = GX_BG_SCRBASE_0xb000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf800,
             .charBase = GX_BG_CHARBASE_0x08000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 0,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
             },
            {
             .x = 0x00000000,
             .y = 0x00000000,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0x00000000,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .dummy = 0x00,
             .mosaic = 0x00000000,
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
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 66, GF_BG_LYR_MAIN_1, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 10, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 64, GF_BG_LYR_SUB_0, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 68, GF_BG_LYR_SUB_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 12, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 63, GF_BG_LYR_MAIN_1, 2, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 62, GF_BG_LYR_SUB_0, 2, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 65, GF_BG_LYR_SUB_0, 1, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 69, FALSE, &mapApp->unk_16C, mapApp->heapId);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 11, FALSE, &mapApp->unk_170, mapApp->heapId);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 13, FALSE, &mapApp->unk_174, mapApp->heapId);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 67, FALSE, &mapApp->unk_178, mapApp->heapId);
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
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->unk_184[i], ov101_021F7F54[i].bgId, ov101_021F7F54[i].left, ov101_021F7F54[i].top, ov101_021F7F54[i].width, ov101_021F7F54[i].height, ov101_021F7F54[i].palette, ov101_021F7F54[i].baseTile);
        FillWindowPixelBuffer(&mapApp->unk_184[i], 0);
    }
}

void ov101_021EE210(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 9; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->unk_184[i]);
        RemoveWindow(&mapApp->unk_184[i]);
    }
}

void ov101_021EE230(PokegearMapAppData *mapApp) {
    mapApp->unk_088 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0273_bin, mapApp->heapId);
    mapApp->unk_08C = MessageFormat_New_Custom(2, 91, mapApp->heapId);
    mapApp->unk_090 = String_New(91, mapApp->heapId);
    mapApp->unk_09C[0] = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00001);
    mapApp->unk_09C[1] = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00000);
    mapApp->unk_0A4 = String_New(40, mapApp->heapId);
    mapApp->unk_0A8 = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00004);
    mapApp->unk_0AC = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00005);
    mapApp->unk_0B0 = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00006);
    mapApp->unk_0B4 = NewString_ReadMsgData(mapApp->unk_088, msg_0273_00003);
    mapApp->unk_0B8 = 2;
}

void ov101_021EE2E8(PokegearMapAppData *mapApp) {
    String_Delete(mapApp->unk_0B4);
    String_Delete(mapApp->unk_0B0);
    String_Delete(mapApp->unk_0AC);
    String_Delete(mapApp->unk_0A8);
    String_Delete(mapApp->unk_0A4);
    String_Delete(mapApp->unk_09C[1]);
    String_Delete(mapApp->unk_09C[0]);
    String_Delete(mapApp->unk_090);
    MessageFormat_Delete(mapApp->unk_08C);
    DestroyMsgData(mapApp->unk_088);
}

void ov101_021EE350(PokegearMapAppData *mapApp) {
    int i;

    mapApp->unk_0C0 = ListMenuItems_New(2, mapApp->heapId);
    for (i = 0; i < 2; ++i) {
        ListMenuItems_AppendFromMsgData(mapApp->unk_0C0, mapApp->unk_088, msg_0273_00007 + i, i);
    }
}

void ov101_021EE380(PokegearMapAppData *mapApp) {
    ListMenuItems_Delete(mapApp->unk_0C0);
    mapApp->unk_0C0 = NULL;
}

void ov101_021EE394(PokegearMapAppData *mapApp) {
    ov100_021E6914(mapApp->pokegear);
    PokegearApp_CreateSpriteManager(mapApp->pokegear, 2);
    mapApp->unk_084 = ov100_021E6E20(42, mapApp->heapId);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(0xF0));
    mapApp->unk_0BC = TouchscreenListMenuSpawner_Create(mapApp->heapId, mapApp->pokegear->plttData);
}

void ov101_021EE3D8(PokegearMapAppData *mapApp) {
    TouchscreenListMenuSpawner_Destroy(mapApp->unk_0BC);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(mapApp->pokegear->spriteSystem), 0, FX32_CONST(0xC0));
    ov100_021E6E58(mapApp->unk_084);
    PokegearApp_DestroySpriteManager(mapApp->pokegear);
    ov100_021E6950(mapApp->pokegear);
}

void ov101_021EE410(PokegearMapAppData *mapApp) {
    int i;
    u16 r1;
    UnkStruct_ov100_021E6E20_Sub8 *sp0 = mapApp->unk_084->unk_08;

    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[0]));
        Sprite_SetPositionXY(sp0[i].sprite, 32 + 104 * (i % 2), 203 + 21 * (i / 2));
        thunk_Sprite_SetPriority(sp0[i].sprite, 0);
    }
    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[1]));
    thunk_Sprite_SetPriority(sp0[4].sprite, 0);
    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[2]));
    ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[3]));
    for (i = 0; i < 4; ++i) {
        ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[4]));
        Sprite_UpdateAnim(sp0[7 + i].sprite, FX32_CONST(i));
    }
    for (i = 0; i < 4; ++i) {
        r1 = ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[5 + i]));
        Sprite_GetPositionXY(sp0[r1].sprite, &sp0[r1].unk_04.x, &sp0[r1].unk_04.y);
        thunk_Sprite_SetPriority(sp0[r1].sprite, 0);
        Sprite_SetAnimActiveFlag(sp0[r1].sprite, TRUE);
        Sprite_SetDrawFlag(sp0[r1].sprite, FALSE);
    }
    for (i = 0; i < 27; ++i) {
        r1 = ov100_021E6EC4(mapApp->unk_084, SpriteSystem_CreateSpriteFromResourceHeader(mapApp->pokegear->spriteSystem, mapApp->pokegear->spriteManager, &ov101_021F807C[9]));
        Sprite_GetPositionXY(sp0[r1].sprite, &sp0[r1].unk_04.x, &sp0[r1].unk_04.y);
        Sprite_SetDrawFlag(sp0[r1].sprite, FALSE);
        Sprite_SetAnimActiveFlag(sp0[r1].sprite, FALSE);
    }
    for (i = 0; i < 11; ++i) {
        r1 = i;
        Sprite_GetPositionXY(sp0[r1].sprite, &sp0[r1].unk_04.x, &sp0[r1].unk_04.y);
        Sprite_SetDrawFlag(sp0[r1].sprite, FALSE);
    }
    Sprite_SetAnimActiveFlag(sp0[5].sprite, TRUE);
    Sprite_SetAnimActiveFlag(sp0[6].sprite, FALSE);
    Sprite_SetAnimationFrame(sp0[6].sprite, mapApp->pokegear->args->playerGender);
    Sprite_SetAffineOverwriteMode(sp0[5].sprite, NNS_G2D_RND_AFFINE_OVERWRITE_DOUBLE);
}

void ov101_021EE664(PokegearMapAppData *mapApp) {
    ov100_021E6EF4(mapApp->unk_084);
}

void ov101_021EE670(PokegearMapAppData *mapApp) {
    int i;
    s16 r1;
    UnkStruct_ov100_021E6E20_Sub8 *sp1C = mapApp->unk_084->unk_08;

    G2_SetBlendAlpha(4, 8, 10, 6);
    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i, BG_POS_OP_SET_Y, 0);
    }
    mapApp->pokegear->reselectAppCB = ov101_021EB338;
    mapApp->pokegear->unknownCB = ov101_021EB2FC;
    ov101_021E990C(mapApp);
    ov101_021E9B70(mapApp, &mapApp->unk_0C8);
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 32, 24, mapApp->unk_178->rawData, 0, 0, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    ov101_021EAF40(mapApp);
    mapApp->unk_00F = -1;
    if (mapApp->unk_00D == 2) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 8, 32, 6, mapApp->unk_16C->rawData, 0, 8, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 1);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, -81);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, -81);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_Y, -81);
    } else {
        ov101_021EA4D0(mapApp, 0);
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 0, 8, 32, 16, mapApp->unk_16C->rawData, 0, 8, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        ov101_021EA8A8(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB4C4(mapApp, -1);
    }
    ov101_021EB1E0(mapApp, 1);
    ov101_021EA608(mapApp, 1);
    r1 = FontID_String_GetWidth(4, mapApp->unk_0B0, 0);
    r1 = (48 - r1) / 2;
    AddTextPrinterParameterizedWithColor(&mapApp->unk_184[8], 4, mapApp->unk_0B0, r1, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 1, 0), NULL);
    Sprite_SetDrawFlag(sp1C[5].sprite, TRUE);
    ov100_021E6E84(mapApp->unk_084);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}
