#include "global.h"
#include "player_data.h"

u32 Save_PlayerData_sizeof(void) {
    return sizeof(PLAYERDATA);
}

void Save_PlayerData_Init(PLAYERDATA* player) {
    MI_CpuClearFast(player, sizeof(PLAYERDATA));

    Options_Init(&player->options);
    PlayerProfile_Init(&player->profile);
    InitCoins(&player->coins);
    InitIGT(&player->igt);
}

PlayerProfile* Save_PlayerData_GetProfileAddr(SaveData* saveData) {
    PLAYERDATA* player = SaveArray_Get(saveData, SAVE_PLAYERDATA);
    return &player->profile;
}

OPTIONS* Save_PlayerData_GetOptionsAddr(SaveData* saveData) {
    PLAYERDATA* player = SaveArray_Get(saveData, SAVE_PLAYERDATA);
    return &player->options;
}

u16* Save_PlayerData_GetCoinsAddr(SaveData* saveData) {
    PLAYERDATA* player = SaveArray_Get(saveData, SAVE_PLAYERDATA);
    return &player->coins;
}

IGT* Save_PlayerData_GetIGTAddr(SaveData* saveData) {
    PLAYERDATA* player = SaveArray_Get(saveData, SAVE_PLAYERDATA);
    return &player->igt;
}

u32 PlayerProfile_sizeof(void) {
    return sizeof(PlayerProfile);
}

PlayerProfile* PlayerProfile_New(HeapID heapId) {
    PlayerProfile* profile = AllocFromHeap(heapId, sizeof(PlayerProfile));
    PlayerProfile_Init(profile);

    return profile;
}

void PlayerProfile_Copy(const PlayerProfile* src, PlayerProfile* dest) {
    MI_CpuCopy8(src, dest, sizeof(PlayerProfile));
}

void PlayerProfile_Init(PlayerProfile* profile) {
    memset(profile, 0, sizeof(PlayerProfile));

    profile->language = GAME_LANGUAGE;
    PlayerProfile_SetVersion(profile, GAME_VERSION);
}

BOOL PlayerProfile_IsNameEmpty(PlayerProfile* profile) {
    for (s32 i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
        if (profile->name[i] != CHAR_NUL) {
            return FALSE;
        }
    }

    return TRUE;
}

void Save_Profile_PlayerName_Set(PlayerProfile* profile, u16* name) {
    GF_ASSERT(StringLength(name) < PLAYER_NAME_LENGTH + 1);
    CopyU16StringArray(profile->name, name);
}

void PlayerName_StringToFlat(PlayerProfile* profile, String* str) {
    CopyStringToU16Array(str, profile->name, PLAYER_NAME_LENGTH + 1);
}

const u16 * PlayerProfile_GetNamePtr(const PlayerProfile *profile) {
    return profile->name;
}

void PlayerName_FlatToString(PlayerProfile* profile, String* str) {
    CopyU16ArrayToString(str, profile->name);
}

String* PlayerProfile_GetPlayerName_NewString(PlayerProfile* profile, HeapID heapId) {
    String* str = String_New(PLAYER_NAME_LENGTH + 1, heapId);
    PlayerName_FlatToString(profile, str);

    return str;
}

void PlayerProfile_SetTrainerID(PlayerProfile* profile, u32 id) {
    profile->id = id;
}

u32 PlayerProfile_GetTrainerID(PlayerProfile* profile) {
    return profile->id;
}

u16 PlayerProfile_GetTrainerID_VisibleHalf(PlayerProfile* profile) {
    return profile->id & 0xFFFF;
}

void PlayerProfile_SetTrainerGender(PlayerProfile* profile, int gender) {
    profile->gender = gender;
}

u32 PlayerProfile_GetTrainerGender(PlayerProfile* profile) {
    return profile->gender;
}

BOOL PlayerProfile_TestBadgeFlag(PlayerProfile* profile, s32 badge_no) {
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

void PlayerProfile_SetBadgeFlag(PlayerProfile* profile, s32 badge_no) {
    if (badge_no >= 16) {
        return;
    }

    if (badge_no < 8) {
        profile->johtoBadges |= (1 << badge_no);
    } else {
        profile->kantoBadges |= (1 << badge_no - 8);
    }
}

u32 PlayerProfile_CountBadges(PlayerProfile* profile) {
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

u32 PlayerProfile_GetMoney(PlayerProfile* profile) {
    return profile->money;
}

u32 PlayerProfile_SetMoney(PlayerProfile* profile, u32 amount) {
    if (amount > MAX_MONEY) {
        amount = MAX_MONEY;
    }

    profile->money = amount;
    return amount;
}

u8 PlayerProfile_GetAvatar(PlayerProfile* profile) {
    return profile->avatar;
}

void PlayerProfile_SetAvatar(PlayerProfile* profile, u8 avatar) {
    profile->avatar = avatar;
}

u32 PlayerProfile_AddMoney(PlayerProfile* profile, u32 amount) {
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

u32 PlayerProfile_SubMoney(PlayerProfile* profile, u32 amount) {
    if (profile->money < amount) {
        profile->money = 0;
    } else {
        profile->money -= amount;
    }

    return profile->money;
}

u8 PlayerProfile_GetVersion(PlayerProfile* profile) {
    return profile->version;
}

void PlayerProfile_SetVersion(PlayerProfile* profile, u8 version) {
    profile->version = version;
}

// may have had something to do with the version?
u32 sub_02029084(void) {
    return 0;
}

u8 PlayerProfile_GetLanguage(PlayerProfile* profile) {
    return profile->language;
}

void PlayerProfile_SetLanguage(PlayerProfile* profile, u8 language) {
    profile->language = language;
}

void PlayerProfile_SetGameClearFlag(PlayerProfile* profile) {
    profile->gameClear = TRUE;
}

BOOL PlayerProfile_GetGameClearFlag(PlayerProfile* profile) {
    return profile->gameClear;
}

void PlayerProfile_SetNatDexFlag(PlayerProfile* profile) {
    profile->natDex = TRUE;
}
