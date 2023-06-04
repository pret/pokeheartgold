#ifndef POKEHEARTGOLD_PLAYER_DATA_H
#define POKEHEARTGOLD_PLAYER_DATA_H

#include "save.h"
#include "options.h"
#include "coins.h"
#include "igt.h"
#include "pm_string.h"

#define MAX_MONEY 999999

typedef struct PLAYERPROFILE {
    u16 name[PLAYER_NAME_LENGTH + 1];
    u32 id;
    u32 money;
    u8 gender;
    u8 language;
    u8 johtoBadges;
    u8 avatar;
    u8 version;
    u8 gameClear:1;
    u8 natDex:1;
    u8 dummy;
    u8 kantoBadges;
} PLAYERPROFILE;

typedef struct PLAYERDATA {
    OPTIONS options;
    PLAYERPROFILE profile;
    u16 coins;
    IGT igt;
} PLAYERDATA;

u32 Save_PlayerData_sizeof(void);
void Save_PlayerData_Init(PLAYERDATA* player);
PLAYERPROFILE* Save_PlayerData_GetProfileAddr(SAVEDATA* savedata);
OPTIONS* Save_PlayerData_GetOptionsAddr(SAVEDATA* savedata);
u16* Save_PlayerData_GetCoinsAddr(SAVEDATA* savedata);
IGT* Save_PlayerData_GetIGTAddr(SAVEDATA* savedata);
u32 PlayerProfile_sizeof(void);
PLAYERPROFILE* PlayerProfile_New(HeapID heap_id);
void PlayerProfile_Copy(const PLAYERPROFILE* src, PLAYERPROFILE* dest);
void PlayerProfile_Init(PLAYERPROFILE* profile);
BOOL PlayerProfile_IsNameEmpty(PLAYERPROFILE* profile);
void Save_Profile_PlayerName_set(PLAYERPROFILE* profile, u16* name);
void PlayerName_StringToFlat(PLAYERPROFILE* profile, STRING* str);
const u16 * PlayerProfile_GetNamePtr(const PLAYERPROFILE *profile);
void PlayerName_FlatToString(PLAYERPROFILE* profile, STRING* str);
STRING* PlayerProfile_GetPlayerName_NewString(PLAYERPROFILE* profile, HeapID heap_id);
void PlayerProfile_SetTrainerID(PLAYERPROFILE* profile, u32 id);
u32 PlayerProfile_GetTrainerID(PLAYERPROFILE* profile);
u16 PlayerProfile_GetTrainerID_VisibleHalf(PLAYERPROFILE* profile);
void PlayerProfile_SetTrainerGender(PLAYERPROFILE* profile, int gender);
u32 PlayerProfile_GetTrainerGender(PLAYERPROFILE* profile);
BOOL PlayerProfile_TestBadgeFlag(PLAYERPROFILE* profile, s32 badge_no);
void PlayerProfile_SetBadgeFlag(PLAYERPROFILE* profile, s32 badge_no);
u32 PlayerProfile_CountBadges(PLAYERPROFILE* profile);
u32 PlayerProfile_GetMoney(PLAYERPROFILE* profile);
u32 PlayerProfile_SetMoney(PLAYERPROFILE* profile, u32 amount);
u8 PlayerProfile_GetAvatar(PLAYERPROFILE* profile);
void PlayerProfile_SetAvatar(PLAYERPROFILE* profile, u8 avatar);
u32 PlayerProfile_AddMoney(PLAYERPROFILE* profile, u32 amount);
u32 PlayerProfile_SubMoney(PLAYERPROFILE* profile, u32 amount);
u8 PlayerProfile_GetVersion(PLAYERPROFILE* profile);
void PlayerProfile_SetVersion(PLAYERPROFILE* profile, u8 version);
u32 sub_02029084(void);
u8 PlayerProfile_GetLanguage(PLAYERPROFILE* profile);
void PlayerProfile_SetLanguage(PLAYERPROFILE* profile, u8 language);
void PlayerProfile_SetGameClearFlag(PLAYERPROFILE* profile);
BOOL PlayerProfile_GetGameClearFlag(PLAYERPROFILE* profile);
void PlayerProfile_SetNatDexFlag(PLAYERPROFILE* profile);

#endif //POKEHEARTGOLD_PLAYER_DATA_H
