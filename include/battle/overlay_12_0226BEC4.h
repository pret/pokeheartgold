#ifndef POKEHEARTGOLD_OVERLAY_12_0226BEC4_H
#define POKEHEARTGOLD_OVERLAY_12_0226BEC4_H

#include "battle/battle.h"

#include "sys_task_api.h"

typedef struct UnkBattleStruct_0226BEC4 {
    BattleSystem *bsys;
    s16 state;
    s16 delay;
} UnkBattleStruct_0226BEC4;

SysTask *ov12_0226BEC4(BattleSystem *bsys);
void ov12_0226BEF0(SysTask *task);

#endif
