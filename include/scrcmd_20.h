#ifndef POKEHEARTGOLD_SCRCMD_20_H
#define POKEHEARTGOLD_SCRCMD_20_H

#include "save.h"

typedef struct UnkStruct_0204F1E4 {
    u8 state;
    u8 unk01;
    u8 filler[2];
    u16 playerTeam;
    u16 partnerTeam;
    u16 *result;
} UnkStruct_0204F1E4;

void sub_0204F85C(u32, u32, UnkStruct_0204F1E4 *, UnkStruct_0204F1E4 *);
void sub_0204F878(SaveData *, u32, u8);

#endif // POKEHEARTGOLD_SCRCMD_20_H
