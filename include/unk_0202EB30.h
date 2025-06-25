#ifndef POKEHEARTGOLD_UNK_0202EB30_H
#define POKEHEARTGOLD_UNK_0202EB30_H

#include "pokemon_types_def.h"

typedef struct PalParkTransfer {
    Pokemon pokemon[PARTY_SIZE];
    u32 unk_588[20];
    s64 unk_5D8[20];
    u32 unk_678;
    u32 unk_67C;
    u8 macAddress[6];
} PalParkTransfer;

int sub_0202EC98(PalParkTransfer *a0);
void sub_0202EB74(PalParkTransfer *a0);
void TransferDataToMon(PalParkTransfer *a0, int i, Pokemon *mon);

#endif // POKEHEARTGOLD_UNK_0202EB30_H
