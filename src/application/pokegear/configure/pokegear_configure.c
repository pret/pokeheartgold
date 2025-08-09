#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "pokegear_apps.h"

void ov101_021EE9D0(PokegearConfigureAppData *configureApp);
void ov101_021EEA2C(PokegearConfigureAppData *configureApp);
int ov101_021EEA4C(PokegearConfigureAppData *configureApp);
int ov101_021EEA70(PokegearConfigureAppData *configureApp);
int ov101_021EEAC4(PokegearConfigureAppData *configureApp);
int ov101_021EEAD8(PokegearConfigureAppData *configureApp);
int ov101_021EEAE0(PokegearConfigureAppData *configureApp);
int ov101_021EEAF4(PokegearConfigureAppData *configureApp);
int ov101_021EEBA4(PokegearConfigureAppData *configureApp);
int ov101_021EEC04(PokegearConfigureAppData *configureApp);
int ov101_021EEC8C(PokegearConfigureAppData *configureApp);

BOOL PokegearConfigure_Init(OverlayManager *man, int *state) {
    PokegearAppData *pokegearApp;
    PokegearConfigureAppData *configureApp;

    pokegearApp = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_POKEGEAR_APP, 0x20000);
    configureApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearConfigureAppData), HEAP_ID_POKEGEAR_APP);
    memset(configureApp, 0, sizeof(PokegearConfigureAppData));
    configureApp->unk_0C = pokegearApp;
    configureApp->unk_00 = HEAP_ID_POKEGEAR_APP;
    ov101_021EE9D0(configureApp);
    return TRUE;
}

BOOL PokegearConfigure_Main(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;

    configureApp = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        *state = ov101_021EEA4C(configureApp);
        break;
    case 1:
        *state = ov101_021EEA70(configureApp);
        break;
    case 2:
        *state = ov101_021EEAC4(configureApp);
        break;
    case 3:
        *state = ov101_021EEAD8(configureApp);
        break;
    case 4:
        *state = ov101_021EEAE0(configureApp);
        break;
    case 5:
        *state = ov101_021EEAF4(configureApp);
        break;
    case 6:
        *state = ov101_021EEBA4(configureApp);
        break;
    case 7:
        *state = ov101_021EEC04(configureApp);
        break;
    case 8:
        *state = ov101_021EEC8C(configureApp);
        break;
    case 9:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearConfigure_Exit(OverlayManager *man, int *state) {
    PokegearConfigureAppData *configureApp;
    HeapID heapID;

    configureApp = OverlayManager_GetData(man);
    ov101_021EEA2C(configureApp);
    configureApp->unk_0C->isSwitchApp = TRUE;
    heapID = configureApp->unk_00;
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);
    return TRUE;
}

void ov101_021EE9D0(PokegearConfigureAppData *configureApp) {
    configureApp->unk_0C->childAppdata = configureApp;
    configureApp->unk_0C->reselectAppCB = ov101_021EF4B0;
    configureApp->unk_12_09 = Pokegear_GetBackgroundStyle(configureApp->unk_0C->savePokegear);
    configureApp->unk_12_00 = sub_0202EE98(configureApp->unk_0C->savePokegear);
    configureApp->unk_12_00 = 0xFF; // nani the fuck?
}

void ov101_021EEA2C(PokegearConfigureAppData *configureApp) {
    Pokegear_SetBackgroundStyle(configureApp->unk_0C->savePokegear, configureApp->unk_12_09);
    configureApp->unk_0C->reselectAppCB = NULL;
    configureApp->unk_0C->deselectAppCB = NULL;
}
