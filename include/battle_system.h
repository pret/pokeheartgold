#ifndef POKEHEARTGOLD_BATTLE_SYSTEM_H
#define POKEHEARTGOLD_BATTLE_SYSTEM_H

#include "battle.h"

u32 ov12_0223A7E0(BattleSystem *bsys);
u32 ov12_0223AB1C(BattleSystem* bsys, int battlerId);
int BattleSys_GetMaxBattlers(BattleSystem *bsys);
int BattleSys_Random(BattleSystem *bsys);
void ov12_0223BDDC(BattleSystem *bsys, int battlerId, u8 a2);
void ov12_0223C288(BattleSystem *bsys, int battlerId);
OpponentData *BattleSys_GetOpponentDataByBattlerId(BattleSystem *bsys, int battlerId);

#endif