#include "constants/sndseq.h"
#include "field_map_object.h"
#include "field_move.h"
#include "field_use_item.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "unk_0203BC10.h"
#include "map_header.h"
#include "constants/map_sections.h"
#include "overlay_01.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sys_flags.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200FA24.h"
#include "unk_020183F0.h"
#include "unk_02034B0C.h"
#include "unk_02037C94.h"
#include "unk_0205A44C.h"
#include "unk_0205AC88.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "constants/start_menu_icons.h"
#include "unk_02092BE8.h"
#include "overlay_01_021F6830.h"

typedef enum StartMenuIconInternal {
    START_MENU_ICON_INTERNAL_POKEDEX,
    START_MENU_ICOM_INTERNAL_POKEMON,
    START_MENU_ICON_INTERNAL_BAG,
    START_MENU_ICON_INTERNAL_TRAINER_CARD,
    START_MENU_ICON_INTERNAL_SAVE,
    START_MENU_ICON_INTERNAL_OPTIONS,
    START_MENU_ICON_INTERNAL_RUNNING_SHOES,
    START_MENU_ICON_INTERNAL_7,
    START_MENU_ICON_INTERNAL_8,
    START_MENU_ICON_INTERNAL_9,
    START_MENU_ICON_INTERNAL_10,
    START_MENU_ICON_INTERNAL_11,
    START_MENU_ICON_INTERNAL_POKEGEAR,
} StartMenuIconInternal;

typedef enum StartMenuIconInhibit {
    START_MENU_ICON_INHIBIT_POKEDEX,
    START_MENU_ICOM_INHIBIT_POKEMON,
    START_MENU_ICON_INHIBIT_BAG,
    START_MENU_ICON_INHIBIT_TRAINER_CARD,
    START_MENU_ICON_INHIBIT_SAVE,
    START_MENU_ICON_INHIBIT_OPTIONS,
    START_MENU_ICON_INHIBIT_RUNNING_SHOES,
    START_MENU_ICON_INHIBIT_7,
    START_MENU_ICON_INHIBIT_8,
    START_MENU_ICON_INHIBIT_POKEGEAR,
} StartMenuIconInhibit;

typedef struct StartMenuAction {
    int ident;
    TaskFunc func;
} StartMenuAction;

#define STARTMENUTASKFUNC_CANCEL     ((TaskFunc)-2)
#define STARTMENUTASKFUNC_NONE    ((TaskFunc)-1)

StartMenuTaskData *sub_0203BE34(void);
u32 sub_0203BE60(FieldSystem *fieldSystem);
u32 sub_0203BECC(FieldSystem *fieldSystem);
u32 sub_0203BED0(FieldSystem *fieldSystem);
u32 sub_0203BED4(FieldSystem *fieldSystem);
u32 sub_0203BED8(FieldSystem *fieldSystem);
u32 sub_0203BEE0(FieldSystem *fieldSystem);
u32 sub_0203BEE8(FieldSystem *fieldSystem);
BOOL sub_0203BEF0(TaskManager *taskManager);
void sub_0203C14C(TaskManager *taskManager);
void sub_0203C1FC(u8 *a0, u8 *a1, u32 *a2, u8 a3, vu32 a4);
u32 sub_0203C220(StartMenuTaskData *startMenu, u8 *a1, u8 *a2);
void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
BOOL sub_0203C3B8(FieldSystem *fieldSystem, int a1);
void sub_0203C460(FieldSystem *fieldSystem);
BOOL sub_0203C47C(TaskManager *taskManager);
BOOL sub_0203C508(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
BOOL sub_0203C5A4(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu);
void sub_0203C69C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem);
void sub_0203C6C8(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender);
void sub_0203C830(StartMenuTaskData *startMenu);
void sub_0203C870(TaskManager *taskManager);
void sub_0203C8B0(TaskManager *taskManager);
BOOL sub_0203C8FC(TaskManager *taskManager);
BOOL sub_0203C920(TaskManager *taskManager);
BOOL sub_0203CA44(TaskManager *taskManager);
BOOL sub_0203CF0C(TaskManager *taskManager);
BOOL sub_0203D1A8(TaskManager *taskManager);
BOOL sub_0203D244(TaskManager *taskManager);
void sub_0203D264(TaskManager *taskManager);
void sub_0203D288(TaskManager *taskManager);
BOOL sub_0203D2CC(TaskManager *taskManager);
void sub_0203D2EC(TaskManager *taskManager);
void sub_0203D304(TaskManager *taskManager);
BOOL sub_0203D318(TaskManager *taskManager);
BOOL sub_0203D394(TaskManager *taskManager);
BOOL sub_0203D488(TaskManager *taskManager);
BOOL sub_0203D500(TaskManager *taskManager);
void sub_0203D9E8(TaskManager *taskManager);
void sub_0203DAE4(TaskManager *taskManager);

extern const int _020FA0C4[];
extern const StartMenuAction _020FA0F4[];

BOOL sub_0203BC10(FieldSystem *fieldSystem) {
    return MapHeader_GetMapSec(fieldSystem->location->mapId) != MAPSEC_MYSTERY_ZONE;
}

void sub_0203BC28(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BCDC(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE0(fieldSystem);
    r4->unk_350 = TRUE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD20(FieldSystem *fieldSystem) {
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE8(fieldSystem);
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD64(FieldSystem *fieldSystem) {
    PlaySE(SEQ_SE_DP_WIN_OPEN);
    StartMenuTaskData *r4 = sub_0203BE34();
    r4->unk_350 = FALSE;
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else if (fieldSystem->unk70 == 3) {
        r4->unk_34C = sub_0203BEE8(fieldSystem);
    } else if (fieldSystem->unk70 == 2) {
        r4->unk_34C = sub_0203BEE0(fieldSystem);
        r4->unk_350 = TRUE;
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    TaskManager_Jump(fieldSystem->taskman, sub_0203BEF0, r4);
}

StartMenuTaskData *sub_0203BE34(void) {
    StartMenuTaskData *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(StartMenuTaskData));
    MI_CpuClearFast(ret, sizeof(StartMenuTaskData));
    ret->state = 0;
    ret->unk_024 = 0;
    ret->atexit_TaskEnv = NULL;
    return ret;
}

u32 sub_0203BE60(FieldSystem *fieldSystem) {
    u32 ret = 0;
    if (!CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICON_INHIBIT_POKEDEX);
    }
    if (!CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICOM_INHIBIT_POKEMON);
    }
    if (!CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_BAG)) {
        ret |= (1 << START_MENU_ICON_INHIBIT_BAG);
    }
    if (!CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
    }
    if (MapHeader_MapIsAmitySquare(fieldSystem->location->mapId) == TRUE) {
        ret |= (1 << START_MENU_ICOM_INHIBIT_POKEMON) | (1 << START_MENU_ICON_INHIBIT_BAG);
    }
    ret |= (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8);
    return ret;
}

u32 sub_0203BECC(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

u32 sub_0203BED0(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

u32 sub_0203BED4(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7);
}

u32 sub_0203BED8(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_POKEDEX) | (1 << START_MENU_ICON_INHIBIT_BAG) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8) | (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
}

u32 sub_0203BEE0(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_8);
}

u32 sub_0203BEE8(FieldSystem *fieldSystem) {
    return (1 << START_MENU_ICON_INHIBIT_POKEDEX) | (1 << START_MENU_ICON_INHIBIT_SAVE) | (1 << START_MENU_ICON_INHIBIT_7) | (1 << START_MENU_ICON_INHIBIT_8) | (1 << START_MENU_ICON_INHIBIT_POKEGEAR);
}

BOOL sub_0203BEF0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    switch (env->state) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        if (ov01_021F6B00(fieldSystem)) {
            ov01_021F6A9C(fieldSystem, 0, NULL);
            env->state = 2;
            break;
        }
        // fallthrough
    case 1:
        ItemCheckUseData_Init(fieldSystem, &env->unk_358);
        FieldSystem_MakeFieldMoveCheckData(fieldSystem, &env->unk_370);
        sub_0203C14C(taskManager);
        fieldSystem->unkD2_0 = 1;
        env->state = 3;
        break;
    case 2:
        if (ov01_021F6B10(fieldSystem) == 6) {
            sub_0203C14C(taskManager);
            fieldSystem->unkD2_0 = 1;
        } else if (ov01_021F6B10(fieldSystem) == 1) {
            ItemCheckUseData_Init(fieldSystem, &env->unk_358);
            FieldSystem_MakeFieldMoveCheckData(fieldSystem, &env->unk_370);
            env->state = 3;
        }
        break;
    case 3:
        if (!sub_0203C47C(taskManager)) {
            return FALSE;
        }
        break;
    case 4:
        sub_0203C870(taskManager);
        break;
    case 5:
        sub_0203C8B0(taskManager);
        break;
    case 6:
        sub_0203D264(taskManager);
        break;
    case 7:
        sub_0203D288(taskManager);
        break;
    case 8:
        sub_0203D9E8(taskManager);
        break;
    case 9:
        sub_0203DAE4(taskManager);
        break;
    case 15:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            sub_0203C14C(taskManager);
            fieldSystem->unkD2_0 = 1;
            ov01_021E636C(1);
            env->state = 17;
        }
        break;
    case 10:
        if (sub_020505C8(fieldSystem)) {
            ov01_021E636C(1);
            env->state = 11;
        }
        break;
    case 11:
        if (IsPaletteFadeFinished()) {
            sub_0203C69C(env, fieldSystem);
            FreeToHeap(env);
            MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
            return TRUE;
        }
        break;
    case 12:
        if (sub_020505C8(fieldSystem)) {
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            ov01_021E636C(1);
            env->state = 13;
        }
        break;
    case 13:
        if (IsPaletteFadeFinished()) {
            TaskManager_Jump(taskManager, env->atexit_TaskFunc, env->atexit_TaskEnv);
            FreeToHeap(env);
        }
        break;
    case 14:
        env->atexit_TaskFunc(taskManager);
        break;
    case 18:
        FreeToHeap(env);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case 16:
        sub_0203C69C(env, fieldSystem);
        sub_0203C38C(env, fieldSystem);
        fieldSystem->unkD2_0 = 2;
        ScheduleBgTilemapBufferTransfer(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3);
        FreeToHeap(env);
        MapObjectManager_UnpauseAllMovement(fieldSystem->mapObjectManager);
        return TRUE;
    case 17:
        if (IsPaletteFadeFinished()) {
            env->state = 3;
        }
        break;
    case 19:
        sub_0203D2EC(taskManager);
        break;
    case 20:
        sub_0203D304(taskManager);
        break;
    }
    if (env->unk_020) {
        sub_0202457C(env->unk_1D4);
    }
    return FALSE;
}

void sub_0203C14C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    u32 r6 = sub_0203C220(env, env->unk_030, env->unk_03A);
    env->unk_02C = r6;
    env->unk_024 = 0;
    for (int i = 0; i < r6; ++i) {
        if (fieldSystem->unk90 == env->unk_030[i]) {
            env->unk_024 = i;
        }
    }
    env->unk_020 = TRUE;
    GfGfxLoader_LoadCharData(NARC_a_0_1_4, 12, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 15, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x1C0, 0x20, HEAP_ID_FIELD);
    GfGfxLoader_LoadScrnData(NARC_a_0_1_4, 13, fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_FIELD);
    sub_0203C6C8(env, env->unk_030, r6, PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fieldSystem->saveData)));
}

void sub_0203C1FC(u8 *a0, u8 *a1, u32 *a2, u8 a3, vu32 a4) {
    a0[*a2] = a3;
    if (a4 == -1u) {
        a4 = *a2;
    }
    a1[a4] = a3;
    ++(*a2);
}

u32 sub_0203C220(StartMenuTaskData *startMenu, u8 *a1, u8 *a2) {
    u32 sp4 = 0;

    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_8))) {
        sub_0203C1FC(a1, a2, &sp4, 8, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_7))) {
        sub_0203C1FC(a1, a2, &sp4, 7, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_POKEDEX))) {
        sub_0203C1FC(a1, a2, &sp4, 0, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICOM_INHIBIT_POKEMON))) {
        sub_0203C1FC(a1, a2, &sp4, 1, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_BAG))) {
        sub_0203C1FC(a1, a2, &sp4, 2, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_POKEGEAR))) {
        if (startMenu->unk_350) {
            sub_0203C1FC(a1, a2, &sp4, 12, -1u);
        } else {
            sub_0203C1FC(a1, a2, &sp4, 11, -1u);
        }
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_TRAINER_CARD))) {
        sub_0203C1FC(a1, a2, &sp4, 3, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_SAVE))) {
        sub_0203C1FC(a1, a2, &sp4, 4, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_OPTIONS))) {
        sub_0203C1FC(a1, a2, &sp4, 5, -1u);
    }
    if (!(startMenu->unk_34C & (1 << START_MENU_ICON_INHIBIT_RUNNING_SHOES))) {
        sub_0203C1FC(a1, a2, &sp4, 6, -1u);
    }
    sub_0203C1FC(a1, a2, &sp4, 9, 7);
    sub_0203C1FC(a1, a2, &sp4, 10, 8);
    return sp4;
}

void sub_0203C38C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem) {
    sub_0203C830(startMenu);
    FillBgTilemapRect(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, 0x20, 0x18, 0);
    startMenu->unk_020 = FALSE;
}

BOOL sub_0203C3B8(FieldSystem *fieldSystem, int a1) {
    return sub_0203C3CC(fieldSystem, _020FA0C4[a1]);
}

BOOL sub_0203C3CC(FieldSystem *fieldSystem, int a1) {
    switch (a1) {
    case START_MENU_ICON_POKEDEX:
        return CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICOM_POKEMON:
        return CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICON_BAG:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_BAG);
    case START_MENU_ICON_POKEGEAR:
        return CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData));
    case START_MENU_ICON_TRAINER_CARD:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_TRAINER_CARD);
    case START_MENU_ICON_SAVE:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_SAVE_BUTTON);
    case START_MENU_ICON_OPTIONS:
        return CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_UNLOCK_OPTIONS_BUTTON);
    case START_MENU_ICON_RUNNING_SHOES:
        return PlayerSaveData_CheckRunningShoes(LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData)));
    default:
        return TRUE;
    }
}

void sub_0203C460(FieldSystem *fieldSystem) {
    if (fieldSystem->unkE0 != 4 && fieldSystem->unkE0 != 11) {
        sub_02092FA8(fieldSystem->unk114);
    }
}

BOOL sub_0203C47C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!ov01_021F6B00(fieldSystem) && ov01_021F6B10(fieldSystem) == TRUE) {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (!sub_0203C508(taskManager, fieldSystem, env)) {
                return FALSE;
            }
            sub_0203C460(fieldSystem);
        } else {
            if (fieldSystem->unkD0 == 0) {
                if (gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_X)) {
                    PlaySE(SEQ_SE_GS_GEARCANCEL);
                    env->state = 16;
                }
            } else {
                if (!sub_0203C5A4(taskManager, fieldSystem, env)) {
                    return FALSE;
                }
                sub_0203C460(fieldSystem);
            }
        }
    }
    return TRUE;
}

BOOL sub_0203C508(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->unkD3 < startMenu->unk_02C) {
        PlaySE(SEQ_SE_DP_SELECT);
        sub_02018410(&fieldSystem->unk_10C, 0);
        startMenu->unk_028 = fieldSystem->unkD3;
        if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func == STARTMENUTASKFUNC_CANCEL) {
            startMenu->state = 16;
        } else if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func != STARTMENUTASKFUNC_NONE) {
            if (sub_0203C3B8(fieldSystem, startMenu->unk_03A[startMenu->unk_028])) {
                TaskFunc func = _020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func;
                sub_0203DF64(fieldSystem, 0);
                ov01_021F6B50(fieldSystem);
                fieldSystem->unkD0 = 0;
                fieldSystem->unkE0 = startMenu->unk_03A[startMenu->unk_028];
                return func(taskManager);
            }
        }
    }

    return TRUE;
}

BOOL sub_0203C5A4(TaskManager *taskManager, FieldSystem *fieldSystem, StartMenuTaskData *startMenu) {
    if (fieldSystem->unkD0 != 0) {
        sub_02018410(&fieldSystem->unk_10C, 1);
    }
    switch (fieldSystem->unkD0) {
    case 1:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        startMenu->state = 16;
        fieldSystem->unkD0 = 0;
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
        fieldSystem->unkD3 = fieldSystem->unkD0 - 2;
        if (fieldSystem->unkD3 < startMenu->unk_02C) {
            PlaySE(SEQ_SE_DP_SELECT);
            startMenu->unk_028 = fieldSystem->unkD3;
            if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func == STARTMENUTASKFUNC_CANCEL) {
                startMenu->state = 16;
                fieldSystem->unkD0 = 0;
            } else if (_020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func != STARTMENUTASKFUNC_NONE) {
                if (sub_0203C3B8(fieldSystem, startMenu->unk_03A[startMenu->unk_028])) {
                    TaskFunc func = _020FA0F4[startMenu->unk_03A[startMenu->unk_028]].func;
                    fieldSystem->unkD0 = 0;
                    sub_0203DF64(fieldSystem, 1);
                    ov01_021F6B50(fieldSystem);
                    fieldSystem->unkE0 = startMenu->unk_03A[startMenu->unk_028];
                    return func(taskManager);
                } else {
                    fieldSystem->unkD0 = 0;
                }
            }
        }
        break;
    }
    return TRUE;
}

void sub_0203C69C(StartMenuTaskData *startMenu, FieldSystem *fieldSystem) {
    if (sub_02035650() && startMenu->unk_350) {
        sub_0205AD0C(fieldSystem->unk84);
        sub_02037FF0();
        sub_0205A904(0);
    }
}

void sub_0203C6C8(StartMenuTaskData *startMenu, u8 *a1, u32 a2, u8 gender) {
    startMenu->unk_1D4 = G2dRenderer_Init(1, &startMenu->unk_1D8, HEAP_ID_FIELD);
    for (int i = 0; i < 4; ++i) {
        startMenu->unk_300[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, HEAP_ID_FIELD);
    }
    startMenu->unk_310[GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_CHAR], NARC_a_0_1_4, 64, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_PLTT], NARC_a_0_1_4, 61, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_CELL], NARC_a_0_1_4, 62, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_FIELD);
    startMenu->unk_310[GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(startMenu->unk_300[GF_GFX_RES_TYPE_ANIM], NARC_a_0_1_4, 63, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_FIELD);
    sub_0200ADA4(startMenu->unk_310[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B00C(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    sub_0200A740(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    CreateSpriteResourcesHeader(&startMenu->unk_320, 0, 0, 0, 0, -1, -1, 0, 0, startMenu->unk_300[GF_GFX_RES_TYPE_CHAR], startMenu->unk_300[GF_GFX_RES_TYPE_PLTT], startMenu->unk_300[GF_GFX_RES_TYPE_CELL], startMenu->unk_300[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    SpriteTemplate spriteTemplate;
    spriteTemplate.spriteList = startMenu->unk_1D4;
    spriteTemplate.header = &startMenu->unk_320;
    spriteTemplate.position.z = 0;
    spriteTemplate.scale.x = FX32_ONE;
    spriteTemplate.scale.y = FX32_ONE;
    spriteTemplate.scale.z = FX32_ONE;
    spriteTemplate.rotation = 0;
    spriteTemplate.priority = 0;
    spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    spriteTemplate.heapId = HEAP_ID_FIELD;
    spriteTemplate.header = &startMenu->unk_320;  // second assign is necessary to match
    spriteTemplate.position.x = FX32_CONST(100);
    spriteTemplate.position.y = FX32_CONST(144);
    startMenu->unk_344 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(startMenu->unk_344, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void sub_0203C830(StartMenuTaskData *startMenu) {
    sub_0200AEB0(startMenu->unk_310[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(startMenu->unk_310[GF_GFX_RES_TYPE_PLTT]);
    for (u16 i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(startMenu->unk_300[i]);
    }
    SpriteList_Delete(startMenu->unk_1D4);
}

void sub_0203C870(TaskManager *taskManager) {
    if (IsPaletteFadeFinished()) {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

        sub_0203C38C(env, fieldSystem);
        fieldSystem->unkD2_0 = 0;
        env->atexit_TaskFunc(taskManager);
        env->state = 5;
    }
}

void sub_0203C8B0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
        env->atexit_TaskFunc(taskManager);
        if (env->state == 15 && sub_020183F0(&fieldSystem->unk_10C) == TRUE) {
            env->state = 10;
        }
    }
}

void sub_0203C8F0(StartMenuTaskData *env, TaskFunc func) {
    env->atexit_TaskFunc = func;
    env->state = 5;
}

BOOL sub_0203C8FC(TaskManager *taskManager) {
    StartMenuTaskData *env = (StartMenuTaskData *)TaskManager_GetEnvironment(taskManager);

    ov01_021E636C(0);
    env->atexit_TaskFunc = sub_0203C920;
    env->state = 4;
    return TRUE;
}
