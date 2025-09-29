
#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0271.h"

#include "render_text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

const TouchscreenHitbox ov101_021F8400 = {
    .rect = { 0x88, 0xb8, 0x08, 0xf8 }
};

BOOL PokegearPhone_LoadGFX(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subsubtaskState) {
    case 0:
        PokegearPhone_InitBGs(phoneApp);
        PokegearPhone_LoadGraphics(phoneApp);
        PokegearPhone_InitWindows(phoneApp);
        PokegearPhone_InitMsg(phoneApp);
        PokegearPhone_CreateTouchMenuSpawner(phoneApp);
        PokegearPhone_LoadPalettes(phoneApp);
        break;
    case 1:
        PokegearPhone_CreateSprites(phoneApp);
        PokegearPhone_InitContextMenus(phoneApp);
        PokegearPhone_CreateContext(phoneApp);
        PokegearPhone_InitCursor(phoneApp);
        phoneApp->subsubtaskState = 0;
        return TRUE;
    }
    ++phoneApp->subsubtaskState;
    return FALSE;
}

BOOL PokegearPhone_UnloadGFX(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_DeleteContextMenus(phoneApp);
    PokegearPhone_DestroyContext(phoneApp);
    PokegearPhone_DeleteSprites(phoneApp);
    PokegearPhone_DestroyTouchMenuSpawner(phoneApp);
    PokegearPhone_DeleteMsg(phoneApp);
    PokegearPhone_RemoveWindows(phoneApp);
    PokegearPhone_UnloadGraphics(phoneApp);
    PokegearPhone_UnloadBGs(phoneApp);
    return TRUE;
}

int PokegearPhone_HandleSubmenuInput(PokegearPhoneAppData *phoneApp) {
    int input = TouchscreenListMenu_HandleInput(phoneApp->touchscreenListMenu);
    if (input != -1) {
        phoneApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->touchscreenListMenu);
        TouchscreenListMenu_Destroy(phoneApp->touchscreenListMenu);
        if (input == 1) { // Sort
            PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 1);
            return PHONE_MAIN_STATE_SORT_CONTEXT_MENU;
        } else {
            PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, FALSE);
            if (input == 0) {
                return PHONE_MAIN_STATE_CLOSE_SUBMENU_BEFORE_CALL;
            } else {
                PokegearPhone_ReturnToContactList(phoneApp);
                return PHONE_MAIN_STATE_INPUT_LOOP;
            }
        }
    }
    return PHONE_MAIN_STATE_CONTEXT_MENU;
}

int PokegearPhone_HandleSortMenuInput(PokegearPhoneAppData *phoneApp) {
    int input = TouchscreenListMenu_HandleInput(phoneApp->touchscreenListMenu);
    if (input == -1) {
        return PHONE_MAIN_STATE_SORT_CONTEXT_MENU;
    }

    phoneApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->touchscreenListMenu);
    TouchscreenListMenu_Destroy(phoneApp->touchscreenListMenu);
    switch (input) {
    case 0: // Title
    case 1: // Alphabet
    case 2: // Location
        PokegearPhone_SortList(phoneApp, input);
        PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, FALSE);
        PokegearPhone_ReturnToContactList(phoneApp);
        return PHONE_MAIN_STATE_INPUT_LOOP;
    case 3: // Move
        PokegearPhone_PrintContextMenuTooltip(phoneApp, 1, TRUE);
        PhoneContactListUI_SetMovingContactsState(&phoneApp->contactListUI, 1);
        PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 0xFF, 0);
        phoneApp->pokegear->reselectAppCB = PokegearPhone_UpdateContactListArrowSprites;
        return PHONE_MAIN_STATE_MOVING_CONTACTS;
    case 4: // Quit
    default:
        PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, FALSE);
        PokegearPhone_ReturnToContactList(phoneApp);
        return PHONE_MAIN_STATE_INPUT_LOOP;
    }
}

int PokegearPhone_HandleMoveContactsInput(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subsubtaskState) {
    case 0:
        phoneApp->subsubtaskState = PokegearPhone_HandleInput_MovingContacts(phoneApp);
        break;
    case 1:
        PhoneContactListUI_SetMovingContactsState(&phoneApp->contactListUI, 0);
        PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, FALSE);
        PhoneContactListUI_ShowMainListCursorSprites(&phoneApp->contactListUI, TRUE);
        phoneApp->pokegear->reselectAppCB = PokegearPhone_OnReselectApp;
        phoneApp->subsubtaskState = 0;
        return PHONE_MAIN_STATE_INPUT_LOOP;
    }

    return PHONE_MAIN_STATE_MOVING_CONTACTS;
}

BOOL PokegearPhone_FadeIn(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subsubtaskState) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, phoneApp->heapID);
        if (phoneApp->isIncomingCall) {
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xB0, 0x30, 0, RGB_BLACK);
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        }
        PokegearPhone_SetTouchscreenDimState(phoneApp, phoneApp->isIncomingCall);
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, TRUE);
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        ++phoneApp->subsubtaskState;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            phoneApp->subsubtaskState = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL PokegearPhone_DimDisplay(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_SetTouchscreenDimState(phoneApp, TRUE);
    return TRUE;
}

BOOL PokegearPhone_SetUpCallData(PokegearPhoneAppData *phoneApp) {
    BOOL okay;

    if (phoneApp->isIncomingCall) {
        okay = PhoneCall_InitContext(phoneApp->callContext, phoneApp->callerID, phoneApp->isIncomingCall, phoneApp->callScriptType, phoneApp->callScriptID);
        phoneApp->isIncomingCall = FALSE;
        phoneApp->pokegear->args->isScriptedLaunch = 0;
    } else {
        okay = PhoneCall_InitContext(phoneApp->callContext, phoneApp->callerID, phoneApp->isIncomingCall, 0, PHONE_SCRIPT_NONE);
    }
    if (okay) {
        PhoneCall_GetCallScriptId(phoneApp->callContext);
    }
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    TextFlags_SetFastForwardTouchButtonHitbox(&ov101_021F8400);
    return okay;
}

BOOL PhoneCall_Exit(PokegearPhoneAppData *phoneApp) {
    FillWindowPixelBuffer(&phoneApp->windows[0], 0);
    FillWindowPixelBuffer(&phoneApp->windows[1], 0);
    CopyWindowToVram(&phoneApp->windows[0]);
    CopyWindowToVram(&phoneApp->windows[1]);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    TextFlags_UnsetFastForwardTouchButtonHitbox();
    PokegearPhone_SetTouchscreenDimState(phoneApp, FALSE);
    PokegearPhone_ReturnToContactList(phoneApp);
    return TRUE;
}

void PokegearPhone_PrintClickDotDotDotStep(PokegearPhoneAppData *phoneApp) {
    ReadMsgDataIntoString(phoneApp->msgData, phoneApp->subsubtaskState + msg_0271_00033, phoneApp->msgReadBuf);
    AddTextPrinterParameterizedWithColor(&phoneApp->windows[0], 0, phoneApp->msgReadBuf, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    PlaySE(SEQ_SE_DP_BOX03);
}

BOOL PokegearPhone_PrintClickDotDotDot(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->subsubtaskState) {
    case 0:
        ReadMsgDataIntoString(phoneApp->msgData, phoneApp->subsubtaskState + msg_0271_00033, phoneApp->msgReadBuf);
        AddTextPrinterParameterizedWithColor(&phoneApp->windows[0], 0, phoneApp->msgReadBuf, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        PlaySE(SEQ_SE_DP_SELECT);
        break;
    case 1:
        if (IsSEPlaying(SEQ_SE_DP_SELECT)) {
            return FALSE;
        }
        PokegearPhone_PrintClickDotDotDotStep(phoneApp);
        break;
    case 2:
    case 3:
        if (IsSEPlaying(SEQ_SE_DP_BOX03)) {
            return FALSE;
        }
        PokegearPhone_PrintClickDotDotDotStep(phoneApp);
        break;
    default:
        if (IsSEPlaying(SEQ_SE_DP_BOX03)) {
            return FALSE;
        }
        FillWindowPixelBuffer(&phoneApp->windows[0], 0);
        CopyWindowToVram(&phoneApp->windows[0]);
        phoneApp->subsubtaskState = 0;
        return TRUE;
    }

    ++phoneApp->subsubtaskState;
    return FALSE;
}
