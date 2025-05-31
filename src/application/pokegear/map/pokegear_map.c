#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "phonebook_dat.h"
#include "pokegear_apps.h"
#include "roamer.h"
#include "sys_flags.h"

FS_EXTERN_OVERLAY(OVY_26);

BOOL ov101_021E7874(u16 mapID);
BOOL ov101_021E78B0(u16 mapID);
void ov101_021E78EC(PokegearMapAppData *mapApp);
void ov101_021E7B54(PokegearMapAppData *mapApp);
int ov101_021E7B90(PokegearMapAppData *mapApp);
int ov101_021E7BB4(PokegearMapAppData *mapApp);
int ov101_021E7C10(PokegearMapAppData *mapApp);
int ov101_021E7D50(PokegearMapAppData *mapApp);
int ov101_021E7E28(PokegearMapAppData *mapApp);
int ov101_021E7E98(PokegearMapAppData *mapApp);
int ov101_021E7F20(PokegearMapAppData *mapApp);
int ov101_021E7C38(PokegearMapAppData *mapApp);
int ov101_021E7C4C(PokegearMapAppData *mapApp);
int ov101_021E7D28(PokegearMapAppData *mapApp);
int ov101_021E7D3C(PokegearMapAppData *mapApp);

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
