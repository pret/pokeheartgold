#include "constants/sndseq.h"
#include "field_map_object.h"
#include "field_move.h"
#include "field_use_item.h"
#include "global.h"
#include "unk_0203BC10.h"
#include "map_header.h"
#include "constants/map_sections.h"
#include "overlay_01.h"
#include "save_vars_flags.h"
#include "sys_flags.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "constants/start_menu_icons.h"

typedef struct UnkStruct_0203BE34 {
    u8 filler_000[0x20];
    BOOL unk_020;
    u16 unk_024;
    u16 unk_026;
    u8 filler_028[0x1AC];
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
void sub_0203C38C(UnkStruct_0203BE34 *startMenu, FieldSystem *fieldSystem);
void sub_0203C69C(UnkStruct_0203BE34 *startMenu, FieldSystem *fieldSystem);
BOOL sub_0203C47C(TaskManager *taskManager);
void sub_0203C870(TaskManager *taskManager);
void sub_0203C8B0(TaskManager *taskManager);
void sub_0203D264(TaskManager *taskManager);
void sub_0203D288(TaskManager *taskManager);
void sub_0203D2EC(TaskManager *taskManager);
void sub_0203D304(TaskManager *taskManager);
void sub_0203D9E8(TaskManager *taskManager);
void sub_0203DAE4(TaskManager *taskManager);

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
        ret |= (1 << 0);
    }
    if (!CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << 1);
    }
    if (!CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_BAG)) {
        ret |= (1 << 2);
    }
    if (!CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << 9);
    }
    if (MapHeader_MapIsAmitySquare(fieldSystem->location->mapId) == TRUE) {
        ret |= (1 << 1) | (1 << 2);
    }
    ret |= (1 << 7) | (1 << 8);
    return ret;
}

u32 sub_0203BECC(FieldSystem *fieldSystem) {
    return (1 << 4) | (1 << 7);
}

u32 sub_0203BED0(FieldSystem *fieldSystem) {
    return (1 << 2) | (1 << 4) | (1 << 7);
}

u32 sub_0203BED4(FieldSystem *fieldSystem) {
    return (1 << 2) | (1 << 4) | (1 << 7);
}

u32 sub_0203BED8(FieldSystem *fieldSystem) {
    return (1 << 0) | (1 << 2) | (1 << 4) | (1 << 7) | (1 << 8) | (1 << 9);
}

u32 sub_0203BEE0(FieldSystem *fieldSystem) {
    return (1 << 4) | (1 << 8);
}

u32 sub_0203BEE8(FieldSystem *fieldSystem) {
    return (1 << 0) | (1 << 4) | (1 << 7) | (1 << 8) | (1 << 9);
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
