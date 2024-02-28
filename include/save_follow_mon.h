#ifndef POKEHEARTGOLD_SAVE_FOLLOW_MON_H
#define POKEHEARTGOLD_SAVE_FOLLOW_MON_H

#include "save.h"

struct SaveFollowMon {
    int mapno;
    int unk_4_0:2;
    int unk_4_2:1;
};

u32 Save_FollowMon_sizeof(void);
void Save_FollowMon_Init(struct SaveFollowMon *followPoke);
struct SaveFollowMon *Save_FollowMon_Get(SaveData *saveData);
int Save_FollowMon_GetMapId(struct SaveFollowMon *followPoke);
void Save_FollowMon_SetMapId(int mapno, struct SaveFollowMon *followPoke);
u8 Save_FollowMon_GetUnused2bitField(struct SaveFollowMon *followPoke); // deadstripped
void Save_FollowMon_SetUnused2bitField(u8 unk, struct SaveFollowMon *followPoke);
void Save_FollowMon_SetInhibitFlagState(struct SaveFollowMon *followPoke, u8 state);
u8 Save_FollowMon_GetInhibitFlagState(struct SaveFollowMon *followPoke);

#endif //POKEHEARTGOLD_SAVE_FOLLOW_MON_H
