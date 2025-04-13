#include "application/pokegear/phone.h"

#include "mail_misc.h"
#include "overlay_100.h"
#include "overlay_101.h"
#include "overlay_102.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_02092BE8.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(OVY_101);
FS_EXTERN_OVERLAY(OVY_102);

void ov100_021E65F4(void *cb_args);
int Phone_MainStep_00(PokegearPhoneApp *phoneApp);
int Phone_MainStep_01(PokegearPhoneApp *phoneApp);
int Phone_MainStep_06(PokegearPhoneApp *phoneApp);
int Phone_MainStep_07(PokegearPhoneApp *phoneApp);
int Phone_MainStep_08(PokegearPhoneApp *phoneApp);
int Phone_MainStep_09(PokegearPhoneApp *phoneApp);
int Phone_MainStep_02(PokegearPhoneApp *phoneApp);
int Phone_MainStep_03(PokegearPhoneApp *phoneApp);
int Phone_MainStep_10(PokegearPhoneApp *phoneApp);
int Phone_MainStep_11(PokegearPhoneApp *phoneApp);
int Phone_MainStep_04(PokegearPhoneApp *phoneApp);
int Phone_MainStep_05(PokegearPhoneApp *phoneApp);

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
    phoneApp->unk_056 = EC_WORD_NULL;
    phoneApp->unk_006 = 1;
    sub_02004EC4(0x37, 0, 0);
    return TRUE;
}

BOOL Phone_Main(OVY_MANAGER *man, int *state) {
    PokegearPhoneApp *phoneApp = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        *state = Phone_MainStep_00(phoneApp);
        break;
    case 1:
        *state = Phone_MainStep_01(phoneApp);
        break;
    case 2:
        *state = Phone_MainStep_02(phoneApp);
        break;
    case 3:
        *state = Phone_MainStep_03(phoneApp);
        break;
    case 4:
        *state = Phone_MainStep_04(phoneApp);
        break;
    case 5:
        *state = Phone_MainStep_05(phoneApp);
        break;
    case 6:
        *state = Phone_MainStep_06(phoneApp);
        break;
    case 7:
        *state = Phone_MainStep_07(phoneApp);
        break;
    case 8:
        *state = Phone_MainStep_08(phoneApp);
        break;
    case 9:
        *state = Phone_MainStep_09(phoneApp);
        break;
    case 10:
        *state = Phone_MainStep_10(phoneApp);
        break;
    case 11:
        *state = Phone_MainStep_11(phoneApp);
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

// -----------------------------
// Local functions
// -----------------------------

void ov100_021E65F4(void *cb_args) {
    PokegearPhoneApp *phoneApp = (PokegearPhoneApp *)cb_args;

    if (phoneApp->unk_058 != NULL) {
        phoneApp->unk_058(phoneApp, phoneApp->unk_064);
    }

    if (phoneApp->plttData != NULL) {
        PaletteData_PushTransparentBuffers(phoneApp->plttData);
    }

    if (phoneApp->unk_08C != 0) {
        if (phoneApp->unk_094 != NULL) {
            ov100_021E5BB0(phoneApp, 0);
            ov100_021E6AB0(phoneApp->unk_094);
        }
        ov100_021E69E8(phoneApp);
        thunk_OamManager_ApplyAndResetBuffers();
    }

    GF_RunVramTransferTasks();
    DoScheduledBgGpuUpdates(phoneApp->bgConfig);
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

int Phone_MainStep_00(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E5DDC(phoneApp)) {
        return 0;
    }

    switch (phoneApp->unk_004) {
    case 2:
    case 4:
        return 6;
    case 1:
        return 4;
    case 3:
        return 10;
    case 0:
        return 2;
    }

    return 2;
}

int Phone_MainStep_01(PokegearPhoneApp *phoneApp) {
    if (ov100_021E5E88(phoneApp)) {
        return 12;
    }

    return 1;
}

int Phone_MainStep_06(PokegearPhoneApp *phoneApp) {
    static const OVY_MGR_TEMPLATE ov100_021E762C = { ov101_021E7740, ov101_021E779C, ov101_021E7834, FS_OVERLAY_ID(OVY_101) };
    phoneApp->childApplication = OverlayManager_New(&ov100_021E762C, phoneApp, phoneApp->heapId);
    return 7;
}

int Phone_MainStep_07(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E6408(&phoneApp->childApplication)) {
        return 7;
    }

    int outcome = phoneApp->unk_01C;
    phoneApp->unk_01C = 0;
    switch (outcome) {
    case 2:
        phoneApp->unk_004 = 2;
        return 6;
    case 6:
        phoneApp->unk_004 = 4;
        return 8;
    case 0:
        phoneApp->unk_004 = 0;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 2;
    case 1:
        phoneApp->unk_004 = 1;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 4;
    case 3:
        phoneApp->unk_004 = 3;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 10;
    default:
        return 1;
    }
}

int Phone_MainStep_08(PokegearPhoneApp *phoneApp) {
    static const OVY_MGR_TEMPLATE ov100_021E761C = { EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102) };

    if (!ov100_021E5E88(phoneApp)) {
        return 8;
    }

    phoneApp->easyChatArgs = EasyChat_CreateArgs(0, 0, phoneApp->args->saveData, phoneApp->args->menuInputStatePtr, phoneApp->heapId);
    phoneApp->unk_056 = EC_WORD_NULL;
    sub_02090D14(phoneApp->easyChatArgs, phoneApp->unk_056);
    phoneApp->childApplication = OverlayManager_New(&ov100_021E761C, phoneApp->easyChatArgs, phoneApp->heapId);
    return 9;
}

int Phone_MainStep_09(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E6408(&phoneApp->childApplication)) {
        return 9;
    }

    if (!sub_02090D48(phoneApp->easyChatArgs)) {
        phoneApp->unk_056 = sub_02090D50(phoneApp->easyChatArgs);
    }

    EasyChat_FreeArgs(phoneApp->easyChatArgs);
    phoneApp->unk_038 = 1;
    phoneApp->unk_004 = 4;
    return 0;
}

int Phone_MainStep_02(PokegearPhoneApp *phoneApp) {
    static const OVY_MGR_TEMPLATE ov100_021E760C = { ov101_021EE8E8, ov101_021EE924, ov101_021EE9A4, FS_OVERLAY_ID(OVY_101) };
    phoneApp->childApplication = OverlayManager_New(&ov100_021E760C, phoneApp, phoneApp->heapId);
    return 3;
}

int Phone_MainStep_03(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E6408(&phoneApp->childApplication)) {
        return 3;
    }

    int outcome = phoneApp->unk_01C;
    phoneApp->unk_01C = 0;
    switch (outcome) {
    case 2:
        phoneApp->unk_004 = 2;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 6;
    case 1:
        phoneApp->unk_004 = 1;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 4;
    case 3:
        phoneApp->unk_004 = 3;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 10;
    default:
        return 1;
    }
}

int Phone_MainStep_10(PokegearPhoneApp *phoneApp) {
    static const OVY_MGR_TEMPLATE ov100_021E75FC = { PhoneCall_Init, PhoneCall_Main, Phonecall_Exit, FS_OVERLAY_ID(OVY_101) };
    phoneApp->childApplication = OverlayManager_New(&ov100_021E75FC, phoneApp, phoneApp->heapId);
    return 11;
}

int Phone_MainStep_11(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E6408(&phoneApp->childApplication)) {
        return 11;
    }

    int outcome = phoneApp->unk_01C;
    phoneApp->unk_01C = 0;
    switch (outcome) {
    case 2:
        phoneApp->unk_004 = 2;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 6;
    case 0:
        phoneApp->unk_004 = 0;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 2;
    case 1:
        phoneApp->unk_004 = 1;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 4;
    default:
        return 1;
    }
}

int Phone_MainStep_04(PokegearPhoneApp *phoneApp) {
    static const OVY_MGR_TEMPLATE ov100_021E763C = { ov101_021F4480, ov101_021F44BC, ov101_021F452C, FS_OVERLAY_ID(OVY_101) };
    phoneApp->childApplication = OverlayManager_New(&ov100_021E763C, phoneApp, phoneApp->heapId);
    return 5;
}

int Phone_MainStep_05(PokegearPhoneApp *phoneApp) {
    if (!ov100_021E6408(&phoneApp->childApplication)) {
        return 5;
    }

    int outcome = phoneApp->unk_01C;
    phoneApp->unk_01C = 0;
    switch (outcome) {
    case 2:
        phoneApp->unk_004 = 2;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 6;
    case 0:
        phoneApp->unk_004 = 0;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 2;
    case 3:
        phoneApp->unk_004 = 3;
        DoScheduledBgGpuUpdates(phoneApp->bgConfig);
        return 10;
    default:
        return 1;
    }
}
