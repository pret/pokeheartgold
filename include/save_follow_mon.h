#ifndef POKEHEARTGOLD_SAVE_FOLLOW_MON_H
#define POKEHEARTGOLD_SAVE_FOLLOW_MON_H

#include "save.h"

typedef struct SaveFollowMon {
    u32 mapNo;
    s32 unused : 2;
    s32 inhibitFlag : 1;
} SaveFollowMon;

u32 Save_FollowMon_sizeof(void);
void Save_FollowMon_Init(SaveFollowMon *followMon);
SaveFollowMon *Save_FollowMon_Get(SaveData *saveData);
void Save_FollowMon_SetMapID(u32 mapNo, SaveFollowMon *followMon);
u32 Save_FollowMon_GetMapID(SaveFollowMon *followMon);
u8 Save_FollowMon_GetUnused2bitField(SaveFollowMon *followMon); // deadstripped
void Save_FollowMon_SetUnused2bitField(u8 value, SaveFollowMon *followMon);
void Save_FollowMon_SetInhibitFlagState(SaveFollowMon *followMon, u8 flag);
u8 Save_FollowMon_GetInhibitFlagState(SaveFollowMon *followMon);

#endif // POKEHEARTGOLD_SAVE_FOLLOW_MON_H
