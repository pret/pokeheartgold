#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/radio/radio_internal.h"

#include "brightness.h"
#include "map_header.h"
#include "pokegear_apps.h"
#include "sound_02004A44.h"
#include "sys_vars.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

void Radio_Load(PokegearRadioAppData *radioApp);
void Radio_Unload(PokegearRadioAppData *radioApp);
BOOL Radio_IsInSpecialMap(u16 mapID, int param);
u8 Radio_GetAvailableChannels(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_VideoInit(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_InputLoop(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_Unload(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_FadeIn(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_FadeOut(PokegearRadioAppData *radioApp);
int PokegearRadio_MainState_FadeInApp(PokegearRadioAppData *radioApp);
int PokegearRadio_MainTask_FadeOutApp(PokegearRadioAppData *radioApp);

BOOL PokegearRadio_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    Heap_Create(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x20000);
    PokegearRadioAppData *radioApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearRadioAppData), HEAP_ID_POKEGEAR_APP);
    memset(radioApp, 0, sizeof(PokegearRadioAppData));
    radioApp->pokegear = pokegearApp;
    radioApp->heapID = HEAP_ID_POKEGEAR_APP;
    Radio_Load(radioApp);
    return TRUE;
}

BOOL PokegearRadio_Main(OverlayManager *man, int *state) {
    PokegearRadioAppData *radioApp = OverlayManager_GetData(man);

    switch (*state) {
    case RADIO_MAIN_STATE_INIT:
        *state = PokegearRadio_MainTask_VideoInit(radioApp);
        break;
    case RADIO_MAIN_STATE_INPUT_LOOP:
        *state = PokegearRadio_MainTask_InputLoop(radioApp);
        break;
    case RADIO_MAIN_STATE_UNLOAD:
        *state = PokegearRadio_MainTask_Unload(radioApp);
        break;
    case RADIO_MAIN_STATE_FADE_IN:
        *state = PokegearRadio_MainTask_FadeIn(radioApp);
        break;
    case RADIO_MAIN_STATE_FADE_OUT:
        *state = PokegearRadio_MainTask_FadeOut(radioApp);
        break;
    case RADIO_MAIN_STATE_FADE_IN_APP:
        *state = PokegearRadio_MainState_FadeInApp(radioApp);
        break;
    case RADIO_MAIN_STATE_FADE_OUT_APP:
        *state = PokegearRadio_MainTask_FadeOutApp(radioApp);
        break;
    case RADIO_MAIN_STATE_QUIT:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearRadio_Exit(OverlayManager *man, int *state) {
    PokegearRadioAppData *radioApp = OverlayManager_GetData(man);

    Radio_Unload(radioApp);
    radioApp->pokegear->isSwitchApp = TRUE;
    enum HeapID heapID = radioApp->heapID;
    OverlayManager_FreeData(man);
    Heap_Destroy(heapID);
    return TRUE;
}

void Radio_Load(PokegearRadioAppData *radioApp) {
    radioApp->pokegear->childAppdata = radioApp;
    radioApp->pokegear->reselectAppCB = Radio_OnReselectApp;
    radioApp->pokegear->deselectAppCB = Radio_UnknownCB;
    radioApp->skin = Pokegear_GetSkin(radioApp->pokegear->savePokegear);
    Pokegear_GetRadioCursorCoords(radioApp->pokegear->savePokegear, &radioApp->cursorX, &radioApp->cursorY);
    radioApp->selectedButton = 3;
    radioApp->stationSelection = Radio_GetAvailableChannels(radioApp);
    radioApp->station = 0xFF;
    radioApp->bgmBak = GF_GetCurrentPlayingBGM();
}

void Radio_Unload(PokegearRadioAppData *radioApp) {
    Pokegear_SetRadioCursorCoords(radioApp->pokegear->savePokegear, radioApp->cursorX, radioApp->cursorY);
    radioApp->pokegear->reselectAppCB = NULL;
    radioApp->pokegear->deselectAppCB = NULL;
}

#define RADIO_SPECIAL_MAP_TYPE_ALPH     0
#define RADIO_SPECIAL_MAP_TYPE_MAHOGANY 1

static const u16 sAlphMaps[] = {
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL,
    MAP_RUINS_OF_ALPH_HALL_ENTRANCE,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2,
};

static const u16 sMahoganyMaps[] = {
    MAP_MAHOGANY,
    MAP_MAHOGANY_EAST_HOUSE,
    MAP_MAHOGANY_GYM_LEADER_ROOM,
    MAP_MAHOGANY_GYM_ROOM_2,
    MAP_MAHOGANY_GYM_ROOM_1,
    MAP_MAHOGANY_POKECENTER_1F,
    MAP_MAHOGANY_POKECENTER_B1F,
    MAP_MAHOGANY_SOUVENIR_SHOP,
    MAP_TEAM_ROCKET_HEADQUARTERS_B1F,
    MAP_TEAM_ROCKET_HEADQUARTERS_B2F,
    MAP_TEAM_ROCKET_HEADQUARTERS_B3F,
    MAP_ROUTE_43,
    MAP_ROUTE_43_MAHOGANY_GATEHOUSE,
    MAP_ROUTE_43_GATEHOUSE,
    MAP_LAKE_OF_RAGE,
    MAP_LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,
    MAP_LAKE_OF_RAGE_FISHING_GURU_HOUSE,
};

static const u16 *sSpecialRadioMapIDs[] = {
    sAlphMaps,
    sMahoganyMaps,
};

static const u8 sNumSpecialRadioMaps[] = {
    NELEMS(sAlphMaps),
    NELEMS(sMahoganyMaps),
};

BOOL Radio_IsInSpecialMap(u16 mapID, int param) {
    for (int i = 0; i < sNumSpecialRadioMaps[param]; ++i) {
        if (mapID == sSpecialRadioMapIDs[param][i]) {
            return TRUE;
        }
    }

    return FALSE;
}

// get channel selection?
u8 Radio_GetAvailableChannels(PokegearRadioAppData *radioApp) {
    u16 mapID = radioApp->pokegear->args->mapID;

    if (!MapHeader_CanReceiveRadioSignal(mapID)) {
        return RADIO_STATION_SELECTION_NO_SIGNAL;
    }
    if (Radio_IsInSpecialMap(mapID, RADIO_SPECIAL_MAP_TYPE_ALPH)) {
        return RADIO_STATION_SELECTION_ALPH;
    }
    if (MapHeader_IsInKanto(mapID)) {
        if (!Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_RESTORED_POWER)) {
            return RADIO_STATION_SELECTION_NO_SIGNAL;
        } else if (Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_GOT_EXPN_CARD)) {
            return RADIO_STATION_SELECTION_KANTO_EXPN;
        } else {
            return RADIO_STATION_SELECTION_KANTO;
        }
    }
    if (Radio_IsInSpecialMap(mapID, RADIO_SPECIAL_MAP_TYPE_MAHOGANY) && !Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        return RADIO_STATION_SELECTION_MAHOGANY;
    }
    if (Save_VarsFlags_IsInRocketTakeover(radioApp->pokegear->saveVarsFlags)) {
        return RADIO_STATION_SELECTION_ROCKET;
    }
    return RADIO_STATION_SELECTION_JOHTO;
}

int PokegearRadio_MainTask_VideoInit(PokegearRadioAppData *radioApp) {
    if (!Radio_VideoInit(radioApp)) {
        return RADIO_MAIN_STATE_INIT;
    }
    if (radioApp->pokegear->isSwitchApp) {
        return RADIO_MAIN_STATE_FADE_IN_APP;
    } else {
        return RADIO_MAIN_STATE_FADE_IN;
    }
}

int PokegearRadio_MainTask_InputLoop(PokegearRadioAppData *radioApp) {
    BOOL inputWasTouch = FALSE;
    int result = Radio_HandleTouchInput(radioApp, &inputWasTouch);
    if (!inputWasTouch) {
        PokegearApp_HandleInputModeChangeToButtons(radioApp->pokegear);
        if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
            result = PokegearApp_HandleKeyInput_SwitchApps(radioApp->pokegear);
        } else {
            result = Radio_HandleKeyInput(radioApp);
        }
    }
    switch (result) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_4:
        radioApp->pokegear->appReturnCode = result;
        return RADIO_MAIN_STATE_FADE_OUT;
    case GEAR_RETURN_8:
        return RADIO_MAIN_STATE_3;
    default:
        radioApp->pokegear->appReturnCode = result;
        return RADIO_MAIN_STATE_FADE_OUT_APP;
    }

    return RADIO_MAIN_STATE_INPUT_LOOP;
}

int PokegearRadio_MainTask_Unload(PokegearRadioAppData *radioApp) {
    if (Radio_VideoUnload(radioApp)) {
        return RADIO_MAIN_STATE_QUIT;
    } else {
        return RADIO_MAIN_STATE_UNLOAD;
    }
}

int PokegearRadio_MainTask_FadeIn(PokegearRadioAppData *radioApp) {
    switch (radioApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, radioApp->heapID);
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, TRUE);
        }
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 0, RGB_BLACK);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        StopBGM(GF_GetCurrentPlayingBGM(), 6);
        ++radioApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            Radio_Start(radioApp);
            radioApp->state = 0;
            return RADIO_MAIN_STATE_INPUT_LOOP;
        }
        break;
    }

    return RADIO_MAIN_STATE_FADE_IN;
}

int PokegearRadio_MainTask_FadeOut(PokegearRadioAppData *radioApp) {
    switch (radioApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, radioApp->heapID);
        ++radioApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            Radio_CloseStation(radioApp);
            for (int i = 0; i < 8; ++i) {
                ToggleBgLayer(i, FALSE);
            }
            radioApp->state = 0;
            return RADIO_MAIN_STATE_UNLOAD;
        }
        break;
    }

    return RADIO_MAIN_STATE_FADE_OUT;
}

int PokegearRadio_MainState_FadeInApp(PokegearRadioAppData *radioApp) {
    switch (radioApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        Radio_BeginScriptWindowSlide(radioApp, 0);
        radioApp->pokegear->fadeCounter = 0;
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), SCREEN_MASK_MAIN);
        StopBGM(GF_GetCurrentPlayingBGM(), 6);
        ++radioApp->state;
        break;
    case 1:
        if (Pokegear_RunFadeLayers123(radioApp->pokegear, 0) && Radio_RunScriptWindowSlide(radioApp, 0)) {
            ++radioApp->state;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        radioApp->pokegear->fadeCounter = 0;
        Radio_Start(radioApp);
        radioApp->state = 0;
        return RADIO_MAIN_STATE_INPUT_LOOP;
    }

    return RADIO_MAIN_STATE_FADE_IN_APP;
}

int PokegearRadio_MainTask_FadeOutApp(PokegearRadioAppData *radioApp) {
    switch (radioApp->state) {
    case 0:
        Radio_BeginScriptWindowSlide(radioApp, 1);
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        radioApp->pokegear->fadeCounter = 0;
        ++radioApp->state;
        break;
    case 1:
        if (Pokegear_RunFadeLayers123(radioApp->pokegear, 1) && Radio_RunScriptWindowSlide(radioApp, 1)) {
            ++radioApp->state;
        }
        break;
    case 2:
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, RGB_BLACK);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, RGB_BLACK);
        PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
        Radio_CloseStation(radioApp);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, FALSE);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, FALSE);
        }
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        radioApp->pokegear->fadeCounter = 0;
        radioApp->state = 0;
        return RADIO_MAIN_STATE_UNLOAD;
    }

    return RADIO_MAIN_STATE_FADE_OUT_APP;
}
