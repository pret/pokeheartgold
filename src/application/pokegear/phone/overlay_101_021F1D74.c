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
    PokegearPhoneApp_Sub0C4 *ret = AllocFromHeap(template->heapId, sizeof(PokegearPhoneApp_Sub0C4));
    MI_CpuClear8(ret, sizeof(PokegearPhoneApp_Sub0C4));
    ret->heapId = template->heapId;
    ret->phoneBook = AllocAndReadPhoneBook(template->heapId);
    ret->phoneEntries = ret->phoneBook->entries;
    ret->phoneApp = template->phoneApp;
    ret->menuInputStatePtr = template->menuInputStatePtr;
    ret->sprite = template->sprite;
    ret->bgConfig = template->bgConfig;
    ret->phoneCallMsgWindow = template->window1;
    ret->window2 = template->window2;
    ret->plttData = template->plttData;
    ret->saveData = template->saveData;
    ret->momsSavings = template->momsSavings;
    ret->playerProfile = template->playerProfile;
    ret->saveVarsFlags = template->saveVarsFlags;
    ret->rtc = template->rtc;
    ret->playerMapSec = template->playerMapSec;
    ret->playerMapID = template->playerMapID;
    ret->textSpeed = template->textSpeed;
    ret->playerGender = PlayerProfile_GetTrainerGender(ret->playerProfile);
    ret->msgData_0271 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, ret->heapId);
    ret->msgData_0640 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0640_bin, ret->heapId);
    ret->msgFormat = MessageFormat_New_Custom(16, 37, ret->heapId);
    ret->msgExpansionBuff = String_New(1081, ret->heapId);
    ret->phoneCallMsgReadBuff = String_New(1081, ret->heapId);
    ret->contactNameBuf = String_New(16, ret->heapId);
    ret->contactClassBuf = String_New(44, ret->heapId);
    ret->buf14String = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00029);
    for (int i = 0; i < 3; ++i) {
        ret->noSignalMsgs[i] = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00030 + i);
        ret->hangUpMsgs[i] = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00033 + i);
    }
    return ret;
}

void ov101_021F1E80(PokegearPhoneApp_Sub0C4 *a0) {
    for (int i = 0; i < 3; ++i) {
        String_Delete(a0->noSignalMsgs[i]);
        String_Delete(a0->hangUpMsgs[i]);
    }
    String_Delete(a0->buf14String);
    String_Delete(a0->contactClassBuf);
    String_Delete(a0->contactNameBuf);
    String_Delete(a0->phoneCallMsgReadBuff);
    String_Delete(a0->msgExpansionBuff);
    MessageFormat_Delete(a0->msgFormat);
    DestroyMsgData(a0->msgData_0640);
    DestroyMsgData(a0->msgData_0271);
    FreePhoneBook(a0->phoneBook);
    MI_CpuClear8(a0, sizeof(PokegearPhoneApp_Sub0C4));
    FreeToHeap(a0);
}

String *PhoneContact_GetName(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    if (a1 >= NUM_PHONE_CONTACTS) {
        a1 = PHONE_CONTACT_MOTHER;
    }
    int gmm = GetPhoneMessageGmm(a1);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, gmm, a0->heapId);
    ReadMsgDataIntoString(msgData, 0, a0->contactNameBuf);
    DestroyMsgData(msgData);
    return a0->contactNameBuf;
}

String *PhoneContact_GetClass(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    if (a1 >= NUM_PHONE_CONTACTS) {
        a1 = PHONE_CONTACT_MOTHER;
    }
    if (a0->phoneEntries[a1].trainerClass == TRAINERCLASS_PHONE_MOM) {
        String_SetEmpty(a0->contactClassBuf);
    } else if (a0->phoneEntries[a1].trainerClass >= TRAINERCLASS_PHONE_POKEMON_PROFESSOR) {
        ReadMsgDataIntoString(a0->msgData_0271, a0->phoneEntries[a1].trainerClass - TRAINERCLASS_PHONE_POKEMON_PROFESSOR + msg_0271_00038, a0->contactClassBuf);
    } else {
        BufferTrainerClassName(a0->msgFormat, 0, a0->phoneEntries[a1].trainerClass);
        StringExpandPlaceholders(a0->msgFormat, a0->contactClassBuf, a0->buf14String);
    }
    return a0->contactClassBuf;
}

BOOL PhoneCall_CheckMapPermissionAndGetTimeOfDay(PokegearPhoneApp_Sub0C4 *a0, u8 callerId, u8 a2, u8 a3, u8 a4) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    MI_CpuClear8(r4, sizeof(PokegearPhoneApp_Sub0C4_Sub88));
    if (callerId >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(FALSE);
        r4->unk_00 = 0xFF;
        return FALSE;
    }
    if (a2) {
        if (!MapHeader_GetField14_1E(a0->playerMapSec)) {
            r4->unk_00 = 0xFF;
            return FALSE;
        }
    } else {
        if (!MapHeader_GetField14_1D(a0->playerMapSec)) {
            r4->unk_00 = 0xFF;
            return FALSE;
        }
    }

    r4->callerID = callerId;
    r4->phoneBookEntry = &a0->phoneEntries[callerId];
    r4->unk_19 = a2;
    r4->unk_1A = a3;
    r4->unk_1C = a4;
    r4->unk_00 = r4->unk_19;
    GF_RTC_CopyDateTime(&r4->date, &r4->time);
    r4->timeOfDay = GF_RTC_GetTimeOfDayWildParamByHour(r4->time.hour);
    r4->unk_20 = 0;
    r4->unk_1E = 0;
    return TRUE;
}

void PhoneCall_GetCallScriptId(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    FillWindowPixelBuffer(a0->phoneCallMsgWindow, 0);
    ScheduleWindowCopyToVram(a0->phoneCallMsgWindow);

    switch (r4->phoneBookEntry->type) {
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
        r4->scriptDef = &sPhoneCallScriptDef[r4->unk_1E];
    }
}

void ov101_021F2110(PokegearPhoneApp_Sub0C4 *a0) {
    a0->msgData_PhoneContact = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, GetPhoneMessageGmm(a0->unk_88.callerID), a0->heapId);
    BufferPlayersName(a0->msgFormat, 0, a0->playerProfile);
    BufferString(a0->msgFormat, 1, PhoneContact_GetName(a0, a0->unk_88.callerID), 2, 1, 2);
    BufferLandmarkName(a0->msgFormat, 2, MapHeader_GetMapSec(a0->playerMapSec));
    BufferLandmarkName(a0->msgFormat, 3, MapHeader_GetMapSec(a0->unk_88.phoneBookEntry->mapId));
}

void ov101_021F217C(PokegearPhoneApp_Sub0C4 *a0) {
    if (TouchscreenHitbox_TouchNewIsIn(&ov101_021F8400)) {
        Sprite_SetAnimActiveFlag(a0->sprite, TRUE);
        Sprite_ResetAnimCtrlState(a0->sprite);
    }
}

void PhoneCallMessagePrint(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, const u8 *msgIDs) {
    ReadMsgDataIntoString(msgData, msgIDs[a0->playerGender], a0->phoneCallMsgReadBuff);
    StringExpandPlaceholders(a0->msgFormat, a0->msgExpansionBuff, a0->phoneCallMsgReadBuff);
    FillWindowPixelBuffer(a0->phoneCallMsgWindow, 0);
    a0->textPrinter = AddTextPrinterParameterizedWithColor(a0->phoneCallMsgWindow, 0, a0->msgExpansionBuff, 0, 0, a0->textSpeed, MAKE_TEXT_COLOR(1, 2, 0), NULL);
}

void PhoneCallMessagePrint_Gendered(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, u8 msgIDifEthan, u8 msgIDifLyra) {
    a0->msgIDs[0] = msgIDifEthan;
    a0->msgIDs[1] = msgIDifLyra;
    PhoneCallMessagePrint(a0, msgData, a0->msgIDs);
}

void PhoneCallMessagePrint_Ungendered(PokegearPhoneApp_Sub0C4 *a0, MsgData *msgData, u8 msgID) {
    a0->msgIDs[0] = msgID;
    a0->msgIDs[1] = msgID;
    PhoneCallMessagePrint(a0, msgData, a0->msgIDs);
}

BOOL ov101_021F2220(PokegearPhoneApp_Sub0C4 *a0) {
    ov101_021F217C(a0);
    if (TextPrinterCheckActive(a0->textPrinter)) {
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
        PhoneRematches_SetSeeking(a0->momsSavings, r6->callerID, TRUE);
        break;
    case 4:
        r2 = a1->unk_4;
        if (r2 == 149) {
            r2 = (MTRandom() % 10) + 149;
        } else if (r2 == 4) {
            r2 = (MTRandom() % 3) + 2;
        }
        PhoneRematches_GiftItemIdSet(a0->momsSavings, r6->callerID, r2);
        break;
    case 1:
    case 2:
        if (a1->unk_2_4) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, a1->unk_4);
        } else {
            Save_VarsFlags_ClearFlagInArray(a0->saveVarsFlags, a1->unk_4);
        }
        break;
    case 5:
        ReadMsgDataIntoString(a0->msgData_PhoneContact, a1->unk_4 + (LCRandom() % a1->unk_2_4), a0->msgExpansionBuff);
        BufferString(a0->msgFormat, 4, a0->msgExpansionBuff, 2, 1, 2);
        break;
    }
}

void ov101_021F2308(PokegearPhoneApp_Sub0C4 *a0, u8 a1) {
    ov101_021F0ACC(a0->phoneApp, 2, 1);
    a0->unk_14 = ov101_021F09B0(a0->phoneApp, 0, a1);
    Sprite_SetVisibleFlag(a0->sprite, FALSE);
    ov101_021F2384(a0, 1);
}

int ov101_021F2338(PokegearPhoneApp_Sub0C4 *a0) {
    return TouchscreenListMenu_HandleInput(a0->unk_14);
}

void ov101_021F2344(PokegearPhoneApp_Sub0C4 *a0) {
    *a0->menuInputStatePtr = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(a0->unk_14);
    TouchscreenListMenu_Destroy(a0->unk_14);
    ov101_021F0ACC(a0->phoneApp, 0, 0);
    Sprite_SetVisibleFlag(a0->sprite, TRUE);
    ov101_021F2384(a0, 0);
}

const PhoneCallScriptDef *ov101_021F2374(int a0) {
    return &sPhoneCallScriptDef[a0];
}

void ov101_021F2384(PokegearPhoneApp_Sub0C4 *a0, int a1) {
    if (a1) {
        PaletteData_BlendPalette(a0->plttData, PLTTBUF_MAIN_BG, 0x10, 0x10, 0, RGB_BLACK);
        PaletteData_BlendPalette(a0->plttData, PLTTBUF_MAIN_BG, 0xA0, 0x10, 0, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(a0->plttData, PLTTBUF_MAIN_BG, 0x10, 0x10, 8, RGB_BLACK);
        PaletteData_BlendPalette(a0->plttData, PLTTBUF_MAIN_BG, 0xA0, 0x10, 8, RGB_BLACK);
    }
    PaletteData_SetAutoTransparent(a0->plttData, TRUE);
    PaletteData_PushTransparentBuffers(a0->plttData);
    PaletteData_SetAutoTransparent(a0->plttData, FALSE);
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
        FillWindowPixelBuffer(a0->phoneCallMsgWindow, 0);
    }
    if (a1 == 0) {
        AddTextPrinterParameterizedWithColor(a0->phoneCallMsgWindow, 0, a0->noSignalMsgs[a2], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    } else {
        AddTextPrinterParameterizedWithColor(a0->phoneCallMsgWindow, 0, a0->hangUpMsgs[a2], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
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
        r3 = r4->timeOfDay * 2 + r4->unk_19 * 6;
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_0640, ov101_021F962C[r4->phoneBookEntry->unkC][r3], ov101_021F962C[r4->phoneBookEntry->unkC][r3 + 1]);
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
    const PhoneCallScriptDef *r6 = r4->scriptDef;

    switch (r4->unk_04) {
    case 0:
        ov101_021F2110(a0);
        ov101_021F2248(a0, r6);
        if (r4->phoneBookEntry->unkC == 0xFF) {
            ++r4->unk_04;
        }
        break;
    case 1:
        if (!ov101_021F2614(a0)) {
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint(a0, a0->msgData_PhoneContact, r6->msgIds);
        break;
    case 3:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
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
        *a0->menuInputStatePtr = (MenuInputState)r4->unk_22;
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
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_0271, 37);
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
