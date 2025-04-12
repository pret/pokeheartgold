#include "application/pokegear/phone.h"

#include "overlay_100.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_02092BE8.h"

int ov100_021E665C(PokegearPhoneApp *phoneApp);
int ov100_021E669C(PokegearPhoneApp *phoneApp);
int ov100_021E66B0(PokegearPhoneApp *phoneApp);
int ov100_021E66C8(PokegearPhoneApp *phoneApp);
int ov100_021E673C(PokegearPhoneApp *phoneApp);
int ov100_021E6794(PokegearPhoneApp *phoneApp);
int ov100_021E67D4(PokegearPhoneApp *phoneApp);
int ov100_021E67EC(PokegearPhoneApp *phoneApp);
int ov100_021E6840(PokegearPhoneApp *phoneApp);
int ov100_021E6858(PokegearPhoneApp *phoneApp);
int ov100_021E68A8(PokegearPhoneApp *phoneApp);
int ov100_021E68C0(PokegearPhoneApp *phoneApp);

BOOL Phone_Init(OVY_MANAGER *man, int *state) {
    PokegearArgs *args = OverlayManager_GetArgs(man);
    sub_0200616C(0);
    CreateHeap(HEAP_ID_3, HEAP_ID_90, 0x32000);
    PokegearPhoneApp *phoneApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearPhoneApp), HEAP_ID_90);
    memset(phoneApp, 0, sizeof(PokegearPhoneApp));
    phoneApp->args = args;
    phoneApp->heapId = HEAP_ID_90;
    phoneApp->saveData = phoneApp->args->saveData;
    phoneApp->savePokegear = SaveData_GSPlayerMisc_Get(phoneApp->args->saveData);
    phoneApp->saveVarsFlags = Save_VarsFlags_Get(phoneApp->args->saveData);
    phoneApp->options = Save_PlayerData_GetOptionsAddr(phoneApp->args->saveData);
    phoneApp->profile = Save_PlayerData_GetProfile(phoneApp->args->saveData);
    phoneApp->unk_005_0 = Pokegear_GetRegisteredCardsArray(phoneApp->savePokegear);
    phoneApp->unk_00C = MenuInputStateMgr_GetState(phoneApp->args->menuInputStatePtr);
    phoneApp->unk_008 = sub_0202EE7C(phoneApp->savePokegear);
    switch (phoneApp->args->kind) {
    case 1:
        phoneApp->unk_004 = 3;
        break;
    case 0:
    default:
        phoneApp->unk_004 = sub_0202EDF8(phoneApp->savePokegear);
        if (phoneApp->unk_004 == 2) {
            if (!(phoneApp->unk_005_0 & 1)) {
                phoneApp->unk_004 = 0;
            }
        } else if (phoneApp->unk_004 == 1) {
            if (!(phoneApp->unk_005_0 & 2)) {
                phoneApp->unk_004 = 0;
            }
        }
        break;
    }
    phoneApp->unk_038 = 0;
    phoneApp->unk_056 = 0xFFFF;
    phoneApp->unk_006 = 1;
    sub_02004EC4(0x37, 0, 0);
    return TRUE;
}

BOOL Phone_Main(OVY_MANAGER *man, int *state) {
    PokegearPhoneApp *phoneApp = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        *state = ov100_021E665C(phoneApp);
        break;
    case 1:
        *state = ov100_021E669C(phoneApp);
        break;
    case 2:
        *state = ov100_021E67D4(phoneApp);
        break;
    case 3:
        *state = ov100_021E67EC(phoneApp);
        break;
    case 4:
        *state = ov100_021E68A8(phoneApp);
        break;
    case 5:
        *state = ov100_021E68C0(phoneApp);
        break;
    case 6:
        *state = ov100_021E66B0(phoneApp);
        break;
    case 7:
        *state = ov100_021E66C8(phoneApp);
        break;
    case 8:
        *state = ov100_021E673C(phoneApp);
        break;
    case 9:
        *state = ov100_021E6794(phoneApp);
        break;
    case 10:
        *state = ov100_021E6840(phoneApp);
        break;
    case 11:
        *state = ov100_021E6858(phoneApp);
        break;
    case 12:
        return TRUE;
    }
    return FALSE;
}

BOOL Phone_Exit(OVY_MANAGER *man, int *state) {
    PokegearPhoneApp *phoneApp = OverlayManager_GetData(man);
    sub_0202EDFC(phoneApp->savePokegear, phoneApp->unk_004);
    MenuInputStateMgr_SetState(phoneApp->args->menuInputStatePtr, phoneApp->unk_00C);
    HeapID heapId = phoneApp->heapId;
    OverlayManager_FreeData(man);
    sub_02004B10();
    sub_0203E354();
    DestroyHeap(heapId);
    return TRUE;
}
