#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H

#include "battle/battle.h"

BattleContext *BattleContext_New(BattleSystem *bsys);
BOOL BattleContext_Main(BattleSystem *bsys, BattleContext *ctx);
void BattleContext_Delete(BattleContext *ctx);
void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);

//The following functions are static, but still refrenced in asm code
void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_CalcExecutionOrder(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_BeforeTurn(BattleSystem *bsys, BattleContext *ctx);
void ov12_02249460(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateFieldConditionExtra(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_FightInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_RunInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SafariThrowBall(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SafariThrowMud(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SafariRun(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SafariWatching(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_CatchingContestThrowBall(BattleSystem *bsys, BattleContext *ctx);
u32 TryDisobedience(BattleSystem *bsys, BattleContext *ctx, int *script);
BOOL ov12_0224B1FC(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224B398(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224B498(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224B528(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224BC2C(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224BCA4(BattleSystem *bsys, BattleContext *ctx);
BOOL BattleSystem_CheckMoveHit(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move);
BOOL BattleSystem_CheckMoveEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move);
BOOL ov12_0224C204(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_RunScript(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224C38C(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224C4D8(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224C5C8(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224C5F8(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224C678(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_HpCalc(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224CAA4(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224CC84(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224CC88(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224CF10(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224CF14(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D014(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D03C(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D1DC(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D224(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D238(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D23C(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D368(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D448(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D464(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D4F0(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D504(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224D53C(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224D540(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224D7EC(BattleSystem *bsys, BattleContext *ctx);

//The following functions haven't been decompiled yet
void ov12_0224E384(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224DC74(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2, int a3);
BOOL ov12_0224DD18(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2);
BOOL ov12_0224DF7C(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224DF98(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224DFEC(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224E078(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224DD74(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224E1BC(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224E130(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224DC0C(BattleSystem *bsys, BattleContext *ctx);

#endif
