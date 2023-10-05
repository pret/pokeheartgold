#include "global.h"
#include "save_misc_data.h"
#include "apricorn_tree.h"
#include "easy_chat.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0295.h"
#include "msgdata/msg/msg_0287.h"

void Save_BerryPots_Init(BerryPot *berryPots) {
    int i;

    MI_CpuClear8(berryPots, MAX_BERRY_POT * sizeof(BerryPot));
    for (i = 0; i < MAX_BERRY_POT; i++) {
        berryPots[i].growthStage = BERRY_POT_GROWTH_STAGE_INVALID;
        berryPots[i].berryId = 0;
    }
}

void Save_BerryPotRTC_Init(struct GF_RTC_DateTime *dateTime) {
    GF_RTC_CopyDateTime(&dateTime->date, &dateTime->time);
}

u32 Save_Misc_sizeof(void) {
    return sizeof(SAVE_MISC_DATA);
}

void Save_Misc_Init(SAVE_MISC_DATA *saveMiscData) {
    int i;

    MI_CpuClearFast(saveMiscData, sizeof(SAVE_MISC_DATA));
    ApricornTrees_Init(saveMiscData->apricorn_trees);
    Save_BerryPots_Init(saveMiscData->berry_pots);
    Save_BerryPotRTC_Init(&saveMiscData->berry_datetime);
    Save_Gymmick_Clear(&saveMiscData->gymmick);
    MI_CpuFill16(saveMiscData->rivalName, EOS, PLAYER_NAME_LENGTH + 1);
    MI_CpuFill8(saveMiscData->unk_0280, 0xFF, 8);
    MailMsg_Init_WithBank(&saveMiscData->battleGreetingEC, MAILMSG_BANK_0295_GMM);
    saveMiscData->battleGreetingEC.msg_no = msg_0295_00000;
    saveMiscData->battleGreetingEC.fields[0] = GetECWordIndexByPair(NARC_msg_msg_0287_bin, msg_0287_regards);
    saveMiscData->battleGreetingEC.fields[1] = EC_WORD_NULL;
    for (i = 0; i < 5; i++) {
        saveMiscData->unk_02A8[0][i] = -1;
        saveMiscData->unk_02A8[1][i] = -1;
    }
}

SAVE_MISC_DATA *Save_Misc_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_MISC);
}

const SAVE_MISC_DATA *Save_Misc_Const_Get(const SaveData *saveData) {
    return SaveArray_Const_Get(saveData, SAVE_MISC);
}

APRICORN_TREE *Save_FieldApricornTrees_Get(SaveData *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SaveArray_Get(saveData, SAVE_MISC);
    return misc->apricorn_trees;
}

BerryPot *Save_BerryPots_Get(SaveData *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SaveArray_Get(saveData, SAVE_MISC);
    return misc->berry_pots;
}

struct GF_RTC_DateTime *Save_BerryPotRTC_Get(SaveData *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SaveArray_Get(saveData, SAVE_MISC);
    return &misc->berry_datetime;
}

Gymmick *Save_GetGymmickPtr(SaveData *saveData) {
    SAVE_MISC_DATA *misc;
    misc = SaveArray_Get(saveData, SAVE_MISC);
    return &misc->gymmick;
}

const u16 *Save_Misc_RivalName_Const_Get(const SAVE_MISC_DATA *saveMiscData) {
    return saveMiscData->rivalName;
}

void Save_Misc_RivalName_Set(SAVE_MISC_DATA *saveMiscData, const String *name) {
    CopyStringToU16Array(name, saveMiscData->rivalName, PLAYER_NAME_LENGTH + 1);
}

void SaveMisc_SetExtraChunksExist(SAVE_MISC_DATA *saveMiscData) {
    saveMiscData->extraChunksExist = TRUE;
}

BOOL SaveMisc_CheckExtraChunksExist(SAVE_MISC_DATA *saveMiscData) {
    return saveMiscData->extraChunksExist;
}

void SaveMisc_SetFavoriteMon(SAVE_MISC_DATA *saveMiscData, int species, int form, int isEgg) {
    saveMiscData->favoriteMonSpecies = species;
    saveMiscData->favoriteMonForm = form;
    saveMiscData->favoriteMonIsEgg = isEgg;
}

void SaveMisc_GetFavoriteMon(SAVE_MISC_DATA *saveMiscData, int *species, int *form, int *isEgg) {
    *species = saveMiscData->favoriteMonSpecies;
    *form = saveMiscData->favoriteMonForm;
    *isEgg = saveMiscData->favoriteMonIsEgg;
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

void SaveMisc_SetTogepiPersonalityGender(SAVE_MISC_DATA * saveMiscData, int personality, u8 gender) {
    saveMiscData->togepiEggPersonality = personality;
    saveMiscData->togepiEggGender = gender;
}

void SaveMisc_GetTogepiPersonalityGender(SAVE_MISC_DATA * saveMiscData, int *personality, u8 *gender) {
    *personality = saveMiscData->togepiEggPersonality;
    *gender = saveMiscData->togepiEggGender;
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
