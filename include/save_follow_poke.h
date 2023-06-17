#ifndef POKEHEARTGOLD_SAVE_FOLLOW_POKE_H
#define POKEHEARTGOLD_SAVE_FOLLOW_POKE_H

#include "save.h"

struct SaveFollowPoke {
    int mapno;
    int unk_4_0:2;
    int unk_4_2:1;
};

u32 Save_FollowPoke_sizeof(void);
void Save_FollowPoke_Init(struct SaveFollowPoke *followPoke);
struct SaveFollowPoke *Save_FollowPoke_Get(SaveData *saveData);
int SavFollowPoke_GetMapId(struct SaveFollowPoke *followPoke);
void SavFollowPoke_SetMapId(int mapno, struct SaveFollowPoke *followPoke);
u8 SavFollowPoke_GetUnused2bitField(struct SaveFollowPoke *followPoke); // deadstripped
void SavFollowPoke_SetUnused2bitField(u8 unk, struct SaveFollowPoke *followPoke);
void SavFollowPoke_SetInhibitFlagState(struct SaveFollowPoke *followPoke, u8 state);
u8 SavFollowPoke_GetInhibitFlagState(struct SaveFollowPoke *followPoke);

#endif //POKEHEARTGOLD_SAVE_FOLLOW_POKE_H
