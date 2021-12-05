#ifndef POKEHEARTGOLD_PLAYER_DATA_H
#define POKEHEARTGOLD_PLAYER_DATA_H

#include "save.h"
#include "options.h"
#include "coins.h"
#include "igt.h"
#include "pm_string.h"

typedef struct PLAYERPROFILE {
    u16 name[OT_NAME_LENGTH + 1];
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

PLAYERPROFILE *Sav2_PlayerData_GetProfileAddr(SAVEDATA *saveData);
OPTIONS *Sav2_PlayerData_GetOptionsAddr(SAVEDATA *saveData);
u16 *Sav2_PlayerData_GetCoinsAddr(SAVEDATA *saveData);
u32 PlayerProfile_GetTrainerID(PLAYERDATA *playerData);
u32 PlayerProfile_GetTrainerGender(PLAYERDATA *playerData);
STRING *PlayerProfile_GetPlayerName_NewString(PLAYERDATA *playerData, HeapID heap_id);

#endif //POKEHEARTGOLD_PLAYER_DATA_H
