#include "overlay_01.h"
#include "gymmick_overlay.h"
#include "unk_0203DE74.h"
#include "unk_02005D10.h"
#include "task.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "unk_02062108.h"
#include "unk_0205FD20.h"
#include "constants/sndseq.h"

#define MDL_RED_SWITCH              (115)
#define MDL_BLUE_SWITCH             (116)
#define MDL_BLUE_WEB                (117)
#define MDL_SPINARAK                (118)
#define MDL_RED_WEB                 (122)

#define TRAVERSAL_CONTINUE            (0)
#define TRAVERSAL_ARRIVED             (1)
#define TRAVERSAL_OVERSHOT            (2)

struct Vec2U16 {
    u16 x;
    u16 z;
};

struct AzaleaGymWork {
    int unused_00;
    int modelIds[GYMMICK_AZALEA_NUM_SPINARAK]; // IDs of the spinarak
    u8 pathNodeCounter;
    u8 switchesState;
    u8 reqNewSegment;
    // param
    u8 spinarakNo;
    u8 startingPoint;
    u8 direction;
    u8 nodeIdx;
    s8 playerZoff;
    BOOL reqStartDiagMovement;
    BOOL xzSigns[2];
    const struct Vec2U16 *targetXZ;
    VecFx32 vecPos;
    VecFx32 vecTranslBuf;
    // Effect of the spinarak crashing into the end
    int cameraShudderCount;
    int cameraShudderFrames;
    fx32 cameraShudderDirection;
    int delayCounter;
};

struct SpinarakRideWork {
    int state;
    FieldSystem *fsys;
};

struct SpinarakPathSpec {
    u16 length;
    u16 endpoint;
    const struct Vec2U16 *path;
};

static BOOL Task_RideSpinarak(TaskManager *taskManager);
static void SysTask_DoSpinarakRideMovement(SysTask *task, struct SpinarakRideWork *work);
static BOOL Task_FlipSwitchWaitSE(TaskManager *taskManager);

#include "data/azalea_paths.h"

static const struct Vec2U16 sPathEndpoints[] = {
    {3, 31},
    {9, 31},
    {15, 31},
    {3, 24},
    {9, 24},
    {15, 24},
    {3, 16},
    {9, 16},
    {15, 16},
    {3, 9},
    {9, 9},
    {15, 9},
};

static const struct SpinarakPathSpec *const sSpinarakPathSpecs[] = {
    startingPoint0,
    startingPoint1,
    startingPoint2,
    startingPoint3,
    startingPoint4,
    startingPoint5,
    startingPoint6,
    startingPoint7,
    startingPoint8,
    startingPoint9,
    startingPoint10,
    startingPoint11,
};

static inline u8 getSwitchState(union GymmickUnion *gymmickUnion, int color) {
    return (gymmickUnion->azalea.switches >> color) & 1;
}

void InitAzaleaGymPuzzleGimmick(FieldSystem *fsys) {
    struct AzaleaGymWork *work;
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    int i;

    fsys->unk4->unk_24 = AllocFromHeap(4, sizeof(struct AzaleaGymWork));
    MI_CpuClear8(fsys->unk4->unk_24, sizeof(struct AzaleaGymWork));
    work = fsys->unk4->unk_24;
    for (i = 0; i < 4; i++) {
        VecFx32 spinarakInitPos = {0, 0, 0};
        u16 x = sPathEndpoints[gymmickUnion->azalea.spiders[i]].x;
        u16 z = sPathEndpoints[gymmickUnion->azalea.spiders[i]].z;

        spinarakInitPos.x = x * 16 * FX32_ONE;
        spinarakInitPos.x += 8 * FX32_ONE;
        spinarakInitPos.z = z * 16 * FX32_ONE;
        work->modelIds[i] = AddBgModelFromTemplate(fsys->bgModels, MDL_SPINARAK, &spinarakInitPos, NULL, fsys->_3dAnimationMgr);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        ov01_021E8970(
            MDL_RED_SWITCH,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_SWITCH,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_RED_WEB,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_WEB
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_WEB,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_WEB
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 1:
        ov01_021E8970(
            MDL_RED_SWITCH,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_SWITCH,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_RED_WEB,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_WEB
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_WEB,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_WEB
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 2:
        ov01_021E8970(
            MDL_RED_SWITCH,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_SWITCH,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_RED_WEB,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_WEB
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_WEB,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_WEB
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 3:
        ov01_021E8970(
            MDL_RED_SWITCH,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_SWITCH,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_SWITCH
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_RED_WEB,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_RED_WEB
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            MDL_BLUE_WEB,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                MDL_BLUE_WEB
            ),
            fsys->_3dAnimationMgr
        );
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

void Fsys_FlipAzaleaGymSwitch(FieldSystem *fsys, u8 switchNo) {
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    u8 switchState;
    struct UnkStruct_ov01_02204004_sub *obj1, *obj2;

    PlaySE(SEQ_SE_DP_KI_GASYAN);

    if (switchNo == GYMMICK_AZALEA_SWITCH_BLUE_F) {
        switchState = getSwitchState(gymmickUnion, GYMMICK_AZALEA_SWITCH_BLUE_F);
        gymmickUnion->azalea.switches ^= (1 << GYMMICK_AZALEA_SWITCH_BLUE_F);
        obj1 = ov01_022040D0(fsys->unkC0, MDL_BLUE_SWITCH);
        obj2 = ov01_022040D0(fsys->unkC0, MDL_BLUE_WEB);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, MDL_BLUE_SWITCH, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, MDL_BLUE_WEB, switchState);
        if (getSwitchState(gymmickUnion, GYMMICK_AZALEA_SWITCH_BLUE_F)) {
            ov01_021E8970(MDL_BLUE_SWITCH, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(MDL_BLUE_WEB, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(MDL_BLUE_SWITCH, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(MDL_BLUE_WEB, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else if (switchNo == GYMMICK_AZALEA_SWITCH_RED_F) {
        switchState = getSwitchState(gymmickUnion, GYMMICK_AZALEA_SWITCH_RED_F);
        gymmickUnion->azalea.switches ^= (1 << GYMMICK_AZALEA_SWITCH_RED_F);
        obj1 = ov01_022040D0(fsys->unkC0, MDL_RED_SWITCH);
        obj2 = ov01_022040D0(fsys->unkC0, MDL_RED_WEB);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, MDL_RED_SWITCH, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, MDL_RED_WEB, switchState);
        if (getSwitchState(gymmickUnion, GYMMICK_AZALEA_SWITCH_RED_F)) {
            ov01_021E8970(MDL_RED_SWITCH, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(MDL_RED_WEB, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(MDL_RED_SWITCH, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(MDL_RED_WEB, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else {
        GF_ASSERT(0);
    }
    TaskManager_Call(fsys->taskman, Task_FlipSwitchWaitSE, NULL);
}

void Fsys_BeginAzaleaGymSpinarakRide(FieldSystem *fsys, u8 startingPoint) {
    struct AzaleaGymWork *gymWork = fsys->unk4->unk_24;
    struct SpinarakRideWork *rideWork = AllocFromHeapAtEnd(11, sizeof(struct SpinarakRideWork));
    int i;
    union GymmickUnion *gymmickUnion;
    const struct Vec2U16 *initPos;

    rideWork->state = 0;
    rideWork->fsys = fsys;
    gymWork->startingPoint = startingPoint;
    gymWork->vecPos.y = 0;
    gymWork->pathNodeCounter = 0;
    gymWork->reqNewSegment = 1;
    gymWork->reqStartDiagMovement = FALSE;
    gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    gymWork->switchesState = gymmickUnion->azalea.switches;
    for (i = 0; i < GYMMICK_AZALEA_NUM_SPINARAK; i++) {
        if (gymmickUnion->azalea.spiders[i] == startingPoint) {
            gymWork->spinarakNo = i;
            break;
        }
    }
    if (i == GYMMICK_AZALEA_NUM_SPINARAK) {
        GF_ASSERT(0);
        return;
    }
    switch (startingPoint) {
    case 3:
    case 4:
    case 5:
    case 9:
    case 10:
    case 11:
        // Downward
        gymWork->direction = 1;
        gymWork->nodeIdx = sSpinarakPathSpecs[startingPoint][gymWork->switchesState].length - 1;
        gymWork->playerZoff = 1;
        break;
        // Upward
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    default:
        gymWork->direction = 0;
        gymWork->nodeIdx = 0;
        gymWork->playerZoff = 0;
        break;
    }
    initPos = &sSpinarakPathSpecs[startingPoint][gymWork->switchesState].path[gymWork->nodeIdx];
    gymWork->vecPos.x = initPos->x * 16 * FX32_ONE;
    gymWork->vecPos.z = initPos->z * 16 * FX32_ONE;
    TaskManager_Call(fsys->taskman, Task_RideSpinarak, rideWork);
}

static BOOL Task_RideSpinarak(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct SpinarakRideWork *rideWork = TaskManager_GetEnv(taskManager);
    switch (rideWork->state) {
    case 0:
        TaskManager_Call(fsys->taskman, Task_WaitFollowingPokeSituatedOnMovingPlatform, NULL);
        rideWork->state++;
        break;
    case 1:
        CreateSysTask((SysTaskFunc)SysTask_DoSpinarakRideMovement, rideWork, 0);
        rideWork->state++;
        break;
    case 10:
        FreeToHeap(rideWork);
        return TRUE;
    }

    return FALSE;
}

static VecFx32 getWebSegmentVec(const struct Vec2U16 *a, const struct Vec2U16 *b) {
    VecFx32 ret;
    ret.x = (b->x - a->x) * FX32_ONE;
    ret.z = (b->z - a->z) * FX32_ONE;
    ret.y = 0;
    return ret;
}

static void getWebSegmentComponentSigns(const VecFx32 *vec, BOOL signs[2]) {
    if (vec->x >= 0) {
        signs[0] = TRUE;
    } else {
        signs[0] = FALSE;
    }
    if (vec->z >= 0) {
        signs[1] = TRUE;
    } else {
        signs[1] = FALSE;
    }
}

static int testWebSegmentTraversalComponent(BOOL isPositive, fx32 compPos, fx32 compMove, u16 compTargetU16) {
    fx32 compTargetFx = compTargetU16 * 16 * FX32_ONE;
    int action = TRAVERSAL_CONTINUE;
    compPos += compMove;
    if (compTargetFx == compPos) {
        action = TRAVERSAL_ARRIVED;
    } else if (isPositive) {
        if (compPos > compTargetFx) {
            action = TRAVERSAL_OVERSHOT;
        }
    } else {
        if (compPos < compTargetFx) {
            action = TRAVERSAL_OVERSHOT;
        }
    }
    return action;
}

void DeleteAzaleaGymPuzzleGimmick(FieldSystem *fsys) {
    FreeToHeap(fsys->unk4->unk_24);
    fsys->unk4->unk_24 = NULL;
}

static void SysTask_DoSpinarakRideMovement(SysTask *task, struct SpinarakRideWork *work) {
    FieldSystem *fsys = work->fsys;
    struct AzaleaGymWork *gymWork = fsys->unk4->unk_24;
    LocalMapObject *playerObj, *followPokeObj;
    BgModelEvent *spinarakMdlEvent;
    fx32 dotprod;
    void *r7;
    const struct Vec2U16 *posvec;
    BgModelEvent *model;

    switch (work->state) {
    case 2:
        if (FollowingPokemon_IsActive(fsys)) {
            playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
                MapObject_SetHeldMovement(followPokeObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
                MapObject_SetHeldMovement(followPokeObj, MV_step_down);
            }
        } else {
            playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
            }
        }
        work->state++;
        //fallthrough
    case 3:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) && MapObject_AreBitsSetForMovementScriptInit(followPokeObj)) {
                MapObject_SetHeldMovement(playerObj, 73);
                gymWork->delayCounter = 0;
                work->state++;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj)) {
                MapObject_SetHeldMovement(playerObj, 73);
                gymWork->delayCounter = 0;
                work->state++;
            }
        }
        break;
    case 4:
        if (gymWork->delayCounter++ < 4) {
            break;
        }
        spinarakMdlEvent = ov01_021F3B44(fsys->bgModels, gymWork->spinarakNo);
        r7 = ov01_021FB9E0(fsys->unk_34);
        ov01_021E8DE8(
            fsys->_3dAnimationMgr,
            fsys->unk_58,
            1,
            MDL_SPINARAK,
            ov01_021F3B38(spinarakMdlEvent),
            ov01_021F3B3C(spinarakMdlEvent),
            r7,
            1,
            255,
            0
        );
        ov01_021E8E70(fsys->unk_58, 1, 0);
        PlaySE(SEQ_SE_GS_ITOMARU_ROBO);
        work->state++;
        break;
    case 5: {
        u8 startingPoint = gymWork->startingPoint;
        u8 reqNewSegment = gymWork->reqNewSegment;
        u8 switchesState = gymWork->switchesState;
        if (reqNewSegment) {
            if (gymWork->direction) {
                posvec = &sSpinarakPathSpecs[startingPoint][switchesState].path[gymWork->nodeIdx];
                gymWork->targetXZ = &sSpinarakPathSpecs[startingPoint][switchesState].path[gymWork->nodeIdx - 1];
            }
            else {
                posvec = &sSpinarakPathSpecs[startingPoint][switchesState].path[gymWork->nodeIdx];
                gymWork->targetXZ = &sSpinarakPathSpecs[startingPoint][switchesState].path[gymWork->nodeIdx + 1];
            }
            gymWork->vecTranslBuf = getWebSegmentVec(posvec, gymWork->targetXZ);
            getWebSegmentComponentSigns(&gymWork->vecTranslBuf, gymWork->xzSigns);
            VEC_Normalize(&gymWork->vecTranslBuf, &gymWork->vecTranslBuf);
            {
                const VecFx32 tmp = {FX32_ONE, 0, 0};
                dotprod = VEC_DotProduct(&gymWork->vecTranslBuf, &tmp);
            }
            {
                VecFx32 tmp = {0, 0, 0};
                VEC_MultAdd(2 * FX32_ONE, &gymWork->vecTranslBuf, &tmp, &gymWork->vecTranslBuf);
            }
            if (gymWork->reqStartDiagMovement == FALSE && dotprod != 0 && dotprod != FX32_ONE) {
                gymWork->reqStartDiagMovement = TRUE;
                ov01_021F6304(fsys->unk2C);
            }
            else if (gymWork->reqStartDiagMovement == TRUE) {
                gymWork->reqStartDiagMovement = FALSE;
                ov01_021F62E8(PlayerAvatar_GetPositionVecConst(fsys->playerAvatar), fsys->unk2C);
            }
            gymWork->reqNewSegment = 0;
        }
        {
            int dx = testWebSegmentTraversalComponent(gymWork->xzSigns[0], gymWork->vecPos.x, gymWork->vecTranslBuf.x, gymWork->targetXZ->x);
            int dz = testWebSegmentTraversalComponent(gymWork->xzSigns[1], gymWork->vecPos.z, gymWork->vecTranslBuf.z, gymWork->targetXZ->z);
            if (dx == TRAVERSAL_OVERSHOT) {
                gymWork->vecTranslBuf.x = 0;
            }
            if (dz == TRAVERSAL_OVERSHOT) {
                gymWork->vecTranslBuf.z = 0;
            }
            if (dx != TRAVERSAL_CONTINUE && dz != TRAVERSAL_CONTINUE) {
                gymWork->vecPos.x = gymWork->targetXZ->x * 16 * FX32_ONE;
                gymWork->vecPos.z = gymWork->targetXZ->z * 16 * FX32_ONE;
                gymWork->pathNodeCounter++;
                if (gymWork->pathNodeCounter >= sSpinarakPathSpecs[startingPoint][switchesState].length - 1) {
                    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(
                        Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
                    gymmickUnion->azalea.spiders[gymWork->spinarakNo] = sSpinarakPathSpecs[startingPoint][switchesState].endpoint;
                    ov01_021E8ED0(fsys->_3dAnimationMgr, fsys->unk_58, 1);
                    StopSE(SEQ_SE_GS_ITOMARU_ROBO, 1);
                    work->state++;
                }
                else {
                    if (gymWork->direction) {
                        gymWork->nodeIdx--;
                    }
                    else {
                        gymWork->nodeIdx++;
                    }
                    gymWork->reqNewSegment = 1;
                }
            }
            else {
                VEC_Add(&gymWork->vecPos, &gymWork->vecTranslBuf, &gymWork->vecPos);
            }
        }
        model = ov01_021F3B44(fsys->bgModels, gymWork->modelIds[gymWork->spinarakNo]);
        {
            VecFx32 spinarakPos = gymWork->vecPos;
            spinarakPos.x += 8 * FX32_ONE;
            BgModel_SetPosition(model, &spinarakPos);
        }
        {
            VecFx32 playerPos;
            const VecFx32 playerPossOffs = {8 * FX32_ONE, 0, 8 * FX32_ONE};
            playerPos = gymWork->vecPos;
            VEC_Add(&playerPos, &playerPossOffs, &playerPos);
            playerPos.z += gymWork->playerZoff * 16 * FX32_ONE;
            MapObject_SetPositionVec(PlayerAvatar_GetMapObject(fsys->playerAvatar), &playerPos);
            if (FollowingPokemon_IsActive(fsys)) {
                s8 posAdj = 1 - gymWork->playerZoff;
                VecFx32 followPokePos = gymWork->vecPos;
                VEC_Add(&followPokePos, &playerPossOffs, &followPokePos);
                followPokePos.z += posAdj * 16 * FX32_ONE;
                MapObject_SetPositionVec(FollowingPokemon_GetMapObject(fsys), &followPokePos);
            }
        }
        break;
    }
    case 6:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        MapObject_SetCurrentX(playerObj, gymWork->targetXZ->x);
        MapObject_SetCurrentHeight(playerObj, 0);
        MapObject_SetCurrentY(playerObj, gymWork->targetXZ->z + gymWork->playerZoff);
        sub_02060F78(playerObj);
        MapObject_SetHeldMovement(playerObj, 74);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            MapObject_SetCurrentX(followPokeObj, gymWork->targetXZ->x);
            MapObject_SetCurrentHeight(followPokeObj, 0);
            MapObject_SetCurrentY(followPokeObj, gymWork->targetXZ->z + (1 - gymWork->playerZoff));
            sub_02060F78(followPokeObj);
        }
        gymWork->cameraShudderCount = 0;
        gymWork->cameraShudderFrames = 0;
        if (PlayerAvatar_GetFacingDirection(fsys->playerAvatar) == DIR_SOUTH) {
            gymWork->cameraShudderDirection = FX32_ONE;
        } else {
            gymWork->cameraShudderDirection = -FX32_ONE;
        }
        work->state++;
        break;
    case 7: {
        VecFx32 cameraShudderVec = {0,0,gymWork->cameraShudderDirection};
        if (gymWork->cameraShudderFrames++ == 0) {
            GF_Camera_ShiftBy(&cameraShudderVec, fsys->camera);
            gymWork->cameraShudderCount++;
        } else if (gymWork->cameraShudderFrames > 1) {
            gymWork->cameraShudderFrames = 0;
            gymWork->cameraShudderDirection *= -1;
        }
        if (gymWork->cameraShudderCount >= 4) {
            gymWork->delayCounter = 0;
            work->state++;
        }
        break;
    }
    case 8:
        if (gymWork->delayCounter++ < 8) {
            break;
        }
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
                MapObject_SetHeldMovement(followPokeObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
                MapObject_SetHeldMovement(followPokeObj, MV_step_down);
            }
        } else {
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
            }
        }
        work->state++;
        break;
    case 9:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) && MapObject_AreBitsSetForMovementScriptInit(followPokeObj)) {
                MapObject_ClearHeldMovement(followPokeObj);
                DestroySysTask(task);
                work->state++;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj)) {
                DestroySysTask(task);
                work->state++;
            }
        }
        break;
    }
}

static BOOL Task_FlipSwitchWaitSE(TaskManager *taskManager) {
    if (!IsSEPlaying(SEQ_SE_DP_KI_GASYAN)) {
        return TRUE;
    } else {
        return FALSE;
    }
}
