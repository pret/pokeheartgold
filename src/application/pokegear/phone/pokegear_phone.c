#include "global.h"

#include "application/pokegear/pokegear_internal.h"

#include "overlay_101.h"
#include "sound_02004A44.h"

typedef struct PokegearPhoneAppData {
    HeapID heapId;             // 0x000
    u8 filler_004[0x8];        // 0x004
    PokegearAppData *pokegear; // 0x00C
    u8 filler_010[0x500];      // 0x010
} PokegearPhoneAppData;        // size: 0x510

void ov101_021EF96C(PokegearPhoneAppData *phoneApp);
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
void ov101_021EFA04(PokegearPhoneAppData *phoneApp);

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
