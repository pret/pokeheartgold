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

static BOOL IsMapSinjoh(u16 mapID);
static BOOL IsMapSSAqua(u16 mapID);
static void PokegearMap_InitInternal(PokegearMapAppData *mapApp);
static void PokegearMap_ExitInternal(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_LoadGFX(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_HandleInput(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_UnloadGFX(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_EnterMarkingMode(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_HandleInput_MarkingMode(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_ExitMarkingMode(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_FadeOutForWordSelect(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_FadeIn(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_FadeOut(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_FadeInApp(PokegearMapAppData *mapApp);
static int PokegearMap_MainTask_FadeOutApp(PokegearMapAppData *mapApp);

static const u16 sMapXScrollLimits[] = {
    26, // Johto only
    29, // Indigo Plateau
    45, // All of Kanto
};

BOOL PokegearMap_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    Heap_Create(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 196608);
    PokegearMapAppData *mapApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearMapAppData), HEAP_ID_POKEGEAR_APP);
    memset(mapApp, 0, sizeof(PokegearMapAppData));
    mapApp->pokegear = pokegearApp;
    mapApp->heapID = HEAP_ID_POKEGEAR_APP;
    PokegearMap_InitInternal(mapApp);
    mapApp->locationSpecs = sLocationSpecs;
    mapApp->numLocationSpecs = NELEMS(sLocationSpecs);
    return TRUE;
}

BOOL PokegearMap_Main(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    switch (*state) {
    case PGMAP_MAIN_STATE_LOAD:
        *state = PokegearMap_MainTask_LoadGFX(mapApp);
        break;
    case PGMAP_MAIN_STATE_HANDLE_INPUT:
        *state = PokegearMap_MainTask_HandleInput(mapApp);
        break;
    case PGMAP_MAIN_STATE_UNLOAD:
        *state = PokegearMap_MainTask_UnloadGFX(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_IN:
        *state = PokegearMap_MainTask_FadeIn(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_OUT:
        *state = PokegearMap_MainTask_FadeOut(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_IN_APP:
        *state = PokegearMap_MainTask_FadeInApp(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_OUT_APP:
        *state = PokegearMap_MainTask_FadeOutApp(mapApp);
        break;
    case PGMAP_MAIN_STATE_ENTER_MARKING_MODE:
        *state = PokegearMap_MainTask_EnterMarkingMode(mapApp);
        break;
    case PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE:
        *state = PokegearMap_MainTask_HandleInput_MarkingMode(mapApp);
        break;
    case PGMAP_MAIN_STATE_EXIT_MARKING_MODE:
        *state = PokegearMap_MainTask_ExitMarkingMode(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_OUT_FOR_WORD_SELECT:
        *state = PokegearMap_MainTask_FadeOutForWordSelect(mapApp);
        break;
    case PGMAP_MAIN_STATE_QUIT:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearMap_Exit(OverlayManager *man, int *state) {
    enum HeapID heapID;
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    PokegearMap_ExitInternal(mapApp);
    MapMatrix_MapData_Free(mapApp->mapData);
    if (mapApp->pokegear->appReturnCode != GEAR_RETURN_CANCEL) {
        mapApp->pokegear->isSwitchApp = TRUE;
    }
    heapID = mapApp->heapID;
    OverlayManager_FreeData(man);
    Heap_Destroy(heapID);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    return TRUE;
}

static BOOL IsMapSinjoh(u16 mapID) {
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

static BOOL IsMapSSAqua(u16 mapID) {
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

static void PokegearMap_InitInternal(PokegearMapAppData *mapApp) {
    int i;
    MapMarkingsHeapNode *mapMarkingsHeapNode;
    RoamerSaveData *roamers;

    mapApp->pokegear->childAppdata = mapApp;
    mapApp->pokegear->reselectAppCB = PokegearMap_ShowMapCursor;
    mapApp->pokegear->deselectAppCB = PokegearMap_DeselectApp;
    MapApp_LoadMarkingsListFromSave(mapApp);
    if (mapApp->pokegear->app != GEAR_APP_CANCEL) {
        mapApp->inMarkingsMode = FALSE;
        mapApp->pokegear->app = GEAR_APP_MAP;
        mapApp->zoomed = sub_0202EEA4(mapApp->pokegear->savePokegear);
    } else {
        mapApp->inMarkingsMode = TRUE;
        mapApp->sessionState = mapApp->pokegear->mapSessionState;
        mapApp->zoomed = mapApp->sessionState.zoomed;
        if (mapApp->sessionState.word != EC_WORD_NULL) {
            mapMarkingsHeapNode = MapApp_GetMarkingsHeapNodeByMapID(mapApp, mapApp->sessionState.mapID);
            if (mapMarkingsHeapNode == NULL) {
                mapMarkingsHeapNode = MapApp_GetOrCreateMarkingsHeapNodeByMapID(mapApp, mapApp->sessionState.mapID);
            }
            MapMarkingsHeapNode_SetWord(mapMarkingsHeapNode, mapApp->sessionState.index, mapApp->sessionState.word);
        }
        mapApp->pokegear->unk_038 = 0;
        mapApp->pokegear->app = GEAR_APP_MAP;
    }
    mapApp->unk_138_4 = FALSE;
    mapApp->unk_138_1 = 0;
    mapApp->mapUnlockLevel = Pokegear_GetMapUnlockLevel(mapApp->pokegear->savePokegear);
    mapApp->mapData = MapMatrix_MapData_New(mapApp->heapID);
    mapApp->phoneCallSave = SaveData_GetPhoneCallPersistentState(mapApp->pokegear->saveData);
    mapApp->phoneBook = AllocAndReadPhoneBook(mapApp->heapID);
    mapApp->phoneContact = SavePokegear_AllocAndCopyPhonebook(mapApp->pokegear->savePokegear, mapApp->heapID);
    mapApp->numPhonebookSlots = SavePokegear_FindEmptyPhonebookSlot(mapApp->pokegear->savePokegear);
    mapApp->matrixX = mapApp->pokegear->args->matrixXCoord;
    mapApp->matrixY = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->mapID = mapApp->pokegear->args->mapID;
    mapApp->playerGender = mapApp->pokegear->args->playerGender;
    mapApp->playerX = mapApp->pokegear->args->matrixXCoord;
    mapApp->playerY = mapApp->pokegear->args->matrixYCoord + 2;
    mapApp->minXscroll = 1;
    mapApp->minYscroll = 1;
    mapApp->maxXscroll = sMapXScrollLimits[mapApp->mapUnlockLevel];
    mapApp->maxYscroll = 17;
    mapApp->centerY = 8;
    mapApp->centerX = 8;
    mapApp->yOffset = 0;
    mapApp->canSeeSafariZone = TRUE;
    mapApp->canFlyToCianwood = Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, FLYPOINT_CIANWOOD);
    mapApp->isMapSinjoh = IsMapSinjoh(mapApp->mapID);
    mapApp->isMapSSAqua = IsMapSSAqua(mapApp->mapID);

    roamers = Save_Roamers_Get(mapApp->pokegear->saveData);
    for (i = 0; i < ROAMER_MAX; ++i) {
        if (GetRoamerIsActiveByIndex(roamers, i)) {
            mapApp->roamerLocations[i] = GetRoamerData(Roamers_GetRoamMonStats(roamers, i), ROAMER_DATA_MET_LOCATION);
        } else {
            mapApp->roamerLocations[i] = SPECIES_NONE;
        }
    }
}

static void PokegearMap_ExitInternal(PokegearMapAppData *mapApp) {
    Heap_Free(mapApp->phoneContact);
    FreePhoneBook(mapApp->phoneBook);
    mapApp->pokegear->reselectAppCB = NULL;
    mapApp->pokegear->deselectAppCB = NULL;
    PokegearMap_SaveMapMarkings(mapApp);
    sub_0202EEA8(mapApp->pokegear->savePokegear, mapApp->zoomed);
}

static int PokegearMap_MainTask_LoadGFX(PokegearMapAppData *mapApp) {
    if (!PokegearMap_LoadGFX(mapApp)) {
        return PGMAP_MAIN_STATE_LOAD;
    }
    if (mapApp->pokegear->isSwitchApp) {
        return PGMAP_MAIN_STATE_FADE_IN_APP;
    } else {
        return PGMAP_MAIN_STATE_FADE_IN;
    }
}

static int PokegearMap_MainTask_HandleInput(PokegearMapAppData *mapApp) {
    BOOL isTouch = FALSE;
    int input;

    input = PokegearMap_HandleTouchInput(mapApp, &isTouch);
    if (!isTouch) {
        PokegearApp_HandleInputModeChangeToButtons(mapApp->pokegear);
        if (mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
            input = PokegearApp_HandleKeyInput_SwitchApps(mapApp->pokegear);
        } else {
            input = PokegearMap_HandleKeyInput(mapApp);
        }
    }
    mapApp->pokegear->appReturnCode = input;
    switch (input) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_7:
        return PGMAP_MAIN_STATE_ENTER_MARKING_MODE;
    case GEAR_RETURN_4:
        return PGMAP_MAIN_STATE_FADE_OUT;
    default:
        return PGMAP_MAIN_STATE_FADE_OUT_APP;
    }

    return PGMAP_MAIN_STATE_HANDLE_INPUT;
}

static int PokegearMap_MainTask_UnloadGFX(PokegearMapAppData *mapApp) {
    if (!PokegearMap_UnloadGFX(mapApp)) {
        return PGMAP_MAIN_STATE_UNLOAD;
    }
    mapApp->pokegear->mapSessionState = mapApp->sessionState;
    return PGMAP_MAIN_STATE_QUIT;
}

static int PokegearMap_MainTask_EnterMarkingMode(PokegearMapAppData *mapApp) {
    if (PokegearMap_AnimateSwitchToMarkingMode(mapApp)) {
        return PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE;
    } else {
        return PGMAP_MAIN_STATE_ENTER_MARKING_MODE;
    }
}

static int PokegearMap_MainTask_HandleInput_MarkingMode(PokegearMapAppData *mapApp) {
    int input = -1;
    BOOL isTouch = FALSE;

    switch (mapApp->draggingType) {
    case PGMAP_DRAG_NONE:
        input = PokegearMap_HandleTouchInput_SelectMarkingsSlot(mapApp, &isTouch);
        break;
    case PGMAP_DRAG_FROM_POOL:
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_BUTTONS) {
            input = PokegearMap_HandleTouchInput_DragItemFromPool(mapApp);
            isTouch = TRUE;
        }
        break;
    case PGMAP_DRAG_FROM_SET:
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_BUTTONS) {
            input = PokegearMap_HandleTouchInput_DragMarkingSlot(mapApp);
            isTouch = TRUE;
        }
        break;
    }
    if (isTouch) {
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearMap_InMarkingsMode_HideCursor(mapApp);
        }
        mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        if (input >= 0) {
            return input;
        } else {
            return PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE;
        }
    }
    if (PokegearApp_HandleInputModeChangeToButtons(mapApp->pokegear) && mapApp->pokegear->menuInputState != mapApp->pokegear->menuInputStateBak) {
        PokegearMap_InMarkingsMode_ShowCursor(mapApp);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE;
    }

    switch (mapApp->draggingType) {
    case PGMAP_DRAG_NONE:
        input = PokegearMap_HandleKeyInput_SelectMarkingsSlot(mapApp);
        break;
    case PGMAP_DRAG_FROM_POOL:
        input = PokegearMap_HandleKeyInput_SelectedIconFromPool(mapApp);
        break;
    case PGMAP_DRAG_FROM_SET:
        input = PokegearMap_HandleKeyInput_SelectedMarkingSlot(mapApp);
        break;
    }
    if (input < 0) {
        input = PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE;
    }
    return input;
}

static int PokegearMap_MainTask_ExitMarkingMode(PokegearMapAppData *mapApp) {
    if (PokegearMap_AnimateSwitchFromMarkingMode(mapApp)) {
        return PGMAP_MAIN_STATE_HANDLE_INPUT;
    } else {
        return PGMAP_MAIN_STATE_EXIT_MARKING_MODE;
    }
}

static int PokegearMap_MainTask_FadeOutForWordSelect(PokegearMapAppData *mapApp) {
    mapApp->pokegear->isSwitchApp = FALSE;
    mapApp->pokegear->appReturnCode = GEAR_RETURN_CANCEL;
    return PGMAP_MAIN_STATE_FADE_OUT;
}

static int PokegearMap_MainTask_FadeIn(PokegearMapAppData *mapApp) {
    int i;

    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, mapApp->heapID);
        if (mapApp->inMarkingsMode == 1) {
            for (i = 0; i < 4; ++i) {
                ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
            }
        } else {
            for (i = 0; i < 8; ++i) {
                ToggleBgLayer(i, TRUE);
            }
        }
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 224, 0, 0);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 64, 192, 0, 0);
        PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        ++mapApp->state;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            mapApp->state = 0;
            if (mapApp->inMarkingsMode == 1) {
                return PGMAP_MAIN_STATE_HANDLE_INPUT_MARKING_MODE;
            } else {
                return PGMAP_MAIN_STATE_HANDLE_INPUT;
            }
        }
        break;
    }

    return PGMAP_MAIN_STATE_FADE_IN;
}

static int PokegearMap_MainTask_FadeOut(PokegearMapAppData *mapApp) {
    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, mapApp->heapID);
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
            return PGMAP_MAIN_STATE_UNLOAD;
        }
        break;
    }

    return PGMAP_MAIN_STATE_FADE_OUT;
}

static int PokegearMap_MainTask_FadeInApp(PokegearMapAppData *mapApp) {
    BOOL plltFadeDone;
    BOOL scrollDone;

    switch (mapApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        mapApp->fadeStep = 0;
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), SCREEN_MASK_MAIN);
        ++mapApp->state;
        break;
    case 1:
        plltFadeDone = PokegearMap_FadeMapScreen(mapApp, 0);
        scrollDone = PokegearMap_RunScrollMarkingsPanelTopScreen(mapApp, 0);
        if (plltFadeDone && scrollDone) {
            ++mapApp->state;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        mapApp->state = 0;
        mapApp->markingsPanelScrollActive = 0;
        return PGMAP_MAIN_STATE_HANDLE_INPUT;
    }

    return PGMAP_MAIN_STATE_FADE_IN_APP;
}

static int PokegearMap_MainTask_FadeOutApp(PokegearMapAppData *mapApp) {
    int i;
    BOOL r4;
    BOOL r0;

    switch (mapApp->state) {
    case 0:
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, TRUE);
        for (i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, TRUE);
        }
        PokegearMap_BeginScrollMarkingsPanelTopScreen(mapApp, 1);
        mapApp->fadeStep = 0;
        ++mapApp->state;
        break;
    case 1:
        r4 = PokegearMap_FadeMapScreen(mapApp, 1);
        r0 = PokegearMap_RunScrollMarkingsPanelTopScreen(mapApp, 1);
        if (r4 && r0) {
            ++mapApp->state;
        }
        break;
    case 2:
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 224, 16, 0);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 64, 192, 16, 0);
        PaletteData_PushTransparentBuffers(mapApp->pokegear->plttData);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_MAIN_1, FALSE);
        }
        PaletteData_SetAutoTransparent(mapApp->pokegear->plttData, FALSE);
        mapApp->state = 0;
        mapApp->markingsPanelScrollActive = 0;
        return PGMAP_MAIN_STATE_UNLOAD;
    }

    return PGMAP_MAIN_STATE_FADE_OUT_APP;
}

const PokegearMapLocationSpec sLocationSpecs[PGMAP_NUM_LOCATIONS] = {
    {
     .mapId = MAP_SINJOH_RUINS_EXTERIOR,
     .x = 19,
     .y = 2,
     .width = 3,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00065,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 0,
     .selectedIconTilemapWidth = 0,
     .selectedIconTilemapHeight = 0,
     },
    {
     .mapId = MAP_SS_AQUA_1F,
     .x = 24,
     .y = 16,
     .width = 3,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00069,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 0,
     .selectedIconTilemapWidth = 0,
     .selectedIconTilemapHeight = 0,
     },
    {
     .mapId = MAP_ICE_PATH_1F,
     .x = 21,
     .y = 6,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00055,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 17,
     .y = 10,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00058,
     .miniMapId = 0,
     .selectedIconTilemapX = 10,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 19,
     .y = 12,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00058,
     .miniMapId = 0,
     .selectedIconTilemapX = 12,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .x = 20,
     .y = 8,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00058,
     .miniMapId = 0,
     .selectedIconTilemapX = 13,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_SPROUT_TOWER_1F,
     .x = 15,
     .y = 9,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00039,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_UNION_CAVE_1F,
     .x = 14,
     .y = 15,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00046,
     .miniMapId = 0,
     .selectedIconTilemapX = 8,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_SLOWPOKE_WELL_ENTRANCE,
     .x = 13,
     .y = 16,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00047,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ILEX_FOREST,
     .x = 11,
     .y = 16,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00052,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_NATIONAL_PARK,
     .x = 10,
     .y = 8,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00043,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 37,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_BELL_TOWER_1F,
     .x = 12,
     .y = 6,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00040,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_BURNED_TOWER_1F,
     .x = 11,
     .y = 6,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00042,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_MOUNT_MORTAR_1F_ENTRANCE,
     .x = 14,
     .y = 7,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00054,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_WHIRL_ISLANDS_1F,
     .x = 7,
     .y = 13,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00056,
     .miniMapId = 0,
     .selectedIconTilemapX = 1,
     .selectedIconTilemapY = 46,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_TOHJO_FALLS,
     .x = 23,
     .y = 14,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00061,
     .miniMapId = 0,
     .selectedIconTilemapX = 6,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_VICTORY_ROAD_1F,
     .x = 28,
     .y = 9,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00059,
     .miniMapId = 0,
     .selectedIconTilemapX = 3,
     .selectedIconTilemapY = 37,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_VIRIDIAN_FOREST,
     .x = 32,
     .y = 7,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00062,
     .miniMapId = 0,
     .selectedIconTilemapX = 15,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_DIGLETT_CAVE,
     .x = 32,
     .y = 6,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00033,
     .miniMapId = 0,
     .selectedIconTilemapX = 15,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_DIGLETT_CAVE,
     .x = 42,
     .y = 11,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00033,
     .miniMapId = 0,
     .selectedIconTilemapX = 28,
     .selectedIconTilemapY = 43,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_MOUNT_MOON,
     .x = 36,
     .y = 5,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00034,
     .miniMapId = 0,
     .selectedIconTilemapX = 6,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_CERULEAN_CAVE_1F,
     .x = 40,
     .y = 5,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00035,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROCK_TUNNEL_1F,
     .x = 44,
     .y = 6,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00036,
     .miniMapId = 0,
     .selectedIconTilemapX = 31,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_10_POWER_PLANT_BROKEN,
     .x = 44,
     .y = 7,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00067,
     .miniMapId = 0,
     .selectedIconTilemapX = 31,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_SEAFOAM_ISLANDS_1F,
     .x = 35,
     .y = 17,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00038,
     .miniMapId = 0,
     .selectedIconTilemapX = 6,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_BATTLE_FRONTIER,
     .x = 6,
     .y = 8,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00050,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 37,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_FUCHSIA_PAL_PARK_ENTRANCE,
     .x = 37,
     .y = 14,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00037,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_OLIVINE_LIGHTHOUSE_2F,
     .x = 9,
     .y = 10,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00048,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_PALLET,
     .x = 32,
     .y = 13,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00010,
     .miniMapId = 1,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_VIRIDIAN,
     .x = 31,
     .y = 9,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00011,
     .miniMapId = 2,
     .selectedIconTilemapX = 35,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_PEWTER,
     .x = 32,
     .y = 4,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00012,
     .miniMapId = 3,
     .selectedIconTilemapX = 35,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_CERULEAN,
     .x = 40,
     .y = 5,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 8,
     .flavorText = msg_0273_00013,
     .miniMapId = 4,
     .selectedIconTilemapX = 18,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_LAVENDER,
     .x = 44,
     .y = 9,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00014,
     .miniMapId = 5,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_VERMILION,
     .x = 40,
     .y = 11,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00015,
     .miniMapId = 6,
     .selectedIconTilemapX = 35,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_CELADON,
     .x = 37,
     .y = 9,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00016,
     .miniMapId = 7,
     .selectedIconTilemapX = 35,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_FUCHSIA,
     .x = 37,
     .y = 14,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 8,
     .flavorText = msg_0273_00017,
     .miniMapId = 8,
     .selectedIconTilemapX = 18,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_CINNABAR_ISLAND,
     .x = 32,
     .y = 17,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00018,
     .miniMapId = 9,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_SAFFRON,
     .x = 40,
     .y = 8,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00020,
     .miniMapId = 10,
     .selectedIconTilemapX = 35,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_NEW_BARK,
     .x = 21,
     .y = 14,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00021,
     .miniMapId = 11,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_CHERRYGROVE,
     .x = 16,
     .y = 14,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00022,
     .miniMapId = 12,
     .selectedIconTilemapX = 26,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_VIOLET,
     .x = 14,
     .y = 9,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 8,
     .flavorText = msg_0273_00023,
     .miniMapId = 13,
     .selectedIconTilemapX = 14,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_AZALEA,
     .x = 12,
     .y = 16,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00024,
     .miniMapId = 14,
     .selectedIconTilemapX = 22,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_CIANWOOD,
     .x = 5,
     .y = 12,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00025,
     .miniMapId = 15,
     .selectedIconTilemapX = 3,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_GOLDENROD,
     .x = 9,
     .y = 12,
     .width = 3,
     .height = 2,
     .objXoffset = 8,
     .objYoffset = 4,
     .flavorText = msg_0273_00026,
     .miniMapId = 16,
     .selectedIconTilemapX = 30,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 5,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_OLIVINE,
     .x = 8,
     .y = 9,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00027,
     .miniMapId = 17,
     .selectedIconTilemapX = 6,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_ECRUTEAK,
     .x = 11,
     .y = 6,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 8,
     .flavorText = msg_0273_00028,
     .miniMapId = 18,
     .selectedIconTilemapX = 10,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_MAHOGANY,
     .x = 16,
     .y = 7,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00029,
     .miniMapId = 19,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_BLACKTHORN,
     .x = 20,
     .y = 6,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 8,
     .flavorText = msg_0273_00031,
     .miniMapId = 20,
     .selectedIconTilemapX = 14,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_INDIGO_PLATEAU,
     .x = 28,
     .y = 8,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00019,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_LAKE_OF_RAGE,
     .x = 15,
     .y = 3,
     .width = 3,
     .height = 2,
     .objXoffset = 8,
     .objYoffset = 4,
     .flavorText = msg_0273_00030,
     .miniMapId = 0,
     .selectedIconTilemapX = 30,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 5,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_MOUNT_SILVER,
     .x = 25,
     .y = 10,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00057,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_RUINS_OF_ALPH_UNUSED,
     .x = 13,
     .y = 10,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00045,
     .miniMapId = 0,
     .selectedIconTilemapX = 3,
     .selectedIconTilemapY = 32,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_SAFARI_ZONE_GATE,
     .x = 2,
     .y = 10,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 4,
     .flavorText = msg_0273_00068,
     .miniMapId = 0,
     .selectedIconTilemapX = 9,
     .selectedIconTilemapY = 37,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_1,
     .x = 32,
     .y = 11,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00070,
     .miniMapId = 0,
     .selectedIconTilemapX = 15,
     .selectedIconTilemapY = 46,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_2,
     .x = 32,
     .y = 8,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00071,
     .miniMapId = 0,
     .selectedIconTilemapX = 15,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_3,
     .x = 34,
     .y = 5,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00072,
     .miniMapId = 0,
     .selectedIconTilemapX = 25,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_4,
     .x = 37,
     .y = 5,
     .width = 3,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00073,
     .miniMapId = 0,
     .selectedIconTilemapX = 28,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_5,
     .x = 40,
     .y = 7,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00074,
     .miniMapId = 0,
     .selectedIconTilemapX = 25,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_6,
     .x = 40,
     .y = 10,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00075,
     .miniMapId = 0,
     .selectedIconTilemapX = 26,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_7,
     .x = 39,
     .y = 9,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00076,
     .miniMapId = 0,
     .selectedIconTilemapX = 24,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_8,
     .x = 42,
     .y = 9,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00077,
     .miniMapId = 0,
     .selectedIconTilemapX = 27,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_9,
     .x = 42,
     .y = 6,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00078,
     .miniMapId = 0,
     .selectedIconTilemapX = 29,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_10,
     .x = 44,
     .y = 8,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00079,
     .miniMapId = 0,
     .selectedIconTilemapX = 31,
     .selectedIconTilemapY = 43,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_11,
     .x = 43,
     .y = 11,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00080,
     .miniMapId = 0,
     .selectedIconTilemapX = 29,
     .selectedIconTilemapY = 43,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_12,
     .x = 44,
     .y = 10,
     .width = 1,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00081,
     .miniMapId = 0,
     .selectedIconTilemapX = 30,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_ROUTE_13,
     .x = 42,
     .y = 13,
     .width = 3,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00082,
     .miniMapId = 0,
     .selectedIconTilemapX = 28,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_14,
     .x = 42,
     .y = 14,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00083,
     .miniMapId = 0,
     .selectedIconTilemapX = 28,
     .selectedIconTilemapY = 46,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_15,
     .x = 39,
     .y = 15,
     .width = 3,
     .height = 1,
     .objXoffset = 12,
     .objYoffset = 0,
     .flavorText = msg_0273_00084,
     .miniMapId = 0,
     .selectedIconTilemapX = 25,
     .selectedIconTilemapY = 47,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_16,
     .x = 35,
     .y = 10,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00085,
     .miniMapId = 0,
     .selectedIconTilemapX = 23,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_17,
     .x = 35,
     .y = 11,
     .width = 1,
     .height = 4,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00086,
     .miniMapId = 0,
     .selectedIconTilemapX = 23,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_ROUTE_18,
     .x = 35,
     .y = 15,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00087,
     .miniMapId = 0,
     .selectedIconTilemapX = 23,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_19,
     .x = 37,
     .y = 16,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00088,
     .miniMapId = 0,
     .selectedIconTilemapX = 22,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_20,
     .x = 33,
     .y = 17,
     .width = 4,
     .height = 1,
     .objXoffset = 8,
     .objYoffset = 0,
     .flavorText = msg_0273_00089,
     .miniMapId = 0,
     .selectedIconTilemapX = 18,
     .selectedIconTilemapY = 46,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_21,
     .x = 32,
     .y = 14,
     .width = 1,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00090,
     .miniMapId = 0,
     .selectedIconTilemapX = 17,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_ROUTE_22,
     .x = 29,
     .y = 10,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00091,
     .miniMapId = 0,
     .selectedIconTilemapX = 21,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_24,
     .x = 41,
     .y = 4,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00093,
     .miniMapId = 0,
     .selectedIconTilemapX = 24,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_25,
     .x = 41,
     .y = 3,
     .width = 4,
     .height = 1,
     .objXoffset = 12,
     .objYoffset = 0,
     .flavorText = msg_0273_00094,
     .miniMapId = 0,
     .selectedIconTilemapX = 24,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 4,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_26,
     .x = 28,
     .y = 11,
     .width = 1,
     .height = 4,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00095,
     .miniMapId = 0,
     .selectedIconTilemapX = 20,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_ROUTE_27,
     .x = 22,
     .y = 14,
     .width = 6,
     .height = 1,
     .objXoffset = 15,
     .objYoffset = 0,
     .flavorText = msg_0273_00096,
     .miniMapId = 0,
     .selectedIconTilemapX = 14,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 6,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_28,
     .x = 26,
     .y = 10,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00097,
     .miniMapId = 0,
     .selectedIconTilemapX = 18,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_29,
     .x = 18,
     .y = 14,
     .width = 3,
     .height = 1,
     .objXoffset = 12,
     .objYoffset = 0,
     .flavorText = msg_0273_00098,
     .miniMapId = 0,
     .selectedIconTilemapX = 11,
     .selectedIconTilemapY = 46,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_30,
     .x = 17,
     .y = 11,
     .width = 1,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00099,
     .miniMapId = 0,
     .selectedIconTilemapX = 10,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 3,
     },
    {
     .mapId = MAP_ROUTE_31,
     .x = 16,
     .y = 10,
     .width = 2,
     .height = 1,
     .objXoffset = 1,
     .objYoffset = 0,
     .flavorText = msg_0273_00100,
     .miniMapId = 0,
     .selectedIconTilemapX = 9,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_32,
     .x = 14,
     .y = 11,
     .width = 1,
     .height = 4,
     .objXoffset = 0,
     .objYoffset = 12,
     .flavorText = msg_0273_00101,
     .miniMapId = 0,
     .selectedIconTilemapX = 8,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_ROUTE_33,
     .x = 14,
     .y = 16,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00102,
     .miniMapId = 0,
     .selectedIconTilemapX = 8,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_34,
     .x = 11,
     .y = 14,
     .width = 1,
     .height = 3,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00103,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 43,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_35,
     .x = 11,
     .y = 10,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00104,
     .miniMapId = 0,
     .selectedIconTilemapX = 2,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_36,
     .x = 11,
     .y = 9,
     .width = 3,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00105,
     .miniMapId = 0,
     .selectedIconTilemapX = 2,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_37,
     .x = 12,
     .y = 8,
     .width = 1,
     .height = 1,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00106,
     .miniMapId = 0,
     .selectedIconTilemapX = 3,
     .selectedIconTilemapY = 43,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_38,
     .x = 9,
     .y = 7,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00107,
     .miniMapId = 0,
     .selectedIconTilemapX = 1,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_39,
     .x = 8,
     .y = 7,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00108,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_40,
     .x = 7,
     .y = 10,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00109,
     .miniMapId = 0,
     .selectedIconTilemapX = 1,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_41,
     .x = 6,
     .y = 12,
     .width = 2,
     .height = 2,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00110,
     .miniMapId = 0,
     .selectedIconTilemapX = 0,
     .selectedIconTilemapY = 44,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_42,
     .x = 13,
     .y = 7,
     .width = 3,
     .height = 1,
     .objXoffset = 2,
     .objYoffset = 0,
     .flavorText = msg_0273_00111,
     .miniMapId = 0,
     .selectedIconTilemapX = 2,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_43,
     .x = 16,
     .y = 5,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 4,
     .flavorText = msg_0273_00112,
     .miniMapId = 0,
     .selectedIconTilemapX = 3,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_44,
     .x = 17,
     .y = 7,
     .width = 3,
     .height = 1,
     .objXoffset = 8,
     .objYoffset = 0,
     .flavorText = msg_0273_00113,
     .miniMapId = 0,
     .selectedIconTilemapX = 5,
     .selectedIconTilemapY = 42,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_45,
     .x = 20,
     .y = 9,
     .width = 1,
     .height = 4,
     .objXoffset = 0,
     .objYoffset = 8,
     .flavorText = msg_0273_00114,
     .miniMapId = 0,
     .selectedIconTilemapX = 13,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 4,
     },
    {
     .mapId = MAP_ROUTE_46,
     .x = 19,
     .y = 13,
     .width = 1,
     .height = 2,
     .objXoffset = 0,
     .objYoffset = 0,
     .flavorText = msg_0273_00115,
     .miniMapId = 0,
     .selectedIconTilemapX = 12,
     .selectedIconTilemapY = 45,
     .selectedIconTilemapWidth = 1,
     .selectedIconTilemapHeight = 1,
     },
    {
     .mapId = MAP_ROUTE_47,
     .x = 2,
     .y = 13,
     .width = 3,
     .height = 2,
     .objXoffset = 8,
     .objYoffset = 4,
     .flavorText = msg_0273_00116,
     .miniMapId = 0,
     .selectedIconTilemapX = 32,
     .selectedIconTilemapY = 41,
     .selectedIconTilemapWidth = 3,
     .selectedIconTilemapHeight = 2,
     },
    {
     .mapId = MAP_ROUTE_48,
     .x = 2,
     .y = 12,
     .width = 2,
     .height = 1,
     .objXoffset = 4,
     .objYoffset = 0,
     .flavorText = msg_0273_00117,
     .miniMapId = 0,
     .selectedIconTilemapX = 32,
     .selectedIconTilemapY = 40,
     .selectedIconTilemapWidth = 2,
     .selectedIconTilemapHeight = 1,
     },
};

const MapFlypointParam gMapFlypointParams[] = {
    { MAP_PALLET,           MAP_PALLET,                          FLYPOINT_PALLET,       0,    32, 11, 0,  20, 1, 1, 3, 3, 1, 1 },
    { MAP_VIRIDIAN,         MAP_VIRIDIAN,                        FLYPOINT_VIRIDIAN,     1,    31, 7,  5,  20, 2, 2, 4, 4, 1, 1 },
    { MAP_PEWTER,           MAP_PEWTER,                          FLYPOINT_PEWTER,       2,    32, 2,  10, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CERULEAN,         MAP_CERULEAN,                        FLYPOINT_CERULEAN,     3,    40, 3,  15, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_LAVENDER,         MAP_LAVENDER,                        FLYPOINT_LAVENDER,     4,    44, 7,  20, 20, 1, 1, 3, 3, 1, 1 },
    { MAP_VERMILION,        MAP_VERMILION,                       FLYPOINT_VERMILION,    5,    40, 9,  25, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CELADON,          MAP_CELADON,                         FLYPOINT_CELADON,      6,    37, 7,  30, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_FUCHSIA,          MAP_FUCHSIA,                         FLYPOINT_FUCHSIA,      7,    37, 12, 35, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CINNABAR_ISLAND,  MAP_CINNABAR_ISLAND,                 FLYPOINT_CINNABAR,     8,    32, 15, 0,  24, 1, 1, 3, 3, 1, 1 },
    { MAP_INDIGO_PLATEAU,   MAP_INDIGO_PLATEAU,                  FLYPOINT_INDIGO,       0xFF, 28, 6,  0,  0,  1, 1, 0, 0, 0, 0 },
    { MAP_SAFFRON,          MAP_SAFFRON,                         FLYPOINT_SAFFRON,      9,    40, 6,  5,  24, 2, 2, 4, 4, 1, 1 },
    { MAP_NEW_BARK,         MAP_NEW_BARK,                        FLYPOINT_NEW_BARK,     10,   21, 12, 11, 25, 1, 1, 1, 1, 0, 0 },
    { MAP_CHERRYGROVE,      MAP_CHERRYGROVE,                     FLYPOINT_CHERRYGROVE,  11,   16, 12, 15, 24, 2, 1, 4, 3, 1, 1 },
    { MAP_VIOLET,           MAP_VIOLET,                          FLYPOINT_VIOLET,       12,   14, 7,  20, 24, 2, 2, 3, 4, 0, 1 },
    { MAP_AZALEA,           MAP_AZALEA,                          FLYPOINT_AZALEA,       13,   12, 14, 25, 24, 2, 1, 4, 3, 1, 1 },
    { MAP_CIANWOOD,         MAP_CIANWOOD,                        FLYPOINT_CIANWOOD,     14,   5,  10, 30, 24, 1, 2, 3, 4, 1, 1 },
    { MAP_GOLDENROD,        MAP_GOLDENROD,                       FLYPOINT_GOLDENROD,    15,   9,  10, 35, 24, 3, 2, 5, 4, 1, 1 },
    { MAP_OLIVINE,          MAP_OLIVINE,                         FLYPOINT_OLIVINE,      16,   8,  7,  0,  28, 2, 2, 4, 4, 1, 1 },
    { MAP_ECRUTEAK,         MAP_ECRUTEAK,                        FLYPOINT_ECRUTEAK,     17,   11, 4,  5,  28, 2, 2, 4, 4, 1, 1 },
    { MAP_MAHOGANY,         MAP_MAHOGANY,                        FLYPOINT_MAHOGANY,     18,   16, 5,  10, 28, 1, 1, 3, 3, 1, 1 },
    { MAP_BLACKTHORN,       MAP_BLACKTHORN,                      FLYPOINT_BLACKTHORN,   19,   20, 4,  15, 28, 2, 2, 4, 4, 1, 1 },
    { MAP_LAKE_OF_RAGE,     MAP_LAKE_OF_RAGE,                    FLYPOINT_LAKE_OF_RAGE, 0xFF, 15, 1,  0,  0,  3, 2, 0, 0, 0, 0 },
    { MAP_MOUNT_SILVER,     MAP_MOUNT_SILVER,                    FLYPOINT_MT_SILVER,    0xFF, 25, 8,  0,  0,  1, 1, 0, 0, 0, 0 },
    { MAP_SAFARI_ZONE_GATE, MAP_SAFARI_ZONE_GATE,                FLYPOINT_SAFARI,       0xFF, 2,  8,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_BATTLE_FRONTIER,  MAP_BATTLE_FRONTIER_FRONTIER_ACCESS, FLYPOINT_UNION_CAVE,   0xFF, 6,  6,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_NATIONAL_PARK,    MAP_POKEATHLON_DOME,                 FLYPOINT_POKEATHLON,   0xFF, 10, 6,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_VICTORY_ROAD_1F,  MAP_ROUTE_26,                        FLYPOINT_VICTORY_ROAD, 0xFF, 28, 7,  0,  0,  1, 2, 0, 0, 0, 0 },
};
