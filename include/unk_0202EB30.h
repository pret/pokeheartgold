#ifndef POKEHEARTGOLD_UNK_0202EB30_H
#define POKEHEARTGOLD_UNK_0202EB30_H

#include "pokemon_types_def.h"

struct UnkStruct_0202EB30 {
    POKEMON pokemon[PARTY_SIZE];
    u32 unk_588[20];
    s64 unk_5D8[20];
    u32 unk_678;
    u32 unk_67C;
    u8 macAddress[6];
};

int sub_0202EC98(struct UnkStruct_0202EB30 *a0);
void sub_0202EB74(struct UnkStruct_0202EB30 *a0);

#endif //POKEHEARTGOLD_UNK_0202EB30_H
