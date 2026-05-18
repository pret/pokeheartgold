#ifndef POKEHEARTGOLD_FRONTIER_CMD_ARCADE
#define POKEHEARTGOLD_FRONTIER_CMD_ARCADE

#include "frontier/frontier_script_context.h"
#include "frontier/overlay_80_0222BDF4.h"
#include "frontier/overlay_80_022340E8.h"

#include "battle_arcade_game_board.h"

BOOL FrtCmd_ArcadeAlloc(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeInit(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeFree(FrontierScriptContext *ctx);
BOOL FrtCmd_LaunchGameBoard(FrontierScriptContext *ctx);
BOOL FrtCmd_187(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeStartBattle(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeSetPartyBeforeBattle(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeSetPartyAfterBattle(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeAction(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeGetBattleResult(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeSendBuffer(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeReceiveBuffer(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadePrintMsg(FrontierScriptContext *ctx);
BOOL FrtCmd_ArcadeSetEvent(FrontierScriptContext *ctx);
BOOL FrtCmd_198(FrontierScriptContext *ctx);

#endif
