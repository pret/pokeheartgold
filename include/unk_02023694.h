#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

struct UnkStruct_02024624 {
    void *unk0;
    const struct UnkStruct_02009D48 *unk4;
    VecFx32 unk8;
    VecFx32 unk14;
    u16 unk20;
    u32 unk24;
    int unk28;
    HeapID heapId;
};

void sub_02024AA8(void *, s32);
void sub_02024504(void *);
void sub_0202457C(void *);
void *sub_02024624(const struct UnkStruct_02024624 *template);
void sub_0202484C(void *, int);
void sub_020248F0(void *, int);
void sub_02024830(void *, int);

#endif //POKEHEARTGOLD_UNK_02023694_H
