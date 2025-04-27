#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0271.h"

#include "map_header.h"
#include "phonebook_dat.h"

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
