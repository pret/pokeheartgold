#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/map/pokegear_map_internal.h"
#include "msgdata/msg/msg_0273.h"

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

BOOL IsMapSinjoh(u16 mapID);
BOOL IsMapSSAqua(u16 mapID);
void ov101_021E78EC(PokegearMapAppData *mapApp);
void ov101_021E7B54(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_GraphicsInit(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_HandleInput(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_GraphicsDeinit(PokegearMapAppData *mapApp);
int ov101_021E7C38(PokegearMapAppData *mapApp);
int ov101_021E7C4C(PokegearMapAppData *mapApp);
int ov101_021E7D28(PokegearMapAppData *mapApp);
int ov101_021E7D3C(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_FadeIn(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_FadeOut(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_FadeInApp(PokegearMapAppData *mapApp);
int PokegearMap_MainTask_FadeOutApp(PokegearMapAppData *mapApp);

static const u16 sMapXScrollLimits[] = {
    26, // Johto only
    29, // Indigo Plateau
    45, // All of Kanto
};

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
    mapApp->unk_136 = 100;
    return TRUE;
}

BOOL PokegearMap_Main(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        *state = PokegearMap_MainTask_GraphicsInit(mapApp);
        break;
    case 1:
        *state = PokegearMap_MainTask_HandleInput(mapApp);
        break;
    case 2:
        *state = PokegearMap_MainTask_GraphicsDeinit(mapApp);
        break;
    case 4:
        *state = PokegearMap_MainTask_FadeIn(mapApp);
        break;
    case 5:
        *state = PokegearMap_MainTask_FadeOut(mapApp);
        break;
    case 6:
        *state = PokegearMap_MainTask_FadeInApp(mapApp);
        break;
    case 7:
        *state = PokegearMap_MainTask_FadeOutApp(mapApp);
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

BOOL IsMapSinjoh(u16 mapID) {
    const u16 sSinjohMapIDs[] = {
        MAP_SINJOH_RUINS_EXTERIOR,
        MAP_SINJOH_RUINS_MYSTRI_STAGE,
        MAP_SINJOH_RUINS_CABIN,
    };

    int i;
    for (i = 0; i < NELEMS(sSinjohMapIDs); ++i) {
        if (mapID == sSinjohMapIDs[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL IsMapSSAqua(u16 mapID) {
    const u16 sSSAquaMapIDs[] = {
        MAP_SS_AQUA_1F,
        MAP_SS_AQUA_CAPTAIN_ROOM,
        MAP_SS_AQUA_1F_SOUTHEAST_ROOMS,
        MAP_SS_AQUA_1F_SOUTHWEST_ROOMS,
        MAP_SS_AQUA_1F_NORTHEAST_ROOMS,
        MAP_SS_AQUA_1F_NORTHWEST_ROOMS,
        MAP_SS_AQUA_B1F,
    };

    int i;
    for (i = 0; i < NELEMS(sSSAquaMapIDs); ++i) {
        if (mapID == sSSAquaMapIDs[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov101_021E78EC(PokegearMapAppData *mapApp) {
    int i;
    MapMarkingsHeapNode *r0;
    RoamerSaveData *roamers;

    mapApp->pokegear->childAppdata = mapApp;
    mapApp->pokegear->reselectAppCB = ov101_021EB338;
    mapApp->pokegear->unknownCB = ov101_021EB2FC;
    MapApp_LoadMarkingsLinkedListFromSave(mapApp);
    if (mapApp->pokegear->app != GEAR_APP_CANCEL) {
        mapApp->unk_00C = 0;
        mapApp->pokegear->app = GEAR_APP_MAP;
        mapApp->unk_138_0 = sub_0202EEA4(mapApp->pokegear->savePokegear);
    } else {
        mapApp->unk_00C = 1;
        mapApp->unk_014 = mapApp->pokegear->unk_03C;
        mapApp->unk_138_0 = mapApp->unk_014.unk_01;
        if (mapApp->unk_014.unk_1A != EC_WORD_NULL) {
            r0 = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapApp->unk_014.unk_18);
            if (r0 == 0) {
                r0 = MapApp_GetOrCreateMarkingsHeapNodeByMapID(mapApp, mapApp->unk_014.unk_18);
            }
            MapMarkingsHeapNode_SetWord(r0, mapApp->unk_014.unk_02, mapApp->unk_014.unk_1A);
        }
        mapApp->pokegear->unk_038 = 0;
        mapApp->pokegear->app = GEAR_APP_MAP;
    }
    mapApp->unk_138_4 = FALSE;
    mapApp->unk_138_1 = 0;
    mapApp->mapUnlockLevel = Pokegear_GetMapUnlockLevel(mapApp->pokegear->savePokegear);
    mapApp->unk_038 = MapMatrix_MapData_New(mapApp->heapId);
    mapApp->phoneCallSave = SaveData_GetPhoneCallPersistentState(mapApp->pokegear->saveData);
    mapApp->phoneBook = AllocAndReadPhoneBook(mapApp->heapId);
    mapApp->phoneContact = SavePokegear_AllocAndCopyPhonebook(mapApp->pokegear->savePokegear, mapApp->heapId);
    mapApp->numPhonebookSlots = SavePokegear_FindEmptyPhonebookSlot(mapApp->pokegear->savePokegear);
    mapApp->matrixX = mapApp->pokegear->args->matrixXCoord;
    mapApp->matrixY = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->mapID = mapApp->pokegear->args->mapID;
    mapApp->playerGender = mapApp->pokegear->args->playerGender;
    mapApp->matrixX_2 = mapApp->pokegear->args->matrixXCoord;
    mapApp->matrixY_2 = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->unk_100 = 1;
    mapApp->unk_104 = 1;
    mapApp->maxXscroll = sMapXScrollLimits[mapApp->mapUnlockLevel];
    mapApp->unk_106 = 0x11;
    mapApp->unk_131 = 8;
    mapApp->unk_132 = 8;
    mapApp->unk_133 = 0;
    mapApp->unk_13D_1 = TRUE;
    mapApp->canFlyToGoldenrod = Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, FLYPOINT_GOLDENROD);
    mapApp->isMapSinjoh = IsMapSinjoh(mapApp->mapID);
    mapApp->isMapSSAqua = IsMapSSAqua(mapApp->mapID);

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
    FreeToHeap(mapApp->phoneContact);
    FreePhoneBook(mapApp->phoneBook);
    mapApp->pokegear->reselectAppCB = NULL;
    mapApp->pokegear->unknownCB = NULL;
    PokegearMap_FlattenMapMarkingsToSaveArray(mapApp);
    sub_0202EEA8(mapApp->pokegear->savePokegear, mapApp->unk_138_0);
}

int PokegearMap_MainTask_GraphicsInit(PokegearMapAppData *mapApp) {
    if (!PokegearMap_GraphicsInit(mapApp)) {
        return 0;
    }
    if (mapApp->pokegear->isSwitchApp) {
        return 6;
    } else {
        return 4;
    }
}

int PokegearMap_MainTask_HandleInput(PokegearMapAppData *mapApp) {
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

int PokegearMap_MainTask_GraphicsDeinit(PokegearMapAppData *mapApp) {
    if (!PokegearMaps_GraphicsDeinit(mapApp)) {
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

int PokegearMap_MainTask_FadeIn(PokegearMapAppData *mapApp) {
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

int PokegearMap_MainTask_FadeOut(PokegearMapAppData *mapApp) {
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

int PokegearMap_MainTask_FadeInApp(PokegearMapAppData *mapApp) {
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

int PokegearMap_MainTask_FadeOutApp(PokegearMapAppData *mapApp) {
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

const PokegearMapAppData_Sub214 ov101_021F7372[] = {
    {
     .mapId = MAP_SINJOH_RUINS_EXTERIOR,
     .x = 0x13,
     .y = 0x02,
     .width = 0x3,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00065,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x00,
     .tilemapUnk170DestWidth = 0x00,
     .tilemapUnk170DestHeight = 0x00,
     },
    {
     .mapId = MAP_SS_AQUA_1F,
     .x = 0x18,
     .y = 0x10,
     .width = 0x3,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00069,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x00,
     .tilemapUnk170DestWidth = 0x00,
     .tilemapUnk170DestHeight = 0x00,
     },
    {
     .mapId = MAP_ICE_PATH_1F,
     .x = 0x15,
     .y = 0x06,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00055,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 0x11,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00058,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0A,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 0x13,
     .y = 0x0C,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00058,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0C,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 0x14,
     .y = 0x08,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00058,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0D,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_SPROUT_TOWER_1F,
     .x = 0x0F,
     .y = 0x09,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00039,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_UNION_CAVE_1F,
     .x = 0x0E,
     .y = 0x0F,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00046,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x08,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_SLOWPOKE_WELL_ENTRANCE,
     .x = 0x0D,
     .y = 0x10,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00047,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ILEX_FOREST,
     .x = 0x0B,
     .y = 0x10,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00052,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_NATIONAL_PARK,
     .x = 0x0A,
     .y = 0x08,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00043,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x25,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_BELL_TOWER_1F,
     .x = 0x0C,
     .y = 0x06,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00040,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_BURNED_TOWER_1F,
     .x = 0x0B,
     .y = 0x06,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00042,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_MOUNT_MORTAR_1F_ENTRANCE,
     .x = 0x0E,
     .y = 0x07,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00054,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_WHIRL_ISLANDS_1F,
     .x = 0x07,
     .y = 0x0D,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00056,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x01,
     .unk_D = 0x2E,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_TOHJO_FALLS,
     .x = 0x17,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00061,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x06,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_VICTORY_ROAD_1F,
     .x = 0x1C,
     .y = 0x09,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00059,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x03,
     .unk_D = 0x25,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_VIRIDIAN_FOREST,
     .x = 0x20,
     .y = 0x07,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00062,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0F,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_DIGLETT_CAVE,
     .x = 0x20,
     .y = 0x06,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00033,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0F,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_DIGLETT_CAVE,
     .x = 0x2A,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00033,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1C,
     .unk_D = 0x2B,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_MOUNT_MOON,
     .x = 0x24,
     .y = 0x05,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00034,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x06,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_CERULEAN_CAVE_1F,
     .x = 0x28,
     .y = 0x05,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00035,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROCK_TUNNEL_1F,
     .x = 0x2C,
     .y = 0x06,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00036,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1F,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_10_POWER_PLANT_BROKEN,
     .x = 0x2C,
     .y = 0x07,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00067,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1F,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_SEAFOAM_ISLANDS_1F,
     .x = 0x23,
     .y = 0x11,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00038,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x06,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_BATTLE_FRONTIER,
     .x = 0x06,
     .y = 0x08,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00050,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x25,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_FUCHSIA_PAL_PARK_ENTRANCE,
     .x = 0x25,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00037,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_OLIVINE_LIGHTHOUSE_2F,
     .x = 0x09,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00048,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_PALLET,
     .x = 0x20,
     .y = 0x0D,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00010,
     .unk_7 = 0x01,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_VIRIDIAN,
     .x = 0x1F,
     .y = 0x09,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00011,
     .unk_7 = 0x02,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x23,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_PEWTER,
     .x = 0x20,
     .y = 0x04,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00012,
     .unk_7 = 0x03,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x23,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_CERULEAN,
     .x = 0x28,
     .y = 0x05,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00013,
     .unk_7 = 0x04,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x12,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_LAVENDER,
     .x = 0x2C,
     .y = 0x09,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00014,
     .unk_7 = 0x05,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_VERMILION,
     .x = 0x28,
     .y = 0x0B,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00015,
     .unk_7 = 0x06,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x23,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_CELADON,
     .x = 0x25,
     .y = 0x09,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00016,
     .unk_7 = 0x07,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x23,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_FUCHSIA,
     .x = 0x25,
     .y = 0x0E,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00017,
     .unk_7 = 0x08,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x12,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_CINNABAR_ISLAND,
     .x = 0x20,
     .y = 0x11,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00018,
     .unk_7 = 0x09,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_SAFFRON,
     .x = 0x28,
     .y = 0x08,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00020,
     .unk_7 = 0x0A,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x23,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_NEW_BARK,
     .x = 0x15,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00021,
     .unk_7 = 0x0B,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_CHERRYGROVE,
     .x = 0x10,
     .y = 0x0E,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00022,
     .unk_7 = 0x0C,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1A,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_VIOLET,
     .x = 0x0E,
     .y = 0x09,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00023,
     .unk_7 = 0x0D,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0E,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_AZALEA,
     .x = 0x0C,
     .y = 0x10,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00024,
     .unk_7 = 0x0E,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x16,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_CIANWOOD,
     .x = 0x05,
     .y = 0x0C,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00025,
     .unk_7 = 0x0F,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x03,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_GOLDENROD,
     .x = 0x09,
     .y = 0x0C,
     .width = 0x3,
     .height = 0x2,
     .objXoffset = 0x8,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00026,
     .unk_7 = 0x10,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1E,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x05,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_OLIVINE,
     .x = 0x08,
     .y = 0x09,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00027,
     .unk_7 = 0x11,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x06,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_ECRUTEAK,
     .x = 0x0B,
     .y = 0x06,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00028,
     .unk_7 = 0x12,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0A,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_MAHOGANY,
     .x = 0x10,
     .y = 0x07,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00029,
     .unk_7 = 0x13,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_BLACKTHORN,
     .x = 0x14,
     .y = 0x06,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00031,
     .unk_7 = 0x14,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0E,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_INDIGO_PLATEAU,
     .x = 0x1C,
     .y = 0x08,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00019,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_LAKE_OF_RAGE,
     .x = 0x0F,
     .y = 0x03,
     .width = 0x3,
     .height = 0x2,
     .objXoffset = 0x8,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00030,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1E,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x05,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_MOUNT_SILVER,
     .x = 0x19,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00057,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_RUINS_OF_ALPH_UNUSED,
     .x = 0x0D,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00045,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x03,
     .unk_D = 0x20,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_SAFARI_ZONE_GATE,
     .x = 0x02,
     .y = 0x0A,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00068,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x09,
     .unk_D = 0x25,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_1,
     .x = 0x20,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00070,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0F,
     .unk_D = 0x2E,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_2,
     .x = 0x20,
     .y = 0x08,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00071,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0F,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_3,
     .x = 0x22,
     .y = 0x05,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00072,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x19,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_4,
     .x = 0x25,
     .y = 0x05,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00073,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1C,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_5,
     .x = 0x28,
     .y = 0x07,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00074,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x19,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_6,
     .x = 0x28,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00075,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1A,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_7,
     .x = 0x27,
     .y = 0x09,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00076,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x18,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_8,
     .x = 0x2A,
     .y = 0x09,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00077,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1B,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_9,
     .x = 0x2A,
     .y = 0x06,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00078,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1D,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_10,
     .x = 0x2C,
     .y = 0x08,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00079,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1F,
     .unk_D = 0x2B,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_11,
     .x = 0x2B,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00080,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1D,
     .unk_D = 0x2B,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_12,
     .x = 0x2C,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00081,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1E,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_ROUTE_13,
     .x = 0x2A,
     .y = 0x0D,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00082,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1C,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_14,
     .x = 0x2A,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00083,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x1C,
     .unk_D = 0x2E,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_15,
     .x = 0x27,
     .y = 0x0F,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0xC,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00084,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x19,
     .unk_D = 0x2F,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_16,
     .x = 0x23,
     .y = 0x0A,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00085,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x17,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_17,
     .x = 0x23,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x4,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00086,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x17,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_ROUTE_18,
     .x = 0x23,
     .y = 0x0F,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00087,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x17,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_19,
     .x = 0x25,
     .y = 0x10,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00088,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x16,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_20,
     .x = 0x21,
     .y = 0x11,
     .width = 0x4,
     .height = 0x1,
     .objXoffset = 0x8,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00089,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x12,
     .unk_D = 0x2E,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_21,
     .x = 0x20,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00090,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x11,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_ROUTE_22,
     .x = 0x1D,
     .y = 0x0A,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00091,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x15,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_24,
     .x = 0x29,
     .y = 0x04,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00093,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x18,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_25,
     .x = 0x29,
     .y = 0x03,
     .width = 0x4,
     .height = 0x1,
     .objXoffset = 0xC,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00094,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x18,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x04,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_26,
     .x = 0x1C,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x4,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00095,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x14,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_ROUTE_27,
     .x = 0x16,
     .y = 0x0E,
     .width = 0x6,
     .height = 0x1,
     .objXoffset = 0xF,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00096,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0E,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x06,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_28,
     .x = 0x1A,
     .y = 0x0A,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00097,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x12,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_29,
     .x = 0x12,
     .y = 0x0E,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0xC,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00098,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0B,
     .unk_D = 0x2E,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_30,
     .x = 0x11,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00099,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0A,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x03,
     },
    {
     .mapId = MAP_ROUTE_31,
     .x = 0x10,
     .y = 0x0A,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x1,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00100,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x09,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_32,
     .x = 0x0E,
     .y = 0x0B,
     .width = 0x1,
     .height = 0x4,
     .objXoffset = 0x0,
     .objYoffset = 0xC,
     .flavorText = msg_0273_00101,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x08,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_ROUTE_33,
     .x = 0x0E,
     .y = 0x10,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00102,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x08,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_34,
     .x = 0x0B,
     .y = 0x0E,
     .width = 0x1,
     .height = 0x3,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00103,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x2B,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_35,
     .x = 0x0B,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00104,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x02,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_36,
     .x = 0x0B,
     .y = 0x09,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00105,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x02,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_37,
     .x = 0x0C,
     .y = 0x08,
     .width = 0x1,
     .height = 0x1,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00106,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x03,
     .unk_D = 0x2B,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_38,
     .x = 0x09,
     .y = 0x07,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00107,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x01,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_39,
     .x = 0x08,
     .y = 0x07,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00108,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_40,
     .x = 0x07,
     .y = 0x0A,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00109,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x01,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_41,
     .x = 0x06,
     .y = 0x0C,
     .width = 0x2,
     .height = 0x2,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00110,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x00,
     .unk_D = 0x2C,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_42,
     .x = 0x0D,
     .y = 0x07,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0x2,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00111,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x02,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_43,
     .x = 0x10,
     .y = 0x05,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00112,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x03,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_44,
     .x = 0x11,
     .y = 0x07,
     .width = 0x3,
     .height = 0x1,
     .objXoffset = 0x8,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00113,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x05,
     .unk_D = 0x2A,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_45,
     .x = 0x14,
     .y = 0x09,
     .width = 0x1,
     .height = 0x4,
     .objXoffset = 0x0,
     .objYoffset = 0x8,
     .flavorText = msg_0273_00114,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0D,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x04,
     },
    {
     .mapId = MAP_ROUTE_46,
     .x = 0x13,
     .y = 0x0D,
     .width = 0x1,
     .height = 0x2,
     .objXoffset = 0x0,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00115,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x0C,
     .unk_D = 0x2D,
     .tilemapUnk170DestWidth = 0x01,
     .tilemapUnk170DestHeight = 0x01,
     },
    {
     .mapId = MAP_ROUTE_47,
     .x = 0x02,
     .y = 0x0D,
     .width = 0x3,
     .height = 0x2,
     .objXoffset = 0x8,
     .objYoffset = 0x4,
     .flavorText = msg_0273_00116,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x20,
     .unk_D = 0x29,
     .tilemapUnk170DestWidth = 0x03,
     .tilemapUnk170DestHeight = 0x02,
     },
    {
     .mapId = MAP_ROUTE_48,
     .x = 0x02,
     .y = 0x0C,
     .width = 0x2,
     .height = 0x1,
     .objXoffset = 0x4,
     .objYoffset = 0x0,
     .flavorText = msg_0273_00117,
     .unk_7 = 0x00,
     .unk_8 = 0x00,
     .unk_9 = 0x00,
     .unk_A = 0x00,
     .unk_B = 0x00,
     .unk_C = 0x20,
     .unk_D = 0x28,
     .tilemapUnk170DestWidth = 0x02,
     .tilemapUnk170DestHeight = 0x01,
     },
};
