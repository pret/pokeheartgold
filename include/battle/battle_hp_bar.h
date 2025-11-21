#ifndef POKEHEARTGOLD_BATTLE_HP_BAR_H
#define POKEHEARTGOLD_BATTLE_HP_BAR_H

#include "battle/battle.h"

void ov12_0226498C(BattlerInfoBox *battlerInfoBox, u32 hp, u32 flag);
void BattleHpBar_LoadResources(BattlerInfoBox *battlerInfoBox);
void BattleHpBar_FreeResources(BattlerInfoBox *battlerInfoBox);
void ov12_02264C84(BattlerInfoBox *battlerInfoBox);
void ov12_02264DCC(BattlerInfoBox *battlerInfoBox, int hp);
void ov12_02264E34(BattlerInfoBox *battlerInfoBox, int a1);
int ov12_02264E00(BattlerInfoBox *battlerInfoBox);
int ov12_02264E68(BattlerInfoBox *battlerInfoBox);
void ov12_02264E84(BattlerInfoBox *battlerInfoBox);
void ov12_02264EB4(BattlerInfoBox *battlerInfoBox);
void ov12_02264EE0(BattlerInfoBox *battlerInfoBox, int prio);
void BattleHpBar_SetEnabled(BattlerInfoBox *battlerInfoBox, BOOL a1);
void ov12_02264FB0(BattlerInfoBox *battlerInfoBox, BOOL a1);
u8 BattleHpBar_Util_GetBarTypeFromBattlerSide(u8 a0, u32 battleType);
SysTask *BattleHpBar_BeginExpBarFullFlashEffect(BattlerInfoBox *battlerInfoBox, u8 *a1);
void ov12_02265D70(BattlerInfoBox *battlerInfoBox);
void ov12_02265D74(BattlerInfoBox *battlerInfoBox);

#endif
