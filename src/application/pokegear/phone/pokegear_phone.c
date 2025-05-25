#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "brightness.h"
#include "pokegear_apps.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "unk_0200FA24.h"

static void PokegearPhone_LoadContactsAndInitFromArgs(PokegearPhoneAppData *phoneApp);
static void PokegearPhone_UnloadContactsAndDeregisterCallbacks(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_Setup(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_HandleInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_TearDown(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_HandleSubmenuInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_HandleSortMenuInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_HandleMoveContactsInput(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_DimScreenBeforeCall(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_SetUpPhoneCall(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_DoPhoneCall(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_DebugHangupEffect(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_FadeInFromGearOpen(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_FadeOutForGearClose(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainTask_WipeInFromAppSwitch(PokegearPhoneAppData *phoneApp);
int PokegearPhone_MainState_WipeOutForAppSwitch(PokegearPhoneAppData *phoneApp);

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
    case PHONE_MAIN_STATE_SETUP:
        *state = PokegearPhone_MainTask_Setup(phoneApp);
        break;
    case PHONE_MAIN_STATE_INPUT_LOOP:
        *state = PokegearPhone_MainTask_HandleInput(phoneApp);
        break;
    case PHONE_MAIN_STATE_TEARDOWN:
        *state = PokegearPhone_MainTask_TearDown(phoneApp);
        break;
    case PHONE_MAIN_STATE_CONTEXT_MENU:
        *state = PokegearPhone_MainTask_HandleSubmenuInput(phoneApp);
        break;
    case PHONE_MAIN_STATE_SORT_CONTEXT_MENU:
        *state = PokegearPhone_MainTask_HandleSortMenuInput(phoneApp);
        break;
    case PHONE_MAIN_STATE_MOVING_CONTACTS:
        *state = PokegearPhone_MainTask_HandleMoveContactsInput(phoneApp);
        break;
    case PHONE_MAIN_STATE_CLOSE_SUBMENU_BEFORE_CALL:
        *state = PokegearPhone_MainTask_DimScreenBeforeCall(phoneApp);
        break;
    case PHONE_MAIN_STATE_SETUP_CALL:
        *state = PokegearPhone_MainTask_SetUpPhoneCall(phoneApp);
        break;
    case PHONE_MAIN_STATE_PLAY_CALL:
        *state = PokegearPhone_MainTask_DoPhoneCall(phoneApp);
        break;
    case PHONE_MAIN_STATE_UNUSED_DEBUG_MAYBE:
        *state = PokegearPhone_MainTask_DebugHangupEffect(phoneApp);
        break;
    case PHONE_MAIN_STATE_FADE_IN:
        *state = PokegearPhone_MainTask_FadeInFromGearOpen(phoneApp);
        break;
    case PHONE_MAIN_STATE_FADE_GEAR_CLOSE:
        *state = PokegearPhone_MainTask_FadeOutForGearClose(phoneApp);
        break;
    case PHONE_MAIN_STATE_WIPE_IN:
        *state = PokegearPhone_MainTask_WipeInFromAppSwitch(phoneApp);
        break;
    case PHONE_MAIN_STATE_WIPE_SWITCH_APP:
        *state = PokegearPhone_MainState_WipeOutForAppSwitch(phoneApp);
        break;
    case PHONE_MAIN_STATE_QUIT:
        return TRUE;
    }

    return FALSE;
}

BOOL PokegearPhone_Exit(OVY_MANAGER *man, int *state) {
    PokegearPhoneAppData *phoneApp = OverlayManager_GetData(man);

    PokegearPhone_UnloadContactsAndDeregisterCallbacks(phoneApp);
    phoneApp->pokegear->isSwitchApp = TRUE;
    HeapID heapId = phoneApp->heapId;
    OverlayManager_FreeData(man);
    DestroyHeap(heapId);
    return TRUE;
}

static void PokegearPhone_LoadContactsAndInitFromArgs(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->childAppdata = phoneApp;
    phoneApp->pokegear->reselectAppCB = PokegearPhone_OnReselectApp;
    phoneApp->backgroundStyle = Pokegear_GetBackgroundStyle(phoneApp->pokegear->savePokegear);
    phoneApp->saveContacts = SavePokegear_AllocAndCopyPhonebook(phoneApp->pokegear->savePokegear, phoneApp->heapId);
    phoneApp->numContacts = SavePokegear_FindEmptyPhonebookSlot(phoneApp->pokegear->savePokegear);
    PokegearPhone_ContactList_CreateLinkedList(phoneApp);
    if (phoneApp->pokegear->args->incomingPhoneCall == 1) {
        phoneApp->isIncomingCall = TRUE;
        phoneApp->callerID = phoneApp->pokegear->args->callerId;
        phoneApp->isScriptedCall = phoneApp->pokegear->args->unk05;
        phoneApp->callScriptID = phoneApp->pokegear->args->callScriptID;
        phoneApp->pokegear->cursorInAppSwitchZone = 0;
    } else {
        phoneApp->isIncomingCall = FALSE;
        phoneApp->callerID = 0;
        phoneApp->isScriptedCall = 0;
        phoneApp->callScriptID = 0;
    }
}

static void PokegearPhone_UnloadContactsAndDeregisterCallbacks(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_ContactList_FlushAndDestroyLinkedList(phoneApp);
    FreeToHeap(phoneApp->saveContacts);
    phoneApp->pokegear->reselectAppCB = NULL;
    phoneApp->pokegear->unk_060 = NULL;
}

int PokegearPhone_MainTask_Setup(PokegearPhoneAppData *phoneApp) {
    if (!PokegearPhone_SetUp(phoneApp)) {
        return PHONE_MAIN_STATE_SETUP;
    }
    if (phoneApp->pokegear->isSwitchApp) {
        return PHONE_MAIN_STATE_WIPE_IN;
    } else {
        return PHONE_MAIN_STATE_FADE_IN;
    }
}

int PokegearPhone_MainTask_HandleInput(PokegearPhoneAppData *phoneApp) {
    int input = PokegearPhone_HandleTouchInput(phoneApp);
    if (input == TOUCH_MENU_NO_INPUT) {
        if (phoneApp->menuInputStateBak == 0) {
            PokegearApp_HandleInputModeChangeToButtons(phoneApp->pokegear);
        }
        if (phoneApp->pokegear->cursorInAppSwitchZone == 1) {
            input = PokegearApp_HandleKeyInput_SwitchApps(phoneApp->pokegear);
        } else {
            input = PokegearPhone_HandleKeyInput_ContactList(phoneApp);
        }
    }
    switch (input) {
    case TOUCH_MENU_NO_INPUT:
        break;
    case GEAR_RETURN_4:
        phoneApp->pokegear->appReturnCode = input;
        return PHONE_MAIN_STATE_FADE_GEAR_CLOSE;
    case 8:
        return PHONE_MAIN_STATE_CONTEXT_MENU;
    default:
        phoneApp->pokegear->appReturnCode = input;
        return PHONE_MAIN_STATE_WIPE_SWITCH_APP;
    }

    return PHONE_MAIN_STATE_INPUT_LOOP;
}

int PokegearPhone_MainTask_TearDown(PokegearPhoneAppData *phoneApp) {
    if (PokegearPhone_TearDown(phoneApp)) {
        return PHONE_MAIN_STATE_QUIT;
    } else {
        return PHONE_MAIN_STATE_TEARDOWN;
    }
}

int PokegearPhone_MainTask_HandleSubmenuInput(PokegearPhoneAppData *phoneApp) {
    return PokegearPhone_HandleSubmenuInput(phoneApp);
}

int PokegearPhone_MainTask_HandleSortMenuInput(PokegearPhoneAppData *phoneApp) {
    return PokegearPhone_HandleSortMenuInput(phoneApp);
}

int PokegearPhone_MainTask_HandleMoveContactsInput(PokegearPhoneAppData *phoneApp) {
    return PokegearPhone_HandleMoveContactsInput(phoneApp);
}

int PokegearPhone_MainTask_DimScreenBeforeCall(PokegearPhoneAppData *phoneApp) {
    ov101_021EFFBC(phoneApp);
    return PHONE_MAIN_STATE_SETUP_CALL;
}

int PokegearPhone_MainTask_SetUpPhoneCall(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_SetUpCallData(phoneApp);
    return PHONE_MAIN_STATE_PLAY_CALL;
}

int PokegearPhone_MainTask_DoPhoneCall(PokegearPhoneAppData *phoneApp) {
    if (!PhoneCall_Main(phoneApp->callContext)) {
        return PHONE_MAIN_STATE_PLAY_CALL;
    }

    PhoneCall_Exit(phoneApp);
    return PHONE_MAIN_STATE_INPUT_LOOP;
}

// unused?
int PokegearPhone_MainTask_DebugHangupEffect(PokegearPhoneAppData *phoneApp) {
    if (!ov101_021F00BC(phoneApp)) {
        return PHONE_MAIN_STATE_UNUSED_DEBUG_MAYBE;
    }
    FillWindowPixelBuffer(&phoneApp->windows[0], 0);
    FillWindowPixelBuffer(&phoneApp->windows[1], 0);
    CopyWindowToVram(&phoneApp->windows[0]);
    CopyWindowToVram(&phoneApp->windows[1]);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    PokegearPhone_ReturnToContactList(phoneApp);
    return PHONE_MAIN_STATE_INPUT_LOOP;
}

int PokegearPhone_MainTask_FadeInFromGearOpen(PokegearPhoneAppData *phoneApp) {
    if (ov101_021EFF14(phoneApp)) {
        phoneApp->subtaskState = 0;
        if (phoneApp->isIncomingCall) {
            return PHONE_MAIN_STATE_SETUP_CALL;
        } else {
            return PHONE_MAIN_STATE_INPUT_LOOP;
        }
    } else {
        return PHONE_MAIN_STATE_FADE_IN;
    }
}

int PokegearPhone_MainTask_FadeOutForGearClose(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subtaskState) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, phoneApp->heapId);
        ++phoneApp->subtaskState;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, FALSE);
        }
        phoneApp->subtaskState = 0;
        return PHONE_MAIN_STATE_TEARDOWN;
    }
    return PHONE_MAIN_STATE_FADE_GEAR_CLOSE;
}

int PokegearPhone_MainTask_WipeInFromAppSwitch(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subtaskState) {
    case 0:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3), NNS_G2D_VRAM_TYPE_2DMAIN);
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(i + 1, TRUE);
            ToggleBgLayer(i + 5, TRUE);
        }
        phoneApp->pokegear->unk_009 = 0;
        ++phoneApp->subtaskState;
        break;
    case 1:
        if (ov100_021E5D3C(phoneApp->pokegear, 0)) {
            ++phoneApp->subtaskState;
        }
        break;
    case 2:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
        phoneApp->pokegear->unk_009 = 0;
        phoneApp->subtaskState = 0;
        return PHONE_MAIN_STATE_INPUT_LOOP;
    }
    return PHONE_MAIN_STATE_WIPE_IN;
}

int PokegearPhone_MainState_WipeOutForAppSwitch(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subtaskState) {
    case 0:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, TRUE);
        phoneApp->pokegear->unk_009 = 0;
        ++phoneApp->subtaskState;
        break;
    case 1:
        if (ov100_021E5D3C(phoneApp->pokegear, 1)) {
            ++phoneApp->subtaskState;
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
        ++phoneApp->subtaskState;
        break;
    case 3:
        PaletteData_SetAutoTransparent(phoneApp->pokegear->plttData, FALSE);
        phoneApp->pokegear->unk_009 = 0;
        phoneApp->subtaskState = 0;
        return PHONE_MAIN_STATE_TEARDOWN;
    }

    return PHONE_MAIN_STATE_WIPE_SWITCH_APP;
}
