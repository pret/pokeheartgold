#ifndef POKEHEARTGOLD_UNK_02055BF0_H
#define POKEHEARTGOLD_UNK_02055BF0_H

#include "field_system.h"
#include "task.h"
#include "unk_0206793C.h"

typedef struct FieldFadeEnvironment {
    u32 state;
    int pattern;
    int typeTop;
    int typeBottom;
    u16 colour;
    u16 unk12;
    u32 duration;
    int framesPer;
    HeapID heapID;
} FieldFadeEnvironment;

typedef struct FieldTransitionEnvironment {
    u8 state;
    u8 unk1;
    u16 transitionState;
    Location location;
    FieldEnvSubUnk18 *unk18;
    u32 transitionNo;
    u32 destinationMapID;
    UnkStruct_0206793C *unk24;
} FieldTransitionEnvironment; // size: 0x28

void NewFieldFadeEnvironment(TaskManager *man, int pattern, int typeTop, int typeBottom, u16 colour, int duration, int framesPer, HeapID heapID);
void NewFieldTransitionEnvironment(FieldSystem *fieldSystem, int mapID, int warpID, int x, int z, int dir, u32 transNo);
void sub_02055CD8(FieldSystem *fieldSystem, int mapID, int warpID, int x, int z, int dir);

BOOL sub_02056004(TaskManager *man);
BOOL sub_02056040(TaskManager *man);
BOOL sub_020560C4(TaskManager *man);
BOOL sub_0205613C(TaskManager *man);
BOOL sub_02056220(TaskManager *man);
BOOL sub_02056268(TaskManager *man);
BOOL sub_020562B0(TaskManager *man);
BOOL sub_02056424(TaskManager *man);
BOOL sub_02056530(TaskManager *man);
BOOL sub_020565FC(TaskManager *man);

#endif // POKEHEARTGOLD_UNK_02055BF0_H
