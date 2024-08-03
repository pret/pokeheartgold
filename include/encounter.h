#ifndef POKEHEARTGOLD_ENCOUNTER_H
#define POKEHEARTGOLD_ENCOUNTER_H

#include "battle/battle_setup.h"

#include "field_player_avatar.h"
#include "task.h"

typedef struct Encounter {
    u32 *winFlag;
    s32 effect;
    s32 bgm;
    s32 unkC;
    BattleSetup *setup;
} Encounter;

typedef struct WildEncounter {
    s32 state;
    s32 effect;
    s32 bgm;
    u32 *winFlag;
    BattleSetup *setup;
} WildEncounter;

void CallTask_020509F0(TaskManager *taskManager, BattleSetup *battleSetup, s32 effect, s32 bgm, u32 *winFlag);
void sub_02050B08(FieldSystem *fieldSystem, BattleSetup *setup);
void FieldSystem_StartForcedWildBattle(FieldSystem *fieldSystem, TaskManager *taskManager, BattleSetup *setup);
void SetupAndStartWildBattle(TaskManager *taskManager, u16 species, u8 level, u32 *winFlag, BOOL canFlee, BOOL shiny);
void SetupAndStartFatefulWildBattle(TaskManager *taskManager, u16 species, u8 level, u32 *winFlag, BOOL canRun);
void sub_020511F8(FieldSystem *fieldSystem, BattleSetup *setup);
void SetupAndStartFirstBattle(TaskManager *taskManager, u16 species, u8 level);
void SetupAndStartTutorialBattle(TaskManager *taskManager);
void SetupAndStartTrainerBattle(TaskManager *taskManager, u32 opponentTrainer1, u32 opponentTrainer2, u32 followerTrainerNum, u32 a4, u32 a5, HeapID heapId, u32 *winFlag);
void CallTask_020508B8(TaskManager *taskManager, void *param1, u32 battleType);
void CallTask_02050960(TaskManager *taskManager, s32 target, s32 maxLevel, u32 flag);
void sub_02051598(FieldSystem *fieldSystem, void *param1, s32 battleType);
void sub_020515FC(FieldSystem *fieldSystem, Party *party, s32 battleType);

#endif // POKEHEARTGOLD_ENCOUNTER_H
