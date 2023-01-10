#ifndef POKEHEARTGOLD_UNK_02030A98_H
#define POKEHEARTGOLD_UNK_02030A98_H

#include "save.h"

struct UnkStruct_02030A98 {
    u8 filler_000[0xBA0];
}; // size = 0xBA0

void *sub_02030E88(SAVEDATA *saveData);
void *sub_02030FA0(SAVEDATA *saveData);
void *sub_0203107C(SAVEDATA *saveData);
void sub_020310A0(SAVEDATA *saveData);
void sub_02031084(SAVEDATA *saveData);
u32 *sub_020312C4(SAVEDATA *saveData, u32 a1, u32 *out);
u32 *sub_020312E0(SAVEDATA *saveData, u32 *a1, u32 a2, u16 a3);

#endif //POKEHEARTGOLD_UNK_02030A98_H
