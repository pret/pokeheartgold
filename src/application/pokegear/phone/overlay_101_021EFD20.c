
#include "application/pokegear/phone/phone_internal.h"

#include "render_text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

const TouchscreenHitbox ov101_021F8400 = {
    .rect = { 0x88, 0xb8, 0x08, 0xf8 }
};

BOOL ov101_021EFD20(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        ov101_021F017C(phoneApp);
        ov101_021F0284(phoneApp);
        ov101_021F0578(phoneApp);
        ov101_021F05EC(phoneApp);
        ov101_021F072C(phoneApp);
        ov101_021F0388(phoneApp);
        break;
    case 1:
        ov101_021F075C(phoneApp);
        ov101_021F0880(phoneApp);
        ov101_021F0694(phoneApp);
        ov101_021F0900(phoneApp);
        phoneApp->unk_008 = 0;
        return TRUE;
    }
    ++phoneApp->unk_008;
    return FALSE;
}

BOOL ov101_021EFD7C(PokegearPhoneAppData *phoneApp) {
    ov101_021F08DC(phoneApp);
    ov101_021F0720(phoneApp);
    ov101_021F0864(phoneApp);
    ov101_021F0748(phoneApp);
    ov101_021F0658(phoneApp);
    ov101_021F05CC(phoneApp);
    ov101_021F0370(phoneApp);
    ov101_021F0260(phoneApp);
    return TRUE;
}

int ov101_021EFDB4(PokegearPhoneAppData *phoneApp) {
    int input = TouchscreenListMenu_HandleInput(phoneApp->touchscreenListMenu);
    if (input != -1) {
        phoneApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->touchscreenListMenu);
        TouchscreenListMenu_Destroy(phoneApp->touchscreenListMenu);
        if (input == 1) {
            PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 1);
            return 8;
        } else {
            ov101_021F0ACC(phoneApp, 0, FALSE);
            if (input == 0) {
                return 5;
            } else {
                ov101_021F0B84(phoneApp);
                return 1;
            }
        }
    }
    return 7;
}

int ov101_021EFE1C(PokegearPhoneAppData *phoneApp) {
    int input = TouchscreenListMenu_HandleInput(phoneApp->touchscreenListMenu);
    if (input == -1) {
        return 8;
    }

    phoneApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->touchscreenListMenu);
    TouchscreenListMenu_Destroy(phoneApp->touchscreenListMenu);
    switch (input) {
    case 0:
    case 1:
    case 2:
        ov101_021F0EB0(phoneApp, input);
        ov101_021F0ACC(phoneApp, 0, FALSE);
        ov101_021F0B84(phoneApp);
        return 1;
    case 3:
        ov101_021F0ACC(phoneApp, 1, TRUE);
        ov101_021F13C8(&phoneApp->contactListUI, 1);
        PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 0xFF, 0);
        phoneApp->pokegear->reselectAppCB = ov101_021F0978;
        return 9;
    case 4:
    default:
        ov101_021F0ACC(phoneApp, 0, FALSE);
        ov101_021F0B84(phoneApp);
        return 1;
    }
}

int ov101_021EFEC8(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        phoneApp->unk_008 = PokegearPhone_HandleInput2(phoneApp);
        break;
    case 1:
        ov101_021F13C8(&phoneApp->contactListUI, 0);
        ov101_021F0ACC(phoneApp, 0, FALSE);
        ov101_021F1338(&phoneApp->contactListUI, TRUE);
        phoneApp->pokegear->reselectAppCB = PokegearPhone_OnReselectApp;
        phoneApp->unk_008 = 0;
        return 1;
    }

    return 9;
}

BOOL ov101_021EFF14(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, phoneApp->heapId);
        if (phoneApp->isIncomingCall) {
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xB0, 0x30, 0, RGB_BLACK);
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        }
        ov101_021F0464(phoneApp, phoneApp->isIncomingCall);
        for (int i = 0; i < 8; ++i) {
            ToggleBgLayer(i, TRUE);
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
        ++phoneApp->unk_008;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            phoneApp->unk_008 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL ov101_021EFFBC(PokegearPhoneAppData *phoneApp) {
    ov101_021F0464(phoneApp, TRUE);
    return TRUE;
}

BOOL PokegearPhone_SetUpCallData(PokegearPhoneAppData *phoneApp) {
    BOOL okay;

    if (phoneApp->isIncomingCall) {
        okay = PhoneCall_InitContext(phoneApp->callContext, phoneApp->callerID, phoneApp->isIncomingCall, phoneApp->isScriptedCall, phoneApp->callScriptID);
        phoneApp->isIncomingCall = 0;
        phoneApp->pokegear->args->incomingPhoneCall = 0;
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
    FillWindowPixelBuffer(&phoneApp->unk_048[0], 0);
    FillWindowPixelBuffer(&phoneApp->unk_048[1], 0);
    CopyWindowToVram(&phoneApp->unk_048[0]);
    CopyWindowToVram(&phoneApp->unk_048[1]);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    TextFlags_UnsetFastForwardTouchButtonHitbox();
    ov101_021F0464(phoneApp, FALSE);
    ov101_021F0B84(phoneApp);
    return TRUE;
}

void ov101_021F0080(PokegearPhoneAppData *phoneApp) {
    ReadMsgDataIntoString(phoneApp->unk_014, phoneApp->unk_008 + 33, phoneApp->unk_020);
    AddTextPrinterParameterizedWithColor(&phoneApp->unk_048[0], 0, phoneApp->unk_020, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    PlaySE(SEQ_SE_DP_BOX03);
}

BOOL ov101_021F00BC(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        ReadMsgDataIntoString(phoneApp->unk_014, phoneApp->unk_008 + 33, phoneApp->unk_020);
        AddTextPrinterParameterizedWithColor(&phoneApp->unk_048[0], 0, phoneApp->unk_020, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        PlaySE(SEQ_SE_DP_SELECT);
        break;
    case 1:
        if (IsSEPlaying(SEQ_SE_DP_SELECT)) {
            return FALSE;
        }
        ov101_021F0080(phoneApp);
        break;
    case 2:
    case 3:
        if (IsSEPlaying(SEQ_SE_DP_BOX03)) {
            return FALSE;
        }
        ov101_021F0080(phoneApp);
        break;
    default:
        if (IsSEPlaying(SEQ_SE_DP_BOX03)) {
            return FALSE;
        }
        FillWindowPixelBuffer(&phoneApp->unk_048[0], 0);
        CopyWindowToVram(&phoneApp->unk_048[0]);
        phoneApp->unk_008 = 0;
        return TRUE;
    }

    ++phoneApp->unk_008;
    return FALSE;
}
