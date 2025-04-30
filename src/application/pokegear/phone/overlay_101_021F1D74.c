#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0271.h"

#include "map_header.h"
#include "math_util.h"
#include "phonebook_dat.h"
#include "render_text.h"
#include "text.h"
#include "unk_02005D10.h"

static BOOL (*const ov101_021F867C[])(PokegearPhoneApp_Sub0C4 *) = {
    ov101_021F2680,
    ov101_021F2F50,
    ov101_021F2FFC,
    ov101_021F35EC,
    GearPhoneCall_Mom,
    ov101_021F313C,
    ov101_021F38FC,
    ov101_021F3798,
    ov101_021F3B20,
    ov101_021F3BA0,
    ov101_021F3CC0,
    ov101_021F3DC8,
    ov101_021F3448,
    ov101_021F3F10,
    ov101_021F4064,
    ov101_021F41B8,
};

PokegearPhoneApp_Sub0C4 *ov101_021F1D74(const PokegearPhoneApp_Sub0C4Template *template) {
    PokegearPhoneApp_Sub0C4 *ret = AllocFromHeap(template->unk_00, sizeof(PokegearPhoneApp_Sub0C4));
    MI_CpuClear8(ret, sizeof(PokegearPhoneApp_Sub0C4));
    ret->heapId = template->unk_00;
    ret->unk_80 = AllocAndReadPhoneBook(template->unk_00);
    ret->unk_84 = ret->unk_80->entries;
    ret->unk_04 = template->unk_0C;
    ret->unk_3C = template->unk_04;
    ret->unk_40 = template->unk_08;
    ret->unk_08 = template->unk_10;
    ret->unk_0C = template->unk_14;
    ret->unk_10 = template->unk_18;
    ret->unk_18 = template->unk_1C;
    ret->unk_1C = template->unk_20;
    ret->unk_20 = template->unk_24;
    ret->unk_24 = template->unk_28;
    ret->unk_28 = template->unk_2C;
    ret->unk_2C = template->unk_30;
    ret->unk_30 = template->unk_34;
    ret->unk_32 = template->unk_36;
    ret->unk_34 = template->unk_38;
    ret->unk_36 = PlayerProfile_GetTrainerGender(ret->unk_24);
    ret->unk_44 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, ret->heapId);
    ret->unk_48 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0640_bin, ret->heapId);
    ret->unk_50 = MessageFormat_New_Custom(16, 37, ret->heapId);
    ret->unk_54 = String_New(1081, ret->heapId);
    ret->unk_64 = String_New(1081, ret->heapId);
    ret->unk_58 = String_New(16, ret->heapId);
    ret->unk_5C = String_New(44, ret->heapId);
    ret->unk_60 = NewString_ReadMsgData(ret->unk_44, msg_0271_00029);
    for (int i = 0; i < 3; ++i) {
        ret->unk_68[i] = NewString_ReadMsgData(ret->unk_44, msg_0271_00030 + i);
        ret->unk_74[i] = NewString_ReadMsgData(ret->unk_44, msg_0271_00033 + i);
    }
    return ret;
}

void ov101_021F1E80(PokegearPhoneApp_Sub0C4 *a0) {
    for (int i = 0; i < 3; ++i) {
        String_Delete(a0->unk_68[i]);
        String_Delete(a0->unk_74[i]);
    }
    String_Delete(a0->unk_60);
    String_Delete(a0->unk_5C);
    String_Delete(a0->unk_58);
    String_Delete(a0->unk_64);
    String_Delete(a0->unk_54);
    MessageFormat_Delete(a0->unk_50);
    DestroyMsgData(a0->unk_48);
    DestroyMsgData(a0->unk_44);
    FreePhoneBook(a0->unk_80);
    MI_CpuClear8(a0, sizeof(PokegearPhoneApp_Sub0C4));
    FreeToHeap(a0);
}

String *PhoneContact_GetName(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    if (a1 >= NUM_PHONE_CONTACTS) {
        a1 = PHONE_CONTACT_MOTHER;
    }
    int gmm = GetPhoneMessageGmm(a1);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, gmm, a0->heapId);
    ReadMsgDataIntoString(msgData, 0, a0->unk_58);
    DestroyMsgData(msgData);
    return a0->unk_58;
}

String *PhoneContact_GetClass(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    if (a1 >= NUM_PHONE_CONTACTS) {
        a1 = PHONE_CONTACT_MOTHER;
    }
    if (a0->unk_84[a1].trainerClass == TRAINERCLASS_PHONE_MOM) {
        String_SetEmpty(a0->unk_5C);
    } else if (a0->unk_84[a1].trainerClass >= TRAINERCLASS_PHONE_POKEMON_PROFESSOR) {
        ReadMsgDataIntoString(a0->unk_44, a0->unk_84[a1].trainerClass - TRAINERCLASS_PHONE_POKEMON_PROFESSOR + msg_0271_00038, a0->unk_5C);
    } else {
        BufferTrainerClassName(a0->unk_50, 0, a0->unk_84[a1].trainerClass);
        StringExpandPlaceholders(a0->unk_50, a0->unk_5C, a0->unk_60);
    }
    return a0->unk_5C;
}

BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, u8 a1, u8 a2, u8 a3, u8 a4) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    MI_CpuClear8(r4, sizeof(PokegearPhoneApp_Sub0C4_Sub88));
    if (a1 >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(FALSE);
        r4->unk_00 = 0xFF;
        return FALSE;
    }
    if (a2) {
        if (!MapHeader_GetField14_1E(a0->unk_30)) {
            r4->unk_00 = 0xFF;
            return FALSE;
        }
    } else {
        if (!MapHeader_GetField14_1D(a0->unk_30)) {
            r4->unk_00 = 0xFF;
            return FALSE;
        }
    }

    r4->unk_18 = a1;
    r4->unk_10 = &a0->unk_84[a1];
    r4->unk_19 = a2;
    r4->unk_1A = a3;
    r4->unk_1C = a4;
    r4->unk_00 = r4->unk_19;
    GF_RTC_CopyDateTime(&r4->unk_28, &r4->unk_38);
    r4->unk_23 = GF_RTC_GetTimeOfDayWildParamByHour(r4->unk_38.hour);
    r4->unk_20 = 0;
    r4->unk_1E = 0;
    return TRUE;
}

void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    FillWindowPixelBuffer(a0->unk_0C, 0);
    ScheduleWindowCopyToVram(a0->unk_0C);

    switch (r4->unk_10->unk1) {
    case 0:
        r4->unk_1E = ov101_021F2B80(a0, r4);
        break;
    case 1:
        r4->unk_1E = PhoneCall_GetCallScriptId_Mother(a0, r4);
        break;
    case 2:
        r4->unk_1E = PhoneCall_GetCallScriptId_ProfElm(a0, r4);
        break;
    case 3:
        r4->unk_1E = PhoneCall_GetCallScriptId_ProfOak(a0, r4);
        break;
    case 5:
        r4->unk_1E = ov101_021F3518(a0, r4);
        break;
    case 7:
        r4->unk_1E = ov101_021F35C4(a0, r4);
        break;
    case 9:
        r4->unk_1E = ov101_021F388C(a0, r4);
        break;
    case 8:
        r4->unk_1E = ov101_021F36F4(a0, r4);
        break;
    case 10:
        r4->unk_1E = ov101_021F3AA4(a0, r4);
        break;
    case 11:
        r4->unk_1E = ov101_021F3C8C(a0, r4);
        break;
    case 4:
        r4->unk_1E = ov101_021F342C(a0, r4);
        break;
    case 12:
        r4->unk_1E = ov101_021F3EA8(a0, r4);
        break;
    case 6:
        r4->unk_1E = ov101_021F3530(a0, r4);
        break;
    case 13:
        r4->unk_1E = ov101_021F410C(a0, r4);
        break;
    case 14:
        r4->unk_1E = ov101_021F4274(a0, r4);
        break;
    case 15:
    default:
        r4->unk_20 = 0;
        r4->unk_1E = 0;
        break;
    }
    if (r4->unk_20 <= 2) {
        r4->unk_14 = &sPhoneCallScriptDef[r4->unk_1E];
    }
}

void ov101_021F2110(PokegearPhoneApp_Sub0C4 *a0) {
    a0->unk_4C = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, GetPhoneMessageGmm(a0->unk_88.unk_18), a0->heapId);
    BufferPlayersName(a0->unk_50, 0, a0->unk_24);
    BufferString(a0->unk_50, 1, PhoneContact_GetName(a0, a0->unk_88.unk_18), 2, 1, 2);
    BufferLandmarkName(a0->unk_50, 2, MapHeader_GetMapSec(a0->unk_30));
    BufferLandmarkName(a0->unk_50, 3, MapHeader_GetMapSec(a0->unk_88.unk_10->mapId));
}

void ov101_021F217C(PokegearPhoneApp_Sub0C4 *a0) {
    if (TouchscreenHitbox_TouchNewIsIn(&ov101_021F8400)) {
        Sprite_SetAnimActiveFlag(a0->unk_40, TRUE);
        Sprite_ResetAnimCtrlState(a0->unk_40);
    }
}

void PhoneCallMessagePrint(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, const u8 *a2) {
    ReadMsgDataIntoString(msgData, a2[a0->unk_36], a0->unk_64);
    StringExpandPlaceholders(a0->unk_50, a0->unk_54, a0->unk_64);
    FillWindowPixelBuffer(a0->unk_0C, 0);
    a0->unk_35 = AddTextPrinterParameterizedWithColor(a0->unk_0C, 0, a0->unk_54, 0, 0, a0->unk_34, MAKE_TEXT_COLOR(1, 2, 0), NULL);
}

void PhoneCallMessagePrint_Gendered(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, u8 msgIdIfEthan, u8 msgIdIfLyra) {
    a0->unk_37[0] = msgIdIfEthan;
    a0->unk_37[1] = msgIdIfLyra;
    PhoneCallMessagePrint(a0, msgData, a0->unk_37);
}

void PhoneCallMessagePrint_Ungendered(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, u8 msgId) {
    a0->unk_37[0] = msgId;
    a0->unk_37[1] = msgId;
    PhoneCallMessagePrint(a0, msgData, a0->unk_37);
}

BOOL ov101_021F2220(PokegearPhoneApp_Sub0C4 *a0) {
    ov101_021F217C(a0);
    if (TextPrinterCheckActive(a0->unk_35)) {
        return FALSE;
    }
    a0->unk_88.unk_22 = TextFlags_GetIsTouchSpeedingUpPrint();
    return TRUE;
}

void ov101_021F2248(PokegearPhoneApp_Sub0C4 *a0, const PhoneCallScriptDef *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r6 = &a0->unk_88;
    u16 r2;

    switch (a1->unk_2_0) {
    case 3:
        PhoneRematches_SetSeeking(a0->unk_20, r6->unk_18, TRUE);
        break;
    case 4:
        r2 = a1->unk_4;
        if (r2 == 149) {
            r2 = (MTRandom() % 10) + 149;
        } else if (r2 == 4) {
            r2 = (MTRandom() % 3) + 2;
        }
        PhoneRematches_GiftItemIdSet(a0->unk_20, r6->unk_18, r2);
        break;
    case 1:
    case 2:
        if (a1->unk_2_4) {
            Save_VarsFlags_SetFlagInArray(a0->unk_28, a1->unk_4);
        } else {
            Save_VarsFlags_ClearFlagInArray(a0->unk_28, a1->unk_4);
        }
        break;
    case 5:
        ReadMsgDataIntoString(a0->unk_4C, a1->unk_4 + (LCRandom() % a1->unk_2_4), a0->unk_54);
        BufferString(a0->unk_50, 4, a0->unk_54, 2, 1, 2);
        break;
    }
}

void ov101_021F2308(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    ov101_021F0ACC(a0->unk_04, 2, 1);
    a0->unk_14 = ov101_021F09B0(a0->unk_04, 0, a1);
    Sprite_SetVisibleFlag(a0->unk_40, FALSE);
    ov101_021F2384(a0, 1);
}

int ov101_021F2338(PokegearPhoneApp_Sub0C4 *a0) {
    return TouchscreenListMenu_HandleInput(a0->unk_14);
}

void ov101_021F2344(PokegearPhoneApp_Sub0C4 *a0) {
    *a0->unk_3C = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(a0->unk_14);
    TouchscreenListMenu_Destroy(a0->unk_14);
    ov101_021F0ACC(a0->unk_04, 0, 0);
    Sprite_SetVisibleFlag(a0->unk_40, TRUE);
    ov101_021F2384(a0, 0);
}

const PhoneCallScriptDef *ov101_021F2374(int a0) {
    return &sPhoneCallScriptDef[a0];
}

void ov101_021F2384(PokegearPhoneApp_Sub0C4 *a0, int a1) {
    if (a1) {
        PaletteData_BlendPalette(a0->unk_18, PLTTBUF_MAIN_BG, 0x10, 0x10, 0, RGB_BLACK);
        PaletteData_BlendPalette(a0->unk_18, PLTTBUF_MAIN_BG, 0xA0, 0x10, 0, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(a0->unk_18, PLTTBUF_MAIN_BG, 0x10, 0x10, 8, RGB_BLACK);
        PaletteData_BlendPalette(a0->unk_18, PLTTBUF_MAIN_BG, 0xA0, 0x10, 8, RGB_BLACK);
    }
    PaletteData_SetAutoTransparent(a0->unk_18, TRUE);
    PaletteData_PushTransparentBuffers(a0->unk_18);
    PaletteData_SetAutoTransparent(a0->unk_18, FALSE);
}

BOOL ov101_021F23F0(PokegearPhoneApp_Sub0C4 *a0) {
    ov101_021F217C(a0);
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        PlaySE(SEQ_SE_DP_SELECT);
        a0->unk_88.unk_22 = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    }

    if (TouchscreenHitbox_TouchNewIsIn(&ov101_021F8400)) {
        PlaySE(SEQ_SE_DP_SELECT);
        a0->unk_88.unk_22 = MENU_INPUT_STATE_TOUCH;
        return TRUE;
    }

    return FALSE;
}

void ov101_021F243C(PokegearPhoneApp_Sub0C4 *a0, u8 a1, u8 a2) {
    if (a2 == 0) {
        FillWindowPixelBuffer(a0->unk_0C, 0);
    }
    if (a1 == 0) {
        AddTextPrinterParameterizedWithColor(a0->unk_0C, 0, a0->unk_68[a2], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    } else {
        AddTextPrinterParameterizedWithColor(a0->unk_0C, 0, a0->unk_74[a2], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    }
}

BOOL ov101_021F2494(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    ov101_021F217C(a0);
    switch (r4->unk_08) {
    case 0:
        PlaySE(SEQ_SE_GS_PHONE0);
        ov101_021F243C(a0, 0, r4->unk_08);
        break;
    case 1:
        if (IsSEPlaying(SEQ_SE_GS_PHONE0)) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_PHONE0);
        ov101_021F243C(a0, 0, r4->unk_08);
        break;
    case 2:
        if (IsSEPlaying(SEQ_SE_GS_PHONE0)) {
            return FALSE;
        }
        r4->unk_08 = 0;
        return TRUE;
    }

    ++r4->unk_08;
    return FALSE;
}

BOOL ov101_021F2510(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    ov101_021F217C(a0);
    switch (r4->unk_08) {
    case 0:
        PlaySE(SEQ_SE_GS_PHONE_OFF);
        ov101_021F243C(a0, 1, r4->unk_08);
        r4->unk_24 = 0;
        break;
    case 1:
    case 2:
        if (r4->unk_24++ < 10) {
            return FALSE;
        }
        r4->unk_24 = 0;
        ov101_021F243C(a0, 1, r4->unk_08);
        break;
    case 3:
        if (r4->unk_24++ < 10) {
            return FALSE;
        }
        r4->unk_24 = 0;
        r4->unk_08 = 0;
        return TRUE;
    }

    ++r4->unk_08;
    return FALSE;
}

BOOL ov101_021F2598(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    ov101_021F217C(a0);
    switch (r4->unk_08) {
    case 0:
        ov101_021F243C(a0, 0, r4->unk_08);
        r4->unk_24 = 0;
        break;
    case 1:
    case 2:
        if (r4->unk_24++ < 10) {
            return FALSE;
        }
        r4->unk_24 = 0;
        ov101_021F243C(a0, 0, r4->unk_08);
        break;
    case 3:
        if (r4->unk_24++ < 10) {
            return FALSE;
        }
        r4->unk_24 = 0;
        r4->unk_08 = 0;
        return TRUE;
    }

    ++r4->unk_08;
    return FALSE;
}

BOOL ov101_021F2614(PokegearPhoneApp_Sub0C4 *a0) {
    u16 r3;
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    ov101_021F217C(a0);
    switch (r4->unk_08) {
    case 0:
        r3 = r4->unk_23 * 2 + r4->unk_19 * 6;
        PhoneCallMessagePrint_Gendered(a0, a0->unk_48, ov101_021F962C[r4->unk_10->unkC][r3], ov101_021F962C[r4->unk_10->unkC][r3 + 1]);
        break;
    case 1:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        r4->unk_08 = 0;
        return TRUE;
    }

    ++r4->unk_08;
    return FALSE;
}

BOOL ov101_021F2680(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    const PhoneCallScriptDef *r6 = r4->unk_14;

    switch (r4->unk_04) {
    case 0:
        ov101_021F2110(a0);
        ov101_021F2248(a0, r6);
        if (r4->unk_10->unkC == 0xFF) {
            ++r4->unk_04;
        }
        break;
    case 1:
        if (!ov101_021F2614(a0)) {
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint(a0, a0->unk_4C, r6->msgIds);
        break;
    case 3:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->unk_4C);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}

BOOL ov101_021F26F8(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    switch (r4->unk_00) {
    case 0:
        if (!ov101_021F2494(a0)) {
            return FALSE;
        }
        break;
    case 1:
        if (!ov101_021F867C[r4->unk_20](a0)) {
            return FALSE;
        }
        *a0->unk_3C = (MenuInputState)r4->unk_22;
        break;
    case 2:
        if (!ov101_021F23F0(a0)) {
            return FALSE;
        }
        break;
    case 3:
        if (!ov101_021F2510(a0)) {
            return FALSE;
        }
        r4->unk_00 = 0;
        return TRUE;
    case 255:
        if (!ov101_021F2598(a0)) {
            return FALSE;
        }
        break;
    case 256:
        if (!ov101_021F2510(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->unk_44, 37);
        break;
    case 257:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        break;
    case 258:
        if (!ov101_021F23F0(a0)) {
            return FALSE;
        }
        r4->unk_00 = 0;
        return TRUE;
    }

    ++r4->unk_00;
    return FALSE;
}
