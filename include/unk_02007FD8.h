#ifndef POKEHEARTGOLD_UNK_02007FD8_H
#define POKEHEARTGOLD_UNK_02007FD8_H

#include "filesystem_files_def.h"
#include "unk_02016EDC.h"
#include "heap.h"

typedef struct UnkStruct_02009264 {
    u8 unk_0;
    s8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4[10];
    struct UnkStruct_02072914_sub_sub *unk_10;
} UnkStruct_02009264;

typedef struct UnkStruct_02007FD4_sub_sub {
    u8 filler_00[0x30];
    u32 unk_30_00:1;
    u32 unk_30_01:10;
    u32 unk_30_0B:1;
    u32 unk_30_0C:20;
} UnkStruct_02007FD4_sub_sub;

typedef struct UnkStruct_02007FD4_sub {
    u32 unk_00_00:1;
    u32 unk_00_01:31;
    u8 filler_04[0x20];
    UnkStruct_02007FD4_sub_sub unk_24;
    u8 filler_58[0x10];
    void (*unk_68)(struct UnkStruct_02007FD4_sub *, UnkStruct_02007FD4_sub_sub *);
    u8 filler_6C[64];
} UnkStruct_02007FD4_sub; // size: 0xAC

typedef struct UnkStruct_02007FD4 {
    UnkStruct_02007FD4_sub unk_000[4];
    NNSG2dImageProxy unk_2B0;
    NNSG2dImagePaletteProxy unk_2D4;
    HeapID unk_2E8;
    int unk_2EC;
    int unk_2F0;
    int unk_2F4;
    int unk_2F8;
    u8 *unk_2FC;
    void *unk_300;
    void *unk_304;
    u8 filler_308[4];
    GXTexFmt unk_30C;
    GXOBJVRamModeChar unk_310;
    u32 unk_314;
    u8 filler_318[0x18];
    u8 unk_330;
    u8 unk_331;
    u8 unk_332;
    u8 unk_333;
    u8 filler_334[4];
} UnkStruct_02007FD4;  // size: 0x338

UnkStruct_02007FD4 *sub_02007FD4(HeapID heapId);
void sub_020087A4(u32 *a0, int a1, int dy);
void sub_02009264(UnkStruct_02009264 *a0, struct UnkStruct_02072914_sub_sub *a1);
int sub_02009284(UnkStruct_02009264 *a0);
void sub_02009B60(void *pRawData, u32 pid, BOOL isAnimated);
void sub_02009D28(void *pRawData, NarcId narcId);

#endif //POKEHEARTGOLD_UNK_02007FD8_H
