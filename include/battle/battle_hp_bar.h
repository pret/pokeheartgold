#ifndef POKEHEARTGOLD_BATTLE_HP_BAR_H
#define POKEHEARTGOLD_BATTLE_HP_BAR_H

#include "battle/battle.h"

void BattleHpBar_LoadResources(BattleHpBar *hpBar);
void BattleHpBar_FreeResources(BattleHpBar *hpBar);
void BattleHpBar_SetEnabled(BattleHpBar *hpBar, BOOL a1);
u8 ov12_02265B64(u8 a0, u32 battleType);
void ov12_02264EE0(BattleHpBar *hpBar, int a1);

#endif
