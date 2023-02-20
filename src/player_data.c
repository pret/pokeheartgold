#include "global.h"
#include "player_data.h"

u32 Sav2_PlayerData_sizeof(void) {
    return sizeof(PLAYERDATA);
}

void Sav2_PlayerData_init(PLAYERDATA* player) {
    MI_CpuClearFast(player, sizeof(PLAYERDATA));

    Options_init(&player->options);
    PlayerProfile_init(&player->profile);
    InitCoins(&player->coins);
    InitIGT(&player->igt);
}

PLAYERPROFILE* Sav2_PlayerData_GetProfileAddr(SAVEDATA* savedata) {
    PLAYERDATA* player = SavArray_get(savedata, SAVE_PLAYERDATA);
    return &player->profile;
}

OPTIONS* Sav2_PlayerData_GetOptionsAddr(SAVEDATA* savedata) {
    PLAYERDATA* player = SavArray_get(savedata, SAVE_PLAYERDATA);
    return &player->options;
}

u16* Sav2_PlayerData_GetCoinsAddr(SAVEDATA* savedata) {
    PLAYERDATA* player = SavArray_get(savedata, SAVE_PLAYERDATA);
    return &player->coins;
}

IGT* Sav2_PlayerData_GetIGTAddr(SAVEDATA* savedata) {
    PLAYERDATA* player = SavArray_get(savedata, SAVE_PLAYERDATA);
    return &player->igt;
}

u32 PlayerProfile_sizeof(void) {
    return sizeof(PLAYERPROFILE);
}

PLAYERPROFILE* PlayerProfile_new(HeapID heap_id) {
    PLAYERPROFILE* profile = AllocFromHeap(heap_id, sizeof(PLAYERPROFILE));
    PlayerProfile_init(profile);

    return profile;
}

void PlayerProfile_copy(const PLAYERPROFILE* src, PLAYERPROFILE* dest) {
    MI_CpuCopy8(src, dest, sizeof(PLAYERPROFILE));
}

void PlayerProfile_init(PLAYERPROFILE* profile) {
    memset(profile, 0, sizeof(PLAYERPROFILE));

    profile->language = GAME_LANGUAGE;
    PlayerProfile_SetVersion(profile, GAME_VERSION);
}

BOOL PlayerProfile_IsNameEmpty(PLAYERPROFILE* profile) {
    for (s32 i = 0; i < OT_NAME_LENGTH + 1; i++) {
        if (profile->name[i] != CHAR_NUL) {
            return FALSE;
        }
    }

    return TRUE;
}

void Sav2_Profile_PlayerName_set(PLAYERPROFILE* profile, u16* name) {
    GF_ASSERT(StringLength(name) < OT_NAME_LENGTH + 1);
    CopyU16StringArray(profile->name, name);
}

void PlayerName_StringToFlat(PLAYERPROFILE* profile, STRING* str) {
    CopyStringToU16Array(str, profile->name, OT_NAME_LENGTH + 1);
}

const u16 * PlayerProfile_GetNamePtr(const PLAYERPROFILE *profile) {
    return profile->name;
}

void PlayerName_FlatToString(PLAYERPROFILE* profile, STRING* str) {
    CopyU16ArrayToString(str, profile->name);
}

STRING* PlayerProfile_GetPlayerName_NewString(PLAYERPROFILE* profile, HeapID heap_id) {
    STRING* str = String_ctor(OT_NAME_LENGTH + 1, heap_id);
    PlayerName_FlatToString(profile, str);

    return str;
}

void PlayerProfile_SetTrainerID(PLAYERPROFILE* profile, u32 id) {
    profile->id = id;
}

u32 PlayerProfile_GetTrainerID(PLAYERPROFILE* profile) {
    return profile->id;
}

u16 PlayerProfile_GetTrainerID_VisibleHalf(PLAYERPROFILE* profile) {
    return profile->id & 0xFFFF;
}

void PlayerProfile_SetTrainerGender(PLAYERPROFILE* profile, int gender) {
    profile->gender = gender;
}

u32 PlayerProfile_GetTrainerGender(PLAYERPROFILE* profile) {
    return profile->gender;
}

BOOL PlayerProfile_TestBadgeFlag(PLAYERPROFILE* profile, s32 badge_no) {
    if (badge_no >= 16) {
        return FALSE;
    }

    if (badge_no < 8) {
        if ((profile->johtoBadges & (1 << badge_no)) != FALSE) {
            return TRUE;
        }
    } else {
        if ((profile->kantoBadges & (1 << (badge_no - 8))) != FALSE) {
            return TRUE;
        }
    }

    return FALSE;
}

void PlayerProfile_SetBadgeFlag(PLAYERPROFILE* profile, s32 badge_no) {
    if (badge_no >= 16) {
        return;
    }

    if (badge_no < 8) {
        profile->johtoBadges |= (1 << badge_no);
    } else {
        profile->kantoBadges |= (1 << badge_no - 8);
    }
}

u32 PlayerProfile_CountBadges(PLAYERPROFILE* profile) {
    u32 badges = 0;

    for (u32 i = profile->johtoBadges; i != 0; i >>= 1) {
        if ((i & 1) != FALSE) {
            badges++;
        }
    }

    for (u32 i = profile->kantoBadges; i != 0; i >>= 1) {
        if ((i & 1) != FALSE) {
            badges++;
        }
    }

    return badges;
}

u32 PlayerProfile_GetMoney(PLAYERPROFILE* profile) {
    return profile->money;
}

u32 PlayerProfile_SetMoney(PLAYERPROFILE* profile, u32 amount) {
    if (amount > MAX_MONEY) {
        amount = MAX_MONEY;
    }

    profile->money = amount;
    return amount;
}

u8 PlayerProfile_GetAvatar(PLAYERPROFILE* profile) {
    return profile->avatar;
}

void PlayerProfile_SetAvatar(PLAYERPROFILE* profile, u8 avatar) {
    profile->avatar = avatar;
}

u32 PlayerProfile_AddMoney(PLAYERPROFILE* profile, u32 amount) {
    if (amount > MAX_MONEY) {
        profile->money = MAX_MONEY;
    } else {
        profile->money += amount;
    }

    if (profile->money > MAX_MONEY) {
        profile->money = MAX_MONEY;
    }

    return profile->money;
}

u32 PlayerProfile_SubMoney(PLAYERPROFILE* profile, u32 amount) {
    if (profile->money < amount) {
        profile->money = 0;
    } else {
        profile->money -= amount;
    }

    return profile->money;
}

u8 PlayerProfile_GetVersion(PLAYERPROFILE* profile) {
    return profile->version;
}

void PlayerProfile_SetVersion(PLAYERPROFILE* profile, u8 version) {
    profile->version = version;
}

// may have had something to do with the version?
u32 sub_02029084(void) {
    return 0;
}

u8 PlayerProfile_GetLanguage(PLAYERPROFILE* profile) {
    return profile->language;
}

void PlayerProfile_SetLanguage(PLAYERPROFILE* profile, u8 language) {
    profile->language = language;
}

void PlayerProfile_SetGameClearFlag(PLAYERPROFILE* profile) {
    profile->gameClear = TRUE;
}

BOOL PlayerProfile_GetGameClearFlag(PLAYERPROFILE* profile) {
    return profile->gameClear;
}

void PlayerProfile_SetNatDexFlag(PLAYERPROFILE* profile) {
    profile->natDex = TRUE;
}
