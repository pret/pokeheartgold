#ifndef POKEHEARTGOLD_UNK_02016EDC_H
#define POKEHEARTGOLD_UNK_02016EDC_H

#include "global.h"

#include "pokepic.h"

struct UnkStruct_02072914_sub {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    PokepicAnimScript unk_3[10];
};

struct UnkStruct_02072914 {
    struct UnkStruct_02072914_sub unk0[2];
    s8 unk_56;
    s8 unk_57;
    u8 unk_58;
};

struct UnkStruct_0207294C {
    u16 unk_0;
    u16 unk_2;
    u8 unk_4;
};

typedef struct PokepicAnimManager PokepicAnimManager;

PokepicAnimManager *sub_02016EDC(enum HeapID heapId, int a1, int a2);
void sub_02016F2C(PokepicAnimManager *pokepicAnimManager);
void sub_02016F40(PokepicAnimManager *pokepicAnimManager, Pokepic *pokepic, struct UnkStruct_0207294C *a2, u8 a3);
BOOL sub_02017068(PokepicAnimManager *a0, int a1);

#endif // POKEHEARTGOLD_UNK_02016EDC_H
