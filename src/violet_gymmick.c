#include "gymmick.h"
#include "gymmick_overlay.h"
#include "task.h"
#include "field_player_avatar.h"
#include "scrcmd.h"
#include "unk_02005D10.h"
#include "overlay_01.h"

#define ELEVATOR_HEIGHT_DOWN         (32 * FX32_ONE)
#define ELEVATOR_HEIGHT_UP           (496 * FX32_ONE)
#define ELEVATOR_HEIGHT_STEP         (16 * FX32_ONE)

struct VioletElevatorMoveTaskEnv {
    int state;
    FieldSystem *fsys;
};

static BOOL fieldTask_ElevatorUp(TaskManager *taskManager);
static BOOL fieldTask_ElevatorDown(TaskManager *taskManager);
static void sysTask_ElevatorUp(SysTask *task, struct VioletElevatorMoveTaskEnv *env);
static void sysTask_ElevatorDown(SysTask *task, struct VioletElevatorMoveTaskEnv *env);

static inline fx32 getElevatorCurrentHeight(u8 state) {
    switch (state) {
    case 0:
        return ELEVATOR_HEIGHT_DOWN;
    case 1:
        return ELEVATOR_HEIGHT_UP;
    default:
        GF_ASSERT(0);
        return ELEVATOR_HEIGHT_DOWN;
    }
}

void InitVioletGymElevatorGimmick(FieldSystem *fsys) {
    union GymmickUnion *data = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_VIOLET);
    const VecFx32 elevInitPos = {
        248 * FX32_ONE,
        0,
        328 * FX32_ONE,
    };
    VecFx32 elevatorPos;
    fx32 ypos;
    struct BgModelEvent *elevator;

    AddBgModelFromTemplate(fsys->bgModels, 111, &elevInitPos, NULL, fsys->_3dAnimationMgr);
    MapHeightOverrideCreateRect(0, 14, 19, 3, 3, ELEVATOR_HEIGHT_DOWN, fsys->mapHeightOverrides);

    ypos = getElevatorCurrentHeight(data->violet.liftState);
    elevator = GetBgModelFromMemoryList(fsys->bgModels, 111);
    BgModel_GetPosition(&elevatorPos, elevator);
    elevatorPos.y = ypos;
    BgModel_SetPosition(elevator, &elevatorPos);
    MapHeightOverrideUpdate(0, ypos, fsys->mapHeightOverrides);
    {
        static const GXRgb edgeColors[8] = {
            GX_RGB(0, 0, 0),
            GX_RGB(9, 9, 9),
            GX_RGB(16, 11, 4),
            GX_RGB(20, 28, 31),
            GX_RGB(4, 4, 4),
            GX_RGB(4, 4, 4),
            GX_RGB(4, 4, 4),
            GX_RGB(4, 4, 4),
        };
        G3X_SetEdgeColorTable(edgeColors);
    }
}

void LaunchVioletGymElevatorMoveTask(FieldSystem *fsys) {
    struct VioletElevatorMoveTaskEnv *env = AllocFromHeapAtEnd(11, sizeof(struct VioletElevatorMoveTaskEnv));
    union GymmickUnion *data;
    VecFx32 playerPos;

    env->state = 0;
    env->fsys = fsys;

    data = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_VIOLET);

    PlayerAvatar_GetPositionVec(fsys->playerAvatar, &playerPos);
    if (playerPos.y == ELEVATOR_HEIGHT_DOWN) {
        TaskManager_Call(fsys->taskman, fieldTask_ElevatorUp, env);
        data->violet.liftState = TRUE;
    } else {
        TaskManager_Call(fsys->taskman, fieldTask_ElevatorDown, env);
        data->violet.liftState = FALSE;
    }
}

static BOOL fieldTask_ElevatorUp(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct VioletElevatorMoveTaskEnv *env = TaskManager_GetEnv(taskManager);
    
    switch (env->state) {
    case 0:
        TaskManager_Call(fsys->taskman, Task_WaitFollowingPokeSituatedOnMovingPlatform, NULL);
        env->state++;
        break;
    case 1:
        CreateSysTask((SysTaskFunc)sysTask_ElevatorUp, env, 0);
        env->state++;
        break;
    case 5:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static BOOL fieldTask_ElevatorDown(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct VioletElevatorMoveTaskEnv *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        TaskManager_Call(fsys->taskman, Task_WaitFollowingPokeSituatedOnMovingPlatform, NULL);
        env->state++;
        break;
    case 1:
        CreateSysTask((SysTaskFunc)sysTask_ElevatorDown, env, 0);
        env->state++;
        break;
    case 5:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void sysTask_ElevatorUp(SysTask *task, struct VioletElevatorMoveTaskEnv *env) {
    FieldSystem *fsys = env->fsys;
    struct BgModelEvent *elevator;
    VecFx32 elevatorPos;
    VecFx32 playerPos;

    switch (env->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fsys->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        env->state++;
        break;
    case 3:
        elevator = GetBgModelFromMemoryList(fsys->bgModels, 111);
        BgModel_GetPosition(&elevatorPos, elevator);
        elevatorPos.y += ELEVATOR_HEIGHT_STEP;
        if (elevatorPos.y >= ELEVATOR_HEIGHT_UP) {
            elevatorPos.y = ELEVATOR_HEIGHT_UP;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            env->state++;
        }
        PlayerAvatar_GetPositionVec(fsys->playerAvatar, &playerPos);
        playerPos.y += ELEVATOR_HEIGHT_STEP;
        PlayerAvatar_SetHeight(fsys->playerAvatar, playerPos.y);
        SetFollowingPokeHeight(fsys, playerPos.y);
        BgModel_SetPosition(elevator, &elevatorPos);
        break;
    case 4:
        MapHeightOverrideUpdate(0, ELEVATOR_HEIGHT_UP, fsys->mapHeightOverrides);
        PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        DestroySysTask(task);
        env->state++;
        break;
    }
}

static void sysTask_ElevatorDown(SysTask *task, struct VioletElevatorMoveTaskEnv *env) {
    FieldSystem *fsys = env->fsys;
    struct BgModelEvent *elevator;
    VecFx32 elevatorPos;
    VecFx32 playerPos;

    switch (env->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fsys->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        env->state++;
        break;
    case 3:
        elevator = GetBgModelFromMemoryList(fsys->bgModels, 111);
        BgModel_GetPosition(&elevatorPos, elevator);
        elevatorPos.y -= ELEVATOR_HEIGHT_STEP;
        if (elevatorPos.y <= ELEVATOR_HEIGHT_DOWN) {
            elevatorPos.y = ELEVATOR_HEIGHT_DOWN;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            env->state++;
        }
        PlayerAvatar_GetPositionVec(fsys->playerAvatar, &playerPos);
        playerPos.y -= ELEVATOR_HEIGHT_STEP;
        PlayerAvatar_SetHeight(fsys->playerAvatar, playerPos.y);
        SetFollowingPokeHeight(fsys, playerPos.y);
        BgModel_SetPosition(elevator, &elevatorPos);
        break;
    case 4:
        MapHeightOverrideUpdate(0, ELEVATOR_HEIGHT_DOWN, fsys->mapHeightOverrides);
        PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        DestroySysTask(task);
        env->state++;
        break;
    }
}
