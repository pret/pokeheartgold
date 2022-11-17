#ifndef POKEHEARTGOLD_BATTLE_SYSTEM_H
#define POKEHEARTGOLD_BATTLE_SYSTEM_H

#include "battle.h"
#include "player_data.h"

u32 BattleSys_GetBattleType(BattleSystem *bsys);
u32 BattleSys_GetFieldSide(BattleSystem *bsys, int battlerId);
int BattleSys_GetMaxBattlers(BattleSystem *bsys);
int BattleSys_Random(BattleSystem *bsys);
PLAYERPROFILE *BattleSys_GetPlayerProfile(BattleSystem *bsys, int a1);
void ov12_0223BDDC(BattleSystem *bsys, int battlerId, u8 a2);
void ov12_0223C288(BattleSystem *bsys, int battlerId);
OpponentData *BattleSys_GetOpponentDataByBattlerId(BattleSystem *bsys, int battlerId);

#endif