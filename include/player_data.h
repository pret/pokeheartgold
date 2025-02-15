#ifndef POKEHEARTGOLD_PLAYER_DATA_H
#define POKEHEARTGOLD_PLAYER_DATA_H

#include "coins.h"
#include "igt.h"
#include "options.h"
#include "pm_string.h"
#include "save.h"

#define MAX_MONEY 999999

typedef struct PlayerProfile {
    u16 name[PLAYER_NAME_LENGTH + 1];
    u32 id;
    u32 money;
    u8 gender;
    u8 language;
    u8 johtoBadges;
    u8 avatar;
    u8 version;
    u8 gameClear : 1;
    u8 natDex : 1;
    u8 dummy;
    u8 kantoBadges;
} PlayerProfile;

typedef struct PLAYERDATA {
    Options options;
    PlayerProfile profile;
    u16 coins;
    IGT igt;
} PLAYERDATA;

u32 Save_PlayerData_sizeof(void);
void Save_PlayerData_Init(PLAYERDATA *player);
PlayerProfile *Save_PlayerData_GetProfile(SaveData *saveData);
Options *Save_PlayerData_GetOptionsAddr(SaveData *saveData);
u16 *Save_PlayerData_GetCoinsAddr(SaveData *saveData);
IGT *Save_PlayerData_GetIGTAddr(SaveData *saveData);
u32 PlayerProfile_sizeof(void);
PlayerProfile *PlayerProfile_New(HeapID heapId);
void PlayerProfile_Copy(const PlayerProfile *src, PlayerProfile *dest);
void PlayerProfile_Init(PlayerProfile *profile);
BOOL PlayerProfile_IsNameEmpty(PlayerProfile *profile);
void Save_Profile_PlayerName_Set(PlayerProfile *profile, u16 *name);
void PlayerName_StringToFlat(PlayerProfile *profile, String *str);
const u16 *PlayerProfile_GetNamePtr(const PlayerProfile *profile);
void PlayerName_FlatToString(PlayerProfile *profile, String *str);
String *PlayerProfile_GetPlayerName_NewString(PlayerProfile *profile, HeapID heapId);
void PlayerProfile_SetTrainerID(PlayerProfile *profile, u32 id);
u32 PlayerProfile_GetTrainerID(PlayerProfile *profile);
u16 PlayerProfile_GetTrainerID_VisibleHalf(PlayerProfile *profile);
void PlayerProfile_SetTrainerGender(PlayerProfile *profile, int gender);
u32 PlayerProfile_GetTrainerGender(PlayerProfile *profile);
BOOL PlayerProfile_TestBadgeFlag(PlayerProfile *profile, s32 badge_no);
void PlayerProfile_SetBadgeFlag(PlayerProfile *profile, s32 badge_no);
s32 PlayerProfile_CountBadges(PlayerProfile *profile);
u32 PlayerProfile_GetMoney(PlayerProfile *profile);
u32 PlayerProfile_SetMoney(PlayerProfile *profile, u32 amount);
u8 PlayerProfile_GetAvatar(PlayerProfile *profile);
void PlayerProfile_SetAvatar(PlayerProfile *profile, u8 avatar);
u32 PlayerProfile_AddMoney(PlayerProfile *profile, u32 amount);
u32 PlayerProfile_SubMoney(PlayerProfile *profile, u32 amount);
u8 PlayerProfile_GetVersion(PlayerProfile *profile);
void PlayerProfile_SetVersion(PlayerProfile *profile, u8 version);
u32 sub_02029084(void);
u8 PlayerProfile_GetLanguage(PlayerProfile *profile);
void PlayerProfile_SetLanguage(PlayerProfile *profile, u8 language);
void PlayerProfile_SetGameClearFlag(PlayerProfile *profile);
BOOL PlayerProfile_GetGameClearFlag(PlayerProfile *profile);
void PlayerProfile_SetNatDexFlag(PlayerProfile *profile);

#endif // POKEHEARTGOLD_PLAYER_DATA_H
