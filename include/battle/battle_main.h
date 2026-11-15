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
void BattleSystem_SetupBattleScreen(BattleSystem *battleSystem);
void BattleSystem_LoadFightOverlay(BattleSystem *battleSys, int flags);
void NitroStaticInit(void);

#endif
