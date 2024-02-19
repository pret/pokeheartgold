#ifndef POKEHEARTGOLD_UNK_020215A0_H
#define POKEHEARTGOLD_UNK_020215A0_H

#include "heap.h"

typedef struct UnkStruct_020215A0 {
    int unk_00;
    u32 unk_04;
    u32 unk_08;
    HeapID heapId;
} UnkStruct_020215A0;

typedef struct UnkStruct_02021758 {
    NNSG2dCharacterData *charData;
    u32 dest;
    int id;
    BOOL unk_0C;
} UnkStruct_02021758;

typedef struct UnkStruct_02021AC8 {
    u32 unk_00;
    u32 unk_04;
    u16 unk_08;
    u16 unk_0A;
} UnkStruct_02021AC8;

typedef struct UnkStruct_021D21F4 UnkStruct_021D21F4;

void sub_020215A0(UnkStruct_020215A0 *template);
void sub_020215C0(UnkStruct_020215A0 *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub);
void sub_0202168C(void);
void sub_020216C8(void);
void sub_020216F4(u32 a0, u32 a1, u32 a2);
BOOL sub_02021758(const UnkStruct_02021758 *a0);
BOOL sub_020217B0(const UnkStruct_02021758 *a0);
void sub_0202183C(int id, NNSG2dCharacterData *charData);
void sub_02021884(int resId);
NNSG2dImageProxy *sub_02021910(int resId);
NNSG2dImageProxy *sub_02021934(int resId, u32 size);
NNSG2dImageProxy *sub_020219B8(NNSG2dImageProxy *proxyIn);
void sub_02021A50(const NNSG2dImageProxy *proxy);
BOOL sub_02021AC8(u32 a0, int a1, int a2, UnkStruct_02021AC8 *a3);
void sub_02021B5C(UnkStruct_02021AC8 *a0);
UnkStruct_021D21F4 *sub_02021BD0(void);
void sub_02021BEC(UnkStruct_021D21F4 *a0);

#endif //POKEHEARTGOLD_UNK_020215A0_H
