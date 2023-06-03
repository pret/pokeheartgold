#ifndef POKEHEARTGOLD_OVERLAY_12_0226BEC4_H
#define POKEHEARTGOLD_OVERLAY_12_0226BEC4_H

#include "battle.h"

typedef struct {
    BattleSystem *bsys;
    s16 unk4;
    s16 delay;
} UnkBattleStruct_0226BEC4;

SysTask *ov12_0226BEC4(BattleSystem *bsys);

#endif
