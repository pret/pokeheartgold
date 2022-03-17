#ifndef POKEHEARTGOLD_OVERLAY_01_H
#define POKEHEARTGOLD_OVERLAY_01_H

#include "script.h"

struct ErrorContinueEnv {
    int unk0;
    Location location;
};

void ov01_021F35C4(FieldSystem *fsys, int a1, struct ErrorContinueEnv *env);
void ov01_021EFAF8(FieldSystem *fsys);

#endif //POKEHEARTGOLD_OVERLAY_01_H
