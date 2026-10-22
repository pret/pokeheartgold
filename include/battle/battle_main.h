#ifndef POKEHEARTGOLD_BATTLE_MAIN_H
#define POKEHEARTGOLD_BATTLE_MAIN_H

#include "battle.h"
#include "battle_setup.h"
#include "overlay_manager.h"

BOOL Battle_Run(OverlayManager *man, int *state);
void BattleSystem_EnterSubMenu(BattleSystem *battleSystem);
void BattleSystem_FreeGraphics(BattleSystem *battleSystem);
void BattleSystem_ExitSubMenu(BattleSystem *battleSystem);
void BattleSystem_HideBattleScreen(BattleSystem *battleSystem);
void ov12_02237D00(BattleSystem *battleSystem);
void ov12_02237ED0(BattleSystem *battleSys, int flags);
void ov12_022399BC(void);

#endif
