#ifndef POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H
#define POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"
#include "battle/battle_system.h"

typedef struct UISetupTaskData {
    BattleSystem *battleSys;
    void *animContext;
    void *animObjects[3];
    u8 step;
    u8 frameCount;
    u8 fadeStep;
    u8 unused;
} UISetupTaskData;

void BattleDisplay_InitTaskSetupUI(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskSetEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonEncounterMessage *message);
void BattleDisplay_InitTaskShowEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message);
void BattleDisplay_InitTaskSetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData, TrainerEncounterMessage *message);
void OpponentData_ClearBattleCursorPosition(OpponentData *opponentData);

#endif
