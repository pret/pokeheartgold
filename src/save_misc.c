#include "save_misc_data.h"
#include "apricorn_tree.h"
#include "easy_chat.h"
#include "msgdata/msg/msg_0287.h"

void Sav2_BerryPots_init(BERRY_POT *berryPot) {
    int i;

    MI_CpuClear8(berryPot, MAX_BERRY_POT * sizeof(BERRY_POT));
    for (i = 0; i < MAX_BERRY_POT; i++) {
        berryPot[i].unk_1 = 0;
        berryPot[i].unk_0 = 0;
    }
}

void Sav2_BerryPotRTC_init(struct GF_RTC_DateTime *dateTime) {
    GF_RTC_CopyDateTime(&dateTime->date, &dateTime->time);
}

u32 Sav2_Misc_sizeof(void) {
    return sizeof(SAVE_MISC_DATA);
}

void Sav2_Misc_init(SAVE_MISC_DATA *saveMiscData) {
    int i;

    MI_CpuClearFast(saveMiscData, sizeof(SAVE_MISC_DATA));
    ApricornTrees_init(saveMiscData->apricorn_trees);
    Sav2_BerryPots_init(saveMiscData->berry_pots);
    Sav2_BerryPotRTC_init(&saveMiscData->berry_datetime);
    SavGymmick_Clear(&saveMiscData->gymmick);
    MI_CpuFill16(saveMiscData->rivalName, EOS, OT_NAME_LENGTH + 1);
    MI_CpuFill8(saveMiscData->unk_0280, 0xFF, 8);
    MailMsg_init_withBank(&saveMiscData->battleGreetingEC, MAILMSG_BANK_0295_GMM);
    saveMiscData->battleGreetingEC.msg_no = msg_0295_00000;
    saveMiscData->battleGreetingEC.fields[0] = GetECWordIndexByPair(NARC_msg_msg_0287_bin, msg_0287_regards);
    saveMiscData->battleGreetingEC.fields[1] = EC_WORD_NULL;
    for (i = 0; i < 5; i++) {
        saveMiscData->unk_02A8[0][i] = -1;
        saveMiscData->unk_02A8[1][i] = -1;
    }
}

SAVE_MISC_DATA *Sav2_Misc_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_MISC);
}

const SAVE_MISC_DATA *Sav2_Misc_const_get(const SAVEDATA *saveData) {
    return SavArray_const_get(saveData, SAVE_MISC);
}

APRICORN_TREE *Sav2_FieldApricornTrees_get(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SavArray_get(saveData, SAVE_MISC);
    return misc->apricorn_trees;
}

BERRY_POT *Sav2_BerryPots_get(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SavArray_get(saveData, SAVE_MISC);
    return misc->berry_pots;
}

struct GF_RTC_DateTime *Sav2_BerryPotRTC_get(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SavArray_get(saveData, SAVE_MISC);
    return &misc->berry_datetime;
}

struct Gymmick *Sav2_GetGymmickPtr(SAVEDATA *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SavArray_get(saveData, SAVE_MISC);
    return &misc->gymmick;
}

const u16 *Sav2_Misc_RivalName_const_get(const SAVE_MISC_DATA *saveMiscData) {
    return saveMiscData->rivalName;
}

void Sav2_Misc_RivalName_set(SAVE_MISC_DATA *saveMiscData, const STRING *name) {
    CopyStringToU16Array(name, saveMiscData->rivalName, OT_NAME_LENGTH + 1);
}

void SaveMisc_SetExtraChunksExist(SAVE_MISC_DATA *saveMiscData) {
    saveMiscData->extraChunksExist = TRUE;
}

BOOL SaveMisc_CheckExtraChunksExist(SAVE_MISC_DATA *saveMiscData) {
    return saveMiscData->extraChunksExist;
}

void sub_0202A9E8(SAVE_MISC_DATA *saveMiscData, int a1, int a2, int a3) {
    saveMiscData->unk_0298 = a1;
    saveMiscData->unk_029A_0 = a2;
    saveMiscData->unk_029A_7 = a3;
}

void sub_0202AA20(SAVE_MISC_DATA *saveMiscData, int *a1, int *a2, int *a3) {
    *a1 = saveMiscData->unk_0298;
    *a2 = saveMiscData->unk_029A_0;
    *a3 = saveMiscData->unk_029A_7;
}

static const u8 _020F677C[3][2] = {
    {0, 4},
    {4, 2},
    {6, 2},
};

BOOL sub_0202AA44(SAVE_MISC_DATA *saveMiscData, int a1, int a2) {
    int i;
    if (a1 > NELEMS(_020F677C) - 1) {
        return FALSE;
    }
    for (i = 0; i < _020F677C[a1][1]; i++) {
        if (saveMiscData->unk_0280[_020F677C[a1][0] + i] == 0xFF) {
            break;
        }
        if (saveMiscData->unk_0280[_020F677C[a1][0] + i] == a2) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_0202AA9C(SAVE_MISC_DATA *saveMiscData, int a1) {
    int i;
    if (a1 > NELEMS(_020F677C) - 1) {
        return;
    }
    for (i = 0; i < _020F677C[a1][1]; i++) {
        saveMiscData->unk_0280[_020F677C[a1][0] + i] = 0xFF;
    }
}

u8 sub_0202AAD4(SAVE_MISC_DATA *saveMiscData, int a1) {
    int n = 0;
    int i, min, max;
    if (a1 > NELEMS(_020F677C) - 1) {
        return 0;
    }
    min = _020F677C[a1][0];
    max = _020F677C[a1][0] + _020F677C[a1][1] - 1;
    for (i = min; i <= max; i++) {
        if (saveMiscData->unk_0280[i] != 0xFF) {
            n++;
        }
    }
    return n;
}

void sub_0202AB18(SAVE_MISC_DATA *saveMiscData, u8 a1, u8 a2, u8 a3) {
    int i, len, min, max;
    if (a1 > NELEMS(_020F677C) - 1) {
        return;
    }
    len = _020F677C[a1][1];
    min = _020F677C[a1][0];
    max = min + len - 1;
    for (i = min; i <= max; i++) {
        if (saveMiscData->unk_0280[i] == 0xFF) {
            saveMiscData->unk_0280[i] = a3;
            return;
        }
    }
    if (a2 == len + 1) {
        sub_0202AA9C(saveMiscData, a1);
        saveMiscData->unk_0280[_020F677C[a1][0]] = a3;
        return;
    }
    MI_CpuCopy8(&saveMiscData->unk_0280[_020F677C[a1][0] + 1], &saveMiscData->unk_0280[_020F677C[a1][0]], len - 1);
    saveMiscData->unk_0280[max] = a3;
}

void sub_0202ABB0(SAVE_MISC_DATA * saveMiscData, int a1, u8 a2) {
    saveMiscData->unk_02D8 = a1;
    saveMiscData->unk_02DC = a2;
}

void sub_0202ABBC(SAVE_MISC_DATA * saveMiscData, int *a1, u8 *a2) {
    *a1 = saveMiscData->unk_02D8;
    *a2 = saveMiscData->unk_02DC;
}

void SaveMisc_GetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MAIL_MESSAGE *a1) {
    *a1 = saveMiscData->battleGreetingEC;
}

void SaveMisc_SetBattleGreeting(SAVE_MISC_DATA *saveMiscData, MAIL_MESSAGE *a1) {
    saveMiscData->battleGreetingEC = *a1;
}

void sub_0202AC0C(SAVE_MISC_DATA *saveMiscData, u8 *a1) {
    *a1 = saveMiscData->unk_029B_1;
}

void sub_0202AC1C(SAVE_MISC_DATA *saveMiscData, u8 a1) {
    saveMiscData->unk_029B_1 = a1;
}

void sub_0202AC38(SAVE_MISC_DATA *saveMiscData, int a1, u32 *a2, u32 *a3, u8 *a4) {
    *a2 = saveMiscData->unk_02A8[0][a1 - 1];
    *a3 = saveMiscData->unk_02A8[1][a1 - 1];
    *a4 = saveMiscData->unk_02D0[a1 - 1];
}

void sub_0202AC60(SAVE_MISC_DATA *saveMiscData, int a1, u32 a2, u32 a3, u8 a4) {
    saveMiscData->unk_02A8[0][a1 - 1] = a2;
    saveMiscData->unk_02A8[1][a1 - 1] = a3;
    saveMiscData->unk_02D0[a1 - 1] = a4;
}
