#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "brightness.h"
#include "overlay_101.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "unk_0200FA24.h"

static void PokegearPhone_LoadContactsAndInitFromArgs(PokegearPhoneAppData *phoneApp);
static void PokegearPhone_UnloadContactsAndDeregisterCallbacks(PokegearPhoneAppData *phoneApp);
int ov101_021EFA24(PokegearPhoneAppData *phoneApp);
int ov101_021EFA48(PokegearPhoneAppData *phoneApp);
int ov101_021EFAA4(PokegearPhoneAppData *phoneApp);
int ov101_021EFAB8(PokegearPhoneAppData *phoneApp);
int ov101_021EFAC0(PokegearPhoneAppData *phoneApp);
int ov101_021EFAC8(PokegearPhoneAppData *phoneApp);
int ov101_021EFAD0(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_SetUpPhoneCall(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_DoPhoneCall(PokegearPhoneAppData *phoneApp);
int ov101_021EFB08(PokegearPhoneAppData *phoneApp);
int ov101_021EFB4C(PokegearPhoneAppData *phoneApp);
int ov101_021EFB70(PokegearPhoneAppData *phoneApp);
int ov101_021EFBD0(PokegearPhoneAppData *phoneApp);
int ov101_021EFC58(PokegearPhoneAppData *phoneApp);

BOOL PokegearPhone_Init(OVY_MANAGER *man, int *state) {
    PokegearAppData *pokegearApp = OverlayManager_GetArgs(man);
    CreateHeap(HEAP_ID_3, HEAP_ID_PHONE, 0x30000);
    PokegearPhoneAppData *phoneApp = OverlayManager_CreateAndGetData(man, sizeof(PokegearPhoneAppData), HEAP_ID_PHONE);
    memset(phoneApp, 0, sizeof(PokegearPhoneAppData));
    phoneApp->pokegear = pokegearApp;
    phoneApp->heapId = HEAP_ID_PHONE;
    Sound_SetSceneAndPlayBGM(55, 0, 0);
    PokegearPhone_LoadContactsAndInitFromArgs(phoneApp);
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
        *state = PokegearPhone_MainTask_SetUpPhoneCall(phoneApp);
        break;
    case 6:
        *state = PokegearPhone_MainTask_DoPhoneCall(phoneApp);
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

    PokegearPhone_UnloadContactsAndDeregisterCallbacks(phoneApp);
    phoneApp->pokegear->unk_005_7 = TRUE;
    HeapID heapId = phoneApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapId);
    return TRUE;
}

static void PokegearPhone_LoadContactsAndInitFromArgs(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->childAppdata = phoneApp;
    phoneApp->pokegear->unk_05C = ov101_021F0944;
    phoneApp->unk_011 = sub_0202EE7C(phoneApp->pokegear->savePokegear);
    phoneApp->saveContacts = GSPlayerMisc_AllocAndCopyPhonebook(phoneApp->pokegear->savePokegear, phoneApp->heapId);
    phoneApp->numContacts = GSPlayerMisc_FindEmptyGearPhonebookSlot(phoneApp->pokegear->savePokegear);
    ov101_021F0D6C(phoneApp);
    if (phoneApp->pokegear->args->kind == 1) {
        phoneApp->isIncomingCall = 1;
        phoneApp->callerID = phoneApp->pokegear->args->callerId;
        phoneApp->unk_0C9 = phoneApp->pokegear->args->unk05;
        phoneApp->callScriptID = phoneApp->pokegear->args->callScriptID;
        phoneApp->pokegear->unk_006 = 0;
    } else {
        phoneApp->isIncomingCall = 0;
        phoneApp->callerID = 0;
        phoneApp->unk_0C9 = 0;
        phoneApp->callScriptID = 0;
    }
}

static void PokegearPhone_UnloadContactsAndDeregisterCallbacks(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_ContactList_ToSaveArray(phoneApp);
    FreeToHeap(phoneApp->saveContacts);
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

int PokegearPhone_MainTask_SetUpPhoneCall(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_SetUpCallData(phoneApp);
    return 6;
}

int PokegearPhone_MainTask_DoPhoneCall(PokegearPhoneAppData *phoneApp) {
    if (!PhoneCall_Main(phoneApp->callContext)) {
        return 6;
    }

    PhoneCall_Exit(phoneApp);
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

int ov101_021EFB4C(PokegearPhoneAppData *phoneApp) {
    if (ov101_021EFF14(phoneApp)) {
        phoneApp->unk_004 = 0;
        if (phoneApp->isIncomingCall) {
            return 3;
        } else {
            return 1;
        }
    } else {
        return 10;
    }
}

int ov101_021EFB70(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_004) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, phoneApp->heapId);
        ++phoneApp->unk_004;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, FALSE);
        }
        phoneApp->unk_004 = 0;
        return 2;
    }
    return 11;
}

int ov101_021EFBD0(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_004) {
    case 0:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), NNS_G2D_VRAM_TYPE_2DMAIN);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + 1, TRUE);
            ToggleBgLayer(i + 5, TRUE);
        }
        phoneApp->pokegear->unk_009 = 0;
        ++phoneApp->unk_004;
        break;
    case 1:
        if (ov100_021E5D3C(phoneApp->pokegear, 0)) {
            ++phoneApp->unk_004;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
        phoneApp->pokegear->unk_009 = 0;
        phoneApp->unk_004 = 0;
        return 1;
    }
    return 12;
}

int ov101_021EFC58(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_004) {
    case 0:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
        phoneApp->pokegear->unk_009 = 0;
        ++phoneApp->unk_004;
        break;
    case 1:
        if (ov100_021E5D3C(phoneApp->pokegear, 1)) {
            ++phoneApp->unk_004;
        }
        break;
    case 2:
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, 0);
        PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, 0);
        PaletteData_PushTransparentBuffers(phoneApp->pokegear->plttData);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + 1, FALSE);
            ToggleBgLayer(i + 5, FALSE);
        }
        ++phoneApp->unk_004;
        break;
    case 3:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
        phoneApp->pokegear->unk_009 = 0;
        phoneApp->unk_004 = 0;
        return 2;
    }

    return 13;
}
