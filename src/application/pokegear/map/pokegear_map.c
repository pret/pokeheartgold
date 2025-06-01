#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "brightness.h"
#include "phonebook_dat.h"
#include "pokegear_apps.h"
#include "roamer.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

FS_EXTERN_OVERLAY(OVY_26);

BOOL ov101_021E7874(u16 mapID);
BOOL ov101_021E78B0(u16 mapID);
void ov101_021E78EC(PokegearMapAppData *mapApp);
void ov101_021E7B54(PokegearMapAppData *mapApp);
int ov101_021E7B90(PokegearMapAppData *mapApp);
int ov101_021E7BB4(PokegearMapAppData *mapApp);
int ov101_021E7C10(PokegearMapAppData *mapApp);
int ov101_021E7C38(PokegearMapAppData *mapApp);
int ov101_021E7C4C(PokegearMapAppData *mapApp);
int ov101_021E7D28(PokegearMapAppData *mapApp);
int ov101_021E7D3C(PokegearMapAppData *mapApp);
int ov101_021E7D50(PokegearMapAppData *mapApp);
int ov101_021E7E28(PokegearMapAppData *mapApp);
int ov101_021E7E98(PokegearMapAppData *mapApp);
int ov101_021E7F20(PokegearMapAppData *mapApp);

extern const u8 ov101_021F7372[];
extern const u16 ov101_021F7358[];
#define ov101_021F735E (*(const u16 *)((u32)ov101_021F7358 + 6))
extern const ov101_021F7364[];

BOOL PokegearMap_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    CreateHeap(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x30000);
    PokegearMapAppData *mapApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearMapAppData), HEAP_ID_POKEGEAR_APP);
    memset(mapApp, 0, sizeof(PokegearMapAppData));
    mapApp->pokegear = pokegearApp;
    mapApp->heapId = HEAP_ID_POKEGEAR_APP;
    ov101_021E78EC(mapApp);
    mapApp->unk_214 = ov101_021F7372;
    mapApp->unk_136 = 0x64;
    return TRUE;
}

BOOL PokegearMap_Main(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        *state = ov101_021E7B90(mapApp);
        break;
    case 1:
        *state = ov101_021E7BB4(mapApp);
        break;
    case 2:
        *state = ov101_021E7C10(mapApp);
        break;
    case 4:
        *state = ov101_021E7D50(mapApp);
        break;
    case 5:
        *state = ov101_021E7E28(mapApp);
        break;
    case 6:
        *state = ov101_021E7E98(mapApp);
        break;
    case 7:
        *state = ov101_021E7F20(mapApp);
        break;
    case 8:
        *state = ov101_021E7C38(mapApp);
        break;
    case 9:
        *state = ov101_021E7C4C(mapApp);
        break;
    case 10:
        *state = ov101_021E7D28(mapApp);
        break;
    case 11:
        *state = ov101_021E7D3C(mapApp);
        break;
    case 13:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearMap_Exit(OverlayManager *man, int *state) {
    HeapID heapID;
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    ov101_021E7B54(mapApp);
    MapMatrix_MapData_Free(mapApp->unk_038);
    if (mapApp->pokegear->appReturnCode != GEAR_RETURN_CANCEL) {
        mapApp->pokegear->isSwitchApp = TRUE;
    }
    heapID = mapApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    return TRUE;
}

BOOL ov101_021E7874(u16 mapID) {
    u16 sp0[3];
    ARRAY_ASSIGN_EX(sp0, ov101_021F735E, u16, 3);

    int i;
    for (i = 0; i < NELEMS(sp0); ++i) {
        if (mapID == sp0[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL ov101_021E78B0(u16 mapID) {
    u16 sp0[7];
    ARRAY_ASSIGN(sp0, ov101_021F7364);

    int i;
    for (i = 0; i < NELEMS(sp0); ++i) {
        if (mapID == sp0[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov101_021E78EC(PokegearMapAppData *mapApp) {
    int i;
    u8 r0;
    RoamerSaveData *roamers;

    mapApp->pokegear->childAppdata = mapApp;
    mapApp->pokegear->reselectAppCB = ov101_021EB338;
    mapApp->pokegear->unknownCB = ov101_021EB2FC;
    ov101_021ED4E0(mapApp);
    if (mapApp->pokegear->app != GEAR_APP_CANCEL) {
        mapApp->unk_00C = 0;
        mapApp->pokegear->app = GEAR_APP_MAP;
        mapApp->unk_138_0 = sub_0202EEA4(mapApp->pokegear->savePokegear);
    } else {
        mapApp->unk_00C = 1;
        mapApp->unk_014 = mapApp->pokegear->unk_03C;
        mapApp->unk_138_0 = mapApp->unk_014.unk_01;
        if (mapApp->unk_014.unk_1A != EC_WORD_NULL) {
            r0 = ov101_021ED614(mapApp, mapApp->unk_014.unk_18);
            if (r0 == 0) {
                r0 = ov101_021ED64C(mapApp, mapApp->unk_014.unk_18);
            }
            ov101_021ED79C(r0, mapApp->unk_014.unk_02, mapApp->unk_014.unk_1A);
        }
        mapApp->pokegear->unk_038 = 0;
        mapApp->pokegear->app = GEAR_APP_MAP;
    }
    mapApp->unk_138_4 = FALSE;
    mapApp->unk_138_1 = 0;
    mapApp->unk_138_5 = Pokegear_GetMapUnlockLevel(mapApp->pokegear->savePokegear);
    mapApp->unk_038 = MapMatrix_MapData_New(mapApp->heapId);
    mapApp->unk_124 = SaveData_GetPhoneCallPersistentState(mapApp->pokegear->saveData);
    mapApp->unk_128 = AllocAndReadPhoneBook(mapApp->heapId);
    mapApp->unk_12C = SavePokegear_AllocAndCopyPhonebook(mapApp->pokegear->savePokegear, mapApp->heapId);
    mapApp->unk_130 = SavePokegear_FindEmptyPhonebookSlot(mapApp->pokegear->savePokegear);
    mapApp->unk_108 = mapApp->pokegear->args->matrixXCoord;
    mapApp->unk_10A = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->unk_10C = mapApp->pokegear->args->mapID;
    mapApp->unk_10E = mapApp->pokegear->args->playerGender;
    mapApp->unk_110 = mapApp->pokegear->args->matrixXCoord;
    mapApp->unk_112 = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->unk_100 = 1;
    mapApp->unk_104 = 1;
    mapApp->unk_102 = ov101_021F7358[mapApp->unk_138_5];
    mapApp->unk_106 = 0x11;
    mapApp->unk_131 = 8;
    mapApp->unk_132 = 8;
    mapApp->unk_133 = 0;
    mapApp->unk_13D_1 = TRUE;
    mapApp->unk_13D_0 = Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, FLYPOINT_GOLDENROD);
    mapApp->unk_13D_2 = ov101_021E7874(mapApp->unk_10C);
    mapApp->unk_13D_3 = ov101_021E78B0(mapApp->unk_10C);

    roamers = Save_Roamers_Get(mapApp->pokegear->saveData);
    for (i = 0; i < ROAMER_MAX; ++i) {
        if (GetRoamerIsActiveByIndex(roamers, i)) {
            mapApp->unk_9E8[i] = GetRoamerData(Roamers_GetRoamMonStats(roamers, i), ROAMER_DATA_MET_LOCATION);
        } else {
            mapApp->unk_9E8[i] = SPECIES_NONE;
        }
    }
}

void ov101_021E7B54(PokegearMapAppData *mapApp) {
    FreeToHeap(mapApp->unk_12C);
    FreePhoneBook(mapApp->unk_128);
    mapApp->pokegear->reselectAppCB = NULL;
    mapApp->pokegear->unknownCB = NULL;
    ov101_021ED5AC(mapApp);
    sub_0202EEA8(mapApp->pokegear->savePokegear, mapApp->unk_138_0);
}

int ov101_021E7B90(PokegearMapAppData *mapApp) {
    if (!ov101_021E7FF4(mapApp)) {
        return 0;
    }
    if (mapApp->pokegear->isSwitchApp) {
        return 6;
    } else {
        return 4;
    }
}

int ov101_021E7BB4(PokegearMapAppData *mapApp) {
    BOOL isTouch = FALSE;
    int input;

    input = ov101_021EB5DC(mapApp, &isTouch);
    if (!isTouch) {
        PokegearApp_HandleInputModeChangeToButtons(mapApp->pokegear);
        if (mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
            input = PokegearApp_HandleKeyInput_SwitchApps(mapApp->pokegear);
        } else {
            input = ov101_021EB568(mapApp);
        }
    }
    mapApp->pokegear->appReturnCode = input;
    switch (input) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_7:
        return 8;
    case GEAR_RETURN_4:
        return 5;
    default:
        return 7;
    }

    return 1;
}

int ov101_021E7C10(PokegearMapAppData *mapApp) {
    if (!ov101_021E8070(mapApp)) {
        return 2;
    }
    mapApp->pokegear->unk_03C = mapApp->unk_014;
    return 13;
}

int ov101_021E7C38(PokegearMapAppData *mapApp) {
    if (ov101_021E80B4(mapApp)) {
        return 9;
    } else {
        return 8;
    }
}

int ov101_021E7C4C(PokegearMapAppData *mapApp) {
    int r4 = -1;
    BOOL sp0 = FALSE;

    switch (mapApp->unk_13C_0) {
    case 0:
        r4 = ov101_021ECC58(mapApp, &sp0);
        break;
    case 1:
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_BUTTONS) {
            r4 = ov101_021ECF98(mapApp);
            sp0 = TRUE;
        }
        break;
    case 2:
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_BUTTONS) {
            r4 = ov101_021ED2C0(mapApp);
            sp0 = TRUE;
        }
        break;
    }
    if (sp0) {
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            ov101_021EB364(mapApp);
        }
        mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        if (r4 >= 0) {
            return r4;
        } else {
            return 9;
        }
    }
    if (PokegearApp_HandleInputModeChangeToButtons(mapApp->pokegear) && mapApp->pokegear->menuInputState != mapApp->pokegear->menuInputStateBak) {
        ov101_021EB378(mapApp);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return 9;
    }

    switch (mapApp->unk_13C_0) {
    case 0:
        r4 = ov101_021ECAF0(mapApp);
        break;
    case 1:
        r4 = ov101_021ECEA8(mapApp);
        break;
    case 2:
        r4 = ov101_021ED158(mapApp);
        break;
    }
    if (r4 < 0) {
        r4 = 9;
    }
    return r4;
}

int ov101_021E7D28(PokegearMapAppData *mapApp) {
    if (ov101_021E818C(mapApp)) {
        return 1;
    } else {
        return 10;
    }
}

int ov101_021E7D3C(PokegearMapAppData *mapApp) {
    mapApp->pokegear->isSwitchApp = FALSE;
    mapApp->pokegear->appReturnCode = GEAR_RETURN_CANCEL;
    return 5;
}

int ov101_021E7D50(PokegearMapAppData *mapApp) {
    int i;

    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        if (mapApp->unk_00C == 1) {
            for (i = 0; i < 4; ++i) {
                ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
            }
        } else {
            for (i = 0; i < 8; ++i) {
                ToggleBgLayer(i, TRUE);
            }
        }
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 0, 0);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, 0);
        PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        ++mapApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            mapApp->state = 0;
            if (mapApp->unk_00C == 1) {
                return 9;
            } else {
                return 1;
            }
        }
        break;
    }

    return 4;
}

int ov101_021E7E28(PokegearMapAppData *mapApp) {
    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        ++mapApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            for (int i = 0; i < 8; ++i) {
                ToggleBgLayer(i, FALSE);
            }
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            mapApp->state = 0;
            return 2;
        }
        break;
    }

    return 5;
}

int ov101_021E7E98(PokegearMapAppData *mapApp) {
    BOOL r4;
    BOOL r0;

    switch (mapApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        mapApp->unk_135 = 0;
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), SCREEN_MASK_MAIN);
        ++mapApp->state;
        break;
    case 1:
        r4 = ov101_021E9CD4(mapApp, 0);
        r0 = ov101_021E9E90(mapApp, 0);
        if (r4 && r0) {
            ++mapApp->state;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        mapApp->state = 0;
        mapApp->unk_030 = 0;
        return 1;
    }

    return 6;
}

int ov101_021E7F20(PokegearMapAppData *mapApp) {
    int i;
    BOOL r4;
    BOOL r0;

    switch (mapApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        for (i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        ov101_021E9D74(mapApp, 1);
        mapApp->unk_135 = 0;
        ++mapApp->state;
        break;
    case 1:
        r4 = ov101_021E9CD4(mapApp, 1);
        r0 = ov101_021E9E90(mapApp, 1);
        if (r4 && r0) {
            ++mapApp->state;
        }
        break;
    case 2:
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, 0);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, 0);
        PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, FALSE);
        }
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        mapApp->state = 0;
        mapApp->unk_030 = 0;
        return 2;
    }

    return 7;
}
