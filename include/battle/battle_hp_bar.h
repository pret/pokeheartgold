#ifndef POKEHEARTGOLD_BATTLE_HP_BAR_H
#define POKEHEARTGOLD_BATTLE_HP_BAR_H

#include "battle/battle.h"

void ov12_0226498C(BattleHpBar *hpBar, u32 num, u32 flag);
void BattleHpBar_LoadResources(BattleHpBar *hpBar);
void BattleHpBar_FreeResources(BattleHpBar *hpBar);
void ov12_02264C84(BattleHpBar *hpBar);
void ov12_02264DCC(BattleHpBar *hpBar, int hp);
void ov12_02264E34(BattleHpBar *hpBar, int a1);
int ov12_02264E00(BattleHpBar *hpBar);
int ov12_02264E68(BattleHpBar *hpBar);
void ov12_02264E84(BattleHpBar *hpBar);
void ov12_02264EB4(BattleHpBar *hpBar);
void ov12_02264EE0(BattleHpBar *hpBar, int prio);
void BattleHpBar_SetEnabled(BattleHpBar *hpBar, BOOL a1);
void ov12_02264FB0(BattleHpBar *hpBar, BOOL a1);
u8 BattleHpBar_Util_GetBarTypeFromBattlerSide(u8 a0, u32 battleType);
SysTask *BattleHpBar_BeginExpBarFullFlashEffect(BattleHpBar *hpBar, u8 *a1);
void ov12_02265D70(BattleHpBar *hpBar);
void ov12_02265D74(BattleHpBar *hpBar);

#endif
