#include "application/pokegear/phone.h"

#include "overlay_100.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_02092BE8.h"

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

// BOOL Phone_Main(OVY_MANAGER *man, int *state) {
// }

// BOOL Phone_Exit(OVY_MANAGER *man, int *state) {
// }
