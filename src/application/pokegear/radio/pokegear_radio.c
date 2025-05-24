#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "brightness.h"
#include "map_header.h"
#include "pokegear_apps.h"
#include "sound_02004A44.h"
#include "sys_vars.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

void ov101_021F4558(PokegearRadioAppData *radioApp);
void ov101_021F45D4(PokegearRadioAppData *radioApp);
BOOL ov101_021F45FC(u16 mapID, int param);
u8 ov101_021F4634(PokegearRadioAppData *radioApp);
int ov101_021F46C8(PokegearRadioAppData *radioApp);
int ov101_021F46EC(PokegearRadioAppData *radioApp);
int ov101_021F4750(PokegearRadioAppData *radioApp);
int ov101_021F4764(PokegearRadioAppData *radioApp);
int ov101_021F4824(PokegearRadioAppData *radioApp);
int ov101_021F4888(PokegearRadioAppData *radioApp);
int ov101_021F4928(PokegearRadioAppData *radioApp);

BOOL PokegearRadio_Init(OVY_MANAGER *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x20000);
    PokegearRadioAppData *radioApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearRadioAppData), HEAP_ID_POKEGEAR_APP);
    memset(radioApp, 0, sizeof(PokegearRadioAppData));
    radioApp->pokegear = pokegearApp;
    radioApp->heapId = HEAP_ID_POKEGEAR_APP;
    ov101_021F4558(radioApp);
    return TRUE;
}

BOOL PokegearRadio_Main(OVY_MANAGER *man, int *state) {
    PokegearRadioAppData *radioApp = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        *state = ov101_021F46C8(radioApp);
        break;
    case 1:
        *state = ov101_021F46EC(radioApp);
        break;
    case 2:
        *state = ov101_021F4750(radioApp);
        break;
    case 5:
        *state = ov101_021F4764(radioApp);
        break;
    case 6:
        *state = ov101_021F4824(radioApp);
        break;
    case 7:
        *state = ov101_021F4888(radioApp);
        break;
    case 8:
        *state = ov101_021F4928(radioApp);
        break;
    case 9:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearRadio_Exit(OVY_MANAGER *man, int *state) {
    PokegearRadioAppData *radioApp = OverlayManager_GetData(man);

    ov101_021F45D4(radioApp);
    radioApp->pokegear->isSwitchApp = TRUE;
    HeapID heapId = radioApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapId);
    return TRUE;
}

void ov101_021F4558(PokegearRadioAppData *radioApp) {
    radioApp->pokegear->childAppdata = radioApp;
    radioApp->pokegear->reselectAppCB = ov101_021F4FCC;
    radioApp->pokegear->unk_060 = ov101_021F4FDC;
    radioApp->unk_25 = Pokegear_GetBackgroundStyle(radioApp->pokegear->savePokegear);
    sub_0202EEB4(radioApp->pokegear->savePokegear, &radioApp->unk_28, &radioApp->unk_2A);
    radioApp->unk_24_5 = 3;
    radioApp->unk_26_0 = ov101_021F4634(radioApp);
    radioApp->unk_27 = 0xFF;
    radioApp->unk_2C = GF_GetCurrentPlayingBGM();
}

void ov101_021F45D4(PokegearRadioAppData *radioApp) {
    sub_0202EEAC(radioApp->pokegear->savePokegear, radioApp->unk_28, radioApp->unk_2A);
    radioApp->pokegear->reselectAppCB = NULL;
    radioApp->pokegear->unk_060 = NULL;
}

extern const u8 ov101_021F87AC[];
extern const u16 *ov101_021FB2C0[];

BOOL ov101_021F45FC(u16 mapID, int param) {
    for (int i = 0; i < ov101_021F87AC[param]; ++i) {
        if (mapID == ov101_021FB2C0[param][i]) {
            return TRUE;
        }
    }

    return FALSE;
}

// get channel selection?
u8 ov101_021F4634(PokegearRadioAppData *radioApp) {
    u16 mapID = radioApp->pokegear->args->mapID;

    if (!MapHeader_CanReceiveRadioSignal(mapID)) {
        return 3; // Radio silence
    }
    if (ov101_021F45FC(mapID, 0)) {
        return 4; // Alph signal
    }
    if (MapHeader_IsInKanto(mapID)) {
        if (!Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_RESTORED_POWER)) {
            return 3; // Radio silence
        } else if (Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_GOT_EXPN_CARD)) {
            return 2; // Full bandwidth
        } else {
            return 1; // Limited selection
        }
    }
    if (ov101_021F45FC(mapID, 1) && !Save_VarsFlags_CheckFlagInArray(radioApp->pokegear->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        return 6; // Weird evolution broadcast
    }
    if (Save_VarsFlags_IsInRocketTakeover(radioApp->pokegear->saveVarsFlags)) {
        return 5; // Rocket takeover
    }
    return 0; // Normal Johto selection
}

int ov101_021F46C8(PokegearRadioAppData *radioApp) {
    if (!ov101_021F49F8(radioApp)) {
        return 0;
    }
    if (radioApp->pokegear->isSwitchApp) {
        return 7;
    } else {
        return 5;
    }
}

int ov101_021F46EC(PokegearRadioAppData *radioApp) {
    BOOL inputWasTouch = FALSE;
    int result = ov101_021F5468(radioApp, &inputWasTouch);
    if (!inputWasTouch) {
        PokegearApp_HandleInputModeChangeToButtons(radioApp->pokegear);
        if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
            result = PokegearApp_HandleKeyInput_SwitchApps(radioApp->pokegear);
        } else {
            result = ov101_021F5304(radioApp);
        }
    }
    switch (result) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_4:
        radioApp->pokegear->appReturnCode = result;
        return 6;
    case 8:
        return 3;
    default:
        radioApp->pokegear->appReturnCode = result;
        return 8;
    }

    return 1;
}

int ov101_021F4750(PokegearRadioAppData *radioApp) {
    if (ov101_021F4A4C(radioApp)) {
        return 9;
    } else {
        return 2;
    }
}

int ov101_021F4764(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_04) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, radioApp->heapId);
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, TRUE);
        }
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 0, 0);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, 0);
        PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        StopBGM(GF_GetCurrentPlayingBGM(), 6);
        ++radioApp->unk_04;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            ov101_021F5090(radioApp);
            radioApp->unk_04 = 0;
            return 1;
        }
        break;
    }

    return 5;
}

int ov101_021F4824(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_04) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, radioApp->heapId);
        ++radioApp->unk_04;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            ov101_021F5048(radioApp);
            for (int i = 0; i < 8; ++i) {
                ToggleBgLayer(i, FALSE);
            }
            radioApp->unk_04 = 0;
            return 2;
        }
        break;
    }

    return 6;
}

int ov101_021F4888(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_04) {
    case 0:
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        ov101_021F50F0(radioApp, 0);
        radioApp->pokegear->unk_009 = 0;
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), SCREEN_MASK_MAIN);
        StopBGM(GF_GetCurrentPlayingBGM(), 6);
        ++radioApp->unk_04;
        break;
    case 1:
        if (ov100_021E5D3C(radioApp->pokegear, 0) && ov101_021F51C0(radioApp, 0)) {
            ++radioApp->unk_04;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        radioApp->pokegear->unk_009 = 0;
        ov101_021F5090(radioApp);
        radioApp->unk_04 = 0;
        return 1;
    }

    return 7;
}

int ov101_021F4928(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_04) {
    case 0:
        ov101_021F50F0(radioApp, 1);
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, TRUE);
        radioApp->pokegear->unk_009 = 0;
        ++radioApp->unk_04;
        break;
    case 1:
        if (ov100_021E5D3C(radioApp->pokegear, 1) && ov101_021F51C0(radioApp, 1)) {
            ++radioApp->unk_04;
        }
        break;
    case 2:
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, 0);
        PaletteData_BlendPalette(radioApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, 0);
        PaletteData_PushTransparentBuffers(radioApp->pokegear->plttData);
        ov101_021F5048(radioApp);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, FALSE);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, FALSE);
        }
        PaletteData_SetAutoTransparent(radioApp->pokegear->plttData, FALSE);
        radioApp->pokegear->unk_009 = 0;
        radioApp->unk_04 = 0;
        return 2;
    }

    return 8;
}
