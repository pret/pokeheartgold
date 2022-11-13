#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle.h"

void ov12_022622C8(BattleSystem *bsys, BOOL a1);
void ov12_022622F0(BattleSystem *bsys, int battlerId);
void ov12_022623F0(BattleSystem *bsys, int battlerId);
void ov12_02262524(BattleSystem *bsys, int battlerId, int a2, int a3);
void ov12_02262734(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_02262958(BattleSystem *bsys, int battlerId);
void ov12_02262974(BattleSystem *bsys, int battlerId);
void ov12_022629A4(BattleSystem *bsys, int battlerId, u32 a2);
void ov12_022629DC(BattleSystem *bsys, int battlerId);
void ov12_022629F8(BattleSystem *bsys, int battlerId, u32 a2);
void ov12_02263CB0(BattleSystem *bsys, int battlerId);
void ov12_02262A2C(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 delay);
void ov12_02262B64(BattleSystem *bsys, int battlerId);
void ov12_022632DC(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 a3, u32 a4, u32 a5);
void ov12_022633B8(BattleSystem *bsys, BATTLECONTEXT *ctx);
void ov12_022633F0(BattleSystem *bsys, BATTLECONTEXT *ctx, BATTLEMSG *msg);
void ov12_0226340C(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move);
void ov12_0226343C(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move, int attacker, int target);
void ov12_0226346C(BattleSystem *bsys, int side, int a2);
void ov12_02263488(BattleSystem *bsys, BATTLECONTEXT *ctx, int side);
void ov12_022636FC(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 sndSeqNo, int battlerId);
void ov12_0226371C(BattleSystem *bsys, BATTLECONTEXT *ctx);
void ov12_02263738(BattleSystem *bsys, int battlerId, int a2);

#endif
