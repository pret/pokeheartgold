#include "application/pokegear/map/pokegear_map_internal.h"

#include "phonebook_dat.h"
#include "pokegear_apps.h"
#include "sys_flags.h"
#include "unk_0200FA24.h"

FS_EXTERN_OVERLAY(OVY_26);
FS_EXTERN_OVERLAY(pokegear);

static void FlyMap_InitParam(PokegearMapAppData *mapApp);
static void FlyMap_DecouplePokegear(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_GraphicsInit(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_HandleInput(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_GraphicsDeinit(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_ContextMenu(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_FadeIn(PokegearMapAppData *mapApp);
static int FlyMap_MainTask_FadeOut(PokegearMapAppData *mapApp);

static const u16 sMapXScrollLimits[] = {
    26, // Johto only
    29, // Indigo Plateau
    45, // All of Kanto
};

BOOL FlyMap_Init(OverlayManager *man, int *state) {
    PokegearArgs *args = OverlayManager_GetArgs(man);
    HandleLoadOverlay(FS_OVERLAY_ID(pokegear), OVY_LOAD_ASYNC);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    Heap_Create(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x40000);
    PokegearMapAppData *mapApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearMapAppData), HEAP_ID_POKEGEAR_APP);
    memset(mapApp, 0, sizeof(PokegearMapAppData));
    mapApp->pokegear = Heap_Alloc(HEAP_ID_POKEGEAR_APP, sizeof(PokegearAppData));
    memset(mapApp->pokegear, 0, sizeof(PokegearAppData));
    mapApp->heapID = HEAP_ID_POKEGEAR_APP;
    mapApp->pokegear->heapID = HEAP_ID_POKEGEAR_APP;
    mapApp->pokegear->args = args;
    mapApp->pokegear->saveData = mapApp->pokegear->args->saveData;
    mapApp->pokegear->savePokegear = SaveData_Pokegear_Get(mapApp->pokegear->saveData);
    mapApp->pokegear->saveVarsFlags = Save_VarsFlags_Get(mapApp->pokegear->saveData);
    mapApp->pokegear->options = Save_PlayerData_GetOptionsAddr(mapApp->pokegear->saveData);
    mapApp->pokegear->profile = Save_PlayerData_GetProfile(mapApp->pokegear->saveData);
    FlyMap_InitParam(mapApp);
    mapApp->locationSpecs = sLocationSpecs;
    mapApp->numLocationSpecs = NELEMS(sLocationSpecs);
    return TRUE;
}

BOOL FlyMap_Main(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    switch (*state) {
    case PGMAP_MAIN_STATE_LOAD:
        *state = FlyMap_MainTask_GraphicsInit(mapApp);
        break;
    case PGMAP_MAIN_STATE_HANDLE_INPUT:
        *state = FlyMap_MainTask_HandleInput(mapApp);
        break;
    case PGMAP_MAIN_STATE_UNLOAD:
        *state = FlyMap_MainTask_GraphicsDeinit(mapApp);
        break;
    case PGMAP_MAIN_STATE_FLY_CONTEXT_MENU:
        *state = FlyMap_MainTask_ContextMenu(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_IN:
        *state = FlyMap_MainTask_FadeIn(mapApp);
        break;
    case PGMAP_MAIN_STATE_FADE_OUT:
        *state = FlyMap_MainTask_FadeOut(mapApp);
        break;
    case PGMAP_MAIN_STATE_QUIT:
        return TRUE;
    }
    return FALSE;
}

BOOL FlyMap_Exit(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);
    enum HeapID heapID;
    FlyMap_DecouplePokegear(mapApp);
    MapMatrix_MapData_Free(mapApp->mapData);
    if (mapApp->pokegear->appReturnCode != GEAR_RETURN_CANCEL) {
        mapApp->pokegear->isSwitchApp = TRUE;
    }
    MI_CpuClear8(mapApp->pokegear, sizeof(PokegearAppData));
    Heap_Free(mapApp->pokegear);
    heapID = mapApp->heapID;
    OverlayManager_FreeData(man);
    Heap_Destroy(heapID);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    UnloadOverlayByID(FS_OVERLAY_ID(pokegear));
    return TRUE;
}

static void FlyMap_InitParam(PokegearMapAppData *mapApp) {
    mapApp->pokegear->childAppdata = mapApp;
    mapApp->pokegear->menuInputState = (MenuInputState)mapApp->pokegear->args->menuInputState;
    mapApp->type = mapApp->pokegear->args->isScriptedLaunch + 1;
    mapApp->pokegear->reselectAppCB = PokegearMap_ShowMapCursor;
    mapApp->pokegear->deselectAppCB = PokegearMap_DeselectApp;
    MapApp_LoadMarkingsListFromSave(mapApp);
    mapApp->unk_138_4 = 0;
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
    mapApp->centerX = 32;
    mapApp->centerY = 8;
    mapApp->yOffset = 0;
    mapApp->xOffset = -24;
    mapApp->canSeeSafariZone = TRUE;
    mapApp->canFlyToGoldenrod = Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, FLYPOINT_GOLDENROD);
    mapApp->curRegion = Pokegear_GetCurrentRegion(mapApp->pokegear);
}

static void FlyMap_DecouplePokegear(PokegearMapAppData *mapApp) {
    Heap_Free(mapApp->phoneContact);
    FreePhoneBook(mapApp->phoneBook);
    mapApp->pokegear->reselectAppCB = NULL;
    mapApp->pokegear->deselectAppCB = NULL;
}

static int FlyMap_MainTask_GraphicsInit(PokegearMapAppData *mapApp) {
    if (FlyMap_LoadGFX(mapApp)) {
        return PGMAP_MAIN_STATE_FADE_IN;
    } else {
        return PGMAP_MAIN_STATE_LOAD;
    }
}

static int FlyMap_MainTask_HandleInput(PokegearMapAppData *mapApp) {
    BOOL retIsTouch = FALSE;
    int ret;

    if (!mapApp->unk_139_3) {
        ret = FlyMap_HandleTouchInput_NotDragging(mapApp, &retIsTouch);
    } else {
        ret = FlyMap_HandleTouchInput_DraggingMap(mapApp);
        retIsTouch = TRUE;
    }
    if (retIsTouch) {
        mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        mapApp->pokegear->appReturnCode = ret;
        switch (ret) {
        case -1:
            break;
        case 8:
            return PGMAP_MAIN_STATE_FLY_CONTEXT_MENU;
        case 4:
            return PGMAP_MAIN_STATE_FADE_OUT;
        }
        return PGMAP_MAIN_STATE_HANDLE_INPUT;
    }
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        mapApp->pokegear->menuInputState = MENU_INPUT_STATE_BUTTONS;
    }
    ret = FlyMap_HandleKeyInput(mapApp);
    mapApp->pokegear->appReturnCode = ret;
    switch (ret) {
    case -1:
        break;
    case 8:
        return PGMAP_MAIN_STATE_FLY_CONTEXT_MENU;
    case 4:
        return PGMAP_MAIN_STATE_FADE_OUT;
    }
    ov101_021EC304(mapApp);
    return PGMAP_MAIN_STATE_HANDLE_INPUT;
}

static int FlyMap_MainTask_GraphicsDeinit(PokegearMapAppData *mapApp) {
    if (!FlyMap_UnloadGFX(mapApp)) {
        return PGMAP_MAIN_STATE_UNLOAD;
    }
    mapApp->pokegear->mapSessionState = mapApp->sessionState;
    return PGMAP_MAIN_STATE_QUIT;
}

static int FlyMap_MainTask_ContextMenu(PokegearMapAppData *mapApp) {
    return FlyMap_HandleContextMenu(mapApp);
}

static int FlyMap_MainTask_FadeIn(PokegearMapAppData *mapApp) {
    int i;

    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, mapApp->heapID);
        for (i = 0; i < 8; ++i) {
            ToggleBgLayer(i, GF_PLANE_TOGGLE_ON);
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        ++mapApp->state;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        mapApp->state = 0;
        return PGMAP_MAIN_STATE_HANDLE_INPUT;
    }

    return PGMAP_MAIN_STATE_FADE_IN;
}

static int FlyMap_MainTask_FadeOut(PokegearMapAppData *mapApp) {
    int i;

    switch (mapApp->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, mapApp->heapID);
        ++mapApp->state;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        for (i = 0; i < 8; ++i) {
            ToggleBgLayer(i, GF_PLANE_TOGGLE_OFF);
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        mapApp->state = 0;
        return PGMAP_MAIN_STATE_UNLOAD;
    }

    return PGMAP_MAIN_STATE_FADE_OUT;
}
