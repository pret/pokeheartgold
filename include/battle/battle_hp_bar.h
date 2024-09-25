#ifndef POKEHEARTGOLD_BATTLE_HP_BAR_H
#define POKEHEARTGOLD_BATTLE_HP_BAR_H

#include "battle/battle.h"

void ov12_0226498C(BattleHpBar *hpBar, u32 num, u32 flag);
void BattleHpBar_LoadResources(BattleHpBar *hpBar);
void BattleHpBar_FreeResources(BattleHpBar *hpBar);
void ov12_02264C84(BattleHpBar *hpBar);
int ov12_02264E00(BattleHpBar *hpBar);
void ov12_02264EE0(BattleHpBar *hpBar, int a1);
void BattleHpBar_SetEnabled(BattleHpBar *hpBar, BOOL a1);
u8 ov12_02265B64(u8 a0, u32 battleType);

#endif
