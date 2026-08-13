#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H

#include "battle/battle.h"

int Move_CalcVariableDamageType(BattleSystem *battleSystem, BattleContext *ctx, Pokemon *mon, int move);
int BattleAI_PostKOSwitchIn(BattleSystem *battleSystem, int battler);
u8 ov12_02261258(OpponentData *opponentData);
void *ov12_02261270(OpponentData *opponentData);
u32 ov12_02261264(OpponentData *opponentData);
BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData);
BattleCursorPosition *ov12_02261280(OpponentData *opponentData);
void ov12_02261294(OpponentData *opponentData, s32);

#endif
