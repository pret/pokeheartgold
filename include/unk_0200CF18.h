#ifndef POKEHEARTGOLD_UNK_0200CF18_H
#define POKEHEARTGOLD_UNK_0200CF18_H

#include "filesystem.h"
#include "unk_02009D48.h"

typedef struct UnkTemplate_0200D748 {
    s16 x;
    s16 y;
    s16 z;
    u16 animation;
    u32 unk_08;
    u32 pal;
    NNS_G2D_VRAM_TYPE vram;
    u32 unk_14[6];
    u32 unk_2C;
    u32 unk_30;
} UnkTemplate_0200D748; // size=0x34

typedef struct UnkStruct_0200D748 {
    void *unk_00;
} UnkStruct_0200D748;

typedef struct UnkStruct_0200CF18 {
    HeapID heapId;
    u32 unk_004;
    u32 unk_008;
    u8 filler_00C[0x12C];
} UnkStruct_0200CF18; // size: 0x138

typedef struct Unk122_021E92FC {
    int unk0[8];
} Unk122_021E92FC;

typedef struct Unk122_021E92D0 {
    int unk0;
    u8 unk4[0x10];
} Unk122_021E92D0;

typedef struct Unk122_021E92E4 {
    int unk0[6];
} Unk122_021E92E4;

typedef struct Unk122_021E9374 {
    u16 unk0;
    u16 unk2;
    u8 unk4[0x2];
    u16 unk6;
    int unk8;
    u8 unkC[0x28];
} Unk122_021E9374;

void sub_0200D68C(void *, s32, void *, void *, NARC*, s32, s32, s32, s32, s32);
void sub_0200D71C(void *, void *, NARC*, s32, s32, s32);
struct UnkStruct_0200D748 *sub_0200D734(void *, void *, struct UnkTemplate_0200D748 *);
void sub_0200DDB8(struct UnkStruct_0200D748*, s16, s16);
void sub_0200DC18(struct UnkStruct_0200D748*);
void sub_0200DC78(struct UnkStruct_0200D748 *, s32);
void sub_0200DCE8(UnkStruct_0200D748 *, int);
BOOL sub_0200DCA0(UnkStruct_0200D748 *);
void sub_0200DC4C(struct UnkStruct_0200D748 *, int);
UnkStruct_0200CF18 *sub_0200CF18(HeapID);
void *sub_0200CF38(UnkStruct_0200CF18 *);
void sub_0200CF70(UnkStruct_0200CF18 *, Unk122_021E92FC *, Unk122_021E92D0 *, int);
void sub_0200CFF4(UnkStruct_0200CF18 *, void *, int);
void sub_0200D3F8(UnkStruct_0200CF18 *, void *, Unk122_021E92E4 *);
GF_G2dRenderer *sub_0200CF6C(UnkStruct_0200CF18 *);
void sub_0200D998(UnkStruct_0200CF18 *, void *);
void sub_0200D108(UnkStruct_0200CF18 *);
void sub_0200D5D4(UnkStruct_0200CF18 *, void *, NARC *, int, int, int, int, int);
void sub_0200D504(UnkStruct_0200CF18 *, void *, NARC *, int, int, int, int);
void sub_0200D6EC(UnkStruct_0200CF18 *, void *, NARC *, int, int, int);
UnkStruct_0200D748 *sub_0200D740(UnkStruct_0200CF18 *a0, void *a1, Unk122_021E9374 *a2, u32 a3);
void sub_0200DD54(UnkStruct_0200D748 *, int);
void sub_0200DD10(UnkStruct_0200D748 *, int);
void sub_0200D9DC(UnkStruct_0200D748 *);
void sub_0200D020(UnkStruct_0200D748 *);
void sub_0200D034(void);
void sub_0200DC58(UnkStruct_0200D748 *, int);
void sub_0200D958(void *a0, u32 character);
void sub_0200D968(void *a0, u32 pal);
void sub_0200D978(void *a0, u32 cell);
void sub_0200D988(void *a0, u32 animation);
void sub_0200DDF4(void *a0, s16 x, s16 y, fx32 a3);
BOOL sub_0200DCFC(void *a0);

#endif //POKEHEARTGOLD_UNK_0200CF18_H
