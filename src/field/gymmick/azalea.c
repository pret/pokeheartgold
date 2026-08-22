#include "field/map_load_manager.h"
#include "field/overlay_01_021FB878.h"
#include "field/overlay_01_02204004.h"

#include "field_system.h"
#include "follow_mon.h"
#include "overlay_01.h"
#include "overlay_01_022053EC.h"
#include "overlay_04.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_0205FD20.h"
#include "unk_02062108.h"

typedef struct AzaleaGymmickSpinarakRouteNode {
    u16 x;
    u16 z;
} AzaleaGymmickSpinarakRouteNode;

typedef struct AzaleaGymmickSpinarakRoute {
    u16 length;
    u16 destination;
    const AzaleaGymmickSpinarakRouteNode *route;
} AzaleaGymmickSpinarakRoute;

typedef struct AzaleaGymmickSpinarakRideData {
    int state;
    FieldSystem *fieldSystem;
} AzaleaGymmickSpinarakRideData; // size: 0x08

typedef struct AzaleaGymmickLocalData {
    u8 filler_00[4];
    int spinarakMapPropIds[4];
    u8 nodeIdx;
    u8 switchState;
    u8 segmentDone;
    u8 spiderIdx;
    u8 spinarakPair;
    u8 spinarakDirection;
    u8 curNodeIndex;
    s8 playerZOffset;
    int mustResetTargetTrack;
    BOOL moveVectorComponentSigns[2];
    const AzaleaGymmickSpinarakRouteNode *node;
    VecFx32 spinarakPos;
    VecFx32 moveVector;
    int shakeCount;
    int shakeFrame;
    fx32 shakeDirection;
    int terminalWaitCounter;
} AzaleaGymmickLocalData; // size: 0x54

static BOOL Task_SpinarakRide(TaskManager *taskman);
static VecFx32 AzaleaGymmick_GetVectorBetweenRouteNodes(const AzaleaGymmickSpinarakRouteNode *prev, const AzaleaGymmickSpinarakRouteNode *next);
static void AzaleaGymmick_GetSignsOfVectorXZComponents(const VecFx32 *deltaVec, BOOL *xzSigns);
static int AzaleaGymmick_GetMovementDoneParams(BOOL sign, fx32 cur, fx32 delta, u16 nodeComponent);
static void SysTask_DoSpinarakRide(SysTask *sysTask, void *taskData);
static BOOL Task_WaitSwitchFlipSFX(TaskManager *taskman);

// FIXME: clang-format is misbehaving on these data
static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_1to5[] = {
    { 3,  31 },
    { 3,  29 },
    { 9,  29 },
    { 9,  27 },
    { 15, 28 },
    { 15, 25 },
    { 9,  25 },
    { 9,  24 },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_2to6[] = {
    { 9,  31 },
    { 9,  29 },
    { 3,  29 },
    { 3,  27 },
    { 9,  26 },
    { 9,  25 },
    { 15, 25 },
    { 15, 24 },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_3to4[] = {
    { 15, 31 },
    { 15, 28 },
    { 9,  27 },
    { 9,  26 },
    { 3,  27 },
    { 3,  24 },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_7to10[] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 10 },
    { 3, 10 },
    { 3, 9  },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_7to11[] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 9  },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_8to10[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  10 },
    { 3,  10 },
    { 3,  9  },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_8to12[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 9  },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakRoute_8to11[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  9  },
};

static const AzaleaGymmickSpinarakRouteNode sSpinarakInitialPositions[] = {
    { 3,  31 },
    { 9,  31 },
    { 15, 31 },
    { 3,  24 },
    { 9,  24 },
    { 15, 24 },
    { 3,  16 },
    { 9,  16 },
    { 15, 16 },
    { 3,  9  },
    { 9,  9  },
    { 15, 9  },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From1[] = {
    { NELEMS(sSpinarakRoute_1to5), 4, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 4, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 4, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 4, sSpinarakRoute_1to5 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From2[] = {
    { NELEMS(sSpinarakRoute_2to6), 5, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 5, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 5, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 5, sSpinarakRoute_2to6 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From3[] = {
    { NELEMS(sSpinarakRoute_3to4), 3, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 3, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 3, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 3, sSpinarakRoute_3to4 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From4[] = {
    { NELEMS(sSpinarakRoute_3to4), 2, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 2, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 2, sSpinarakRoute_3to4 },
    { NELEMS(sSpinarakRoute_3to4), 2, sSpinarakRoute_3to4 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From5[] = {
    { NELEMS(sSpinarakRoute_1to5), 0, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 0, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 0, sSpinarakRoute_1to5 },
    { NELEMS(sSpinarakRoute_1to5), 0, sSpinarakRoute_1to5 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From6[] = {
    { NELEMS(sSpinarakRoute_2to6), 1, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 1, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 1, sSpinarakRoute_2to6 },
    { NELEMS(sSpinarakRoute_2to6), 1, sSpinarakRoute_2to6 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From7[] = {
    {},
    { NELEMS(sSpinarakRoute_7to10), 9, sSpinarakRoute_7to10 },
    {},
    { NELEMS(sSpinarakRoute_7to11), 10, sSpinarakRoute_7to11 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From8[] = {
    { NELEMS(sSpinarakRoute_8to10), 9,  sSpinarakRoute_8to10 },
    { NELEMS(sSpinarakRoute_8to12), 11, sSpinarakRoute_8to12 },
    { NELEMS(sSpinarakRoute_8to11), 10, sSpinarakRoute_8to11 },
    { NELEMS(sSpinarakRoute_8to12), 11, sSpinarakRoute_8to12 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From9[] = {
    {},
    {},
    {},
    {},
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From10[] = {
    { NELEMS(sSpinarakRoute_8to10), 7, sSpinarakRoute_8to10 },
    { NELEMS(sSpinarakRoute_7to10), 6, sSpinarakRoute_7to10 },
    {},
    {},
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From11[] = {
    {},
    {},
    { NELEMS(sSpinarakRoute_8to11), 7, sSpinarakRoute_8to11 },
    { NELEMS(sSpinarakRoute_7to11), 6, sSpinarakRoute_7to11 },
};

static const AzaleaGymmickSpinarakRoute sSpinarakRoutes_From12[] = {
    {},
    { NELEMS(sSpinarakRoute_8to12), 7, sSpinarakRoute_8to12 },
    {},
    { NELEMS(sSpinarakRoute_8to12), 7, sSpinarakRoute_8to12 },
};

static const AzaleaGymmickSpinarakRoute *const sSpinarakRoutes_Froms[] = {
    sSpinarakRoutes_From1,
    sSpinarakRoutes_From2,
    sSpinarakRoutes_From3,
    sSpinarakRoutes_From4,
    sSpinarakRoutes_From5,
    sSpinarakRoutes_From6,
    sSpinarakRoutes_From7,
    sSpinarakRoutes_From8,
    sSpinarakRoutes_From9,
    sSpinarakRoutes_From10,
    sSpinarakRoutes_From11,
    sSpinarakRoutes_From12,
};

void GymmickInit_Azalea(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(AzaleaGymmickLocalData));
    MI_CpuFill8(fieldSystem->unk4->unk24, 0, sizeof(AzaleaGymmickLocalData));
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (int i = 0; i < 4; ++i) {
        VecFx32 spinarakPos = { 0, 0, 0 };
        u8 spider = gymmickUnion->azalea.spiders[i];
        spinarakPos.x = sSpinarakInitialPositions[spider].x * 16 * FX32_ONE;
        spinarakPos.x += FX32_CONST(8);
        spinarakPos.z = sSpinarakInitialPositions[spider].z * 16 * FX32_ONE;
        localData->spinarakMapPropIds[i] = MapPropManager_LoadOne(fieldSystem->mapPropManager, 118, &spinarakPos, 0, fieldSystem->mapPropAnimationManager);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        MapPropAnimationManager_AddAnimationToRenderObj(115, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(116, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(122, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(117, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117)->renderObj, fieldSystem->mapPropAnimationManager);
        break;
    case 1:
        MapPropAnimationManager_AddAnimationToRenderObj(115, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(116, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(122, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(117, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117)->renderObj, fieldSystem->mapPropAnimationManager);
        break;
    case 2:
        MapPropAnimationManager_AddAnimationToRenderObj(115, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(116, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(122, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(117, 0, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117)->renderObj, fieldSystem->mapPropAnimationManager);
        break;
    case 3:
        MapPropAnimationManager_AddAnimationToRenderObj(115, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(116, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(122, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122)->renderObj, fieldSystem->mapPropAnimationManager);
        MapPropAnimationManager_AddAnimationToRenderObj(117, 1, TRUE, &Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117)->renderObj, fieldSystem->mapPropAnimationManager);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void FlipAzaleaGymSwitch(FieldSystem *fieldSystem, u8 switchNo) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    UnkStruct_FieldSysC0_SubC *switch1;
    UnkStruct_FieldSysC0_SubC *switch2;
    u8 switchStateBefore;

    PlaySE(SEQ_SE_DP_KI_GASYAN);
    if (switchNo == 0) {
        switchStateBefore = (gymmickUnion->azalea.switches >> 0) & 1;
        gymmickUnion->azalea.switches ^= (1 << 0);
        switch1 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116);
        switch2 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &switch1->renderObj, 116, switchStateBefore);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &switch2->renderObj, 117, switchStateBefore);
        u8 r0 = (gymmickUnion->azalea.switches >> 0) & 1;
        if (r0) {
            MapPropAnimationManager_AddAnimationToRenderObj(116, 1, 1, &switch1->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(117, 1, 1, &switch2->renderObj, fieldSystem->mapPropAnimationManager);
        } else {
            MapPropAnimationManager_AddAnimationToRenderObj(116, 0, 1, &switch1->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(117, 0, 1, &switch2->renderObj, fieldSystem->mapPropAnimationManager);
        }
    } else if (switchNo == 1) {
        switchStateBefore = (gymmickUnion->azalea.switches >> 1) & 1;
        gymmickUnion->azalea.switches ^= (1 << 1);
        switch1 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115);
        switch2 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &switch1->renderObj, 115, switchStateBefore);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &switch2->renderObj, 122, switchStateBefore);
        u8 switchStateAfter = (gymmickUnion->azalea.switches >> 1) & 1;
        if (switchStateAfter) {
            MapPropAnimationManager_AddAnimationToRenderObj(115, 1, 1, &switch1->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(122, 1, 1, &switch2->renderObj, fieldSystem->mapPropAnimationManager);
        } else {
            MapPropAnimationManager_AddAnimationToRenderObj(115, 0, 1, &switch1->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(122, 0, 1, &switch2->renderObj, fieldSystem->mapPropAnimationManager);
        }
    } else {
        GF_ASSERT(FALSE);
    }
    TaskManager_Call(fieldSystem->taskman, Task_WaitSwitchFlipSFX, NULL);
}

void BeginAzaleaGymSpinarakRide(FieldSystem *fieldSystem, u8 spinarakNo) {
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    AzaleaGymmickSpinarakRideData *rideData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(AzaleaGymmickSpinarakRideData));
    rideData->state = 0;
    rideData->fieldSystem = fieldSystem;
    localData->spinarakPair = spinarakNo;
    localData->spinarakPos.y = 0;
    localData->nodeIdx = 0;
    localData->segmentDone = TRUE;
    localData->mustResetTargetTrack = FALSE;

    int spiderIdx;
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    localData->switchState = gymmickUnion->azalea.switches;
    for (spiderIdx = 0; spiderIdx < 4; ++spiderIdx) {
        if (spinarakNo == gymmickUnion->azalea.spiders[spiderIdx]) {
            localData->spiderIdx = spiderIdx;
            break;
        }
    }
    if (spiderIdx == 4) {
        GF_ASSERT(FALSE);
        return;
    }
    switch (spinarakNo) {
    case 3:
    case 4:
    case 5:
    case 9:
    case 10:
    case 11:
        localData->spinarakDirection = 1;
        localData->curNodeIndex = sSpinarakRoutes_Froms[spinarakNo][localData->switchState].length - 1;
        localData->playerZOffset = 1;
        break;
    default:
        localData->spinarakDirection = 0;
        localData->curNodeIndex = 0;
        localData->playerZOffset = 0;
        break;
    }
    const AzaleaGymmickSpinarakRouteNode *ptr = &sSpinarakRoutes_Froms[spinarakNo][localData->switchState].route[localData->curNodeIndex];
    localData->spinarakPos.x = ptr->x * FX32_ONE * 16;
    localData->spinarakPos.z = ptr->z * FX32_ONE * 16;
    TaskManager_Call(fieldSystem->taskman, Task_SpinarakRide, rideData);
}

static BOOL Task_SpinarakRide(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    AzaleaGymmickSpinarakRideData *rideData = TaskManager_GetEnvironment(taskman);

    switch (rideData->state) {
    case 0:
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++rideData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(SysTask_DoSpinarakRide, rideData, 0);
        ++rideData->state;
        break;
    case 10:
        Heap_Free(rideData);
        return TRUE;
    }

    return FALSE;
}

static VecFx32 AzaleaGymmick_GetVectorBetweenRouteNodes(const AzaleaGymmickSpinarakRouteNode *prev, const AzaleaGymmickSpinarakRouteNode *next) {
    VecFx32 ret;

    ret.x = (next->x - prev->x) * FX32_ONE;
    ret.z = (next->z - prev->z) * FX32_ONE;
    ret.y = 0;
    return ret;
}

static void AzaleaGymmick_GetSignsOfVectorXZComponents(const VecFx32 *deltaVec, BOOL *xzSigns) {
    if (deltaVec->x >= 0) {
        xzSigns[0] = TRUE;
    } else {
        xzSigns[0] = FALSE;
    }
    if (deltaVec->z >= 0) {
        xzSigns[1] = TRUE;
    } else {
        xzSigns[1] = FALSE;
    }
}

static int AzaleaGymmick_GetMovementDoneParams(BOOL sign, fx32 cur, fx32 delta, u16 nodeComponent) {
    int ret = 0;
    fx32 nodeComponentFx = nodeComponent * FX32_ONE * 16;
    if (cur + delta == nodeComponentFx) {
        ret = 1;
    } else if (sign) {
        if (cur + delta > nodeComponentFx) {
            ret = 2;
        }
    } else {
        if (cur + delta < nodeComponentFx) {
            ret = 2;
        }
    }
    return ret;
}

void GymmickFree_Azalea(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

static void SysTask_DoSpinarakRide(SysTask *sysTask, void *taskData) {
    AzaleaGymmickSpinarakRideData *rideData = taskData;
    FieldSystem *fieldSystem = rideData->fieldSystem;
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    switch (rideData->state) {
    case 2:
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);

            if (localData->spinarakDirection) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
                MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_DOWN);
            } else {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
                MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_UP);
            }
        } else {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);

            if (localData->spinarakDirection) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
            } else {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
            }
        }
        ++rideData->state;
    case 3: {
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObject) && MapObject_AreBitsSetForMovementScriptInit(followMonObject)) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_UNK_73);
                localData->terminalWaitCounter = 0;
                ++rideData->state;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObject)) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_UNK_73);
                localData->terminalWaitCounter = 0;
                ++rideData->state;
            }
        }
        break;
    }
    case 4:
        if (localData->terminalWaitCounter++ >= 4) {
            MapProp *mapProp = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->spiderIdx);
            NNSG3dResTex *tex = ov01_021FB9E0(fieldSystem->areaDataManager);
            NNSG3dRenderObj *renderObj = MapProp_GetRenderSurface(mapProp);
            NNSG3dResMdl *mdl = MapProp_GetResModel(mapProp);
            MapPropOneShotAnimationManager_LoadPropAnimations(fieldSystem->mapPropAnimationManager, fieldSystem->mapPropOneShotAnimationManager, 1, 118, renderObj, mdl, tex, 1, 255, FALSE);
            MapPropOneShotAnimationManager_PlayAnimation(fieldSystem->mapPropOneShotAnimationManager, 1, 0);
            PlaySE(SEQ_SE_GS_ITOMARU_ROBO);
            ++rideData->state;
        }
        break;
    case 5: {
        u16 spinarakPair;
        int length;
        int switchState;
        const AzaleaGymmickSpinarakRouteNode *prevNode;
        int xDoneState;
        int zDoneState;

        spinarakPair = localData->spinarakPair;
        switchState = localData->switchState;
        if (localData->segmentDone) {
            fx32 xComponent;
            if (localData->spinarakDirection) {
                prevNode = &sSpinarakRoutes_Froms[spinarakPair][switchState].route[localData->curNodeIndex];
                localData->node = &sSpinarakRoutes_Froms[spinarakPair][switchState].route[localData->curNodeIndex - 1];
            } else {
                prevNode = &sSpinarakRoutes_Froms[spinarakPair][switchState].route[localData->curNodeIndex];
                localData->node = &sSpinarakRoutes_Froms[spinarakPair][switchState].route[localData->curNodeIndex + 1];
            }
            localData->moveVector = AzaleaGymmick_GetVectorBetweenRouteNodes(prevNode, localData->node);
            AzaleaGymmick_GetSignsOfVectorXZComponents(&localData->moveVector, localData->moveVectorComponentSigns);
            VEC_Normalize(&localData->moveVector, &localData->moveVector);

            VecFx32 xOne = { FX32_ONE, 0, 0 };
            xComponent = VEC_DotProduct(&localData->moveVector, &xOne);

            VecFx32 zero = { 0, 0, 0 };
            VEC_MultAdd(FX32_CONST(2), &localData->moveVector, &zero, &localData->moveVector);

            if (localData->mustResetTargetTrack == FALSE && xComponent != 0 && xComponent != FX32_ONE) {
                localData->mustResetTargetTrack = TRUE;
                MapLoadManager_ForgetTrackedTarget(fieldSystem->mapLoadManager);
            } else if (localData->mustResetTargetTrack == TRUE) {
                localData->mustResetTargetTrack = FALSE;
                MapLoadManager_TrackTarget(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem->mapLoadManager);
            }
            localData->segmentDone = FALSE;
        }
        xDoneState = AzaleaGymmick_GetMovementDoneParams(localData->moveVectorComponentSigns[0], localData->spinarakPos.x, localData->moveVector.x, localData->node->x);
        zDoneState = AzaleaGymmick_GetMovementDoneParams(localData->moveVectorComponentSigns[1], localData->spinarakPos.z, localData->moveVector.z, localData->node->z);
        if (xDoneState == 2) {
            localData->moveVector.x = 0;
        }
        if (zDoneState == 2) {
            localData->moveVector.z = 0;
        }
        if (xDoneState != 0 && zDoneState != 0) {
            localData->spinarakPos.x = localData->node->x * 16 * FX32_ONE;
            localData->spinarakPos.z = localData->node->z * 16 * FX32_ONE;
            ++localData->nodeIdx;
            length = sSpinarakRoutes_Froms[spinarakPair][switchState].length;
            if (localData->nodeIdx >= length - 1) {
                GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
                gymmickUnion->azalea.spiders[localData->spiderIdx] = sSpinarakRoutes_Froms[spinarakPair][switchState].destination;
                MapPropOneShotAnimationManager_UnloadAnimation(fieldSystem->mapPropAnimationManager, fieldSystem->mapPropOneShotAnimationManager, 1);
                StopSE(SEQ_SE_GS_ITOMARU_ROBO, 1);
                ++rideData->state;
            } else {
                if (localData->spinarakDirection) {
                    --localData->curNodeIndex;
                } else {
                    ++localData->curNodeIndex;
                }
                localData->segmentDone = TRUE;
            }
        } else {
            VEC_Add(&localData->spinarakPos, &localData->moveVector, &localData->spinarakPos);
        }
        MapProp *spinarakMapProp = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->spinarakMapPropIds[localData->spiderIdx]);
        VecFx32 spinarakPos = localData->spinarakPos;
        spinarakPos.x += FX32_CONST(8);
        MapProp_SetTranslation(spinarakMapProp, &spinarakPos);

        VecFx32 playerPos;
        VecFx32 playerSpinarakOffset = { 8 * FX32_ONE, 0, 8 * FX32_ONE };
        playerPos = localData->spinarakPos;
        VEC_Add(&playerPos, &playerSpinarakOffset, &playerPos);
        playerPos.z += localData->playerZOffset * 16 * FX32_ONE;
        MapObject_SetPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &playerPos);
        if (FollowMon_IsActive(fieldSystem)) {
            s8 followMonZOffset = 1 - localData->playerZOffset;
            VecFx32 followMonPos = localData->spinarakPos;
            VEC_Add(&followMonPos, &playerSpinarakOffset, &followMonPos);
            followMonPos.z += followMonZOffset * 16 * FX32_ONE;
            MapObject_SetPositionVector(FollowMon_GetMapObject(fieldSystem), &followMonPos);
        }
        break;
    }
    case 6: {
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        MapObject_SetCurrentX(playerObject, localData->node->x);
        MapObject_SetCurrentY(playerObject, 0);
        MapObject_SetCurrentZ(playerObject, localData->node->z + localData->playerZOffset);
        sub_02060F78(playerObject);
        MapObject_SetHeldMovement(playerObject, MOVEMENT_UNK_74);
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
            MapObject_SetCurrentX(followMonObject, localData->node->x);
            MapObject_SetCurrentY(followMonObject, 0);
            MapObject_SetCurrentZ(followMonObject, localData->node->z + (1 - localData->playerZOffset));
            sub_02060F78(followMonObject);
        }
        localData->shakeCount = 0;
        localData->shakeFrame = 0;
        if (PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar) == DIR_SOUTH) {
            localData->shakeDirection = FX32_ONE;
        } else {
            localData->shakeDirection = -FX32_ONE;
        }
        ++rideData->state;
        break;
    }
    case 7: {
        VecFx32 cameraLookDelta = { 0, 0, 0 };
        cameraLookDelta.z = localData->shakeDirection;
        if (localData->shakeFrame++ == 0) {
            Camera_OffsetLookAtPosAndTarget(&cameraLookDelta, fieldSystem->camera);
            ++localData->shakeCount;
        } else if (localData->shakeFrame > 1) {
            localData->shakeFrame = 0;
            localData->shakeDirection *= -1;
        }
        if (localData->shakeCount >= 4) {
            localData->terminalWaitCounter = 0;
            ++rideData->state;
        }
        break;
    }
    case 8:
        if (localData->terminalWaitCounter++ >= 8) {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            if (FollowMon_IsActive(fieldSystem)) {
                LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
                if (localData->spinarakDirection) {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
                    MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_DOWN);
                } else {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
                    MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_UP);
                }
            } else {
                if (localData->spinarakDirection) {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
                } else {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
                }
            }
            ++rideData->state;
        }
        break;
    case 9: {
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObject) && MapObject_AreBitsSetForMovementScriptInit(followMonObject)) {
                MapObject_ClearHeldMovement(followMonObject);
                SysTask_Destroy(sysTask);
                ++rideData->state;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObject)) {
                SysTask_Destroy(sysTask);
                ++rideData->state;
            }
        }
        break;
    }
    }
}

static BOOL Task_WaitSwitchFlipSFX(TaskManager *taskman) {
    return !IsSEPlaying(SEQ_SE_DP_KI_GASYAN);
}
