#ifndef POKEHEARTGOLD_BATTLE_022378C0_H
#define POKEHEARTGOLD_BATTLE_022378C0_H

#include "battle.h"
#include "battle_setup.h"
#include "overlay_manager.h"

BOOL Battle_Main(OVY_MANAGER *man, int *state);
void ov12_02237B0C(BattleSystem *bsys);
void ov12_02237B6C(BattleSystem *bsys);
void ov12_02237BB8(BattleSystem *bsys);
void ov12_02237CC4(BattleSystem *bsys);

//the following functions are static and have yet to be decompiled
void ov12_022399D4(OVY_MANAGER *man, BattleSetup *setup);
BOOL ov12_02239C28(OVY_MANAGER *man);
void ov12_0223A088(OVY_MANAGER *man);
BOOL ov12_0223A0D4(OVY_MANAGER *man);
BOOL ov12_0223A218(OVY_MANAGER *man);
BOOL ov12_0223A260(OVY_MANAGER *man);
BOOL ov12_0223A3A8(OVY_MANAGER *man);
void ov12_02237F18(OVY_MANAGER *man);
BOOL ov12_02238358(OVY_MANAGER *man);
void ov12_0223843C(OVY_MANAGER *man);
BOOL ov12_0223A3F0(OVY_MANAGER *man);
BOOL ov12_0223A5E4(OVY_MANAGER *man);
void ov12_0226631C(u32 *);
void ov12_022660A8(BgConfig *);
void ov12_0223A620(BattleSystem *bsys);

//the following functions aren't static/haven't been checked to their status and are yet to be decompiled
void ov12_02238A30(BgConfig *config);
void ov12_02238A64(BattleSystem *bsys);
void ov12_02237ED0(BattleSystem *bsys, int a1);

#endif
