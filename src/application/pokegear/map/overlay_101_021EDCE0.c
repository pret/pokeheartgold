#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_0200FA24.h"
#include "unk_020210A0.h"

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
        extern const GraphicsModes ov101_021F7F44;
        GraphicsModes graphicsModes = ov101_021F7F44;
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        extern const BgTemplate ov101_021F7F9C[8];
        BgTemplate bgTemplates[8];
        ARRAY_ASSIGN(bgTemplates, ov101_021F7F9C);
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
