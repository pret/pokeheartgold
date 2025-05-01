
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
    int input = TouchscreenListMenu_HandleInput(phoneApp->unk_504);
    if (input != -1) {
        phoneApp->pokegear->unk_00C = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->unk_504);
        TouchscreenListMenu_Destroy(phoneApp->unk_504);
        if (input == 1) {
            ov101_021F09B0(phoneApp, ov101_021F1804(&phoneApp->unk_0E0), 1);
            return 8;
        } else {
            ov101_021F0ACC(phoneApp, 0, 0);
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
    int input = TouchscreenListMenu_HandleInput(phoneApp->unk_504);
    if (input == -1) {
        return 8;
    }

    phoneApp->pokegear->unk_00C = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(phoneApp->unk_504);
    TouchscreenListMenu_Destroy(phoneApp->unk_504);
    switch (input) {
    case 0:
    case 1:
    case 2:
        ov101_021F0EB0(phoneApp, input);
        ov101_021F0ACC(phoneApp, 0, 0);
        ov101_021F0B84(phoneApp);
        return 1;
    case 3:
        ov101_021F0ACC(phoneApp, 1, 1);
        ov101_021F13C8(&phoneApp->unk_0E0, 1);
        ov101_021F1290(&phoneApp->unk_0E0, 0xFF, 0);
        phoneApp->pokegear->unk_05C = ov101_021F0978;
        return 9;
    case 4:
    default:
        ov101_021F0ACC(phoneApp, 0, 0);
        ov101_021F0B84(phoneApp);
        return 1;
    }
}

int ov101_021EFEC8(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        phoneApp->unk_008 = ov101_021F0CE4(phoneApp);
        break;
    case 1:
        ov101_021F13C8(&phoneApp->unk_0E0, 0);
        ov101_021F0ACC(phoneApp, 0, 0);
        ov101_021F1338(&phoneApp->unk_0E0, 1);
        phoneApp->pokegear->unk_05C = ov101_021F0944;
        phoneApp->unk_008 = 0;
        return 1;
    }

    return 9;
}

BOOL ov101_021EFF14(PokegearPhoneAppData *phoneApp) {
    switch (phoneApp->unk_008) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, phoneApp->heapId);
        if (phoneApp->unk_0CB) {
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0xB0, 0x30, 0, RGB_BLACK);
            PaletteData_BlendPalette(phoneApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 0, RGB_BLACK);
        }
        ov101_021F0464(phoneApp, phoneApp->unk_0CB);
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

BOOL ov101_021EFFC8(PokegearPhoneAppData *phoneApp) {
    BOOL r4;

    if (phoneApp->unk_0CB) {
        r4 = PhoneCall_CheckMapPermissionAndGetTimeOfDay(phoneApp->unk_0C4, phoneApp->callerID, phoneApp->unk_0CB, phoneApp->unk_0C9, phoneApp->unk_0CA);
        phoneApp->unk_0CB = 0;
        phoneApp->pokegear->args->kind = 0;
    } else {
        r4 = PhoneCall_CheckMapPermissionAndGetTimeOfDay(phoneApp->unk_0C4, phoneApp->callerID, phoneApp->unk_0CB, 0, 0);
    }
    if (r4) {
        PhoneCall_GetCallScriptId(phoneApp->unk_0C4);
    }
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    TextFlags_SetFastForwardTouchButtonHitbox(&ov101_021F8400);
    return r4;
}

BOOL ov101_021F003C(PokegearPhoneAppData *phoneApp) {
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
