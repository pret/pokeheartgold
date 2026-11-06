#ifndef POKEHEARTGOLD_UNK_02020E80_H
#define POKEHEARTGOLD_UNK_02020E80_H

#include <nitro.h>

#include "global.h"

typedef struct Vec2D {
    s32 x;
    s32 y;
} Vec2D;

typedef struct VecFx322D {
    fx32 x;
    fx32 y;
} VecFx322D;

BOOL sub_02020E80(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2);
BOOL sub_02020EB0(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2, Vec2D *arg3);
VecFx322D sub_02020EF4(int arg0, int arg1, int arg2, int arg3);
BOOL sub_02020F4C(Vec2D *arg0, Vec2D *arg1, Vec2D *arg2, Vec2D *arg3, Vec2D *arg4);

#endif // POKEHEARTGOLD_UNK_02020E80_H
