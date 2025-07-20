#ifndef POKEHEARTGOLD_UNK_020192D0_H
#define POKEHEARTGOLD_UNK_020192D0_H

#include "field_system.h"
#include "heap.h"
#include "overlay_manager.h"
#include "save.h"
#include "unk_02020654.h"

typedef struct UnkStruct_0203FC14 {
    FieldSystem *fieldSystem;
    SaveData *saveData;
    int unk8;
    u8 unkC;
} UnkStruct_0203FC14;

void *sub_02019BA4(const void *, const void *, const void *, void *, int, u8, HeapID);
void sub_02019BDC(void *);
int sub_02019F74(void *);
void sub_02019F7C(void *, int);
int sub_02019D18(void *);
const UnkStruct_02020654 *sub_0201A018(void *, int);

BOOL sub_020192D0(OverlayManager *man, int *state);
BOOL sub_0201935C(OverlayManager *man, int *state);
BOOL sub_02019490(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_UNK_020192D0_H
