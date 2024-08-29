#ifndef POKEHEARTGOLD_SCRCMD_BATTLE_CASTLE_H
#define POKEHEARTGOLD_SCRCMD_BATTLE_CASTLE_H

#include "global.h"

typedef struct UnkStruct_0204FB20 {
    u8 state;
    u8 unk01;
    u8 filler[2];
    u16 playerTeam[2];
    u16 partnerTeam[2];
    u16 *result;
} UnkStruct_0204FB20;

void sub_0204FE58(u32, u32, UnkStruct_0204FB20 *, UnkStruct_0204FB20 *);

#endif // POKEHEARTGOLD_SCRCMD_BATTLE_CASTLE_H
