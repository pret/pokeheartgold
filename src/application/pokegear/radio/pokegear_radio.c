#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "pokegear_apps.h"

void ov101_021F4558(PokegearRadioAppData *radioApp);

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
