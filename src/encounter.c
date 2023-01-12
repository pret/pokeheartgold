#include "battle_setup.h"
#include "encounter.h"
#include "field_black_out.h"
#include "field_system.h"
#include "game_clear.h"
#include "overlay_02.h"
#include "use_item_on_mon.h"
#include "save_arrays.h"
#include "save_flypoints.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "unk_020517A4.h"
#include "unk_0203E348.h"
#include "unk_02087E70.h"
#include "unk_020551B8.h"
#include "unk_02055244.h"
#include "unk_02092BE8.h"
#include "unk_0206D494.h"
#include "constants/std_script.h"

static void sub_02051660(FieldSystem *fsys, BATTLE_SETUP *setup);

/*static*/ BOOL sub_02050660(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    BATTLE_SETUP *battleSetup = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);
    
    switch (*state) {
    case 0:
        sub_0203E3C4(fsys, battleSetup);
        sub_0203E354();
        (*state)++;
        break;
    case 1:
        if (!FieldSys_ApplicationIsRunning(fsys)) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

/*static*/ void sub_020506AC(TaskManager *man, BATTLE_SETUP *setup) {
    TaskManager_Call(man, sub_02050660, setup);
}

/*static*/ ENCOUNTER *sub_020506BC(BATTLE_SETUP *setup, int effect, int bgm, int *flag) {
    ENCOUNTER *work;
    work = AllocFromHeapAtEnd(HEAP_ID_FIELDMAP, sizeof(ENCOUNTER));
    work->winFlag = flag;
    if (flag != NULL) {
        *flag = 0;
    }
    work->effect = effect;
    work->bgm = bgm;
    work->setup = setup;
    return work;
}

/*static*/ void sub_020506E0(ENCOUNTER *work) {
    sub_02051BF8(work->setup);
    FreeToHeap(work);
}

/*static*/ BOOL sub_020506F4(ENCOUNTER *work, FieldSystem *fsys) {
    if (work->winFlag != NULL) {
        *(work->winFlag) = work->setup->winFlag;
    }
    VarSet(fsys, VAR_BATTLE_RESULT, work->setup->winFlag);
    return IsBattleResultWin(work->setup->winFlag);
}

/*static*/ void sub_02050724(BATTLE_SETUP *setup, FieldSystem *fsys) {
    if (!(setup->flags & (1 << 31))) {
        sub_0205239C(setup, fsys);
    }
}

/*static*/ BOOL sub_02050738(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);
    
    switch (*state) {
        case 0:
            MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
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
            sub_02050724(encounter->setup, fsys);
            if (encounter->setup->flags == (0) || encounter->setup->flags == (1 << 8) || encounter->setup->flags == 0x4A) {
                sub_02093070(fsys);
                sub_020930C4(fsys);
            }
            
            fsys->unk7E = 0;
            fsys->unk7C = 0;
            
            if (sub_020506F4(encounter, fsys) == 0) {
                if (encounter->setup->flags & (1 << 11)) {
                    HealParty(SavArray_PlayerParty_get(fsys->savedata));
                } else {
                    sub_020506E0(encounter);
                    return TRUE;
                }
            }
            
            if (ScriptState_CheckHaveFollower(SavArray_Flags_get(fsys->savedata))) {
                HealParty(SavArray_PlayerParty_get(fsys->savedata));
            }
            
            sub_02051660(fsys, encounter->setup);
            sub_020552A4(man);
            (*state)++;
            break;
        case 4:
            MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
            sub_0205532C(man);
            (*state)++;
            break;
        case 5:
            sub_020506E0(encounter);
            return TRUE;
    }
    
    return FALSE;
}

/*static*/ void sub_0205085C(TaskManager *man, BATTLE_SETUP *setup, int effect, int bgm, int *winFlag) {
    ENCOUNTER *encounter = sub_020506BC(setup, effect, bgm, winFlag);
    TaskManager_Call(man, sub_02050738, encounter);
}

/*static*/ void sub_0205087C(int a0, FieldSystem *fsys) {
    switch(a0 & 15) {
    case 1:
    case 6:
        sub_02034AC0(fsys->savedata, 1);
        break;
    case 2:
    case 5:
        sub_02034AC0(fsys->savedata, -1);
        break;
    
    }
}

/*static*/ BOOL sub_020508B8(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
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
        sub_0205087C(encounter->setup->winFlag, fsys);
        sub_02052444(encounter->setup, fsys);
        GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 20);
        sub_020506F4(encounter, fsys);
        sub_020552A4(man);
        (*state)++;
        break;
    case 4:
        sub_020506E0(encounter);
        return TRUE;
        break;
    }
    return FALSE;
}

/*static*/ BOOL sub_02050960(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
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
        sub_0205087C(encounter->setup->winFlag, fsys);
        sub_02052444(encounter->setup, fsys);
        GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 20);
        sub_020506F4(encounter, fsys);
        (*state)++;
        break;
    case 2:
        sub_020506E0(encounter);
        sub_0202FC24();
        return TRUE;
    }
    return FALSE;
}

/*static*/ BOOL sub_020509F0(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
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
        sub_02052444(encounter->setup, fsys);
        
        if (fsys->unkA0 != NULL) {
            sub_02067484(fsys, &encounter->setup->unk78);
        }
        
        sub_020506F4(encounter, fsys);
        sub_020552A4(man);
        
        (*state)++;
        break;
    case 4:
        sub_0205532C(man);
        (*state)++;
        break;
    case 5:
        sub_020506E0(encounter);
        return TRUE;
    }
    return FALSE;
}

/*static*/ void sub_02050AAC(TaskManager *man, BATTLE_SETUP *setup, int effect, int bgm, int *winFlag) {
    ENCOUNTER *encounter = sub_020506BC(setup, effect, bgm, winFlag);
    TaskManager_Call(man, sub_020509F0, encounter);
}

/*static*/ WILD_ENCOUNTER *sub_02050ACC(BATTLE_SETUP *setup, int effect, int bgm, int *winFlag) {
    WILD_ENCOUNTER *encounter = AllocFromHeapAtEnd(HEAP_ID_FIELDMAP, sizeof(WILD_ENCOUNTER));
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

/*static*/ void sub_02050AF4(WILD_ENCOUNTER *encounter) {
    sub_02051BF8(encounter->setup);
    FreeToHeap(encounter);
}

/*static*/ BOOL sub_02050D1C(TaskManager *man);
/*static*/ BOOL sub_02050EB8(TaskManager *man);
/*static*/ BOOL sub_02050C18(TaskManager *man);

void sub_02050B08(FieldSystem *fsys, BATTLE_SETUP *setup) {   
    SCRIPT_STATE *flags = SavArray_Flags_get(fsys->savedata);
    int a0 = sub_020517E8(setup);
    int a1 = sub_020517FC(setup);
    
    if (ScriptState_CheckSafariSysFlag(flags)) {
        ENCOUNTER *encounter = sub_020506BC(setup, a0, a1, NULL);
        FieldSys_CreateTask(fsys, sub_02050D1C, encounter);
    } else if (CheckFlag996(flags)) {
        ENCOUNTER *encounter = sub_020506BC(setup, a0, a1, NULL);
        FieldSys_CreateTask(fsys, sub_02050EB8, encounter);
    } else {
        WILD_ENCOUNTER *encounter = sub_02050ACC(setup, a0, a1, NULL);
        FieldSys_CreateTask(fsys, sub_02050C18, encounter);
    }
}

void sub_02050B90(FieldSystem *fsys, TaskManager *man, BATTLE_SETUP *setup) {
    SCRIPT_STATE *flags = SavArray_Flags_get(fsys->savedata);
    int a0 = sub_020517E8(setup);
    int a1 = sub_020517FC(setup);
    
    if (ScriptState_CheckSafariSysFlag(flags)) {
        ENCOUNTER *encounter = sub_020506BC(setup, a0, a1, NULL);
        TaskManager_Jump(man, sub_02050D1C, encounter);
    } else if (CheckFlag996(flags)) {
        ENCOUNTER *encounter = sub_020506BC(setup, a0, a1, NULL);
        TaskManager_Jump(man, sub_02050EB8, encounter);
    } else {
        WILD_ENCOUNTER *encounter = sub_02050ACC(setup, a0, a1, NULL);
        TaskManager_Jump(man, sub_02050C18, encounter);
    }
}

/*static*/ BOOL sub_02050C18(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    WILD_ENCOUNTER *encounter = TaskManager_GetEnv(man);
    
    switch (encounter->state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
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
        sub_02050724(encounter->setup, fsys);
        sub_02093070(fsys);
        sub_020930C4(fsys);
        
        if (IsBattleResultWin(encounter->setup->winFlag) == FALSE) {
            sub_02050AF4(encounter);
            TaskManager_Jump(man, Task_BlackOut, NULL);
            return FALSE;
        }
        
        if (ScriptState_CheckHaveFollower(SavArray_Flags_get(fsys->savedata))) {
            HealParty(SavArray_PlayerParty_get(fsys->savedata));
        }
        
        sub_02051660(fsys, encounter->setup);
        sub_020552A4(man);
        
        encounter->state++;
        break;
    case 4:
        ov02_BattleExit_HandleRoamerAction(fsys, encounter->setup);
        sub_0205532C(man);
        encounter->state++;
        break;
    case 5:
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        sub_02050AF4(encounter);
        return TRUE;
        break;
    }
    return FALSE;
}

/*static*/ BOOL  sub_02050D1C(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);
    u16 *safariBall = FlyPoints_GetSafariBallsCounter(Save_FlyPoints_get(fsys->savedata));
    
    switch (*state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
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
        sub_02050724(encounter->setup, fsys);
        if (encounter->setup->winFlag == 4) {
            sub_020270C4(fsys->savedata);
            GetPartyMonByIndex(encounter->setup->party[1], 0);
            sub_02093070(fsys);
            sub_020930C4(fsys);
        }
        
        sub_02051660(fsys, encounter->setup);
        
        if (*safariBall == 0 && encounter->setup->winFlag != 4) {
            Location *loc = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
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
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 7:
        if (*safariBall == 0) { 
            if(encounter->setup->winFlag == 4) {
                QueueScript(man, std_safari_balls_out, NULL, NULL);
            }
        } else {
            PC_STORAGE *pc = GetStoragePCPointer(fsys->savedata);
            PARTY *party = SavArray_PlayerParty_get(fsys->savedata);
            if (PCStorage_FindFirstBoxWithEmptySlot(pc) == 18 && GetPartyCount(party) == 6) {
                QueueScript(man, std_safari_storage_out, NULL, NULL);
            }
        }
        (*state)++;
        break;
    case 8:
        sub_020506E0(encounter);
        return TRUE;
    }
    return FALSE;
}

/*static*/ BOOL sub_02050EB8(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    BUGCONTEST *contest = FieldSys_BugContest_get(fsys);
    int *state = TaskManager_GetStatePtr(man);
    u16 *sportBall = BugContest_GetSportBallsAddr(contest);
    
    switch (*state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
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
        sub_02050724(encounter->setup, fsys);
        if (!IsBattleResultWin(encounter->setup->winFlag)) {
            sub_020506E0(encounter);
            TaskManager_Jump(man, sub_0205298C, NULL);
            return FALSE;
        }
        
        sub_02051660(fsys, encounter->setup);
        
        if (encounter->setup->winFlag == 4) {
            sub_0206DB94(man, encounter->setup->unk1C8);
            sub_02093070(fsys);
            sub_020930C4(fsys);
        }
        (*state)++;
        break;
    case 4:
        if (*sportBall == 0 && encounter->setup->winFlag != 4) {
            sub_0206DB58(man, fsys);
        }
        (*state)++;
        break;
    case 5:
        sub_020552A4(man);
        (*state)++;
        break;
    case 6:
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 7:
        sub_020506E0(encounter);
        if (*sportBall == 0 && encounter->setup->winFlag == 4) {
            StartScriptFromMenu(man, std_bug_contest_balls_up, NULL);
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

void SetupAndStartWildBattle(TaskManager *man, u16 mon, u8 level, int *winFlag, BOOL canFlee, BOOL shiny) {
    BATTLE_SETUP *setup;
    FieldSystem *fsys = TaskManager_GetSys(man);
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, 0);
    BattleStruct_InitFromFsys(setup, fsys);
    ov02_02247F30(fsys, mon, level, shiny, setup);
    
    if (canFlee) {
        setup->unkCC |= 8;
    }
    
    GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
    
    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

void sub_02051090(TaskManager *man, u16 species, u8 level, int *winFlag, BOOL canRun) {
    BATTLE_SETUP *setup;
    FieldSystem *fsys;
    int var;
    
    fsys = TaskManager_GetSys(man);
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, 0);
    BattleStruct_InitFromFsys(setup, fsys);
    
    ov02_02247F30(fsys, species, level, 0, setup);

    var = 1;
    
    SetMonData(GetPartyMonByIndex(setup->party[1], 0), 110, &var);
    
    if (canRun) {
        setup->unkCC |= 8;
    }
   
   GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
    
   sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

/*static*/ BOOL sub_02051114(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    int *state = TaskManager_GetStatePtr(man);
    
    switch(*state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
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
        sub_02050724(encounter->setup, fsys);
        sub_020558AC(fsys, encounter->setup);
        sub_02051660(fsys, encounter->setup);
        (*state)++;
        break;
    case 4:
        sub_020552A4(man);
        (*state)++;
        break;
    case 5:
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 6:
        sub_020506E0(encounter);
        if (sub_020558BC(fsys) == 0) {
            StartScriptFromMenu(man, 3, NULL);
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_020511F8(FieldSystem *fsys, BATTLE_SETUP *setup) {
    ENCOUNTER *encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    FieldSys_CreateTask(fsys, sub_02051114, encounter);
}

void sub_02051228(TaskManager *man, u16 species, u8 level) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    BATTLE_SETUP *setup = BattleStruct_new(HEAP_ID_FIELDMAP, 0);
    BattleStruct_InitFromFsys(setup, fsys);
    
    ov02_02247F30(fsys, species, level, 0, setup);
    
    setup->unkCC = 1;
    
    GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 8);
    
    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
}

/*static*/ BOOL sub_0205128C(TaskManager *man) {
    ENCOUNTER *encounter = TaskManager_GetEnv(man);
    FieldSystem *fsys = TaskManager_GetSys(man);
    int *state = TaskManager_GetStatePtr(man);
    
    switch(*state) {
    case 0:
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
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
        MapObjectMan_UnpauseAllMovement(fsys->mapObjectMan);
        sub_0205532C(man);
        (*state)++;
        break;
    case 6:
        sub_020506E0(encounter);
        return TRUE;
    }
    return FALSE;
}

void SetupAndStartTutorialBattle(TaskManager *man) {
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    FieldSystem *fsys;
    
    fsys = TaskManager_GetSys(man);
    setup = sub_02051AAC(HEAP_ID_FIELDMAP, fsys);
    encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    
    TaskManager_Call(man, sub_0205128C, encounter);
}

void SetupAndStartTrainerBattle(TaskManager *man, u32 opponentTrainer1, u32 opponentTrainer2, u32 followerTrainerNum, u32 a4, u32 a5, HeapID heapId, int *winFlag) {
    u32 battleFlags;
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    FieldSystem *fsys = TaskManager_GetSys(man);
    
    if (opponentTrainer2 != 0 && opponentTrainer1 != opponentTrainer2) {
        if (followerTrainerNum == 0) {
            battleFlags = 0x13;
        } else {
            battleFlags = 0x4b;
        }
    } else if (opponentTrainer1 == opponentTrainer2) {
        battleFlags = 3;
    } else {
        battleFlags = 1;
        if (a4) {
            battleFlags |= (1 << 11);
        }
    }
    
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, battleFlags);
    BattleStruct_InitFromFsys(setup, fsys);

    setup->trainerId[1] = opponentTrainer1;
    setup->trainerId[3] = opponentTrainer2;
    setup->trainerId[2] = followerTrainerNum;

    EnemyTrainerSet_Init(setup, fsys->savedata, heapId);
    
    GameStats_Inc(Sav2_GameStats_get(fsys->savedata), 9);
    
    if (a5) {
        if (battleFlags & 8) {
            setup->unk1CE = 0;
        } else if (!(battleFlags & 2)) {
            setup->unk1CD = 0;
        }
    }
    
    sub_0205085C(man, setup, sub_020517E8(setup), sub_020517FC(setup), winFlag);
}

/*static*/ BOOL sub_020508B8(TaskManager *man);

void sub_02051428(TaskManager *man, void *a1, int battleFlags) {
    FieldSystem *fsys;
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    
    fsys = TaskManager_GetSys(man);
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, battleFlags);
    
    sub_020522F0(setup, fsys, a1);
    
    encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    TaskManager_Call(man, sub_020508B8, encounter);
}

/*static*/ int sub_02051474(void *a0, int battleFlags) {
    int var = sub_02029264(a0);
    int mode;
    
    if (battleFlags & 8) {
        mode = 14;
    } else if (battleFlags & 2) {
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
    FieldSystem *fsys;
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    int result, mode;
    
    fsys = TaskManager_GetSys(man);
    
    if (flag == 0) {
        setup = BattleStruct_new(HEAP_ID_FIELDMAP, 5);
        mode = 0;
    } else if (flag == 1) {
        setup = BattleStruct_new(HEAP_ID_FIELDMAP, 7);
        mode = 7;
    } else {
        setup = BattleStruct_new(HEAP_ID_FIELDMAP, 143);
        
        setup->trainerId[1] = 1;
        setup->trainerId[3] = 2;
        
        EnemyTrainerSet_Init(setup, fsys->savedata, HEAP_ID_FIELDMAP);
        mode = 14;
    }
    
    sub_02051F2C(setup, fsys, maxLevel);
    
    sub_0202FBF0(fsys->savedata, HEAP_ID_FIELDMAP, &result);
    
    setup->unk1B2 = mode;
    
    encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);    
    encounter->unkC = target;
    
    TaskManager_Call(man, sub_02050960, encounter);
}

/*static*/ BOOL sub_02051540(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
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
        sub_02058190(fsys);
        return TRUE;
    }
    return FALSE;
}

void sub_02051598(FieldSystem *fsys, void *a1, int battleFlags) {
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    int var;
    
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, battleFlags);
    sub_020522F0(setup, fsys, a1);
    sub_0202FBF0(fsys->savedata, HEAP_ID_FIELDMAP, &var);
    
    setup->unk1B2 = sub_02051474(fsys->unkA4, battleFlags);
    
    encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    
    FieldSys_CreateTask(fsys, sub_02051540, encounter);
}

void sub_020515FC(FieldSystem *fsys, PARTY *party, int battleFlags) {
    ENCOUNTER *encounter;
    BATTLE_SETUP *setup;
    int var;
    
    setup = BattleStruct_new(HEAP_ID_FIELDMAP, battleFlags);
    sub_020520B0(setup, fsys, party, NULL);
    sub_0202FBF0(fsys->savedata, HEAP_ID_FIELDMAP, &var);
    
    setup->unk1B2 = sub_02051474(fsys->unkA4, battleFlags);
    
    encounter = sub_020506BC(setup, sub_020517E8(setup), sub_020517FC(setup), NULL);
    
    FieldSys_CreateTask(fsys, sub_02051540, encounter);
}

static void sub_02051660(FieldSystem *fsys, BATTLE_SETUP *setup) {
    POKEMON *mon;
    u32 battleFlags = setup->flags;
    int winFlag = setup->winFlag;
    
    if (battleFlags & 4 || battleFlags & 0x80) {
        return;
    }
    
    if (battleFlags == 0 || battleFlags == 0x100 || battleFlags == 0x4A) {
        if (winFlag == 1) {
            GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 9);
        } else if (winFlag == 4) {
            mon = GetPartyMonByIndex(setup->party[1], 0);
            if (Pokedex_ConvertToCurrentDexNo(0, GetMonData(mon, 5, NULL)) != 0) {
                GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 10);
            } else {
                GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 11);
            }
        }
    } else if ((battleFlags & 1) || (battleFlags & 0x10)) {
        if (winFlag == 1) {
            GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 12);   
        }
    } else if ((battleFlags & 0x20 || battleFlags & 0x200) && winFlag == 4) {
        mon = GetPartyMonByIndex(setup->party[1], 0);
        if (Pokedex_ConvertToCurrentDexNo(0, GetMonData(mon, 5, NULL)) != 0) {
            GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 10);
        } else {
            GameStats_AddSpecial(Sav2_GameStats_get(fsys->savedata), 11);
        }
    }
}
