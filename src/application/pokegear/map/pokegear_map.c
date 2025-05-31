#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "pokegear_apps.h"

FS_EXTERN_OVERLAY(OVY_26);

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
