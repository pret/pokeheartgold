#include "global.h"

#include "application/pokegear/pokegear_internal.h"

#include "brightness.h"
#include "overlay_101.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "touchscreen_list_menu.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

typedef struct PokegearPhoneApp_Sub0E0 {
    u8 unk_00;
    u8 unk_01;
    u8 filler_02[4];
    u8 unk_06_0 : 1;
    u8 filler_08[0x3E4];
    Sprite *unk_3EC[4];
} PokegearPhoneApp_Sub0E0; // size unknown, currently 0x3FC

typedef struct PokegearPhoneApp_Sub0C4 {
} PokegearPhoneApp_Sub0C4;

typedef struct PokegearPhoneAppData {
    HeapID heapId;                    // 0x000
    int unk_004;                      // 0x004
    int unk_008;                      // 0x008
    PokegearAppData *pokegear;        // 0x00C
    u8 unk_010;                       // 0x010
    u8 unk_011;                       // 0x011
    u8 filler_012[2];                 // 0x012
    MsgData *unk_014;                 // 0x014
    u8 filler_018[8];                 // 0x018
    String *unk_020;                  // 0x020
    u8 filler_024[0x24];              // 0x024
    Window unk_048[2];                // 0x048
    u8 filler_068[0x5C];              // 0x068
    PokegearPhoneApp_Sub0C4 *unk_0C4; // 0x0C4 type pending
    u8 unk_0C8;                       // 0x0C8
    u8 unk_0C9;                       // 0x0C9
    u8 unk_0CA;                       // 0x0CA
    u8 unk_0CB;                       // 0x0CB
    u8 unk_0CC;                       // 0x0CC
    u8 unk_0CD;                       // 0x0CD
    u8 filler_0CE[2];                 // 0x0CE
    PhoneContact *unk_0D0;            // 0x0D0
    u8 filler_0D4[0xC];               // 0x0D4
    PokegearPhoneApp_Sub0E0 unk_0E0;  // 0x0E0
    u8 filler_4DC[0x28];              // 0x4DC
    TouchscreenListMenu *unk_504;     // 0x504
    u8 filler_508[0x8];               // 0x508
} PokegearPhoneAppData;               // size: 0x510

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
BOOL ov101_021EFF14(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFFBC(PokegearPhoneAppData *phoneApp);
BOOL ov101_021EFFC8(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F003C(PokegearPhoneAppData *phoneApp);
void ov101_021F0080(PokegearPhoneAppData *phoneApp);
BOOL ov101_021F00BC(PokegearPhoneAppData *phoneApp);
void ov101_021F017C(PokegearPhoneAppData *phoneApp);
void ov101_021F0260(PokegearPhoneAppData *phoneApp);
void ov101_021F0284(PokegearPhoneAppData *phoneApp);
void ov101_021F0370(PokegearPhoneAppData *phoneApp);
void ov101_021F0388(PokegearPhoneAppData *phoneApp);
void ov101_021F0464(PokegearPhoneAppData *phoneApp, int a1);
void ov101_021F0578(PokegearPhoneAppData *phoneApp);
void ov101_021F05CC(PokegearPhoneAppData *phoneApp);
void ov101_021F05EC(PokegearPhoneAppData *phoneApp);
void ov101_021F0658(PokegearPhoneAppData *phoneApp);
void ov101_021F0694(PokegearPhoneAppData *phoneApp);
void ov101_021F0720(PokegearPhoneAppData *phoneApp);
void ov101_021F072C(PokegearPhoneAppData *phoneApp);
void ov101_021F0748(PokegearPhoneAppData *phoneApp);
void ov101_021F075C(PokegearPhoneAppData *phoneApp);
void ov101_021F0864(PokegearPhoneAppData *phoneApp);
void ov101_021F0880(PokegearPhoneAppData *phoneApp);
void ov101_021F08DC(PokegearPhoneAppData *phoneApp);
void ov101_021F0900(PokegearPhoneAppData *phoneApp);
void ov101_021F0944(void *cb_arg);
void ov101_021F0978(void *arg);
void ov101_021F09B0(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0ACC(PokegearPhoneAppData *phoneApp, int a1, int a2);
void ov101_021F0B84(PokegearPhoneAppData *phoneApp);
int ov101_021F0BA0(PokegearPhoneAppData *phoneApp);
int ov101_021F0C4C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D6C(PokegearPhoneAppData *phoneApp);
void ov101_021F0D90(PokegearPhoneAppData *phoneApp);
void ov101_021F0EB0(PokegearPhoneAppData *phoneApp, u8 a1);
void ov101_021F1290(PokegearPhoneApp_Sub0E0 *a0, int a1, int a2);
void ov101_021F13C8(PokegearPhoneApp_Sub0E0 *a0, int a1);
int ov101_021F1804(PokegearPhoneApp_Sub0E0 *a0);
int ov101_021F0CE4(PokegearPhoneAppData *phoneApp);
void ov101_021F1338(PokegearPhoneApp_Sub0E0 *a0, int a1);
BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, int a1, int a2, int a3, int a4);
void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0);
BOOL ov101_021F26F8(void *a0);

extern const TouchscreenHitbox ov101_021F8400;

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

int ov101_021EFB4C(PokegearPhoneAppData *phoneApp) {
    if (ov101_021EFF14(phoneApp)) {
        phoneApp->unk_004 = 0;
        if (phoneApp->unk_0CB) {
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

// maybe file boundary?

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
    ov101_021F0464(phoneApp, 1);
    return TRUE;
}

BOOL ov101_021EFFC8(PokegearPhoneAppData *phoneApp) {
    BOOL r4;

    if (phoneApp->unk_0CB) {
        r4 = PhoneCall_CheckMapPermissionAndGetTimeOfDay(phoneApp->unk_0C4, phoneApp->unk_0C8, phoneApp->unk_0CB, phoneApp->unk_0C9, phoneApp->unk_0CA);
        phoneApp->unk_0CB = 0;
        phoneApp->pokegear->args->kind = 0;
    } else {
        r4 = PhoneCall_CheckMapPermissionAndGetTimeOfDay(phoneApp->unk_0C4, phoneApp->unk_0C8, phoneApp->unk_0CB, 0, 0);
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
    ov101_021F0464(phoneApp, 0);
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
