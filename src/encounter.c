#include "global.h"
#include "battle/battle_setup.h"
#include "encounter.h"
#include "blackout.h"
#include "field_map_object.h"
#include "field_system.h"
#include "field_warp_tasks.h"
#include "game_clear.h"
#include "game_stats.h"
#include "overlay_02.h"
#include "overlay_03.h"
#include "overlay_80.h"
#include "pokedex_util.h"
#include "use_item_on_mon.h"
#include "save_arrays.h"
#include "save_local_field_data.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "unk_020517A4.h"
#include "unk_0203E348.h"
#include "unk_02087E70.h"
#include "unk_020551B8.h"
#include "unk_02055244.h"
#include "unk_02092BE8.h"
#include "unk_0206D494.h"
#include "unk_020552A4.h"
#include "unk_02034354.h"
#include "unk_02004A44.h"
#include "unk_02066EDC.h"
#include "pal_park.h"
#include "unk_0202FBCC.h"
#include "unk_020290B4.h"
#include "unk_02058034.h"
#include "constants/battle.h"
#include "constants/game_stats.h"
#include "constants/std_script.h"
#include "game_stats.h"
#include "unk_020552A4.h"
#include "unk_02034354.h"
#include "unk_02066EDC.h"
#include "field_map_object.h"
#include "field_warp_tasks.h"
#include "unk_02058034.h"
#include "pokedex_util.h"
#include "fielddata/script/scr_seq/event_D10R0101.h"

static BOOL Task_StartBattle(TaskManager *taskManager);
static void CallTask_StartBattle(TaskManager *taskManager, BattleSetup *setup);
static Encounter *Encounter_New(BattleSetup *setup, s32 effect, s32 bgm, u32 *winFlag);
static void Encounter_Delete(Encounter *encounter);
static void sub_02050724(BattleSetup *setup, FieldSystem *fieldSystem);
static BOOL Task_StartEncounter(TaskManager *taskManager);
static void sub_0205087C(s32 flag, FieldSystem *fieldSystem);
static BOOL Task_020508B8(TaskManager *taskManager);
static BOOL Task_02050960(TaskManager *taskManager);
static BOOL Task_020509F0(TaskManager *taskManager);
static BOOL Task_WildEncounter(TaskManager *taskManager);
static BOOL Task_SafariEncounter(TaskManager *taskManager);
static BOOL Task_BugContestEncounter(TaskManager *taskManager);
static BOOL Task_TutorialBattle(TaskManager *taskManager);
static u32 sub_02051474(void *param0, u32 battleType);
static void sub_02051660(FieldSystem *fieldSystem, BattleSetup *setup);

static BOOL Task_StartBattle(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    BattleSetup *battleSetup = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            sub_0203E3C4(fieldSystem, battleSetup);
            sub_0203E354();
            (*state)++;
            break;
        case 1:
            if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
                return TRUE;
            }
            break;
    }
    return FALSE;
}

static void CallTask_StartBattle(TaskManager *taskManager, BattleSetup *setup) {
    TaskManager_Call(taskManager, Task_StartBattle, setup);
}

static Encounter *Encounter_New(BattleSetup *setup, s32 effect, s32 bgm, u32 *winFlag) {
    Encounter *encounter = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(Encounter));
    encounter->winFlag = winFlag;
    if (winFlag != NULL) {
        *winFlag = BATTLE_OUTCOME_NONE;
    }
    encounter->effect = effect;
    encounter->bgm = bgm;
    encounter->setup = setup;
    return encounter;
}

static void Encounter_Delete(Encounter *encounter) {
    BattleSetup_Delete(encounter->setup);
    FreeToHeap(encounter);
}

static BOOL Encounter_GetResult(Encounter *encounter, FieldSystem *fieldSystem) {
    if (encounter->winFlag != NULL) {
        *(encounter->winFlag) = encounter->setup->winFlag;
    }
    FieldSystem_VarSet(fieldSystem, VAR_BATTLE_RESULT, encounter->setup->winFlag);
    return IsBattleResultWin(encounter->setup->winFlag);
}

static void sub_02050724(BattleSetup *setup, FieldSystem *fieldSystem) {
    if (!(setup->battleType & BATTLE_TYPE_DEBUG)) {
        sub_0205239C(setup, fieldSystem);
    }
}

static BOOL Task_StartEncounter(TaskManager *taskManager) { //todo: better name
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            if (encounter->setup->battleType == BATTLE_TYPE_NONE || encounter->setup->battleType == BATTLE_TYPE_8 || encounter->setup->battleType == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_6)) {
                sub_02093070(fieldSystem);
                sub_020930C4(fieldSystem);
            }

            fieldSystem->unk7E = 0;
            fieldSystem->unk7C = 0;

            if (Encounter_GetResult(encounter, fieldSystem) == FALSE) {
                if (encounter->setup->battleType & BATTLE_TYPE_11) {
                    HealParty(SaveArray_Party_Get(fieldSystem->saveData));
                } else {
                    Encounter_Delete(encounter);
                    return TRUE;
                }
            }

            if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData))) {
                HealParty(SaveArray_Party_Get(fieldSystem->saveData));
            }

            sub_02051660(fieldSystem, encounter->setup);
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 4:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 5:
            Encounter_Delete(encounter);
            return TRUE;
    }

    return FALSE;
}

static void CallTask_StartEncounter(TaskManager *taskManager, BattleSetup *setup, s32 effect, s32 bgm, u32 *winFlag) {
    Encounter *encounter = Encounter_New(setup, effect, bgm, winFlag);
    TaskManager_Call(taskManager, Task_StartEncounter, encounter);
}

static void sub_0205087C(s32 flag, FieldSystem *fieldSystem) {
    switch(flag & 0xF) {
        case 1:
        case 6:
            sub_02034AC0(fieldSystem->saveData, 1);
            break;
        case 2:
        case 5:
            sub_02034AC0(fieldSystem->saveData, -1);
            break;
    }
}

static BOOL Task_020508B8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_0205087C(encounter->setup->winFlag, fieldSystem);
            sub_02052444(encounter->setup, fieldSystem);
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK20);
            Encounter_GetResult(encounter, fieldSystem);
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 4:
            Encounter_Delete(encounter);
            return TRUE;
            break;
    }
    return FALSE;
}

static BOOL Task_02050960(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            sub_02004AD8(0);
            sub_02004EC4(5, encounter->bgm, 1);
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 1:
            sub_0205087C(encounter->setup->winFlag, fieldSystem);
            sub_02052444(encounter->setup, fieldSystem);
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK20);
            Encounter_GetResult(encounter, fieldSystem);
            (*state)++;
            break;
        case 2:
            Encounter_Delete(encounter);
            sub_0202FC24();
            return TRUE;
    }
    return FALSE;
}

static BOOL Task_020509F0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02052444(encounter->setup, fieldSystem);
            if (fieldSystem->unkA0 != NULL) {
                sub_02067484(fieldSystem, &encounter->setup->unk138);
            }
            Encounter_GetResult(encounter, fieldSystem);
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 4:
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 5:
            Encounter_Delete(encounter);
            return TRUE;
    }
    return FALSE;
}

void CallTask_020509F0(TaskManager *taskManager, BattleSetup *battleSetup, s32 effect, s32 bgm, u32 *winFlag) {
    Encounter *encounter = Encounter_New(battleSetup, effect, bgm, winFlag);
    TaskManager_Call(taskManager, Task_020509F0, encounter);
}

static WildEncounter *WildEncounter_New(BattleSetup *setup, s32 effect, s32 bgm, u32 *winFlag) {
    WildEncounter *encounter = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(WildEncounter));
    encounter->winFlag = winFlag;
    if (winFlag != NULL) {
        *winFlag = BATTLE_OUTCOME_NONE;
    }
    encounter->effect = effect;
    encounter->bgm = bgm;
    encounter->setup = setup;
    encounter->state = 0;
    return encounter;
}

static void WildEncounter_Delete(WildEncounter *encounter) {
    BattleSetup_Delete(encounter->setup);
    FreeToHeap(encounter);
}

void sub_02050B08(FieldSystem *fieldSystem, BattleSetup *setup) {
    SaveVarsFlags *flags = Save_VarsFlags_Get(fieldSystem->saveData);
    s32 effect = sub_020517E8(setup);
    s32 bgm = sub_020517FC(setup);

    if (Save_VarsFlags_CheckSafariSysFlag(flags)) {
        Encounter *encounter = Encounter_New(setup, effect, bgm, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_SafariEncounter, encounter);
    } else if (CheckFlag996(flags)) {
        Encounter *encounter = Encounter_New(setup, effect, bgm, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_BugContestEncounter, encounter);
    } else {
        WildEncounter *encounter = WildEncounter_New(setup, effect, bgm, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_WildEncounter, encounter);
    }
}

void sub_02050B90(FieldSystem *fieldSystem, TaskManager *taskManager, BattleSetup *setup) {
    SaveVarsFlags *flags = Save_VarsFlags_Get(fieldSystem->saveData);
    s32 effect = sub_020517E8(setup);
    s32 bgm = sub_020517FC(setup);

    if (Save_VarsFlags_CheckSafariSysFlag(flags)) {
        Encounter *encounter = Encounter_New(setup, effect, bgm, NULL);
        TaskManager_Jump(taskManager, Task_SafariEncounter, encounter);
    } else if (CheckFlag996(flags)) {
        Encounter *encounter = Encounter_New(setup, effect, bgm, NULL);
        TaskManager_Jump(taskManager, Task_BugContestEncounter, encounter);
    } else {
        WildEncounter *encounter = WildEncounter_New(setup, effect, bgm, NULL);
        TaskManager_Jump(taskManager, Task_WildEncounter, encounter);
    }
}

static BOOL Task_WildEncounter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    WildEncounter *encounter = TaskManager_GetEnvironment(taskManager);

    switch (encounter->state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            encounter->state++;
            break;
        case 1:
            sub_0205525C(taskManager);
            encounter->state++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            encounter->state++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            sub_02093070(fieldSystem);
            sub_020930C4(fieldSystem);

            if (IsBattleResultWin(encounter->setup->winFlag) == FALSE) {
                WildEncounter_Delete(encounter);
                TaskManager_Jump(taskManager, Task_Blackout, NULL);
                return FALSE;
            }

            if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData))) {
                HealParty(SaveArray_Party_Get(fieldSystem->saveData));
            }

            sub_02051660(fieldSystem, encounter->setup);
            CallTask_RestoreOverworld(taskManager);

            encounter->state++;
            break;
        case 4:
            ov02_BattleExit_HandleRoamerAction(fieldSystem, encounter->setup);
            CallTask_FadeFromBlack(taskManager);
            encounter->state++;
            break;
        case 5:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            WildEncounter_Delete(encounter);
            return TRUE;
    }
    return FALSE;
}

static BOOL Task_SafariEncounter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    u16 *safariBalls = LocalFieldData_GetSafariBallsCounter(Save_LocalFieldData_Get(fieldSystem->saveData));

    switch (*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            if (encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
                sub_020270C4(fieldSystem->saveData); //Save_SafariZone_Get?
                Party_GetMonByIndex(encounter->setup->party[BATTLER_ENEMY], 0);
                sub_02093070(fieldSystem);
                sub_020930C4(fieldSystem);
            }

            sub_02051660(fieldSystem, encounter->setup);

            if (*safariBalls == 0 && encounter->setup->winFlag != BATTLE_OUTCOME_MON_CAUGHT) {
                Location *location = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
                sub_020537A8(taskManager, location);
            } else {
                *state = 5;
                return FALSE;
            }

            (*state)++;
            break;
        case 4:
            QueueScript(taskManager, std_safari_enter, NULL, NULL);
            (*state)++;
            break;
        case 5:
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 6:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 7:
            if (*safariBalls == 0) {
                if (encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
                    QueueScript(taskManager, std_safari_balls_out, NULL, NULL);
                }
            } else {
                PCStorage *pc = SaveArray_PCStorage_Get(fieldSystem->saveData);
                Party *party = SaveArray_Party_Get(fieldSystem->saveData);
                if (PCStorage_FindFirstBoxWithEmptySlot(pc) == NUM_BOXES && Party_GetCount(party) == PARTY_SIZE) {
                    QueueScript(taskManager, std_safari_storage_out, NULL, NULL);
                }
            }
            (*state)++;
            break;
        case 8:
            Encounter_Delete(encounter);
            return TRUE;
    }
    return FALSE;
}

static BOOL Task_BugContestEncounter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    BugContest *contest = FieldSystem_BugContest_Get(fieldSystem);
    u32 *state = TaskManager_GetStatePtr(taskManager);
    u16 *sportBall = BugContest_GetSportBallsAddr(contest);

    switch (*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            if (!IsBattleResultWin(encounter->setup->winFlag)) {
                Encounter_Delete(encounter);
                TaskManager_Jump(taskManager, sub_0205298C, NULL);
                return FALSE;
            }

            sub_02051660(fieldSystem, encounter->setup);

            if (encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
                BugContest_PromptSwapPokemon(taskManager, encounter->setup->bugContestMon);
                sub_02093070(fieldSystem);
                sub_020930C4(fieldSystem);
            }
            (*state)++;
            break;
        case 4:
            if (*sportBall == 0 && encounter->setup->winFlag != BATTLE_OUTCOME_MON_CAUGHT) {
                BugContest_WarpToJudging(taskManager, fieldSystem);
            }
            (*state)++;
            break;
        case 5:
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 6:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 7:
            Encounter_Delete(encounter);
            if (*sportBall == 0 && encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
                StartScriptFromMenu(taskManager, std_bug_contest_balls_up, NULL);
                return FALSE;
            }
            return TRUE;
    }
    return FALSE;
}

void SetupAndStartWildBattle(TaskManager *taskManager, u16 species, u8 level, u32 *winFlag, BOOL canFlee, BOOL shiny) {
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    setup = BattleSetup_New(HEAP_ID_FIELD, BATTLE_TYPE_NONE);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);
    ov02_02247F30(fieldSystem, species, level, shiny, setup);

    if (canFlee) {
        setup->battleSpecial |= 8;
    }

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);

    CallTask_StartEncounter(taskManager, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

void SetupAndStartFatefulWildBattle(TaskManager *taskManager, u16 species, u8 level, u32 *winFlag, BOOL canRun) {
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    setup = BattleSetup_New(HEAP_ID_FIELD, 0);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);
    ov02_02247F30(fieldSystem, species, level, FALSE, setup);

    u32 var = 1;

    SetMonData(Party_GetMonByIndex(setup->party[BATTLER_ENEMY], 0), MON_DATA_FATEFUL_ENCOUNTER, &var);

    if (canRun) {
        setup->battleSpecial |= 8;
    }

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);

    CallTask_StartEncounter(taskManager, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

static BOOL Task_PalParkEncounter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch(*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            PalPark_HandleBattleEnd(fieldSystem, encounter->setup);
            sub_02051660(fieldSystem, encounter->setup);
            (*state)++;
            break;
        case 4:
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 5:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 6:
            Encounter_Delete(encounter);
            if (PalPark_CountMonsNotCaught(fieldSystem) == 0) {
                // Ding-dong!
                // Congratulations!
                // $PLAYER has successfully
                // caught the stocked Pokémon!
                StartScriptFromMenu(taskManager, _EV_scr_seq_D10R0101_002 + 1, NULL); //??? - what is script 3?
                return FALSE;
            }
            return TRUE;
    }
    return FALSE;
}

void sub_020511F8(FieldSystem *fieldSystem, BattleSetup *setup) {
    Encounter *encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    FieldSystem_CreateTask(fieldSystem, Task_PalParkEncounter, encounter);
}

void SetupAndStartFirstBattle(TaskManager *taskManager, u16 species, u8 level) { //leftover from DP, still used to setup a battle where items are not usable and the player cannot run
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    BattleSetup *setup = BattleSetup_New(HEAP_ID_FIELD, BATTLE_TYPE_NONE);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);

    ov02_02247F30(fieldSystem, species, level, FALSE, setup);

    setup->battleSpecial = BATTLE_SPECIAL_FIRST_RIVAL;

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK8);

    CallTask_StartEncounter(taskManager, setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
}

static BOOL Task_TutorialBattle(TaskManager *taskManager) {
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch(*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            sub_02055218(taskManager, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(taskManager);
            (*state)++;
            break;
        case 2:
            CallTask_StartBattle(taskManager, encounter->setup);
            (*state)++;
            break;
        case 3:
            (*state)++;
            break;
        case 4:
            CallTask_RestoreOverworld(taskManager);
            (*state)++;
            break;
        case 5:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            CallTask_FadeFromBlack(taskManager);
            (*state)++;
            break;
        case 6:
            Encounter_Delete(encounter);
            return TRUE;
    }
    return FALSE;
}

void SetupAndStartTutorialBattle(TaskManager *taskManager) {
    Encounter *encounter;
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    setup = BattleSetup_New_Tutorial(HEAP_ID_FIELD, fieldSystem);
    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    TaskManager_Call(taskManager, Task_TutorialBattle, encounter);
}

void SetupAndStartTrainerBattle(TaskManager *taskManager, u32 opponentTrainer1, u32 opponentTrainer2, u32 followerTrainerNum, u32 a4, u32 a5, HeapID heapId, u32 *winFlag) {
    u32 battleType;
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

    if (opponentTrainer2 != 0 && opponentTrainer1 != opponentTrainer2) {
        if (followerTrainerNum == 0) {
            battleType = (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_INGAME_PARTNER);
        } else {
            battleType = (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_6);
        }
    } else if (opponentTrainer1 == opponentTrainer2) {
        battleType = (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES);
    } else {
        battleType = BATTLE_TYPE_TRAINER;
        if (a4) {
            battleType |= BATTLE_TYPE_11;
        }
    }

    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);

    setup->trainerId[BATTLER_ENEMY] = opponentTrainer1;
    setup->trainerId[BATTLER_ENEMY2] = opponentTrainer2;
    setup->trainerId[BATTLER_PLAYER2] = followerTrainerNum;

    EnemyTrainerSet_Init(setup, fieldSystem->saveData, heapId);

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK9);

    if (a5) {
        if (battleType & BATTLE_TYPE_MULTI) {
            setup->unk1CC[2] = 0;
        } else if (!(battleType & BATTLE_TYPE_DOUBLES)) {
            setup->unk1CC[1] = 0;
        }
    }

    CallTask_StartEncounter(taskManager, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

void CallTask_020508B8(TaskManager *taskManager, void *param1, u32 battleType) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter;
    BattleSetup *setup;

    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);

    sub_020522F0(setup, fieldSystem, param1);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    TaskManager_Call(taskManager, Task_020508B8, encounter);
}

static u32 sub_02051474(void *param0, u32 battleType) {
    u32 var = sub_02029264(param0);
    u32 mode;

    if (battleType & BATTLE_TYPE_MULTI) {
        mode = 14;
    } else if (battleType & BATTLE_TYPE_DOUBLES) {
        mode = 7;
    } else {
        mode = 0;
    }

    if (var != 255) {
        mode += 1 + ov03_02256B40(var);
    }
    return mode;
}

void CallTask_02050960(TaskManager *taskManager, s32 target, s32 maxLevel, u32 flag) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter;
    BattleSetup *setup;
    u32 result;
    u32 mode;

    if (flag == 0) {
        setup = BattleSetup_New(HEAP_ID_FIELD, (BATTLE_TYPE_LINK | BATTLE_TYPE_TRAINER));
        mode = 0;
    } else if (flag == 1) {
        setup = BattleSetup_New(HEAP_ID_FIELD, (BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER));
        mode = 7;
    } else {
        setup = BattleSetup_New(HEAP_ID_FIELD, (BATTLE_TYPE_TOWER | BATTLE_TYPE_MULTI | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TRAINER));

        //these don't seem right
        setup->trainerId[BATTLER_ENEMY] = TRAINER_RIVAL_SILVER;
        setup->trainerId[BATTLER_ENEMY2] = TRAINER_RIVAL_SILVER_2;

        EnemyTrainerSet_Init(setup, fieldSystem->saveData, HEAP_ID_FIELD);
        mode = 14;
    }

    BattleSetup_InitForFixedLevelFacility(setup, fieldSystem, maxLevel);

    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &result);

    setup->unk1B2 = mode;

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    encounter->unkC = target;

    TaskManager_Call(taskManager, Task_02050960, encounter);
}

static BOOL sub_02051540(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Encounter *encounter = TaskManager_GetEnvironment(taskManager);
    u32 *state = TaskManager_GetStatePtr(taskManager);

    switch (*state) {
        case 0:
            TaskManager_Call(taskManager, Task_020508B8, encounter);
            (*state)++;
            break;
        case 1:
            if (sub_0202FC48() == TRUE) {
                sub_0202FC24();
            }
            sub_02058190(fieldSystem);
            return TRUE;
    }
    return FALSE;
}

void sub_02051598(FieldSystem *fieldSystem, void *param1, s32 battleType) {
    Encounter *encounter;
    BattleSetup *setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    u32 var;

    sub_020522F0(setup, fieldSystem, param1);
    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &var);

    setup->unk1B2 = sub_02051474(fieldSystem->unkA4, battleType);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    FieldSystem_CreateTask(fieldSystem, sub_02051540, encounter);
}

void sub_020515FC(FieldSystem *fieldSystem, Party *party, s32 battleType) {
    Encounter *encounter;
    BattleSetup *setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    u32 var;

    sub_020520B0(setup, fieldSystem, party, NULL);
    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &var);

    setup->unk1B2 = sub_02051474(fieldSystem->unkA4, battleType);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    FieldSystem_CreateTask(fieldSystem, sub_02051540, encounter);
}

static void sub_02051660(FieldSystem *fieldSystem, BattleSetup *setup) {
    Pokemon *mon;
    u32 battleType = setup->battleType;
    u32 winFlag = setup->winFlag;

    if (battleType & BATTLE_TYPE_LINK || battleType & BATTLE_TYPE_TOWER) {
        return;
    }

    if (battleType == BATTLE_TYPE_NONE || battleType == BATTLE_TYPE_8 || battleType == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_6)) {
        if (winFlag == BATTLE_OUTCOME_WIN) {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK9);
        } else if (winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
            mon = Party_GetMonByIndex(setup->party[BATTLER_ENEMY], 0);
            if (Pokedex_ConvertToCurrentDexNo(FALSE, GetMonData(mon, MON_DATA_SPECIES, NULL)) != 0) {
                GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK10);
            } else {
                GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK11);
            }
        }
    } else if ((battleType & BATTLE_TYPE_TRAINER) || (battleType & BATTLE_TYPE_INGAME_PARTNER)) {
        if (winFlag == BATTLE_OUTCOME_WIN) {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK12);
        }
    } else if ((battleType & BATTLE_TYPE_SAFARI || battleType & BATTLE_TYPE_PAL_PARK) && winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
        mon = Party_GetMonByIndex(setup->party[BATTLER_ENEMY], 0);
        if (Pokedex_ConvertToCurrentDexNo(FALSE, GetMonData(mon, MON_DATA_SPECIES, NULL)) != 0) {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK10);
        } else {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK11);
        }
    }
}
