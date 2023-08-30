#ifndef POKEHEARTGOLD_UNK_020215A0_H
#define POKEHEARTGOLD_UNK_020215A0_H

#include "heap.h"

typedef struct UnkStruct_020215A0 {
    u32 unk_00;
    u32 unk_04;
    u32 unk_08;
    HeapID heapId;
} UnkStruct_020215A0;

void sub_020215A0(UnkStruct_020215A0 *a0);
void sub_020215C0(UnkStruct_020215A0 *a0, int a1, int a2);
void sub_0202168C(void);
void sub_020216C8(void);
void sub_020216F4(u32, u32, u32);
void sub_02021884(u32);

#endif //POKEHEARTGOLD_UNK_020215A0_H
