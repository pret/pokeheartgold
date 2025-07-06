#include "application/pokegear/map/pokegear_map_internal.h"

#include "phonebook_dat.h"
#include "pokegear_apps.h"
#include "sys_flags.h"

FS_EXTERN_OVERLAY(OVY_26);
FS_EXTERN_OVERLAY(OVY_100);

void ov101_021ED980(PokegearMapAppData *mapApp);
void ov101_021EDAF8(PokegearMapAppData *mapApp);
int ov101_021EDB1C(PokegearMapAppData *mapApp);
int ov101_021EDB30(PokegearMapAppData *mapApp);
int ov101_021EDBD4(PokegearMapAppData *mapApp);
int ov101_021EDBFC(PokegearMapAppData *mapApp);
int ov101_021EDC04(PokegearMapAppData *mapApp);
int ov101_021EDC70(PokegearMapAppData *mapApp);

extern const u16 ov101_021F7F3C[];

BOOL TownMap_Init(OverlayManager *man, int *state) {
    PokegearArgs *args = OverlayManager_GetArgs(man);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_100), OVY_LOAD_ASYNC);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    CreateHeap(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x40000);
    PokegearMapAppData *mapApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearMapAppData), HEAP_ID_POKEGEAR_APP);
    memset(mapApp, 0, sizeof(PokegearMapAppData));
    mapApp->pokegear = AllocFromHeap(HEAP_ID_POKEGEAR_APP, sizeof(PokegearAppData));
    memset(mapApp->pokegear, 0, sizeof(PokegearAppData));
    mapApp->heapId = HEAP_ID_POKEGEAR_APP;
    mapApp->pokegear->heapId = HEAP_ID_POKEGEAR_APP;
    mapApp->pokegear->args = args;
    mapApp->pokegear->saveData = mapApp->pokegear->args->saveData;
    mapApp->pokegear->savePokegear = SaveData_Pokegear_Get(mapApp->pokegear->saveData);
    mapApp->pokegear->saveVarsFlags = Save_VarsFlags_Get(mapApp->pokegear->saveData);
    mapApp->pokegear->options = Save_PlayerData_GetOptionsAddr(mapApp->pokegear->saveData);
    mapApp->pokegear->profile = Save_PlayerData_GetProfile(mapApp->pokegear->saveData);
    ov101_021ED980(mapApp);
    mapApp->unk_214 = ov101_021F7372;
    mapApp->unk_136 = 100;
    return TRUE;
}

BOOL TownMap_Main(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        *state = ov101_021EDB1C(mapApp);
        break;
    case 1:
        *state = ov101_021EDB30(mapApp);
        break;
    case 2:
        *state = ov101_021EDBD4(mapApp);
        break;
    case 12:
        *state = ov101_021EDBFC(mapApp);
        break;
    case 4:
        *state = ov101_021EDC04(mapApp);
        break;
    case 5:
        *state = ov101_021EDC70(mapApp);
        break;
    case 13:
        return TRUE;
    }
    return FALSE;
}

BOOL TownMap_Exit(OverlayManager *man, int *state) {
    PokegearMapAppData *mapApp = OverlayManager_GetData(man);
    HeapID heapID;
    ov101_021EDAF8(mapApp);
    MapMatrix_MapData_Free(mapApp->unk_038);
    if (mapApp->pokegear->appReturnCode != GEAR_RETURN_CANCEL) {
        mapApp->pokegear->isSwitchApp = TRUE;
    }
    MI_CpuClear8(mapApp->pokegear, sizeof(PokegearAppData));
    FreeToHeap(mapApp->pokegear);
    heapID = mapApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_100));
    return TRUE;
}

void ov101_021ED980(PokegearMapAppData *mapApp) {
    mapApp->pokegear->childAppdata = mapApp;
    mapApp->pokegear->menuInputState = (MenuInputState)mapApp->pokegear->args->unk01;
    mapApp->unk_00D = mapApp->pokegear->args->incomingPhoneCall + 1;
    mapApp->pokegear->reselectAppCB = ov101_021EB338;
    mapApp->pokegear->unknownCB = ov101_021EB2FC;
    ov101_021ED4E0(mapApp);
    mapApp->unk_138_4 = 0;
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
    mapApp->unk_102 = ov101_021F7F3C[mapApp->unk_138_5];
    mapApp->unk_106 = 0x11;
    mapApp->unk_132 = 0x20;
    mapApp->unk_131 = 8;
    mapApp->unk_133 = 0;
    mapApp->unk_134 = -24;
    mapApp->unk_13D_1 = TRUE;
    mapApp->unk_13D_0 = Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, FLYPOINT_GOLDENROD);
    mapApp->unk_00E = ov100_021E5C80(mapApp->pokegear);
}
