#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "brightness.h"
#include "pokegear_apps.h"
#include "unk_0200FA24.h"

static void PokegearConfigure_InitInternal(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_ExitInternal(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_LoadGFX(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_HandleInput(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_UnloadGFX(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_ContextMenu(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_SwapSkins(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_FadeIn(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_FadeOut(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_FadeInApp(PokegearConfigureAppData *configureApp);
static int PokegearConfigure_MainTask_FadeOutApp(PokegearConfigureAppData *configureApp);

BOOL PokegearConfigure_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp;
    PokegearConfigureAppData *configureApp;

    pokegearApp = OverlayManager_GetArgs(man);
    Heap_Create(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x20000);
    configureApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearConfigureAppData), HEAP_ID_POKEGEAR_APP);
    memset(configureApp, 0, sizeof(PokegearConfigureAppData));
    configureApp->pokegear = pokegearApp;
    configureApp->heapId = HEAP_ID_POKEGEAR_APP;
    PokegearConfigure_InitInternal(configureApp);
    return TRUE;
}

BOOL PokegearConfigure_Main(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;

    configureApp = OverlayManager_GetData(man);
    switch (*state) {
    case PGCONF_MAIN_STATE_LOAD:
        *state = PokegearConfigure_MainTask_LoadGFX(configureApp);
        break;
    case PGCONF_MAIN_STATE_HANDLE_INPUT:
        *state = PokegearConfigure_MainTask_HandleInput(configureApp);
        break;
    case PGCONF_MAIN_STATE_UNLOAD:
        *state = PokegearConfigure_MainTask_UnloadGFX(configureApp);
        break;
    case PGCONF_MAIN_STATE_CONTEXT_MENU:
        *state = PokegearConfigure_MainTask_ContextMenu(configureApp);
        break;
    case PGCONF_MAIN_STATE_SWAP_SKINS:
        *state = PokegearConfigure_MainTask_SwapSkins(configureApp);
        break;
    case PGCONF_MAIN_STATE_FADE_IN:
        *state = PokegearConfigure_MainTask_FadeIn(configureApp);
        break;
    case PGCONF_MAIN_STATE_FADE_OUT:
        *state = PokegearConfigure_MainTask_FadeOut(configureApp);
        break;
    case PGCONF_MAIN_STATE_FADE_IN_APP:
        *state = PokegearConfigure_MainTask_FadeInApp(configureApp);
        break;
    case PGCONF_MAIN_STATE_FADE_OUT_APP:
        *state = PokegearConfigure_MainTask_FadeOutApp(configureApp);
        break;
    case PGCONF_MAIN_STATE_QUIT:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearConfigure_Exit(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;
    enum HeapID heapID;

    configureApp = OverlayManager_GetData(man);
    PokegearConfigure_ExitInternal(configureApp);
    configureApp->pokegear->isSwitchApp = TRUE;
    heapID = configureApp->heapId;
    OverlayManager_FreeData(man);
    Heap_Destroy(heapID);
    return TRUE;
}

static void PokegearConfigure_InitInternal(PokegearConfigureAppData *configureApp) {
    configureApp->pokegear->childAppdata = configureApp;
    configureApp->pokegear->reselectAppCB = PokegearConfigure_OnReselectApp;
    configureApp->skin = Pokegear_GetSkin(configureApp->pokegear->savePokegear);
    configureApp->unlockedSkins = Pokegear_GetUnlockedSkins(configureApp->pokegear->savePokegear);
    configureApp->unlockedSkins = 0xFF; // the ability to unlock skins was likely removed late in development, and dev was lazy
}

static void PokegearConfigure_ExitInternal(PokegearConfigureAppData *configureApp) {
    Pokegear_SetSkin(configureApp->pokegear->savePokegear, configureApp->skin);
    configureApp->pokegear->reselectAppCB = NULL;
    configureApp->pokegear->deselectAppCB = NULL;
}

static int PokegearConfigure_MainTask_LoadGFX(PokegearConfigureAppData *configureApp) {
    if (!PokegearConfigure_LoadGFX(configureApp)) {
        return FALSE;
    }
    if (configureApp->pokegear->isSwitchApp) {
        return PGCONF_MAIN_STATE_FADE_IN_APP;
    } else {
        return PGCONF_MAIN_STATE_FADE_IN;
    }
}

static int PokegearConfigure_MainTask_HandleInput(PokegearConfigureAppData *configureApp) {
    int input;

    input = PokegearConfigure_HandleTouchInput(configureApp);
    if (input == -1) {
        PokegearApp_HandleInputModeChangeToButtons(configureApp->pokegear);
        if (configureApp->pokegear->cursorInAppSwitchZone == TRUE) {
            input = PokegearApp_HandleKeyInput_SwitchApps(configureApp->pokegear);
        } else {
            input = PokegearConfigure_HandleKeyInput(configureApp);
        }
    }
    switch (input) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_4:
        configureApp->pokegear->appReturnCode = input;
        return PGCONF_MAIN_STATE_FADE_OUT;
    case GEAR_RETURN_8:
        return PGCONF_MAIN_STATE_CONTEXT_MENU;
    default:
        configureApp->pokegear->appReturnCode = input;
        return PGCONF_MAIN_STATE_FADE_OUT_APP;
    }

    return PGCONF_MAIN_STATE_HANDLE_INPUT;
}

static int PokegearConfigure_MainTask_UnloadGFX(PokegearConfigureAppData *configureApp) {
    if (PokegearConfigure_UnloadGFX(configureApp)) {
        return PGCONF_MAIN_STATE_QUIT;
    }

    return PGCONF_MAIN_STATE_UNLOAD;
}

static int PokegearConfigure_MainTask_ContextMenu(PokegearConfigureAppData *configureApp) {
    return PokegearConfigure_ContextMenu(configureApp);
}

static int PokegearConfigure_MainTask_SwapSkins(PokegearConfigureAppData *configureApp) {
    if (PokegearConfigure_SwapSkins(configureApp)) {
        return PGCONF_MAIN_STATE_HANDLE_INPUT;
    }

    return PGCONF_MAIN_STATE_SWAP_SKINS;
}

static int PokegearConfigure_MainTask_FadeIn(PokegearConfigureAppData *configureApp) {
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
            return PGCONF_MAIN_STATE_HANDLE_INPUT;
        }
        break;
    }

    return PGCONF_MAIN_STATE_FADE_IN;
}

static int PokegearConfigure_MainTask_FadeOut(PokegearConfigureAppData *configureApp) {
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
            return PGCONF_MAIN_STATE_UNLOAD;
        }
        break;
    }

    return PGCONF_MAIN_STATE_FADE_OUT;
}

static int PokegearConfigure_MainTask_FadeInApp(PokegearConfigureAppData *configureApp) {
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
        return PGCONF_MAIN_STATE_HANDLE_INPUT;
    }

    return PGCONF_MAIN_STATE_FADE_IN_APP;
}

static int PokegearConfigure_MainTask_FadeOutApp(PokegearConfigureAppData *configureApp) {
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
        return PGCONF_MAIN_STATE_UNLOAD;
    }

    return PGCONF_MAIN_STATE_FADE_OUT_APP;
}
