#ifndef POKEHEARTGOLD_OVERLAY_12_02258800_H
#define POKEHEARTGOLD_OVERLAY_12_02258800_H

#include "battle/battle.h"

typedef struct BattlerInitData {
    u8 battler;
    u8 battlerType;
} BattlerInitData;

int ov12_02258800(BattleSystem *battleSystem, int battler);
int ov12_02258BA0(BattleSystem *battleSystem, int battler);
void ov12_02258DB0(BattleSystem *battleSystem, OpponentData *opponentData, u16 monBall, int slot);
OpponentData *ov12_02258D74(BattleSystem *battleSystem, BattlerInitData *battlerInitData);

#endif
