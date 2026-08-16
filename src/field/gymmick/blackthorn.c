#include "field_system.h"
#include "metatile_behavior.h"
#include "overlay_04.h"
#include "unk_02005D10.h"
#include "unk_02054648.h"
#include "unk_0205FD20.h"

#define PLATFORM_TYPE_0_W    5
#define PLATFORM_TYPE_0_H    7
#define PLATFORM_TYPE_0_AREA 14
#define PLATFORM_TYPE_1_W    4
#define PLATFORM_TYPE_1_H    8
#define PLATFORM_TYPE_1_AREA 24

typedef enum BlackthornPlatformButtonAction {
    ACTION_NONE,
    ACTION_ROTATE,
    ACTION_MOVE_RIGHT, // with respect to default orientation
    ACTION_MOVE_LEFT,  // with respect to default orientation
} BlackthornPlatformButtonAction;

typedef enum BlackthornPlatformActionTaskState {
    STATE_MOVE_INIT,
    STATE_MOVE_CHECK,
    STATE_MOVE_RUN,
    STATE_MOVE_APPLY,
    STATE_MOVE_BONK_START,
    STATE_MOVE_BONK_CHECK,
    STATE_MOVE_BONK_RETURN,
    STATE_MOVE_FINISH,
    STATE_ROTATE_INIT,
    STATE_ROTATE_RUN,
    STATE_ROTATE_BONK,
    STATE_ROTATE_BONK_RETURN,
    STATE_ROTATE_FINISH,
} BlackthornPlatformActionTaskState;

typedef enum BlackthornPlatformRotationBonkState {
    ROTATE_BONK_NO_GO,
    ROTATE_BONK_PARTIAL_GO,
    ROTATE_BONK_OK,
} BlackthornPlatformRotationBonkState;

typedef struct BlackthornGymXZPoint {
    int x;
    int z;
} BlackthornGymXZPoint;

typedef struct BlackthornGymmickPlatformData {
    int shape;
    u8 width;
    u8 height;
    u8 rotation;
    u8 mapPropID;
    BlackthornGymXZPoint rotateButton;
    BlackthornGymXZPoint moveLeftButton;
    BlackthornGymXZPoint moveRightButton;
    BlackthornGymXZPoint unusedCoords;
    BlackthornGymXZPoint rightWall[8];
    BlackthornGymXZPoint leftWall[8];
    BlackthornGymXZPoint bottomWall[5];
    BlackthornGymXZPoint topWall[5];
    BlackthornGymXZPoint rotateCollisionCheck[24];
    BlackthornGymXZPoint rightEdgeOuter[5];
    BlackthornGymXZPoint floor[18];
} BlackthornGymmickPlatformData; // size: 0x270

typedef struct BlackthornGymmickLocalData {
    FieldSystem *fieldSystem;
    BlackthornGymmickPlatformData platforms[3];
} BlackthornGymmickLocalData; // size: 0x754

typedef struct BlackthornGymMovePlatformTaskData {
    BlackthornPlatformActionTaskState state;
    BlackthornGymXZPoint leadingWall[9];
    u8 platformIdx;
    u8 moveStepCount;
    u8 moveDistance;
    u8 moveStepTimer;
    BlackthornPlatformButtonAction action;
    int moveDirection;
    VecFx32 moveVector;
    fx32 rotatePos;
    fx32 rotateExtent;
    fx32 initY;
    FieldSystem *fieldSystem;
} BlackthornGymMovePlatformTaskData;

static void BlackthornPlatform_Init(u8 i, u8 rot, u16 x, u16 z, BlackthornGymmickPlatformData *platform);
static void BlackthornGymmick_ApplyRotationToPoints(const u8 rot, const u16 x, const u16 z, const BlackthornGymXZPoint *pointIn, BlackthornGymXZPoint *pointOut);
static void BlackthornGymmick_ApplyXTranslation(const int dx, const u8 height, BlackthornGymXZPoint *column);
static void BlackthornGymmick_ApplyZTranslation(const int dz, const u8 width, BlackthornGymXZPoint *row);
static void BlackthornPlatform_ApplyRotation(const u8 rot, const u16 x, const u16 z, BlackthornGymmickPlatformData *platform);
static BlackthornPlatformButtonAction BlackthornGymmick_GetButtonAction(const BlackthornGymmickLocalData *localData, const u16 x, const u16 z, u8 *out);
static BOOL BlackthornGymmick_TryStartBlackthornAction(const BlackthornGymmickLocalData *localData, const u16 x, const u16 z);
static void BlackthornGymmick_GetCurrentLeadingWallCoordinates(const BlackthornGymmickPlatformData *platform, BlackthornGymMovePlatformTaskData *taskData);
static void BlackthornGymmick_GetNextLeadingWallCoordinates(const int dim, BlackthornGymMovePlatformTaskData *taskData);
static int BlackthornGymmick_GetMoveDirection(u8 rotation, u8 direction);
static void BlackthornGymmick_DirectionToVec(int directionId, VecFx32 *directionVec);
static u8 BlackthornGymmick_CheckWallCollision(FieldSystem *fieldSystem, const u8 dim, const BlackthornGymXZPoint *const points);
static u16 BlackthornGymmick_GetMaxRotationExtent(FieldSystem *fieldSystem, const u8 dim, const BlackthornGymXZPoint *const points, const u8 *const extentDat);
static BOOL Task_BlackthornGymmick_MovePlatform(TaskManager *taskman);
static BOOL Task_BlackthornGymmick_RotatePlatform(TaskManager *taskman);
static BlackthornPlatformRotationBonkState ov04_02255CBC(FieldSystem *fieldSystem, BlackthornGymmickPlatformData *platform, u16 *out);
static u16 BlackthornGymmick_GetMaximumRotationAngle(FieldSystem *fieldSystem, BlackthornGymmickPlatformData *platform);
static void SysTask_BlackthornGymmick_MovePlatform(SysTask *task, void *data);

// clang-format off
// If any point on the platform hits collision while rotating,
// the corresponding entry is 1/256th of the total angle
// that the platform will travel before bonking.
// 64, being 1/256th of 0x4000, represents full travel (no bonk).
static const u8 sMainAreaRotationExtents_Type0[] = {
    10, 10, 13, 18, 25, 38, 51,
    64, 64, 23, 28, 35, 45, 55,
};
static const u8 sMainAreaRotationExtents_Type1[] = {
     8,  9, 10, 14, 19, 26, 37, 51,
    64, 17, 19, 23, 28, 35, 46, 55,
    64, 64, 64, 30, 35, 41, 49, 57,
};
static const u8 sLeadingEdgeRotationExtents_Type0[] = { 64, 64, 64, 64, 42 };
static const u8 sLeadingEdgeRotationExtents_Type1[] = { 64, 20, 30, 46 };
// clang-format on

void GymmickInit_Blackthorn(FieldSystem *fieldSystem) {
    int modelIDs[3] = { 120, 121, 120 };

    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_BLACKTHORN);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(BlackthornGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(BlackthornGymmickLocalData));
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;
    for (int i = 0; i < 3; ++i) {
        VecFx32 positionVec = { 0, 48 * FX32_ONE, 0 };
        VecFx32 rotationVec = { 0, 0, 0 };
        rotationVec.y = -4 * FX32_ONE * gymmickUnion->blackthorn.rot[i];
        positionVec.x = 16 * FX32_ONE * gymmickUnion->blackthorn.x[i] + 8 * FX32_ONE;
        positionVec.z = 16 * FX32_ONE * gymmickUnion->blackthorn.z[i] + 8 * FX32_ONE;
        localData->platforms[i].mapPropID = MapPropManager_LoadOne(fieldSystem->mapPropManager, modelIDs[i], &positionVec, &rotationVec, fieldSystem->mapPropAnimationManager);
        BlackthornPlatform_Init(i, gymmickUnion->blackthorn.rot[i], gymmickUnion->blackthorn.x[i], gymmickUnion->blackthorn.z[i], &localData->platforms[i]);
    }
}

void GymmickFree_Blackthorn(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

BOOL ov04_02255090(FieldSystem *fieldSystem) {
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_BLACKTHORN) {
        return FALSE;
    }
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (localData == NULL) {
        return FALSE;
    }
    return BlackthornGymmick_TryStartBlackthornAction(localData, PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar));
}

BOOL GymmickCheckCollision_Blackthorn(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (int i = 0; i < 3; ++i) {
        BlackthornGymmickPlatformData *platform = &localData->platforms[i];
        for (int j = 0; j < 18; ++j) {
            if (tileX == platform->floor[j].x && tileZ == platform->floor[j].z) {
                *isColliding = FALSE;
                return TRUE;
            }
        }
    }
    if (MetatileBehavior_IsMagma(GetMetatileBehavior(fieldSystem, tileX, tileZ))) {
        *isColliding = TRUE;
        return TRUE;
    }
    return FALSE;
}

// This function is weird. I promise, every oddity is required to match.
// Scratch: https://decomp.me/scratch/6ql5q
static void BlackthornPlatform_Init(u8 index, u8 rot, u16 x, u16 z, BlackthornGymmickPlatformData *platform) {
    BlackthornGymXZPoint basePos;

    platform->rotateButton.x = x;
    platform->rotateButton.z = z;
    platform->moveLeftButton.x = x + 1;
    platform->moveLeftButton.z = z;
    platform->moveRightButton.x = x - 1;
    platform->moveRightButton.z = z;
    platform->unusedCoords.x = x;
    platform->unusedCoords.z = z;

    if (index != 1) {
        // Declaration here is required to match
        int i, j;
        platform->shape = 0;
        platform->width = 5;
        platform->height = 7;
        basePos.x = x;
        basePos.z = z;
        basePos.x += 3;
        basePos.z -= 2;
        for (i = 0; i < 7; ++i) {
            platform->rightWall[i] = basePos;
            platform->rightWall[i].z += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 3;
        basePos.z -= 2;
        for (i = 0; i < 7; ++i) {
            platform->leftWall[i] = basePos;
            platform->leftWall[i].z += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 2;
        basePos.z += 5;
        for (i = 0; i < 5; ++i) {
            platform->bottomWall[i] = basePos;
            platform->bottomWall[i].x += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 2;
        basePos.z -= 3;
        for (i = 0; i < 5; ++i) {
            platform->topWall[i] = basePos;
            platform->topWall[i].x += i;
        }
        for (i = 0; i < 2; ++i) {
            basePos.x = x - 4;
            basePos.z = z + 4;
            basePos.x -= i;
            for (j = 0; j < 7; ++j) {
                platform->rotateCollisionCheck[i * 7 + j] = basePos;
                platform->rotateCollisionCheck[i * 7 + j].z -= j;
            }
        }
        for (i = 0; i < platform->width; ++i) {
            basePos.x = x + 3;
            basePos.z = z - 2;
            platform->rightEdgeOuter[i] = basePos;
            platform->rightEdgeOuter[i].z += i;
        }
    } else {
        // Declaration here is required to match
        int i, j;
        platform->shape = 1;
        platform->width = 4;
        platform->height = 8;
        basePos.x = x;
        basePos.z = z;
        basePos.x += 2;
        basePos.z -= 2;
        for (i = 0; i < 8; ++i) {
            platform->rightWall[i] = basePos;
            platform->rightWall[i].z += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 3;
        basePos.z -= 2;
        for (i = 0; i < 8; ++i) {
            platform->leftWall[i] = basePos;
            platform->leftWall[i].z += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 2;
        basePos.z += 6;
        for (i = 0; i < 4; ++i) {
            platform->bottomWall[i] = basePos;
            platform->bottomWall[i].x += i;
        }
        basePos.x = x;
        basePos.z = z;
        basePos.x -= 2;
        basePos.z -= 3;
        for (i = 0; i < 4; ++i) {
            platform->topWall[i] = basePos;
            platform->topWall[i].x += i;
        }
        for (i = 0; i < 3; ++i) {
            basePos.x = x - 4;
            basePos.z = z + 5;
            basePos.x -= i;
            for (j = 0; j < 8; ++j) {
                platform->rotateCollisionCheck[i * 8 + j] = basePos;
                platform->rotateCollisionCheck[i * 8 + j].z -= j;
            }
        }
        for (i = 0; i < platform->width; ++i) {
            basePos.x = x + 3;
            basePos.z = z - 2;
            platform->rightEdgeOuter[i] = basePos;
            platform->rightEdgeOuter[i].z += i;
        }
    }
    {
        // Declaration here is required to match
        int i, j;
        basePos.x = x - 1;
        basePos.z = z - 1;
        for (i = 0; i < 6; ++i) {
            for (j = 0; j < 3; ++j) {
                platform->floor[i * 3 + j].x = basePos.x + j;
                platform->floor[i * 3 + j].z = basePos.z + i;
            }
        }
    }
    platform->rotation = rot;
    BlackthornPlatform_ApplyRotation(rot, x, z, platform);
}

static void BlackthornGymmick_ApplyRotationToPoints(const u8 rot, const u16 x, const u16 z, const BlackthornGymXZPoint *pointIn, BlackthornGymXZPoint *pointOut) {
    int dx = pointIn->x - x;
    int dz = pointIn->z - z;

    switch (rot) {
    case 1:
        pointOut->x = -dz;
        pointOut->z = dx;
        break;
    case 2:
        pointOut->x = -dx;
        pointOut->z = -dz;
        break;
    case 3:
        pointOut->x = dz;
        pointOut->z = -dx;
        break;
    default:
        return;
    }
    pointOut->x += x;
    pointOut->z += z;
}

static void BlackthornGymmick_ApplyXTranslation(const int dx, const u8 height, BlackthornGymXZPoint *column) {
    for (int i = 0; i < height; ++i) {
        column[i].x += dx;
    }
}

static void BlackthornGymmick_ApplyZTranslation(const int dz, const u8 width, BlackthornGymXZPoint *row) {
    for (int i = 0; i < width; ++i) {
        row[i].z += dz;
    }
}

// the const is required to match
// i don't make the rules
static void BlackthornPlatform_ApplyRotation(const u8 rot, const u16 x, const u16 z, BlackthornGymmickPlatformData *platform) {
    int i;
    int area;
    u8 width;
    u8 height;

    if (platform->shape == 0) {
        area = PLATFORM_TYPE_0_AREA;
        width = PLATFORM_TYPE_0_W;
        height = PLATFORM_TYPE_0_H;
    } else {
        area = PLATFORM_TYPE_1_AREA;
        width = PLATFORM_TYPE_1_W;
        height = PLATFORM_TYPE_1_H;
    }
    BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->moveLeftButton, &platform->moveLeftButton);
    BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->moveRightButton, &platform->moveRightButton);
    for (i = 0; i < height; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->rightWall[i], &platform->rightWall[i]);
    }
    for (i = 0; i < height; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->leftWall[i], &platform->leftWall[i]);
    }
    for (i = 0; i < width; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->bottomWall[i], &platform->bottomWall[i]);
    }
    for (i = 0; i < width; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->topWall[i], &platform->topWall[i]);
    }
    for (i = 0; i < area; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->rotateCollisionCheck[i], &platform->rotateCollisionCheck[i]);
    }
    for (i = 0; i < width; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->rightEdgeOuter[i], &platform->rightEdgeOuter[i]);
    }
    for (i = 0; i < 18; ++i) {
        BlackthornGymmick_ApplyRotationToPoints(rot, x, z, &platform->floor[i], &platform->floor[i]);
    }
}

static BlackthornPlatformButtonAction BlackthornGymmick_GetButtonAction(const BlackthornGymmickLocalData *localData, const u16 x, const u16 z, u8 *out) {
    for (u8 i = 0; i < 3; ++i) {
        if (x == localData->platforms[i].rotateButton.x && z == localData->platforms[i].rotateButton.z) {
            *out = i;
            return ACTION_ROTATE;
        }
        if (x == localData->platforms[i].moveLeftButton.x && z == localData->platforms[i].moveLeftButton.z) {
            *out = i;
            return ACTION_MOVE_RIGHT;
        }
        if (x == localData->platforms[i].moveRightButton.x && z == localData->platforms[i].moveRightButton.z) {
            *out = i;
            return ACTION_MOVE_LEFT;
        }
    }
    return ACTION_NONE;
}

static BOOL BlackthornGymmick_TryStartBlackthornAction(const BlackthornGymmickLocalData *localData, const u16 x, const u16 z) {
    u8 platformIdx;
    BlackthornPlatformButtonAction action = BlackthornGymmick_GetButtonAction(localData, x, z, &platformIdx);
    if (action == ACTION_NONE) {
        return FALSE;
    }
    BlackthornGymMovePlatformTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(BlackthornGymMovePlatformTaskData));
    taskData->fieldSystem = localData->fieldSystem;
    taskData->state = STATE_MOVE_INIT;
    taskData->platformIdx = platformIdx;
    taskData->action = action;

    BOOL ret = FALSE;
    switch (action) {
    case ACTION_ROTATE:
        taskData->state = STATE_ROTATE_INIT;
        PlaySE(SEQ_SE_GS_GONDORA_IDOU);
        FieldSystem_CreateTask(localData->fieldSystem, Task_BlackthornGymmick_RotatePlatform, taskData);
        ret = TRUE;
        break;
    case ACTION_MOVE_RIGHT:
        taskData->state = STATE_MOVE_INIT;
        taskData->moveStepCount = 0;
        taskData->moveDistance = localData->platforms[platformIdx].width;
        taskData->moveDirection = BlackthornGymmick_GetMoveDirection(localData->platforms[platformIdx].rotation, 0);
        BlackthornGymmick_DirectionToVec(taskData->moveDirection, &taskData->moveVector);
        PlaySE(SEQ_SE_GS_GONDORA_IDOU);
        FieldSystem_CreateTask(localData->fieldSystem, Task_BlackthornGymmick_MovePlatform, taskData);
        ret = TRUE;
        break;
    case ACTION_MOVE_LEFT:
        taskData->state = STATE_MOVE_INIT;
        taskData->moveStepCount = 0;
        taskData->moveDistance = localData->platforms[platformIdx].width;
        taskData->moveDirection = BlackthornGymmick_GetMoveDirection(localData->platforms[platformIdx].rotation, 1);
        BlackthornGymmick_DirectionToVec(taskData->moveDirection, &taskData->moveVector);
        PlaySE(SEQ_SE_GS_GONDORA_IDOU);
        FieldSystem_CreateTask(localData->fieldSystem, Task_BlackthornGymmick_MovePlatform, taskData);
        ret = TRUE;
        break;
    }

    return ret;
}

static void BlackthornGymmick_GetCurrentLeadingWallCoordinates(const BlackthornGymmickPlatformData *platform, BlackthornGymMovePlatformTaskData *taskData) {
    int i;

    switch (taskData->action) {
    case ACTION_MOVE_RIGHT:
        for (i = 0; i < platform->height; ++i) {
            taskData->leadingWall[i] = platform->rightWall[i];
        }
        break;
    case ACTION_MOVE_LEFT:
        for (i = 0; i < platform->height; ++i) {
            taskData->leadingWall[i] = platform->leftWall[i];
        }
        break;
    }
}

static void BlackthornGymmick_GetNextLeadingWallCoordinates(const int dim, BlackthornGymMovePlatformTaskData *taskData) {
    switch (taskData->moveDirection) {
    case 0:
        BlackthornGymmick_ApplyXTranslation(1, dim, taskData->leadingWall);
        break;
    case 1:
        BlackthornGymmick_ApplyZTranslation(1, dim, taskData->leadingWall);
        break;
    case 2:
        BlackthornGymmick_ApplyXTranslation(-1, dim, taskData->leadingWall);
        break;
    case 3:
        BlackthornGymmick_ApplyZTranslation(-1, dim, taskData->leadingWall);
        break;
    }
}

static int BlackthornGymmick_GetMoveDirection(u8 rotation, u8 direction) {
    u8 addend;
    if (direction == 0) {
        addend = 0;
    } else {
        addend = 2;
    }
    return (addend + rotation) % 4;
}

static void BlackthornGymmick_DirectionToVec(int directionId, VecFx32 *directionVec) {
    directionVec->x = 0;
    directionVec->y = 0;
    directionVec->z = 0;

    switch (directionId) {
    case 0:
        directionVec->x = 8 * FX32_ONE;
        break;
    case 1:
        directionVec->z = 8 * FX32_ONE;
        break;
    case 2:
        directionVec->x = -8 * FX32_ONE;
        break;
    case 3:
        directionVec->z = -8 * FX32_ONE;
        break;
    }
}

static u8 BlackthornGymmick_CheckWallCollision(FieldSystem *fieldSystem, const u8 dim, const BlackthornGymXZPoint *const points) {
    u8 ret = 0xFF;

    for (int i = 0; i < dim; ++i) {
        if (sub_020548C0(fieldSystem, points[i].x, points[i].z)) {
            ret = i;
            break;
        }
        if (!MetatileBehavior_IsMagma(GetMetatileBehavior(fieldSystem, points[i].x, points[i].z))) {
            ret = i;
            break;
        }
    }
    return ret;
}

static u16 BlackthornGymmick_GetMaxRotationExtent(FieldSystem *fieldSystem, const u8 dim, const BlackthornGymXZPoint *const points, const u8 *const extentDat) {
    u16 ret = 0x4000; // 90º

    for (int i = 0; i < dim; ++i) {
        BOOL isBonk = sub_020548C0(fieldSystem, points[i].x, points[i].z);
        if (!isBonk) {
            isBonk = !MetatileBehavior_IsMagma(GetMetatileBehavior(fieldSystem, points[i].x, points[i].z));
        }
        if (isBonk) {
            int val = extentDat[i] << 8;
            if (val < 0x4000) {
                ret = val;
                break;
            }
        }
    }

    return ret;
}

static BOOL Task_BlackthornGymmick_MovePlatform(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    BlackthornGymMovePlatformTaskData *taskData = TaskManager_GetEnvironment(taskman);
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;

    switch (taskData->state) {
    case STATE_MOVE_INIT:
        BlackthornGymmick_GetCurrentLeadingWallCoordinates(&localData->platforms[taskData->platformIdx], taskData);
        SysTask_CreateOnMainQueue(SysTask_BlackthornGymmick_MovePlatform, taskData, 0);
        taskData->state = STATE_MOVE_CHECK;
        break;
    case STATE_MOVE_APPLY: {
        VecFx32 platformPos;
        MapProp_GetTranslation(&platformPos, MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID));
        int x = platformPos.x / (16 * FX32_ONE);
        int z = platformPos.z / (16 * FX32_ONE);
        BlackthornGymmickPlatformData *platform = &localData->platforms[taskData->platformIdx];
        GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_BLACKTHORN);
        gymmickUnion->blackthorn.x[taskData->platformIdx] = x;
        gymmickUnion->blackthorn.z[taskData->platformIdx] = z;
        BlackthornPlatform_Init(taskData->platformIdx, platform->rotation, x, z, platform);
        taskData->state = STATE_MOVE_FINISH;
    } break;
    case STATE_MOVE_FINISH:
        StopSE(SEQ_SE_GS_GONDORA_IDOU, 0);
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

static BOOL Task_BlackthornGymmick_RotatePlatform(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    BlackthornGymMovePlatformTaskData *taskData = TaskManager_GetEnvironment(taskman);
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;

    switch (taskData->state) {
    case STATE_ROTATE_INIT: {
        BlackthornGymmickPlatformData *platform = &localData->platforms[taskData->platformIdx];
        taskData->moveStepTimer = 0;
        u16 rotateExtent;
        BlackthornPlatformRotationBonkState response = ov04_02255CBC(fieldSystem, platform, &rotateExtent);
        if (response == ROTATE_BONK_OK) {
            taskData->state = STATE_ROTATE_RUN;
        } else if (response == ROTATE_BONK_PARTIAL_GO) {
            VecFx32 *pRot = MapProp_GetRotation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID));
            taskData->rotateExtent = rotateExtent;
            taskData->initY = pRot->y;
            taskData->rotatePos = 0;
            taskData->state = STATE_ROTATE_BONK;
            PlaySE(SEQ_SE_GS_GONDORA_KABEHIT);
        } else {
            taskData->state = STATE_ROTATE_FINISH;
        }
    } break;
    case STATE_ROTATE_RUN: {
        VecFx32 *pRot = MapProp_GetRotation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID));
        pRot->y -= FX32_CONST(0.25);
        ++taskData->moveStepTimer;
        if (taskData->moveStepTimer >= 16) {
            BlackthornGymmickPlatformData *platform = &localData->platforms[taskData->platformIdx];
            taskData->moveStepTimer = 0;
            GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_BLACKTHORN);
            gymmickUnion->blackthorn.rot[taskData->platformIdx] = (gymmickUnion->blackthorn.rot[taskData->platformIdx] + 1) % 4;
            platform->rotation = gymmickUnion->blackthorn.rot[taskData->platformIdx];
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            int playerX = MapObject_GetXCoord(playerObject);
            int playerZ = MapObject_GetZCoord(playerObject);
            BlackthornPlatform_ApplyRotation(1, playerX, playerZ, platform);
            taskData->state = STATE_ROTATE_FINISH;
        }
    } break;
    case STATE_ROTATE_BONK: {
        VecFx32 *pRot = MapProp_GetRotation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID));
        pRot->y -= FX32_CONST(0.25);
        taskData->rotatePos += FX32_CONST(0.25);
        if (taskData->rotatePos >= taskData->rotateExtent) {
            pRot->y = taskData->initY - taskData->rotateExtent;
            taskData->state = STATE_ROTATE_BONK_RETURN;
        }
    } break;
    case STATE_ROTATE_BONK_RETURN: {
        VecFx32 *pRot = MapProp_GetRotation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID));
        pRot->y += FX32_CONST(0.25);
        taskData->rotatePos -= FX32_CONST(0.25);
        if (taskData->rotatePos <= 0) {
            pRot->y = taskData->initY;
            taskData->state = STATE_ROTATE_FINISH;
        }
    } break;
    case STATE_ROTATE_FINISH:
        StopSE(SEQ_SE_GS_GONDORA_IDOU, 0);
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

static BlackthornPlatformRotationBonkState ov04_02255CBC(FieldSystem *fieldSystem, BlackthornGymmickPlatformData *platform, u16 *out) {
    u8 rightWallMinus1 = platform->width - 1;
    if (BlackthornGymmick_CheckWallCollision(fieldSystem, platform->width, platform->bottomWall) != 0xFF) {
        return ROTATE_BONK_NO_GO;
    }
    if (BlackthornGymmick_CheckWallCollision(fieldSystem, platform->width, platform->topWall) != 0xFF) {
        return ROTATE_BONK_NO_GO;
    }
    if (BlackthornGymmick_CheckWallCollision(fieldSystem, platform->height, platform->leftWall) != 0xFF) {
        return ROTATE_BONK_NO_GO;
    }
    if (BlackthornGymmick_CheckWallCollision(fieldSystem, rightWallMinus1, platform->rightWall) != 0xFF) {
        return ROTATE_BONK_NO_GO;
    }
    u16 r0 = BlackthornGymmick_GetMaximumRotationAngle(fieldSystem, platform);
    if (r0 < 0x4000) {
        *out = r0;
        return ROTATE_BONK_PARTIAL_GO;
    }
    return ROTATE_BONK_OK;
}

static u16 BlackthornGymmick_GetMaximumRotationAngle(FieldSystem *fieldSystem, BlackthornGymmickPlatformData *platform) {
    u8 areaDim;
    u8 leadingEdgeDim;
    const u8 *rotateExtentByPoint_MainArea;
    const u8 *rotateExtentByPoint_LeadingEdge;

    if (platform->shape == 0) {
        areaDim = PLATFORM_TYPE_0_AREA;
        rotateExtentByPoint_MainArea = sMainAreaRotationExtents_Type0;
        rotateExtentByPoint_LeadingEdge = sLeadingEdgeRotationExtents_Type0;
    } else {
        areaDim = PLATFORM_TYPE_1_AREA;
        rotateExtentByPoint_MainArea = sMainAreaRotationExtents_Type1;
        rotateExtentByPoint_LeadingEdge = sLeadingEdgeRotationExtents_Type1;
    }
    leadingEdgeDim = platform->width;
    u16 rotationExtent_MainArea = BlackthornGymmick_GetMaxRotationExtent(fieldSystem, areaDim, platform->rotateCollisionCheck, rotateExtentByPoint_MainArea);
    u16 rotationExtent_LeadingEdge = BlackthornGymmick_GetMaxRotationExtent(fieldSystem, leadingEdgeDim, platform->rightEdgeOuter, rotateExtentByPoint_LeadingEdge);
    if (rotationExtent_MainArea <= rotationExtent_LeadingEdge) {
        rotationExtent_LeadingEdge = rotationExtent_MainArea;
    }
    return rotationExtent_LeadingEdge;
}

static void SysTask_BlackthornGymmick_MovePlatform(SysTask *task, void *data) {
    BlackthornGymMovePlatformTaskData *taskData = data;
    FieldSystem *fieldSystem = taskData->fieldSystem;
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;

    switch (taskData->state) {
    case STATE_MOVE_CHECK:
        taskData->moveStepTimer = 0;
        if (BlackthornGymmick_CheckWallCollision(fieldSystem, localData->platforms[taskData->platformIdx].height, taskData->leadingWall) == 255) {
            taskData->state = STATE_MOVE_RUN;
        } else {
            taskData->state = STATE_MOVE_BONK_START;
        }
        break;
    case STATE_MOVE_RUN: {
        MapProp *mapProp = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID);
        VecFx32 sp34;
        MapProp_GetTranslation(&sp34, mapProp);
        VEC_Add(&sp34, &taskData->moveVector, &sp34);
        MapProp_SetTranslation(mapProp, &sp34);
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        VecFx32 sp28;
        MapObject_CopyPositionVector(playerObject, &sp28);
        VEC_Add(&sp28, &taskData->moveVector, &sp28);
        MapObject_SetPositionVector(playerObject, &sp28);
        ++taskData->moveStepTimer;
        if (taskData->moveStepTimer >= 2) {
            taskData->moveStepTimer = 0;
            BlackthornGymmick_GetNextLeadingWallCoordinates(localData->platforms[taskData->platformIdx].height, taskData);
            ++taskData->moveStepCount;
            if (taskData->moveStepCount >= taskData->moveDistance) {
                VecFx32 sp1C;
                MapObject_CopyPositionVector(playerObject, &sp1C);
                MapObject_SetCurrentX(playerObject, sp1C.x / (16 * FX32_ONE));
                MapObject_SetCurrentZ(playerObject, sp1C.z / (16 * FX32_ONE));
                sub_02060F78(playerObject);
                SysTask_Destroy(task);
                taskData->state = STATE_MOVE_APPLY;
            } else {
                taskData->state = STATE_MOVE_CHECK;
            }
        }
    } break;
    case STATE_MOVE_BONK_START:
        PlaySE(SEQ_SE_GS_GONDORA_KABEHIT);
        taskData->state = STATE_MOVE_BONK_CHECK;
        break;
    case STATE_MOVE_BONK_CHECK:
        if (taskData->moveStepCount == 0) {
            SysTask_Destroy(task);
            taskData->state = STATE_MOVE_FINISH;
        } else {
            taskData->moveVector.x *= -1;
            taskData->moveVector.z *= -1;
            taskData->state = STATE_MOVE_BONK_RETURN;
        }
        break;
    case STATE_MOVE_BONK_RETURN: {
        MapProp *mapProp = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->platforms[taskData->platformIdx].mapPropID);
        VecFx32 sp10;
        MapProp_GetTranslation(&sp10, mapProp);
        VEC_Add(&sp10, &taskData->moveVector, &sp10);
        MapProp_SetTranslation(mapProp, &sp10);
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        VecFx32 sp04;
        MapObject_CopyPositionVector(playerObject, &sp04);
        VEC_Add(&sp04, &taskData->moveVector, &sp04);
        MapObject_SetPositionVector(playerObject, &sp04);
        ++taskData->moveStepTimer;
        if (taskData->moveStepTimer >= 2) {
            taskData->moveStepTimer = 0;
            --taskData->moveStepCount;
            if (taskData->moveStepCount == 0) {
                SysTask_Destroy(task);
                taskData->state = STATE_MOVE_FINISH;
            }
        }
    } break;
    }
}
