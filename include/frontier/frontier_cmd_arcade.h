#ifndef POKEHEARTGOLD_FRONTIER_CMD_ARCADE
#define POKEHEARTGOLD_FRONTIER_CMD_ARCADE

#include "frontier/overlay_80_0222BDF4.h"
#include "frontier/overlay_80_022340E8.h"

#include "battle_arcade_game_board.h"

BOOL FrtCmd_ArcadeAlloc(FrontierContext *ctx);
BOOL FrtCmd_ArcadeInit(FrontierContext *ctx);
BOOL FrtCmd_ArcadeFree(FrontierContext *ctx);
BOOL FrtCmd_LaunchGameBoard(FrontierContext *ctx);
BOOL FrtCmd_187(FrontierContext *ctx);
BOOL FrtCmd_ArcadeStartBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSetPartyBeforeBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSetPartyAfterBattle(FrontierContext *ctx);
BOOL FrtCmd_ArcadeAction(FrontierContext *ctx);
BOOL FrtCmd_ArcadeGetBattleResult(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSendBuffer(FrontierContext *ctx);
BOOL FrtCmd_ArcadeReceiveBuffer(FrontierContext *ctx);
BOOL FrtCmd_ArcadePrintMsg(FrontierContext *ctx);
BOOL FrtCmd_ArcadeSetEvent(FrontierContext *ctx);
BOOL FrtCmd_198(FrontierContext *ctx);

#endif
