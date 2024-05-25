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
#include "unk_0200FA24.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "constants/start_menu_icons.h"
#include "unk_02092BE8.h"

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

typedef struct UnkStruct_0203BE34 {
    u8 filler_000[0x20];
    BOOL unk_020;
    u16 unk_024;
    u16 unk_026;
    u8 filler_028[0x4];
    u32 unk_02C;
    u8 unk_030[10];
    u8 unk_03A[10];
    u8 filler_044[0x190];
    SpriteList *unk_1D4;
    u8 filler_1D8[0x174];
    u32 unk_34C;
    BOOL unk_350;
    TaskFunc unk_354;
    ItemCheckUseData unk_358;
    FieldMoveCheckData unk_370;
    void *unk_380;
    u8 filler_384[0x8];
} UnkStruct_0203BE34;  // size: 0x38C

UnkStruct_0203BE34 *sub_0203BE34(void);
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
u32 sub_0203C220(UnkStruct_0203BE34 *startMenu, u8 *a1, u8 *a2);
void sub_0203C38C(UnkStruct_0203BE34 *startMenu, FieldSystem *fieldSystem);
BOOL sub_0203C3B8(FieldSystem *fieldSystem, int a1);
void sub_0203C460(FieldSystem *fieldSystem);
BOOL sub_0203C47C(TaskManager *taskManager);
BOOL sub_0203C508(TaskManager *taskManager, FieldSystem *fieldSystem, UnkStruct_0203BE34 *startMenu);
BOOL sub_0203C5A4(TaskManager *taskManager, FieldSystem *fieldSystem, UnkStruct_0203BE34 *startMenu);
void sub_0203C69C(UnkStruct_0203BE34 *startMenu, FieldSystem *fieldSystem);
void sub_0203C6C8(UnkStruct_0203BE34 *startMenu, u8 *a1, u32 a2, u8 gender);
void sub_0203C830(UnkStruct_0203BE34 *startMenu);
void sub_0203C870(TaskManager *taskManager);
void sub_0203C8B0(TaskManager *taskManager);
void sub_0203D264(TaskManager *taskManager);
void sub_0203D288(TaskManager *taskManager);
void sub_0203D2EC(TaskManager *taskManager);
void sub_0203D304(TaskManager *taskManager);
void sub_0203D9E8(TaskManager *taskManager);
void sub_0203DAE4(TaskManager *taskManager);

extern const int _020FA0C4[];

BOOL sub_0203BC10(FieldSystem *fieldSystem) {
    return MapHeader_GetMapSec(fieldSystem->location->mapId) != MAPSEC_MYSTERY_ZONE;
}

void sub_0203BC28(FieldSystem *fieldSystem) {
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
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
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE0(fieldSystem);
    r4->unk_350 = TRUE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD20(FieldSystem *fieldSystem) {
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE8(fieldSystem);
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD64(FieldSystem *fieldSystem) {
    PlaySE(SEQ_SE_DP_WIN_OPEN);
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
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

UnkStruct_0203BE34 *sub_0203BE34(void) {
    UnkStruct_0203BE34 *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203BE34));
    MI_CpuClearFast(ret, sizeof(UnkStruct_0203BE34));
    ret->unk_026 = 0;
    ret->unk_024 = 0;
    ret->unk_380 = NULL;
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
    UnkStruct_0203BE34 *env = (UnkStruct_0203BE34 *)TaskManager_GetEnvironment(taskManager);

    switch (env->unk_026) {
    case 0:
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
        if (ov01_021F6B00(fieldSystem)) {
            ov01_021F6A9C(fieldSystem, 0, NULL);
            env->unk_026 = 2;
            break;
        }
        // fallthrough
    case 1:
        ItemCheckUseData_Init(fieldSystem, &env->unk_358);
        FieldSystem_MakeFieldMoveCheckData(fieldSystem, &env->unk_370);
        sub_0203C14C(taskManager);
        fieldSystem->unkD2_0 = 1;
        env->unk_026 = 3;
        break;
    case 2:
        if (ov01_021F6B10(fieldSystem) == 6) {
            sub_0203C14C(taskManager);
            fieldSystem->unkD2_0 = 1;
        } else if (ov01_021F6B10(fieldSystem) == 1) {
            ItemCheckUseData_Init(fieldSystem, &env->unk_358);
            FieldSystem_MakeFieldMoveCheckData(fieldSystem, &env->unk_370);
            env->unk_026 = 3;
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
            env->unk_026 = 17;
        }
        break;
    case 10:
        if (sub_020505C8(fieldSystem)) {
            ov01_021E636C(1);
            env->unk_026 = 11;
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
            env->unk_026 = 13;
        }
        break;
    case 13:
        if (IsPaletteFadeFinished()) {
            TaskManager_Jump(taskManager, env->unk_354, env->unk_380);
            FreeToHeap(env);
        }
        break;
    case 14:
        env->unk_354(taskManager);
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
            env->unk_026 = 3;
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
    UnkStruct_0203BE34 *env = (UnkStruct_0203BE34 *)TaskManager_GetEnvironment(taskManager);

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

u32 sub_0203C220(UnkStruct_0203BE34 *startMenu, u8 *a1, u8 *a2) {
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

void sub_0203C38C(UnkStruct_0203BE34 *startMenu, FieldSystem *fieldSystem) {
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
    UnkStruct_0203BE34 *env = (UnkStruct_0203BE34 *)TaskManager_GetEnvironment(taskManager);

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
                    env->unk_026 = 16;
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
