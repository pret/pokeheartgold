#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "brightness.h"
#include "pokegear_apps.h"
#include "unk_0200FA24.h"

void ov101_021EE9D0(PokegearConfigureAppData *configureApp);
void ov101_021EEA2C(PokegearConfigureAppData *configureApp);
int ov101_021EEA4C(PokegearConfigureAppData *configureApp);
int ov101_021EEA70(PokegearConfigureAppData *configureApp);
int ov101_021EEAC4(PokegearConfigureAppData *configureApp);
int ov101_021EEAD8(PokegearConfigureAppData *configureApp);
int ov101_021EEAE0(PokegearConfigureAppData *configureApp);
int ov101_021EEAF4(PokegearConfigureAppData *configureApp);
int ov101_021EEBA4(PokegearConfigureAppData *configureApp);
int ov101_021EEC04(PokegearConfigureAppData *configureApp);
int ov101_021EEC8C(PokegearConfigureAppData *configureApp);

BOOL PokegearConfigure_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp;
    PokegearConfigureAppData *configureApp;

    pokegearApp = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x20000);
    configureApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearConfigureAppData), HEAP_ID_POKEGEAR_APP);
    memset(configureApp, 0, sizeof(PokegearConfigureAppData));
    configureApp->pokegear = pokegearApp;
    configureApp->heapId = HEAP_ID_POKEGEAR_APP;
    ov101_021EE9D0(configureApp);
    return TRUE;
}

BOOL PokegearConfigure_Main(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;

    configureApp = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        *state = ov101_021EEA4C(configureApp);
        break;
    case 1:
        *state = ov101_021EEA70(configureApp);
        break;
    case 2:
        *state = ov101_021EEAC4(configureApp);
        break;
    case 3:
        *state = ov101_021EEAD8(configureApp);
        break;
    case 4:
        *state = ov101_021EEAE0(configureApp);
        break;
    case 5:
        *state = ov101_021EEAF4(configureApp);
        break;
    case 6:
        *state = ov101_021EEBA4(configureApp);
        break;
    case 7:
        *state = ov101_021EEC04(configureApp);
        break;
    case 8:
        *state = ov101_021EEC8C(configureApp);
        break;
    case 9:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearConfigure_Exit(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;
    HeapID heapID;

    configureApp = OverlayManager_GetData(man);
    ov101_021EEA2C(configureApp);
    configureApp->pokegear->isSwitchApp = TRUE;
    heapID = configureApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);
    return TRUE;
}

void ov101_021EE9D0(PokegearConfigureAppData *configureApp) {
    configureApp->pokegear->childAppdata = configureApp;
    configureApp->pokegear->reselectAppCB = ov101_021EF4B0;
    configureApp->backgroundStyle = Pokegear_GetBackgroundStyle(configureApp->pokegear->savePokegear);
    configureApp->unk_12_00 = sub_0202EE98(configureApp->pokegear->savePokegear);
    configureApp->unk_12_00 = 0xFF; // nani the fuck?
}

void ov101_021EEA2C(PokegearConfigureAppData *configureApp) {
    Pokegear_SetBackgroundStyle(configureApp->pokegear->savePokegear, configureApp->backgroundStyle);
    configureApp->pokegear->reselectAppCB = NULL;
    configureApp->pokegear->deselectAppCB = NULL;
}

int ov101_021EEA4C(PokegearConfigureAppData *configureApp) {
    if (!ov101_021EED44(configureApp)) {
        return FALSE;
    }
    if (configureApp->pokegear->isSwitchApp) {
        return 7;
    } else {
        return 5;
    }
}

int ov101_021EEA70(PokegearConfigureAppData *configureApp) {
    int input;

    input = ov101_021EF7D4(configureApp);
    if (input == -1) {
        PokegearApp_HandleInputModeChangeToButtons(configureApp->pokegear);
        if (configureApp->pokegear->cursorInAppSwitchZone == TRUE) {
            input = PokegearApp_HandleKeyInput_SwitchApps(configureApp->pokegear);
        } else {
            input = ov101_021EF6E4(configureApp);
        }
    }
    switch (input) {
    case -1:
        break;
    case 4:
        configureApp->pokegear->appReturnCode = input;
        return 6;
    case 8:
        return 3;
    default:
        configureApp->pokegear->appReturnCode = input;
        return 8;
    }

    return 1;
}

int ov101_021EEAC4(PokegearConfigureAppData *configureApp) {
    if (ov101_021EED98(configureApp)) {
        return 9;
    }

    return 2;
}

int ov101_021EEAD8(PokegearConfigureAppData *configureApp) {
    return ov101_021EEDC4(configureApp);
}

int ov101_021EEAE0(PokegearConfigureAppData *configureApp) {
    if (ov101_021EEE80(configureApp)) {
        return 1;
    }

    return 4;
}

int ov101_021EEAF4(PokegearConfigureAppData *configureApp) {
    switch (configureApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, configureApp->heapId);
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, TRUE);
        }
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, TRUE);
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 0, RGB_BLACK);
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        PaletteData_PushTransparentBuffers(configureApp->pokegear->plttData);
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, FALSE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        ++configureApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            configureApp->state = 0;
            return 1;
        }
        break;
    }

    return 5;
}

int ov101_021EEBA4(PokegearConfigureAppData *configureApp) {
    switch (configureApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, configureApp->heapId);
        ++configureApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            for (int i = 0; i < 8; ++i) {
                ToggleBgLayer(i, FALSE);
            }
            configureApp->state = 0;
            return 2;
        }
        break;
    }

    return 6;
}

int ov101_021EEC04(PokegearConfigureAppData *configureApp) {
    switch (configureApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, TRUE);
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), SCREEN_MASK_MAIN);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, TRUE);
        }
        configureApp->pokegear->fadeCounter = 0;
        ++configureApp->state;
        break;
    case 1:
        if (Pokegear_RunFadeLayers123(configureApp->pokegear, 0)) {
            ++configureApp->state;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, FALSE);
        configureApp->pokegear->fadeCounter = 0;
        configureApp->state = 0;
        return 1;
    }

    return 7;
}

int ov101_021EEC8C(PokegearConfigureAppData *configureApp) {
    switch (configureApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, TRUE);
        configureApp->pokegear->fadeCounter = 0;
        ++configureApp->state;
        break;
    case 1:
        if (Pokegear_RunFadeLayers123(configureApp->pokegear, 1)) {
            ++configureApp->state;
        }
        break;
    case 2:
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
        PaletteData_PushTransparentBuffers(configureApp->pokegear->plttData);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, FALSE);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, FALSE);
        }
        PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, FALSE);
        configureApp->pokegear->fadeCounter = 0;
        configureApp->state = 0;
        return 2;
    }

    return 8;
}
