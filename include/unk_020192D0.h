#ifndef POKEHEARTGOLD_UNK_020192D0_H
#define POKEHEARTGOLD_UNK_020192D0_H

#include "field_system.h"
#include "heap.h"
#include "overlay_manager.h"
#include "save.h"
#include "touchscreen.h"
#include "unk_02020654.h"

typedef struct UnkStruct_0203FC14 {
    FieldSystem *fieldSystem;
    SaveData *saveData;
    int unk8;
    u8 unkC;
} UnkStruct_0203FC14;

typedef void (*UnkStruct_02019BA4_unk18_func)(void *data, int a1, int a2);

typedef struct UnkStruct_02019BA4 {
    const TouchscreenHitbox *unk_00;
    const UnkStruct_02020654 *unk_04;
    int unk_08;
    u8 unk_0C;
    u8 unk_0D;
    u8 unk_0E;
    u8 unk_0F;
    int unk_10;
    int unk_14;
    UnkStruct_02019BA4_unk18_func *unk_18;
    void *unk_1C; // passed as data to unk_18
} UnkStruct_02019BA4;

UnkStruct_02019BA4 *sub_02019BA4(const TouchscreenHitbox *, const UnkStruct_02020654 *, const UnkStruct_02019BA4_unk18_func *, void *, int, u8, enum HeapID);
void sub_02019BDC(UnkStruct_02019BA4 *);
int sub_02019F74(UnkStruct_02019BA4 *);
void sub_02019F7C(UnkStruct_02019BA4 *, int);
int sub_02019D18(UnkStruct_02019BA4 *);
const UnkStruct_02020654 *sub_0201A018(UnkStruct_02019BA4 *, int);

BOOL sub_020192D0(OverlayManager *man, int *state);
BOOL sub_0201935C(OverlayManager *man, int *state);
BOOL sub_02019490(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_UNK_020192D0_H
