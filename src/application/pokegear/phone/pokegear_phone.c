#include "global.h"

#include "application/pokegear/pokegear_internal.h"

#include "overlay_101.h"
#include "render_text.h"
#include "sound_02004A44.h"

typedef struct PokegearPhoneAppData {
    HeapID heapId;             // 0x000
    u8 filler_004[0x8];        // 0x004
    PokegearAppData *pokegear; // 0x00C
    u8 unk_010;                // 0x010
    u8 unk_011;                // 0x011
    u8 filler_012[0x36];       // 0x012
    Window unk_048[2];         // 0x048
    u8 filler_068[0x5C];       // 0x068
    void *unk_0C4;             // 0x0C4 type pending
    u8 unk_0C8;                // 0x0C8
    u8 unk_0C9;                // 0x0C9
    u8 unk_0CA;                // 0x0CA
    u8 unk_0CB;                // 0x0CB
    u8 unk_0CC;                // 0x0CC
    u8 unk_0CD;                // 0x0CD
    u8 filler_0CE[2];          // 0x0CE
    PhoneContact *unk_0D0;     // 0x0D0
    u8 filler_0D4[0x43C];      // 0x0D4
} PokegearPhoneAppData;        // size: 0x510

void ov101_021EF96C(PokegearPhoneAppData *phoneApp);
void ov101_021EFA04(PokegearPhoneAppData *phoneApp);
int ov101_021EFA24(PokegearPhoneAppData *phoneApp);
int ov101_021EFA48(PokegearPhoneAppData *phoneApp);
int ov101_021EFAA4(PokegearPhoneAppData *phoneApp);
int ov101_021EFAB8(PokegearPhoneAppData *phoneApp);
int ov101_021EFAC0(PokegearPhoneAppData *phoneApp);
int ov101_021EFAC8(PokegearPhoneAppData *phoneApp);
int ov101_021EFAD0(PokegearPhoneAppData *phoneApp);
int ov101_021EFADC(PokegearPhoneAppData *phoneApp);
int ov101_021EFAE8(PokegearPhoneAppData *phoneApp);
int ov101_021EFB08(PokegearPhoneAppData *phoneApp);
int ov101_021EFB4C(PokegearPhoneAppData *phoneApp);
int ov101_021EFB70(PokegearPhoneAppData *phoneApp);
int ov101_021EFBD0(PokegearPhoneAppData *phoneApp);
int ov101_021EFC58(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFD20(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFD7C(PokegearPhoneAppData *phoneApp);
int ov101_021EFDB4(PokegearPhoneAppData *phoneApp);
int ov101_021EFE1C(PokegearPhoneAppData *phoneApp);
int ov101_021EFEC8(PokegearPhoneAppData *phoneApp);
void ov101_021EFFBC(PokegearPhoneAppData *phoneApp);
void ov101_021EFFC8(PokegearPhoneAppData *phoneApp);
void ov101_021F003C(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F00BC(PokegearPhoneAppData *phoneApp);
void ov101_021F0944(void *cb_arg);
void ov101_021F0B84(PokegearPhoneAppData *phoneApp);
int ov101_021F0BA0(PokegearPhoneAppData *phoneApp);
int ov101_021F0C4C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D6C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D90(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F26F8(void *a0);

BOOL PokegearPhone_Init(OVY_MANAGER *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_PHONE, 0x30000);
    PokegearPhoneAppData *phoneApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearPhoneAppData), HEAP_ID_PHONE);
    memset(phoneApp, 0, sizeof(PokegearPhoneAppData));
    phoneApp->pokegear = pokegearApp;
    phoneApp->heapId = HEAP_ID_PHONE;
    sub_02004EC4(0x37, 0, 0);
    ov101_021EF96C(phoneApp);
    return TRUE;
}

BOOL PokegearPhone_Main(OVY_MANAGER *man, int *state) {
    PokegearPhoneAppData *phoneApp = OverlayManager_GetData(man);

    switch (*state) {
    case 0:
        *state = ov101_021EFA24(phoneApp);
        break;
    case 1:
        *state = ov101_021EFA48(phoneApp);
        break;
    case 2:
        *state = ov101_021EFAA4(phoneApp);
        break;
    case 7:
        *state = ov101_021EFAB8(phoneApp);
        break;
    case 8:
        *state = ov101_021EFAC0(phoneApp);
        break;
    case 9:
        *state = ov101_021EFAC8(phoneApp);
        break;
    case 5:
        *state = ov101_021EFAD0(phoneApp);
        break;
    case 3:
        *state = ov101_021EFADC(phoneApp);
        break;
    case 6:
        *state = ov101_021EFAE8(phoneApp);
        break;
    case 4:
        *state = ov101_021EFB08(phoneApp);
        break;
    case 10:
        *state = ov101_021EFB4C(phoneApp);
        break;
    case 11:
        *state = ov101_021EFB70(phoneApp);
        break;
    case 12:
        *state = ov101_021EFBD0(phoneApp);
        break;
    case 13:
        *state = ov101_021EFC58(phoneApp);
        break;
    case 14:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearPhone_Exit(OVY_MANAGER *man, int *state) {
    PokegearPhoneAppData *phoneApp = OverlayManager_GetData(man);

    ov101_021EFA04(phoneApp);
    phoneApp->pokegear->unk_005_7 = TRUE;
    HeapID heapId = phoneApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapId);
    return TRUE;
}

void ov101_021EF96C(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->childAppdata = phoneApp;
    phoneApp->pokegear->unk_05C = ov101_021F0944;
    phoneApp->unk_011 = sub_0202EE7C(phoneApp->pokegear->savePokegear);
    phoneApp->unk_0D0 = GSPlayerMisc_AllocAndCopyPhonebook(phoneApp->pokegear->savePokegear, phoneApp->heapId);
    phoneApp->unk_0CD = GSPlayerMisc_FindEmptyGearPhonebookSlot(phoneApp->pokegear->savePokegear);
    ov101_021F0D6C(phoneApp);
    if (phoneApp->pokegear->args->kind == 1) {
        phoneApp->unk_0CB = 1;
        phoneApp->unk_0C8 = phoneApp->pokegear->args->callerId;
        phoneApp->unk_0C9 = phoneApp->pokegear->args->unk05;
        phoneApp->unk_0CA = phoneApp->pokegear->args->unk06;
        phoneApp->pokegear->unk_006 = 0;
    } else {
        phoneApp->unk_0CB = 0;
        phoneApp->unk_0C8 = 0;
        phoneApp->unk_0C9 = 0;
        phoneApp->unk_0CA = 0;
    }
}

void ov101_021EFA04(PokegearPhoneAppData *phoneApp) {
    ov101_021F0D90(phoneApp);
    FreeToHeap(phoneApp->unk_0D0);
    phoneApp->pokegear->unk_05C = NULL;
    phoneApp->pokegear->unk_060 = NULL;
}

int ov101_021EFA24(PokegearPhoneAppData *phoneApp) {
    if (!ov101_021EFD20(phoneApp)) {
        return 0;
    }
    if (phoneApp->pokegear->unk_005_7) {
        return 12;
    } else {
        return 10;
    }
}

int ov101_021EFA48(PokegearPhoneAppData *phoneApp) {
    int input = ov101_021F0C4C(phoneApp);
    if (input == -1) {
        if (phoneApp->unk_010 == 0) {
            ov100_021E5900(phoneApp->pokegear);
        }
        if (phoneApp->pokegear->unk_006 == 1) {
            input = PokegearApp_HandleKeyInput_SwitchApps(phoneApp->pokegear);
        } else {
            input = ov101_021F0BA0(phoneApp);
        }
    }
    switch (input) {
    case -1:
        break;
    case 4:
        phoneApp->pokegear->unk_01C = input;
        return 11;
    case 8:
        return 7;
    default:
        phoneApp->pokegear->unk_01C = input;
        return 13;
    }

    return 1;
}

int ov101_021EFAA4(PokegearPhoneAppData *phoneApp) {
    if (ov101_021EFD7C(phoneApp)) {
        return 14;
    } else {
        return 2;
    }
}

int ov101_021EFAB8(PokegearPhoneAppData *phoneApp) {
    return ov101_021EFDB4(phoneApp);
}

int ov101_021EFAC0(PokegearPhoneAppData *phoneApp) {
    return ov101_021EFE1C(phoneApp);
}

int ov101_021EFAC8(PokegearPhoneAppData *phoneApp) {
    return ov101_021EFEC8(phoneApp);
}

int ov101_021EFAD0(PokegearPhoneAppData *phoneApp) {
    ov101_021EFFBC(phoneApp);
    return 3;
}

int ov101_021EFADC(PokegearPhoneAppData *phoneApp) {
    ov101_021EFFC8(phoneApp);
    return 6;
}

int ov101_021EFAE8(PokegearPhoneAppData *phoneApp) {
    if (!ov101_021F26F8(phoneApp->unk_0C4)) {
        return 6;
    }

    ov101_021F003C(phoneApp);
    return 1;
}

int ov101_021EFB08(PokegearPhoneAppData *phoneApp) {
    if (!ov101_021F00BC(phoneApp)) {
        return 4;
    }
    FillWindowPixelBuffer(&phoneApp->unk_048[0], 0);
    FillWindowPixelBuffer(&phoneApp->unk_048[1], 0);
    CopyWindowToVram(&phoneApp->unk_048[0]);
    CopyWindowToVram(&phoneApp->unk_048[1]);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    ov101_021F0B84(phoneApp);
    return 1;
}
