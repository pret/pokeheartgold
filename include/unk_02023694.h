#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "unk_02009D48.h"

struct Sprite;

typedef struct UnkStruct_0202445C UnkStruct_0202445C;

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
void sub_02024504(UnkStruct_0202445C *);
void sub_0202457C(UnkStruct_0202445C *);
struct Sprite *sub_02024624(const struct UnkStruct_02024624Header *template);
void sub_0202484C(struct Sprite *, int);
void sub_020248F0(struct Sprite *, int);
void Set2dSpriteVisibleFlag(struct Sprite *, int);

#endif //POKEHEARTGOLD_UNK_02023694_H
