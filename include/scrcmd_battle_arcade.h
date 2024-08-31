#ifndef POKEHEARTGOLD_SCRCMD_BATTLE_HALL_H
#define POKEHEARTGOLD_SCRCMD_BATTLE_HALL_H

#include "global.h"

typedef struct UnkStruct_02050060 {
    u8 state;
    u8 unk01;
    u8 filler[2];
    u16 playerTeam[2];
    u16 partnerTeam[2];
    u16 *result;
} UnkStruct_02050060;

void sub_02050398(u32, u32, UnkStruct_02050060 *, UnkStruct_02050060 *);

#endif // POKEHEARTGOLD_SCRCMD_BATTLE_HALL_H
