#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

struct UnkStruct_02024624;

struct UnkStruct_02024624Header {
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
void sub_02024504(UnkStruct_02009F40 *);
void sub_0202457C(UnkStruct_02009F40 *);
struct UnkStruct_02024624 *sub_02024624(const struct UnkStruct_02024624Header *template);
void sub_0202484C(struct UnkStruct_02024624 *, int);
void sub_020248F0(struct UnkStruct_02024624 *, int);
void sub_02024830(struct UnkStruct_02024624 *, int);

#endif //POKEHEARTGOLD_UNK_02023694_H
