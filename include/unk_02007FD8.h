#ifndef POKEHEARTGOLD_UNK_02007FD8_H
#define POKEHEARTGOLD_UNK_02007FD8_H

#include "filesystem_files_def.h"
#include "pokemon_types_def.h"
#include "heap.h"

typedef struct UnkStruct_02007FD4_sub84 {
    s8 unk_0;
    u8 unk_1;
    s8 unk_2;
    s8 unk_3;
} UnkStruct_02007FD4_sub84;

typedef struct UnkStruct_02009264 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4[10];
    struct UnkStruct_02007FD4_sub84 *unk_10;
} UnkStruct_02009264;

typedef struct UnkStruct_02007FD4_sub_sub {
    s16 unk_00;
    s16 unk_02;
    int unk_04;
    s16 unk_08;
    s16 unk_0A;
    int unk_0C;
    s16 unk_10;
    s16 unk_12;
    u16 unk_14;
    u16 unk_16;
    u16 unk_18;
    u8 filler_1A[2];
    s16 unk_1C;
    s16 unk_1E;
    u8 unk_20;
    u8 unk_21;
    u8 unk_22;
    u8 unk_23;
    u8 unk_24;
    u8 unk_25;
    u8 unk_26;
    u8 unk_27;
    u32 unk_28;
    u32 unk_2C_00:5;
    u32 unk_2C_05:5;
    u32 unk_2C_10:5;
    u32 unk_2C_15:5;
    u32 unk_2C_20:5;
    u32 unk_2C_25:5;
    u32 unk_2C_30:2;
    u32 unk_30_00:1;
    u32 unk_30_01:1;
    u32 unk_30_02:5;
    u32 unk_30_07:1;
    u32 unk_30_08:1;
    u32 unk_30_09:1;
    u32 unk_30_0A:1;
    u32 unk_30_0B:1;
    u32 unk_30_0C:1;
    u32 unk_30_0D:4;
    u32 unk_30_11:15;
} UnkStruct_02007FD4_sub_sub;

typedef struct UnkStruct_02007FD4_sub6C {
    u16 unk_0_0:2;
    u16 unk_0_2:1;
    u16 unk_0_3:1;
    u16 unk_0_4:1;
    u16 unk_0_5:2;
    u16 unk_0_7:9;
    s8 unk_2;
    u8 unk_3;
    s16 unk_4;
    s16 unk_6;
    s16 unk_8;
    s16 unk_A;
} UnkStruct_02007FD4_sub6C;

struct UnkStruct_02007FD4_sub;

typedef void (*UnkStruct_02007FD4_sub_func68)(struct UnkStruct_02007FD4_sub *, UnkStruct_02007FD4_sub_sub *);

typedef struct UnkStruct_02007FD4_sub {
    u32 unk_00_00:1;
    u32 unk_00_01:6;
    u32 unk_00_07:1;
    u32 unk_00_08:1;
    u32 unk_00_09:23;
    SomeDrawPokemonStruct unk_04;
    SomeDrawPokemonStruct unk_14;
    UnkStruct_02007FD4_sub_sub unk_24;
    u8 unk_58;
    u8 unk_59;
    u8 unk_5A;
    u8 unk_5B;
    u8 unk_5C[10];
    u8 filler_66[2];
    UnkStruct_02007FD4_sub_func68 unk_68;
    UnkStruct_02007FD4_sub6C unk_6C;
    UnkStruct_02007FD4_sub6C unk_78;
    UnkStruct_02007FD4_sub84 unk_84[10];
} UnkStruct_02007FD4_sub; // size: 0xAC

typedef struct UnkStruct_02007FD4 {
    UnkStruct_02007FD4_sub unk_000[4];
    NNSG2dImageProxy unk_2B0;
    NNSG2dImagePaletteProxy unk_2D4;
    HeapID unk_2E8;
    u32 unk_2EC;
    u32 unk_2F0;
    u32 unk_2F4;
    u32 unk_2F8;
    u8 *unk_2FC;
    u16 *unk_300;
    u16 *unk_304;
    NNSG2dCharacterData unk_308;
    NNSG2dPaletteData unk_320;
    u8 unk_330;
    u8 unk_331;
    u8 unk_332;
    u8 unk_333;
    u32 unk_334;
} UnkStruct_02007FD4;  // size: 0x338

UnkStruct_02007FD4 *sub_02007FD4(HeapID heapId);
void sub_02008120(UnkStruct_02007FD4 *r5);
void sub_02008524(UnkStruct_02007FD4 *r5);
void sub_02008550(UnkStruct_02007FD4_sub *a0);
void sub_020085C8(UnkStruct_02007FD4_sub *a0, UnkStruct_02007FD4_sub84 *a1);
BOOL sub_020085DC(UnkStruct_02007FD4_sub *a0);
UnkStruct_02007FD4_sub *sub_020085EC(UnkStruct_02007FD4 *a0, SomeDrawPokemonStruct *a1, int a2, int a3, int a4, int a5, UnkStruct_02007FD4_sub84 *a6, UnkStruct_02007FD4_sub_func68 a7);
UnkStruct_02007FD4_sub *sub_02008634(UnkStruct_02007FD4 *a0, SomeDrawPokemonStruct *a1, int a2, int a3, int a4, int a5, int a6, UnkStruct_02007FD4_sub84 *a7, UnkStruct_02007FD4_sub_func68 a8);
void sub_02008780(UnkStruct_02007FD4_sub *a0);
void sub_0200878C(UnkStruct_02007FD4 *a0);
void sub_020087A4(UnkStruct_02007FD4_sub *a0, int a1, int a2);
int sub_02008A78(UnkStruct_02007FD4_sub *a0, int a1);
void sub_02008C2C(UnkStruct_02007FD4_sub *a0, int a1, int a2);
void sub_0200908C(UnkStruct_02007FD4_sub *a0, int a1, int a2, int a3, int a4);
void sub_020090B4(UnkStruct_02007FD4_sub *a0, int a1, int a2, int a3, int a4);
void sub_020090E4(UnkStruct_02007FD4 *a0, int a1, int a2, int a3, int a4);
BOOL sub_02009138(UnkStruct_02007FD4_sub *a0);
void sub_0200914C(UnkStruct_02007FD4_sub *a0, int a1);
void sub_02009264(UnkStruct_02009264 *a0, struct UnkStruct_02007FD4_sub84 *a1);
int sub_02009284(UnkStruct_02009264 *a0);
void sub_02009324(UnkStruct_02007FD4_sub *a0);
void sub_02009334(UnkStruct_02007FD4_sub *a0);
void sub_02009390(UnkStruct_02007FD4_sub *a0);
void sub_020093FC(UnkStruct_02007FD4 *a0, int a1, int a2);
void sub_02009408(UnkStruct_02007FD4 *a0, int a1, int a2);
SomeDrawPokemonStruct *sub_02009414(UnkStruct_02007FD4_sub *a0);
void sub_02009418(UnkStruct_02007FD4 *a0);
void sub_020094B0(UnkStruct_02007FD4 *a0, int a1);
BOOL sub_020094BC(UnkStruct_02007FD4_sub *a0);
void sub_020094D8(UnkStruct_02007FD4 *a0, u32 a1);
void sub_020094E4(UnkStruct_02007FD4 *a0, u32 a1);
void sub_020094FC(UnkStruct_02007FD4 *a0);
void sub_02009B60(u8 *pRawData, u32 pid, BOOL isAnimated);
void sub_02009D28(void *pRawData, NarcId narcId);

#endif //POKEHEARTGOLD_UNK_02007FD8_H
