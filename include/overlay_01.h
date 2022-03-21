#ifndef POKEHEARTGOLD_OVERLAY_01_H
#define POKEHEARTGOLD_OVERLAY_01_H

#include "script.h"
#include "unk_0206793C.h"

struct ErrorContinueEnv {
    int unk0;
    Location location;
};

void ov01_021F35C4(FieldSystem *fsys, int a1, int *a2);
void ov01_021EFAF8(FieldSystem *fsys);
void ov01_02205790(FieldSystem *fsys, int a1);
BOOL ov01_022057C4(FieldSystem *fsys);
UnkStruct_0206793C *ov01_0220329C(LocalMapObject *obj, int a1);

#endif //POKEHEARTGOLD_OVERLAY_01_H
