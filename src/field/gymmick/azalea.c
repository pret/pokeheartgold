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
    int unk_04[4];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 unk_18;
    u8 unk_19;
    u8 unk_1A;
    s8 unk_1B;
    int unk_1C;
    BOOL unk_20[2];
    const AzaleaGymmickSpinarakRouteNode *unk_28;
    VecFx32 unk_2C;
    VecFx32 unk_38;
    int unk_44;
    int unk_48;
    fx32 unk_4C;
    int unk_50;
} AzaleaGymmickLocalData; // size: 0x54

BOOL ov04_0225463C(TaskManager *taskman);
VecFx32 ov04_02254698(const AzaleaGymmickSpinarakRouteNode *a0, const AzaleaGymmickSpinarakRouteNode *a1);
void ov04_022546C8(const VecFx32 *a0, BOOL *a1);
int ov04_022546E8(int a0, fx32 a1, fx32 a2, BOOL a3);
void ov04_02254724(SysTask *sysTask, void *taskData);
BOOL ov04_02254CA4(TaskManager *taskman);

// FIXME: clang-format is misbehaving on these data
// clang-format off
static const AzaleaGymmickSpinarakRouteNode ov04_02257404[] = {
    { 3,  31 },
    { 3,  29 },
    { 9,  29 },
    { 9,  27 },
    { 15, 28 },
    { 15, 25 },
    { 9,  25 },
    { 9,  24 },
};

static const AzaleaGymmickSpinarakRouteNode ov04_02257584[] = {
    { 9,  31 },
    { 9,  29 },
    { 3,  29 },
    { 3,  27 },
    { 9,  26 },
    { 9,  25 },
    { 15, 25 },
    { 15, 24 },
};

static const AzaleaGymmickSpinarakRouteNode ov04_0225737C[] = {
    { 15, 31 },
    { 15, 28 },
    { 9,  27 },
    { 9,  26 },
    { 3,  27 },
    { 3,  24 },
};

static const AzaleaGymmickSpinarakRouteNode ov04_02257394[] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 10 },
    { 3, 10 },
    { 3, 9  },
};

static const AzaleaGymmickSpinarakRouteNode ov04_0225736C[] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 9  },
};

static const AzaleaGymmickSpinarakRouteNode ov04_02257504[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  10 },
    { 3,  10 },
    { 3,  9  },
};

static const AzaleaGymmickSpinarakRouteNode ov04_0225735C[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 9  },
};

static const AzaleaGymmickSpinarakRouteNode ov04_022573AC[] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  9  },
};

static const AzaleaGymmickSpinarakRouteNode ov04_022575D4[] = {
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

static const AzaleaGymmickSpinarakRoute ov04_02257484[] = {
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257464[] = {
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257444[] = {
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257424[] = {
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
};

static const AzaleaGymmickSpinarakRoute ov04_022574A4[] = {
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
};

static const AzaleaGymmickSpinarakRoute ov04_022574C4[] = {
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257524[] = {
    {},
    { NELEMS(ov04_02257394), 9, ov04_02257394 },
    {},
    { NELEMS(ov04_0225736C), 10, ov04_0225736C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257544[] = {
    { NELEMS(ov04_02257504), 9,  ov04_02257504 },
    { NELEMS(ov04_0225735C), 11, ov04_0225735C },
    { NELEMS(ov04_022573AC), 10, ov04_022573AC },
    { NELEMS(ov04_0225735C), 11, ov04_0225735C },
};

static const AzaleaGymmickSpinarakRoute ov04_022573C4[] = {
    {},
    {},
    {},
    {},
};

static const AzaleaGymmickSpinarakRoute ov04_022573E4[] = {
    { NELEMS(ov04_02257504), 7, ov04_02257504 },
    { NELEMS(ov04_02257394), 6, ov04_02257394 },
    {},
    {},
};

static const AzaleaGymmickSpinarakRoute ov04_022574E4[] = {
    {},
    {},
    { NELEMS(ov04_022573AC), 7, ov04_022573AC },
    { NELEMS(ov04_0225736C), 6, ov04_0225736C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257564[] = {
    {},
    { NELEMS(ov04_0225735C), 7, ov04_0225735C },
    {},
    { NELEMS(ov04_0225735C), 7, ov04_0225735C },
};

const AzaleaGymmickSpinarakRoute *const ov04_022575A4[] = {
    ov04_02257484,
    ov04_02257464,
    ov04_02257444,
    ov04_02257424,
    ov04_022574A4,
    ov04_022574C4,
    ov04_02257524,
    ov04_02257544,
    ov04_022573C4,
    ov04_022573E4,
    ov04_022574E4,
    ov04_02257564,
};
// clang-format on

void GymmickInit_Azalea(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(AzaleaGymmickLocalData));
    MI_CpuFill8(fieldSystem->unk4->unk24, 0, sizeof(AzaleaGymmickLocalData));
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (int i = 0; i < 4; ++i) {
        VecFx32 sp4 = { 0, 0, 0 };
        u8 spider = gymmickUnion->azalea.spiders[i];
        sp4.x = ov04_022575D4[spider].x * 16 * FX32_ONE;
        sp4.x += FX32_CONST(8);
        sp4.z = ov04_022575D4[spider].z * 16 * FX32_ONE;
        localData->unk_04[i] = MapPropManager_LoadOne(fieldSystem->mapPropManager, 118, &sp4, 0, fieldSystem->mapPropAnimationManager);
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
    UnkStruct_FieldSysC0_SubC *r7;
    UnkStruct_FieldSysC0_SubC *sp4;
    u8 r6;

    PlaySE(SEQ_SE_DP_KI_GASYAN);
    if (switchNo == 0) {
        r6 = (gymmickUnion->azalea.switches >> 0) & 1;
        gymmickUnion->azalea.switches ^= (1 << 0);
        r7 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116);
        sp4 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &r7->renderObj, 116, r6);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &sp4->renderObj, 117, r6);
        u8 r0 = (gymmickUnion->azalea.switches >> 0) & 1;
        if (r0) {
            MapPropAnimationManager_AddAnimationToRenderObj(116, 1, 1, &r7->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(117, 1, 1, &sp4->renderObj, fieldSystem->mapPropAnimationManager);
        } else {
            MapPropAnimationManager_AddAnimationToRenderObj(116, 0, 1, &r7->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(117, 0, 1, &sp4->renderObj, fieldSystem->mapPropAnimationManager);
        }
    } else if (switchNo == 1) {
        r6 = (gymmickUnion->azalea.switches >> 1) & 1;
        gymmickUnion->azalea.switches ^= (1 << 1);
        r7 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115);
        sp4 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &r7->renderObj, 115, r6);
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &sp4->renderObj, 122, r6);
        u8 r0 = (gymmickUnion->azalea.switches >> 1) & 1;
        if (r0) {
            MapPropAnimationManager_AddAnimationToRenderObj(115, 1, 1, &r7->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(122, 1, 1, &sp4->renderObj, fieldSystem->mapPropAnimationManager);
        } else {
            MapPropAnimationManager_AddAnimationToRenderObj(115, 0, 1, &r7->renderObj, fieldSystem->mapPropAnimationManager);
            MapPropAnimationManager_AddAnimationToRenderObj(122, 0, 1, &sp4->renderObj, fieldSystem->mapPropAnimationManager);
        }
    } else {
        GF_ASSERT(FALSE);
    }
    TaskManager_Call(fieldSystem->taskman, ov04_02254CA4, NULL);
}

void BeginAzaleaGymSpinarakRide(FieldSystem *fieldSystem, u8 spinarakNo) {
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    AzaleaGymmickSpinarakRideData *rideData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(AzaleaGymmickSpinarakRideData));
    rideData->state = 0;
    rideData->fieldSystem = fieldSystem;
    localData->unk_18 = spinarakNo;
    localData->unk_2C.y = 0;
    localData->unk_14 = 0;
    localData->unk_16 = 1;
    localData->unk_1C = 0;

    int spiderIdx;
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    localData->unk_15 = gymmickUnion->azalea.switches;
    for (spiderIdx = 0; spiderIdx < 4; ++spiderIdx) {
        if (spinarakNo == gymmickUnion->azalea.spiders[spiderIdx]) {
            localData->unk_17 = spiderIdx;
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
        localData->unk_19 = 1;
        localData->unk_1A = ov04_022575A4[spinarakNo][localData->unk_15].length - 1;
        localData->unk_1B = 1;
        break;
    default:
        localData->unk_19 = 0;
        localData->unk_1A = 0;
        localData->unk_1B = 0;
        break;
    }
    const AzaleaGymmickSpinarakRouteNode *ptr = &ov04_022575A4[spinarakNo][localData->unk_15].route[localData->unk_1A];
    localData->unk_2C.x = ptr->x * FX32_ONE * 16;
    localData->unk_2C.z = ptr->z * FX32_ONE * 16;
    TaskManager_Call(fieldSystem->taskman, ov04_0225463C, rideData);
}

BOOL ov04_0225463C(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    AzaleaGymmickSpinarakRideData *rideData = TaskManager_GetEnvironment(taskman);

    switch (rideData->state) {
    case 0:
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++rideData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(ov04_02254724, rideData, 0);
        ++rideData->state;
        break;
    case 10:
        Heap_Free(rideData);
        return TRUE;
    }

    return FALSE;
}

VecFx32 ov04_02254698(const AzaleaGymmickSpinarakRouteNode *a0, const AzaleaGymmickSpinarakRouteNode *a1) {
    VecFx32 ret;

    ret.x = (a1->x - a0->x) * FX32_ONE;
    ret.z = (a1->z - a0->z) * FX32_ONE;
    ret.y = 0;
    return ret;
}

void ov04_022546C8(const VecFx32 *a0, BOOL *a1) {
    if (a0->x >= 0) {
        a1[0] = TRUE;
    } else {
        a1[0] = FALSE;
    }
    if (a0->z >= 0) {
        a1[1] = TRUE;
    } else {
        a1[1] = FALSE;
    }
}

int ov04_022546E8(int a0, fx32 a1, fx32 a2, BOOL a3) {
    int ret = 0;
    fx32 r3 = a3 * FX32_ONE * 16;
    if (a1 + a2 == r3) {
        ret = 1;
    } else if (a0) {
        if (a1 + a2 > r3) {
            ret = 2;
        }
    } else {
        if (a1 + a2 < r3) {
            ret = 2;
        }
    }
    return ret;
}

void GymmickFree_Azalea(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

void ov04_02254724(SysTask *sysTask, void *taskData) {
    AzaleaGymmickSpinarakRideData *rideData = taskData;
    FieldSystem *fieldSystem = rideData->fieldSystem;
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    switch (rideData->state) {
    case 2:
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);

            if (localData->unk_19) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
                MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_DOWN);
            } else {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
                MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_UP);
            }
        } else {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);

            if (localData->unk_19) {
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
                localData->unk_50 = 0;
                ++rideData->state;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObject)) {
                MapObject_SetHeldMovement(playerObject, MOVEMENT_UNK_73);
                localData->unk_50 = 0;
                ++rideData->state;
            }
        }
        break;
    }
    case 4:
        if (localData->unk_50++ >= 4) {
            MapProp *mapProp = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->unk_17);
            NNSG3dResTex *r7 = ov01_021FB9E0(fieldSystem->areaDataManager);
            NNSG3dRenderObj *sp2C = MapProp_GetRenderSurface(mapProp);
            NNSG3dResMdl *sp4 = MapProp_GetResModel(mapProp);
            MapPropOneShotAnimationManager_LoadPropAnimations(fieldSystem->mapPropAnimationManager, fieldSystem->mapPropOneShotAnimationManager, 1, 118, sp2C, sp4, r7, 1, 255, FALSE);
            MapPropOneShotAnimationManager_PlayAnimation(fieldSystem->mapPropOneShotAnimationManager, 1, 0);
            PlaySE(SEQ_SE_GS_ITOMARU_ROBO);
            ++rideData->state;
        }
        break;
    case 5: {
        u16 sp24;
        int r1;
        int r7;
        const AzaleaGymmickSpinarakRouteNode *r1_2;
        int sp20;
        int r0;

        sp24 = localData->unk_18;
        r7 = localData->unk_15;
        if (localData->unk_16) {
            fx32 sp34;
            if (localData->unk_19) {
                r1_2 = &ov04_022575A4[sp24][r7].route[localData->unk_1A];
                localData->unk_28 = &ov04_022575A4[sp24][r7].route[localData->unk_1A - 1];
            } else {
                r1_2 = &ov04_022575A4[sp24][r7].route[localData->unk_1A];
                localData->unk_28 = &ov04_022575A4[sp24][r7].route[localData->unk_1A + 1];
            }
            localData->unk_38 = ov04_02254698(r1_2, localData->unk_28);
            ov04_022546C8(&localData->unk_38, localData->unk_20);
            VEC_Normalize(&localData->unk_38, &localData->unk_38);

            VecFx32 sp8C = { FX32_ONE, 0, 0 };
            sp34 = VEC_DotProduct(&localData->unk_38, &sp8C);

            VecFx32 sp80 = { 0, 0, 0 };
            VEC_MultAdd(FX32_CONST(2), &localData->unk_38, &sp80, &localData->unk_38);

            if (localData->unk_1C == 0 && sp34 != 0 && sp34 != FX32_ONE) {
                localData->unk_1C = 1;
                MapLoadManager_ForgetTrackedTarget(fieldSystem->mapLoadManager);
            } else if (localData->unk_1C == 1) {
                localData->unk_1C = 0;
                MapLoadManager_TrackTarget(PlayerAvatar_GetPositionVector(fieldSystem->playerAvatar), fieldSystem->mapLoadManager);
            }
            localData->unk_16 = 0;
        }
        sp20 = ov04_022546E8(localData->unk_20[0], localData->unk_2C.x, localData->unk_38.x, localData->unk_28->x);
        r0 = ov04_022546E8(localData->unk_20[1], localData->unk_2C.z, localData->unk_38.z, localData->unk_28->z);
        if (sp20 == 2) {
            localData->unk_38.x = 0;
        }
        if (r0 == 2) {
            localData->unk_38.z = 0;
        }
        if (sp20 != 0 && r0 != 0) {
            localData->unk_2C.x = localData->unk_28->x * 16 * FX32_ONE;
            localData->unk_2C.z = localData->unk_28->z * 16 * FX32_ONE;
            ++localData->unk_14;
            r1 = ov04_022575A4[sp24][r7].length;
            if (localData->unk_14 >= r1 - 1) {
                GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
                gymmickUnion->azalea.spiders[localData->unk_17] = ov04_022575A4[sp24][r7].destination;
                MapPropOneShotAnimationManager_UnloadAnimation(fieldSystem->mapPropAnimationManager, fieldSystem->mapPropOneShotAnimationManager, 1);
                StopSE(SEQ_SE_GS_ITOMARU_ROBO, 1);
                ++rideData->state;
            } else {
                if (localData->unk_19) {
                    --localData->unk_1A;
                } else {
                    ++localData->unk_1A;
                }
                localData->unk_16 = 1;
            }
        } else {
            VEC_Add(&localData->unk_2C, &localData->unk_38, &localData->unk_2C);
        }
        MapProp *r6 = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, localData->unk_04[localData->unk_17]);
        VecFx32 sp74 = localData->unk_2C;
        sp74.x += FX32_CONST(8);
        MapProp_SetTranslation(r6, &sp74);

        VecFx32 sp68;
        VecFx32 sp5C = { 8 * FX32_ONE, 0, 8 * FX32_ONE };
        sp68 = localData->unk_2C;
        VEC_Add(&sp68, &sp5C, &sp68);
        sp68.z += localData->unk_1B * 16 * FX32_ONE;
        MapObject_SetPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &sp68);
        if (FollowMon_IsActive(fieldSystem)) {
            s8 r6_2 = 1 - localData->unk_1B;
            VecFx32 sp50 = localData->unk_2C;
            VEC_Add(&sp50, &sp5C, &sp50);
            sp50.z += r6_2 * 16 * FX32_ONE;
            MapObject_SetPositionVector(FollowMon_GetMapObject(fieldSystem), &sp50);
        }
        break;
    }
    case 6: {
        LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        MapObject_SetCurrentX(playerObject, localData->unk_28->x);
        MapObject_SetCurrentY(playerObject, 0);
        MapObject_SetCurrentZ(playerObject, localData->unk_28->z + localData->unk_1B);
        sub_02060F78(playerObject);
        MapObject_SetHeldMovement(playerObject, MOVEMENT_UNK_74);
        if (FollowMon_IsActive(fieldSystem)) {
            LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
            MapObject_SetCurrentX(followMonObject, localData->unk_28->x);
            MapObject_SetCurrentY(followMonObject, 0);
            MapObject_SetCurrentZ(followMonObject, localData->unk_28->z + (1 - localData->unk_1B));
            sub_02060F78(followMonObject);
        }
        localData->unk_44 = 0;
        localData->unk_48 = 0;
        if (PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar) == DIR_SOUTH) {
            localData->unk_4C = FX32_ONE;
        } else {
            localData->unk_4C = -FX32_ONE;
        }
        ++rideData->state;
        break;
    }
    case 7: {
        VecFx32 sp44 = { 0, 0, 0 };
        sp44.z = localData->unk_4C;
        if (localData->unk_48++ == 0) {
            Camera_OffsetLookAtPosAndTarget(&sp44, fieldSystem->camera);
            ++localData->unk_44;
        } else if (localData->unk_48 > 1) {
            localData->unk_48 = 0;
            localData->unk_4C *= -1;
        }
        if (localData->unk_44 >= 4) {
            localData->unk_50 = 0;
            ++rideData->state;
        }
        break;
    }
    case 8:
        if (localData->unk_50++ >= 8) {
            LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            if (FollowMon_IsActive(fieldSystem)) {
                LocalMapObject *followMonObject = FollowMon_GetMapObject(fieldSystem);
                if (localData->unk_19) {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_DOWN);
                    MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_DOWN);
                } else {
                    MapObject_SetHeldMovement(playerObject, MOVEMENT_STEP_UP);
                    MapObject_SetHeldMovement(followMonObject, MOVEMENT_STEP_UP);
                }
            } else {
                if (localData->unk_19) {
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
