#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "pokegear_apps.h"

void ov101_021F4558(PokegearRadioAppData *radioApp);
void ov101_021F45D4(PokegearRadioAppData *radioApp);
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
