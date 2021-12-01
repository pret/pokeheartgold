#ifndef POKEHEARTGOLD_UNK_0200CF18_H
#define POKEHEARTGOLD_UNK_0200CF18_H

#include "filesystem.h"

struct UnkStruct_0200D748 {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    u16 unk_06;
    u32 unk_08;
    u32 unk_0C;
    u32 unk_10;
    u32 unk_14[6];
    u32 unk_2C;
    u32 unk_30;
}; // size=0x34

struct UnkStruct_0200CF18 {
    void *unk_00;
};

void sub_0200D504(void *, s32, NARC*, s32, s32, s32, s32);
void sub_0200D68C(s32, s32, void *, s32, NARC*, s32, s32, s32, s32, s32);
void sub_0200D6EC(void *, s32, NARC*, s32, s32, s32);
void sub_0200D71C(void *, s32, NARC*, s32, s32, s32);
struct UnkStruct_0200CF18 *sub_0200D734(void *, s32, struct UnkStruct_0200D748 *);
void sub_0200DDB8(struct UnkStruct_0200CF18*, s16, s16);
void sub_0200DC18(struct UnkStruct_0200CF18*);
void sub_0200DC78(struct UnkStruct_0200CF18*, s32);

#endif //POKEHEARTGOLD_UNK_0200CF18_H
