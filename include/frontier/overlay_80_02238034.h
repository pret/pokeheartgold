#ifndef POKEHEARTGOLD_OVERLAY_80_02238034_H
#define POKEHEARTGOLD_OVERLAY_80_02238034_H

#include "frontier/frontier.h"
#include "frontier/overlay_80_022340E8.h"

u8 BattleArcade_GetMonCount(u8 type, int a1);
u8 BattleArcade_GetOpponentMonCount(u8 type, int a1);
BattleSetup *BattleArcade_NewBattleSetup(ArcadeContext *ctx, FrontierLaunchParam *param);
u32 ov80_02238498(ArcadeContext *ctx);
u32 ov80_02238430(ArcadeContext *ctx, u8 a1);
BOOL BattleArcade_MultiplayerCheck(int type);
u32 ov80_022384BC(u8 a0);
void ov80_022383C0(ArcadeContext *ctx);

#endif
