#include "global.h"
#include "battle/battle_setup.h"
#include "encounter.h"
#include "field_black_out.h"
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
#include "constants/std_script.h"
#include "game_stats.h"
#include "unk_020552A4.h"
#include "unk_02034354.h"
#include "unk_02066EDC.h"
#include "field_map_object.h"
#include "field_warp_tasks.h"
#include "unk_02058034.h"
#include "pokedex_util.h"
#include "constants/battle.h"
#include "constants/game_stat.h"
#include "fielddata/script/scr_seq/event_D10R0101.h"

static void sub_02051660(FieldSystem *fieldSystem, BattleSetup *setup);

static BOOL sub_02050660(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    BattleSetup *battleSetup = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

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

static void sub_020506AC(TaskManager *man, BattleSetup *setup) {
    TaskManager_Call(man, sub_02050660, setup);
}

static ENCOUNTER *Encounter_New(BattleSetup *setup, int effect, int bgm, u32 *flag) {
    ENCOUNTER *work;
    work = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(ENCOUNTER));
    work->winFlag = flag;
    if (flag != NULL) {
        *flag = 0;
    }
    work->effect = effect;
    work->bgm = bgm;
    work->setup = setup;
    return work;
}

static void Encounter_Delete(ENCOUNTER *work) {
    BattleSetup_Delete(work->setup);
    FreeToHeap(work);
}

static BOOL sub_020506F4(ENCOUNTER *work, FieldSystem *fieldSystem) {
    if (work->winFlag != NULL) {
        *(work->winFlag) = work->setup->winFlag;
    }
    VarSet(fieldSystem, VAR_BATTLE_RESULT, work->setup->winFlag);
    return IsBattleResultWin(work->setup->winFlag);
}

static void sub_02050724(BattleSetup *setup, FieldSystem *fieldSystem) {
    if (!(setup->flags & BATTLE_TYPE_DEBUG)) {
        sub_0205239C(setup, fieldSystem);
    }
}

static BOOL sub_02050738(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch (*state) {
        case 0:
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
            sub_02055218(man, encounter->effect, encounter->bgm);
            (*state)++;
            break;
        case 1:
            sub_0205525C(man);
            (*state)++;
            break;
        case 2:
            sub_020506AC(man, encounter->setup);
            (*state)++;
            break;
        case 3:
            sub_02050724(encounter->setup, fieldSystem);
            if (encounter->setup->flags == (0) || encounter->setup->flags == (1 << 8) || encounter->setup->flags == 0x4A) {
                sub_02093070(fieldSystem);
                sub_020930C4(fieldSystem);
            }

            fieldSystem->unk7E = 0;
            fieldSystem->unk7C = 0;

            if (sub_020506F4(encounter, fieldSystem) == 0) {
                if (encounter->setup->flags & (1 << 11)) {
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
            sub_020552A4(man);
            (*state)++;
            break;
        case 4:
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
            sub_0205532C(man);
            (*state)++;
            break;
        case 5:
            Encounter_Delete(encounter);
            return TRUE;
    }

    return FALSE;
}

static void sub_0205085C(TaskManager *man, BattleSetup *setup, int effect, int bgm, u32 *winFlag) {
    ENCOUNTER *encounter = Encounter_New(setup, effect, bgm, winFlag);
    TaskManager_Call(man, sub_02050738, encounter);
}

static void sub_0205087C(int a0, FieldSystem *fieldSystem) {
    switch(a0 & 15) {
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

static BOOL sub_020508B8(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch (*state) {
    case 0:
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_0205087C(encounter->setup->winFlag, fieldSystem);
        sub_02052444(encounter->setup, fieldSystem);
        GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK20);
        sub_020506F4(encounter, fieldSystem);
        sub_020552A4(man);
        (*state)++;
        break;
    case 4:
        Encounter_Delete(encounter);
        return TRUE;
        break;
    }
    return FALSE;
}

static BOOL sub_02050960(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch (*state) {
    case 0:
        sub_02004AD8(0);
        sub_02004EC4(5, encounter->bgm, 1);
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 1:
        sub_0205087C(encounter->setup->winFlag, fieldSystem);
        sub_02052444(encounter->setup, fieldSystem);
        GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK20);
        sub_020506F4(encounter, fieldSystem);
        (*state)++;
        break;
    case 2:
        Encounter_Delete(encounter);
        sub_0202FC24();
        return TRUE;
    }
    return FALSE;
}

static BOOL sub_020509F0(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch (*state) {
    case 0:
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_02052444(encounter->setup, fieldSystem);

        if (fieldSystem->unkA0 != NULL) {
            sub_02067484(fieldSystem, &encounter->setup->unk138);
        }

        sub_020506F4(encounter, fieldSystem);
        sub_020552A4(man);

        (*state)++;
        break;
    case 4:
        sub_0205532C(man);
        (*state)++;
        break;
    case 5:
        Encounter_Delete(encounter);
        return TRUE;
    }
    return FALSE;
}

void sub_02050AAC(TaskManager *man, BattleSetup *setup, int effect, int bgm, u32 *winFlag) {
    ENCOUNTER *encounter = Encounter_New(setup, effect, bgm, winFlag);
    TaskManager_Call(man, sub_020509F0, encounter);
}

static WILD_ENCOUNTER *WildEncounter_New(BattleSetup *setup, int effect, int bgm, int *winFlag) {
    WILD_ENCOUNTER *encounter = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(WILD_ENCOUNTER));
    encounter->winFlag = winFlag;
    if (winFlag != NULL) {
        *winFlag = 0;
    }
    encounter->effect = effect;
    encounter->bgm = bgm;
    encounter->setup = setup;
    encounter->state = 0;
    return encounter;
}

static void WildEncounter_Delete(WILD_ENCOUNTER *encounter) {
    BattleSetup_Delete(encounter->setup);
    FreeToHeap(encounter);
}

static BOOL Task_SafariEncounter(TaskManager *man);
static BOOL Task_BugContestEncounter(TaskManager *man);
static BOOL Task_WildEncounter(TaskManager *man);

void sub_02050B08(FieldSystem *fieldSystem, BattleSetup *setup) {
    SaveVarsFlags *flags = Save_VarsFlags_Get(fieldSystem->saveData);
    int a0 = sub_020517E8(setup);
    int a1 = sub_020517FC(setup);

    if (Save_VarsFlags_CheckSafariSysFlag(flags)) {
        ENCOUNTER *encounter = Encounter_New(setup, a0, a1, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_SafariEncounter, encounter);
    } else if (CheckFlag996(flags)) {
        ENCOUNTER *encounter = Encounter_New(setup, a0, a1, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_BugContestEncounter, encounter);
    } else {
        WILD_ENCOUNTER *encounter = WildEncounter_New(setup, a0, a1, NULL);
        FieldSystem_CreateTask(fieldSystem, Task_WildEncounter, encounter);
    }
}

void sub_02050B90(FieldSystem *fieldSystem, TaskManager *man, BattleSetup *setup) {
    SaveVarsFlags *flags = Save_VarsFlags_Get(fieldSystem->saveData);
    int a0 = sub_020517E8(setup);
    int a1 = sub_020517FC(setup);

    if (Save_VarsFlags_CheckSafariSysFlag(flags)) {
        ENCOUNTER *encounter = Encounter_New(setup, a0, a1, NULL);
        TaskManager_Jump(man, Task_SafariEncounter, encounter);
    } else if (CheckFlag996(flags)) {
        ENCOUNTER *encounter = Encounter_New(setup, a0, a1, NULL);
        TaskManager_Jump(man, Task_BugContestEncounter, encounter);
    } else {
        WILD_ENCOUNTER *encounter = WildEncounter_New(setup, a0, a1, NULL);
        TaskManager_Jump(man, Task_WildEncounter, encounter);
    }
}

static BOOL Task_WildEncounter(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    WILD_ENCOUNTER *encounter = TaskManager_GetEnv(man);

    switch (encounter->state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);
        sub_02055218(man, encounter->effect, encounter->bgm);
        encounter->state++;
        break;
    case 1:
        sub_0205525C(man);
        encounter->state++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        encounter->state++;
        break;
    case 3:
        sub_02050724(encounter->setup, fieldSystem);
        sub_02093070(fieldSystem);
        sub_020930C4(fieldSystem);

        if (IsBattleResultWin(encounter->setup->winFlag) == FALSE) {
            WildEncounter_Delete(encounter);
            TaskManager_Jump(man, FieldTask_BlackOut, NULL);
            return FALSE;
        }

        if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData))) {
            HealParty(SaveArray_Party_Get(fieldSystem->saveData));
        }

        sub_02051660(fieldSystem, encounter->setup);
        sub_020552A4(man);

        encounter->state++;
        break;
    case 4:
        ov02_BattleExit_HandleRoamerAction(fieldSystem, encounter->setup);
        sub_0205532C(man);
        encounter->state++;
        break;
    case 5:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
        WildEncounter_Delete(encounter);
        return TRUE;
        break;
    }
    return FALSE;
}

static BOOL Task_SafariEncounter(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);
    u16 *safariBall = LocalFieldData_GetSafariBallsCounter(Save_LocalFieldData_Get(fieldSystem->saveData));

    switch (*state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_02050724(encounter->setup, fieldSystem);
        if (encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
            sub_020270C4(fieldSystem->saveData);
            Party_GetMonByIndex(encounter->setup->party[1], 0);
            sub_02093070(fieldSystem);
            sub_020930C4(fieldSystem);
        }

        sub_02051660(fieldSystem, encounter->setup);

        if (*safariBall == 0 && encounter->setup->winFlag != BATTLE_OUTCOME_MON_CAUGHT) {
            Location *loc = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
            sub_020537A8(man, loc);
        } else {
            *state = 5;
            return FALSE;
        }

        (*state)++;
        break;
    case 4:
        QueueScript(man, std_safari_enter, NULL, NULL);
        (*state)++;
        break;
    case 5:
        sub_020552A4(man);
        (*state)++;
        break;
    case 6:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 7:
        if (*safariBall == 0) {
            if(encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
                QueueScript(man, std_safari_balls_out, NULL, NULL);
            }
        } else {
            PC_STORAGE *pc = SaveArray_PCStorage_Get(fieldSystem->saveData);
            Party *party = SaveArray_Party_Get(fieldSystem->saveData);
            if (PCStorage_FindFirstBoxWithEmptySlot(pc) == 18 && Party_GetCount(party) == 6) {
                QueueScript(man, std_safari_storage_out, NULL, NULL);
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

static BOOL Task_BugContestEncounter(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    BUGCONTEST *contest = FieldSystem_BugContest_Get(fieldSystem);
    int *state = TaskManager_GetStatePtr(man);
    u16 *sportBall = BugContest_GetSportBallsAddr(contest);

    switch (*state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_02050724(encounter->setup, fieldSystem);
        if (!IsBattleResultWin(encounter->setup->winFlag)) {
            Encounter_Delete(encounter);
            TaskManager_Jump(man, sub_0205298C, NULL);
            return FALSE;
        }

        sub_02051660(fieldSystem, encounter->setup);

        if (encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
            sub_0206DB94(man, encounter->setup->bugContestMon);
            sub_02093070(fieldSystem);
            sub_020930C4(fieldSystem);
        }
        (*state)++;
        break;
    case 4:
        if (*sportBall == 0 && encounter->setup->winFlag != BATTLE_OUTCOME_MON_CAUGHT) {
            sub_0206DB58(man, fieldSystem);
        }
        (*state)++;
        break;
    case 5:
        sub_020552A4(man);
        (*state)++;
        break;
    case 6:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 7:
        Encounter_Delete(encounter);
        if (*sportBall == 0 && encounter->setup->winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
            StartScriptFromMenu(man, std_bug_contest_balls_up, NULL);
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

void SetupAndStartWildBattle(TaskManager *man, u16 mon, u8 level, u32 *winFlag, BOOL canFlee, BOOL shiny) {
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    setup = BattleSetup_New(HEAP_ID_FIELD, 0);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);
    ov02_02247F30(fieldSystem, mon, level, shiny, setup);

    if (canFlee) {
        setup->unk_18C |= 8;
    }

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);

    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

void sub_02051090(TaskManager *man, u16 species, u8 level, u32 *winFlag, BOOL canRun) {
    BattleSetup *setup;
    FieldSystem *fieldSystem;
    int var;

    fieldSystem = TaskManager_GetFieldSystem(man);
    setup = BattleSetup_New(HEAP_ID_FIELD, 0);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);

    ov02_02247F30(fieldSystem, species, level, 0, setup);

    var = 1;

    SetMonData(Party_GetMonByIndex(setup->party[1], 0), 110, &var);

    if (canRun) {
        setup->unk_18C |= 8;
    }

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);

    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

static BOOL Task_PalParkEncounter(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch(*state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        sub_02050724(encounter->setup, fieldSystem);
        PalPark_HandleBattleEnd(fieldSystem, encounter->setup);
        sub_02051660(fieldSystem, encounter->setup);
        (*state)++;
        break;
    case 4:
        sub_020552A4(man);
        (*state)++;
        break;
    case 5:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 6:
        Encounter_Delete(encounter);
        if (PalPark_CountMonsNotCaught(fieldSystem) == 0) {
            // Ding-dong!
            // Congratulations!
            // $PLAYER has successfully
            // caught the stocked Pokémon!
            StartScriptFromMenu(man, _EV_scr_seq_D10R0101_002 + 1, NULL);
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_020511F8(FieldSystem *fieldSystem, BattleSetup *setup) {
    ENCOUNTER *encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    FieldSystem_CreateTask(fieldSystem, Task_PalParkEncounter, encounter);
}

void sub_02051228(TaskManager *man, u16 species, u8 level) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    BattleSetup *setup = BattleSetup_New(HEAP_ID_FIELD, 0);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);

    ov02_02247F30(fieldSystem, species, level, 0, setup);

    setup->unk_18C = 1;

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), 8);

    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
}

static BOOL Task_TutorialBattle(TaskManager *man) {
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    int *state = TaskManager_GetStatePtr(man);

    switch(*state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        sub_02055218(man, encounter->effect, encounter->bgm);
        (*state)++;
        break;
    case 1:
        sub_0205525C(man);
        (*state)++;
        break;
    case 2:
        sub_020506AC(man, encounter->setup);
        (*state)++;
        break;
    case 3:
        (*state)++;
        break;
    case 4:
        sub_020552A4(man);
        (*state)++;
        break;
    case 5:
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 6:
        Encounter_Delete(encounter);
        return TRUE;
    }
    return FALSE;
}

void SetupAndStartTutorialBattle(TaskManager *man) {
    ENCOUNTER *encounter;
    BattleSetup *setup;
    FieldSystem *fieldSystem;

    fieldSystem = TaskManager_GetFieldSystem(man);
    setup = BattleSetup_New_Tutorial(HEAP_ID_FIELD, fieldSystem);
    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    TaskManager_Call(man, Task_TutorialBattle, encounter);
}

void SetupAndStartTrainerBattle(TaskManager *man, u32 opponentTrainer1, u32 opponentTrainer2, u32 followerTrainerNum, u32 a4, u32 a5, HeapID heapId, u32 *winFlag) {
    u32 battleType;
    BattleSetup *setup;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);

    if (opponentTrainer2 != 0 && opponentTrainer1 != opponentTrainer2) {
        if (followerTrainerNum == 0) {
            battleType = (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_INGAME_PARTNER);
        } else {
            battleType = 0x4b;
        }
    } else if (opponentTrainer1 == opponentTrainer2) {
        battleType = 3;
    } else {
        battleType = 1;
        if (a4) {
            battleType |= BATTLE_TYPE_11;
        }
    }

    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    BattleSetup_InitFromFieldSystem(setup, fieldSystem);

    setup->trainerId[1] = opponentTrainer1;
    setup->trainerId[3] = opponentTrainer2;
    setup->trainerId[2] = followerTrainerNum;

    EnemyTrainerSet_Init(setup, fieldSystem->saveData, heapId);

    GameStats_Inc(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK9);

    if (a5) {
        if (battleType & BATTLE_TYPE_MULTI) {
            setup->unk1CC[2] = 0;
        } else if (!(battleType & BATTLE_TYPE_DOUBLES)) {
            setup->unk1CC[1] = 0;
        }
    }

    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

static BOOL sub_020508B8(TaskManager *man);

void sub_02051428(TaskManager *man, void *a1, int battleType) {
    FieldSystem *fieldSystem;
    ENCOUNTER *encounter;
    BattleSetup *setup;

    fieldSystem = TaskManager_GetFieldSystem(man);
    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);

    sub_020522F0(setup, fieldSystem, a1);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    TaskManager_Call(man, sub_020508B8, encounter);
}

static int sub_02051474(void *a0, int battleType) {
    int var = sub_02029264(a0);
    int mode;

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

void sub_020514A4(TaskManager *man, int target, int maxLevel, int flag) {
    FieldSystem *fieldSystem;
    ENCOUNTER *encounter;
    BattleSetup *setup;
    int result, mode;

    fieldSystem = TaskManager_GetFieldSystem(man);

    if (flag == 0) {
        setup = BattleSetup_New(HEAP_ID_FIELD, 5);
        mode = 0;
    } else if (flag == 1) {
        setup = BattleSetup_New(HEAP_ID_FIELD, 7);
        mode = 7;
    } else {
        setup = BattleSetup_New(HEAP_ID_FIELD, 143);

        setup->trainerId[1] = 1;
        setup->trainerId[3] = 2;

        EnemyTrainerSet_Init(setup, fieldSystem->saveData, HEAP_ID_FIELD);
        mode = 14;
    }

    BattleSetup_InitForFixedLevelFacility(setup, fieldSystem, maxLevel);

    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &result);

    setup->unk1B2 = mode;

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    encounter->unkC = target;

    TaskManager_Call(man, sub_02050960, encounter);
}

static BOOL sub_02051540(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);

    switch (*state) {
    case 0:
        TaskManager_Call(man, sub_020508B8, encounter);
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

void sub_02051598(FieldSystem *fieldSystem, void *a1, int battleType) {
    ENCOUNTER *encounter;
    BattleSetup *setup;
    int var;

    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    sub_020522F0(setup, fieldSystem, a1);
    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &var);

    setup->unk1B2 = sub_02051474(fieldSystem->unkA4, battleType);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    FieldSystem_CreateTask(fieldSystem, sub_02051540, encounter);
}

void sub_020515FC(FieldSystem *fieldSystem, Party *party, int battleType) {
    ENCOUNTER *encounter;
    BattleSetup *setup;
    int var;

    setup = BattleSetup_New(HEAP_ID_FIELD, battleType);
    sub_020520B0(setup, fieldSystem, party, NULL);
    sub_0202FBF0(fieldSystem->saveData, HEAP_ID_FIELD, &var);

    setup->unk1B2 = sub_02051474(fieldSystem->unkA4, battleType);

    encounter = Encounter_New(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);

    FieldSystem_CreateTask(fieldSystem, sub_02051540, encounter);
}

static void sub_02051660(FieldSystem *fieldSystem, BattleSetup *setup) {
    Pokemon *mon;
    u32 battleType = setup->flags;
    int winFlag = setup->winFlag;

    if (battleType & BATTLE_TYPE_LINK || battleType & BATTLE_TYPE_TOWER) {
        return;
    }

    if (battleType == 0 || battleType == BATTLE_TYPE_8 || battleType == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_6)) {
        if (winFlag == BATTLE_OUTCOME_WIN) {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK9);
        } else if (winFlag == BATTLE_OUTCOME_MON_CAUGHT) {
            mon = Party_GetMonByIndex(setup->party[1], 0);
            if (Pokedex_ConvertToCurrentDexNo(0, GetMonData(mon, MON_DATA_SPECIES, NULL)) != 0) {
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
        mon = Party_GetMonByIndex(setup->party[1], 0);
        if (Pokedex_ConvertToCurrentDexNo(0, GetMonData(mon, MON_DATA_SPECIES, NULL)) != 0) {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK10);
        } else {
            GameStats_AddSpecial(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK11);
        }
    }
}
