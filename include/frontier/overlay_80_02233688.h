#ifndef POKEHEARTGOLD_OVERLAY_80_02233688
#define POKEHEARTGOLD_OVERLAY_80_02233688

#include "frontier/overlay_80_0222BDF4.h"
#include "frontier/overlay_80_022340E8.h"
#include "battle_arcade_game_board.h"

BOOL FrtCmd_ArcadeAlloc(FrontierContext *ctx);
BOOL FrtCmd_ArcadeInit(FrontierContext  *ctx);
BOOL FrtCmd_ArcadeFree(FrontierContext *ctx);
BOOL ov80_0223371C(FrontierContext *ctx);
BOOL ov80_02233770(FrontierContext *ctx);
BOOL FrtCmd_ArcadeStartBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSetPartyBeforeBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSetPartyAfterBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeAction(FrontierContext *ctx);

//static functions to be decompiled later
void ov80_02233F1C(FrontierContext *ctx, ArcadeContext *arcadeCtx, u32 a2);

#endif
