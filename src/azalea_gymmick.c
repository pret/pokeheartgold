#include "overlay_01.h"
#include "unk_0203DE74.h"
#include "unk_02005D10.h"
#include "task.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "unk_02062108.h"
#include "unk_0205FD20.h"
#include "constants/sndseq.h"

struct Vec2U16 {
    u16 x;
    u16 z;
};

struct AzaleaGymWork {
    u8 filler_00[4];
    int modelIds[4];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 spinarakNo;
    u8 startingPoint;
    u8 direction;
    u8 pathIdx;
    s8 playerZoff;
    int unk_1C;
    BOOL unk_20[2];
    const struct Vec2U16 *unk_28;
    VecFx32 vecPos;
    VecFx32 vecTranslBuf;
    int unk_44;
    int unk_48;
    fx32 unk_4C;
    int unk_50;
};

struct SpinarakRideWork {
    int state;
    FieldSystem *fsys;
};

struct SpinarakPathSpec {
    u16 unk_0;
    u16 unk_2;
    const struct Vec2U16 *unk_4;
};

BOOL ov04_0225463C(TaskManager *taskManager);
void ov04_02254724(SysTask *task, struct SpinarakRideWork *work);
BOOL ov04_02254CA4(TaskManager *taskManager);

extern const u16 ov04_022575D4[][2];
extern const struct SpinarakPathSpec *const ov04_022575A4[];

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
        VecFx32 sp4 = {0, 0, 0};
        u16 x = ov04_022575D4[gymmickUnion->azalea.spiders[i]][0];
        u16 z = ov04_022575D4[gymmickUnion->azalea.spiders[i]][1];

        sp4.x = x * 16 * FX32_ONE;
        sp4.x += 8 * FX32_ONE;
        sp4.z = z * 16 * FX32_ONE;
        work->modelIds[i] = AddBgModelFromTemplate(fsys->bgModels, 118, &sp4, NULL, fsys->_3dAnimationMgr);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 1:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 2:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 3:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
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
    struct UnkStruct_ov01_02004004_sub *obj1, *obj2;

    PlaySE(SEQ_SE_DP_KI_GASYAN);

    if (switchNo == 0) {
        switchState = getSwitchState(gymmickUnion, 0);
        gymmickUnion->azalea.switches ^= 1;
        obj1 = ov01_022040D0(fsys->unkC0, 116);
        obj2 = ov01_022040D0(fsys->unkC0, 117);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 116, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 117, switchState);
        if (getSwitchState(gymmickUnion, 0)) {
            ov01_021E8970(116, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(116, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else if (switchNo == 1) {
        switchState = getSwitchState(gymmickUnion, 1);
        gymmickUnion->azalea.switches ^= 2;
        obj1 = ov01_022040D0(fsys->unkC0, 115);
        obj2 = ov01_022040D0(fsys->unkC0, 122);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 115, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 122, switchState);
        if (getSwitchState(gymmickUnion, 1)) {
            ov01_021E8970(115, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(115, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else {
        GF_ASSERT(0);
    }
    TaskManager_Call(fsys->taskman, ov04_02254CA4, NULL);
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
    gymWork->unk_14 = 0;
    gymWork->unk_16 = 1;
    gymWork->unk_1C = 0;
    gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    gymWork->unk_15 = gymmickUnion->azalea.switches;
    for (i = 0; i < 4; i++) {
        if (gymmickUnion->azalea.spiders[i] == startingPoint) {
            gymWork->spinarakNo = i;
            break;
        }
    }
    if (i == 4) {
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
        gymWork->direction = 1;
        gymWork->pathIdx = ov04_022575A4[startingPoint][gymWork->unk_15].unk_0 - 1;
        gymWork->playerZoff = 1;
        break;
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    default:
        gymWork->direction = 0;
        gymWork->pathIdx = 0;
        gymWork->playerZoff = 0;
        break;
    }
    initPos = &ov04_022575A4[startingPoint][gymWork->unk_15].unk_4[gymWork->pathIdx];
    gymWork->vecPos.x = initPos->x * 16 * FX32_ONE;
    gymWork->vecPos.z = initPos->z * 16 * FX32_ONE;
    TaskManager_Call(fsys->taskman, ov04_0225463C, rideWork);
}

BOOL ov04_0225463C(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct SpinarakRideWork *rideWork = TaskManager_GetEnv(taskManager);
    switch (rideWork->state) {
    case 0:
        TaskManager_Call(fsys->taskman, Task_WaitFollowingPokeSituatedOnMovingPlatform, NULL);
        rideWork->state++;
        break;
    case 1:
        CreateSysTask((SysTaskFunc)ov04_02254724, rideWork, 0);
        rideWork->state++;
        break;
    case 10:
        FreeToHeap(rideWork);
        return TRUE;
    }

    return FALSE;
}

VecFx32 ov04_02254698(const struct Vec2U16 *a, const struct Vec2U16 *b) {
    VecFx32 sp0;
    sp0.x = (b->x - a->x) * FX32_ONE;
    sp0.z = (b->z - a->z) * FX32_ONE;
    sp0.y = 0;
    return sp0;
}

void ov04_022546C8(const VecFx32 *vec, BOOL signs[2]) {
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

int ov04_022546E8(BOOL a0, fx32 a1, fx32 a2, int a3) {
    fx32 r3 = a3 * 16 * FX32_ONE;
    int r4 = 0;
    a1 += a2;
    if (r3 == a1) {
        r4 = 1;
    } else if (a0) {
        if (a1 > r3) {
            r4 = 2;
        }
    } else if (a1 < r3) {
        r4 = 2;
    }
    return r4;
}

void DeleteAzaleaGymPuzzleGimmick(FieldSystem *fsys) {
    FreeToHeap(fsys->unk4->unk_24);
    fsys->unk4->unk_24 = NULL;
}

/*
	thumb_func_start ov04_02254724
ov04_02254724: ; 0x02254724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	add r6, r1, #0
	ldr r5, [r6, #4]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldr r0, [r6]
	cmp r0, #9
	bhi _02254828
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02254744: ; jump table
	.short _02254C9E - _02254744 - 2 ; case 0
	.short _02254C9E - _02254744 - 2 ; case 1
	.short _02254758 - _02254744 - 2 ; case 2
	.short _022547BA - _02254744 - 2 ; case 3
	.short _0225481E - _02254744 - 2 ; case 4
	.short _02254886 - _02254744 - 2 ; case 5
	.short _02254AE0 - _02254744 - 2 ; case 6
	.short _02254B76 - _02254744 - 2 ; case 7
	.short _02254BD4 - _02254744 - 2 ; case 8
	.short _02254C44 - _02254744 - 2 ; case 9
_02254758:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	ldr r0, [r5, #0x40]
	beq _0225479C
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _0225478A
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0x28]
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _022547B4
_0225478A:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0x28]
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	b _022547B4
_0225479C:
	bl PlayerAvatar_GetMapObject
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _022547AE
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _022547B4
_022547AE:
	mov r1, #0xc
	bl MapObject_SetHeldMovement
_022547B4:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_022547BA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022547FE
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r7, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_022547FE:
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r7, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_0225481E:
	ldr r1, [r4, #0x50]
	add r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #4
	bge _0225482A
_02254828:
	b _02254C9E
_0225482A:
	add r0, r5, #0
	add r0, #0x9c
	ldrb r1, [r4, #0x17]
	ldr r0, [r0]
	bl ov01_021F3B44
	add r4, r0, #0
	ldr r0, [r5, #0x34]
	bl ov01_021FB9E0
	add r7, r0, #0
	add r0, r4, #0
	bl ov01_021F3B38
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl ov01_021F3B3C
	ldr r1, [sp, #0x2c]
	mov r2, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0xff
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	mov r3, #0x76
	bl ov01_021E8DE8
	ldr r0, [r5, #0x58]
	mov r1, #1
	mov r2, #0
	bl ov01_021E8E70
	ldr r0, _02254B9C ; =SEQ_SE_GS_ITOMARU_ROBO
	bl PlaySE
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254886:
	ldrb r0, [r4, #0x18]
	str r0, [sp, #0x24]
	ldrb r0, [r4, #0x16]
	ldrb r7, [r4, #0x15]
	cmp r0, #0
	beq _02254962
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _022548B0
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r1, [r0, r1]
	lsl r0, r7, #3
	add r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsl r1, r0, #2
	add r1, r2, r1
	sub r0, r0, #1
	b _022548C6
_022548B0:
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r1, [r0, r1]
	lsl r0, r7, #3
	add r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsl r1, r0, #2
	add r1, r2, r1
	add r0, r0, #1
_022548C6:
	lsl r0, r0, #2
	add r0, r2, r0
	str r0, [r4, #0x28]
	ldr r2, [r4, #0x28]
	add r0, sp, #0x38
	bl ov04_02254698
	add r3, sp, #0x38
	add r2, r4, #0
	add r2, #0x38
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x30]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	ldr r0, [sp, #0x30]
	add r1, #0x20
	bl ov04_022546C8
	add r0, r4, #0
	add r0, #0x38
	add r1, r0, #0
	bl VEC_Normalize
	ldr r2, _02254BA4 ; =ov04_02257350
	add r3, sp, #0x8c
	ldmia r2!, {r0, r1}
	mov ip, r3
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r1, ip
	str r0, [r3]
	add r0, r4, #0
	add r0, #0x38
	bl VEC_DotProduct
	str r0, [sp, #0x34]
	add r1, r4, #0
	add r1, #0x38
	add r2, sp, #0x80
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	mov r0, #2
	lsl r0, r0, #0xc
	add r3, r1, #0
	bl VEC_MultAdd
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0225494A
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0225494A
	mov r2, #1
	lsl r2, r2, #0xc
	cmp r1, r2
	beq _0225494A
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x2c]
	bl ov01_021F6304
	b _0225495E
_0225494A:
	cmp r0, #1
	bne _0225495E
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r5, #0x2c]
	bl ov01_021F62E8
_0225495E:
	mov r0, #0
	strb r0, [r4, #0x16]
_02254962:
	ldr r3, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldrh r3, [r3]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl ov04_022546E8
	ldr r3, [r4, #0x28]
	str r0, [sp, #0x20]
	ldrh r3, [r3, #2]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x40]
	bl ov04_022546E8
	ldr r1, [sp, #0x20]
	cmp r1, #2
	bne _0225498A
	mov r1, #0
	str r1, [r4, #0x38]
_0225498A:
	cmp r0, #2
	bne _02254992
	mov r1, #0
	str r1, [r4, #0x40]
_02254992:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _02254A14
	cmp r0, #0
	beq _02254A14
	ldr r0, [r4, #0x28]
	lsl r7, r7, #3
	ldrh r0, [r0]
	lsl r0, r0, #0x10
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x10
	str r0, [r4, #0x34]
	ldrb r0, [r4, #0x14]
	add r0, r0, #1
	strb r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r0, [r0, r1]
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	ldrb r0, [r4, #0x14]
	ldrh r1, [r1, r7]
	sub r1, r1, #1
	cmp r0, r1
	blt _022549FE
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [sp, #0x1c]
	add r1, r1, r7
	ldrh r2, [r1, #2]
	ldrb r1, [r4, #0x17]
	strb r2, [r0, r1]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	mov r2, #1
	bl ov01_021E8ED0
	ldr r0, _02254B9C ; =SEQ_SE_GS_ITOMARU_ROBO
	mov r1, #1
	bl StopSE
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _02254A22
_022549FE:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	ldrb r0, [r4, #0x1a]
	beq _02254A0A
	sub r0, r0, #1
	b _02254A0C
_02254A0A:
	add r0, r0, #1
_02254A0C:
	strb r0, [r4, #0x1a]
	mov r0, #1
	strb r0, [r4, #0x16]
	b _02254A22
_02254A14:
	add r0, r4, #0
	add r0, #0x2c
	add r1, r4, #0
	add r1, #0x38
	add r2, r0, #0
	bl VEC_Add
_02254A22:
	ldrb r1, [r4, #0x17]
	add r0, r5, #0
	add r0, #0x9c
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #4]
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	add r3, r4, #0
	add r2, sp, #0x74
	add r3, #0x2c
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #2
	ldr r1, [sp, #0x74]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x74]
	add r0, r6, #0
	add r1, r7, #0
	bl BgModel_SetPosition
	ldr r3, _02254BA8 ; =ov04_02257344
	add r2, sp, #0x5c
	add r6, r4, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r6, #0x2c
	str r0, [r2]
	add r3, sp, #0x68
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r7, #0
	str r0, [r3]
	add r0, r2, #0
	bl VEC_Add
	mov r0, #0x1b
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0x70]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x70]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x68
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02254AA6
	b _02254C9E
_02254AA6:
	mov r0, #0x1b
	ldrsb r1, [r4, r0]
	mov r0, #1
	add r3, sp, #0x50
	sub r0, r0, r1
	lsl r0, r0, #0x18
	add r4, #0x2c
	asr r6, r0, #0x18
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r7, #0
	str r0, [r3]
	add r0, r2, #0
	bl VEC_Add
	ldr r1, [sp, #0x58]
	lsl r0, r6, #0x10
	add r0, r1, r0
	str r0, [sp, #0x58]
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0x50
	bl MapObject_SetPositionVec
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
_02254AE0:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r1, [r4, #0x28]
	add r7, r0, #0
	ldrh r1, [r1]
	bl MapObject_SetCurrentX
	add r0, r7, #0
	mov r1, #0
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #0x28]
	mov r2, #0x1b
	ldrh r1, [r1, #2]
	ldrsb r2, [r4, r2]
	add r0, r7, #0
	add r1, r1, r2
	bl MapObject_SetCurrentY
	add r0, r7, #0
	bl sub_02060F78
	add r0, r7, #0
	mov r1, #0x4a
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254B52
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	ldr r1, [r4, #0x28]
	add r7, r0, #0
	ldrh r1, [r1]
	bl MapObject_SetCurrentX
	add r0, r7, #0
	mov r1, #0
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #0x28]
	add r0, r7, #0
	ldrh r3, [r1, #2]
	mov r1, #0x1b
	ldrsb r2, [r4, r1]
	mov r1, #1
	sub r1, r1, r2
	add r1, r3, r1
	bl MapObject_SetCurrentY
	add r0, r7, #0
	bl sub_02060F78
_02254B52:
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #1
	bne _02254B68
	mov r0, #1
	lsl r0, r0, #0xc
	b _02254B6A
_02254B68:
	ldr r0, _02254BAC ; =0xFFFFF000
_02254B6A:
	str r0, [r4, #0x4c]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254B76:
	add r0, sp, #0x44
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0x4c]
	ldr r3, [r4, #0x48]
	add r2, r3, #1
	str r2, [r4, #0x48]
	cmp r3, #0
	bne _02254BB0
	ldr r1, [r5, #0x24]
	bl GF_Camera_ShiftBy
	ldr r0, [r4, #0x44]
	add r0, r0, #1
	str r0, [r4, #0x44]
	b _02254BC0
	.balign 4, 0
_02254B9C: .word SEQ_SE_GS_ITOMARU_ROBO
_02254BA0: .word ov04_022575A4
_02254BA4: .word ov04_02257350
_02254BA8: .word ov04_02257344
_02254BAC: .word 0xFFFFF000
_02254BB0:
	ldr r0, [r4, #0x48]
	cmp r0, #1
	ble _02254BC0
	str r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	sub r0, r1, #1
	mul r0, r2
	str r0, [r4, #0x4c]
_02254BC0:
	ldr r0, [r4, #0x44]
	cmp r0, #4
	blt _02254C9E
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254BD4:
	ldr r1, [r4, #0x50]
	add r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #8
	blt _02254C9E
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254C22
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C10
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C10:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C22:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C32
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C32:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
_02254C3A:
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C44:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254C88
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r4, r0, #0
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	add r0, r4, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	add r0, r4, #0
	bl MapObject_ClearHeldMovement
	ldr r0, [sp, #0x18]
	bl DestroySysTask
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C88:
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	ldr r0, [sp, #0x18]
	bl DestroySysTask
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02254C9E:
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02254724

ov04_02257344: ; 0x02257344
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00

ov04_02257350: ; 0x02257350
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 */

void ov04_02254724(SysTask *task, struct SpinarakRideWork *work) {
    FieldSystem *fsys = work->fsys;
    struct AzaleaGymWork *gymWork = fsys->unk4->unk_24;
    LocalMapObject *playerObj, *followPokeObj;
    BgModelEvent *spinarakMdlEvent;
    fx32 dotprod;
    void *r7;
    int startingPoint;
    int work_16;
    int work_15;
    const struct Vec2U16 *posvec;
    int work_1A_new;
    int dx;
    int dz;
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
                gymWork->unk_50 = 0;
                work->state++;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj)) {
                MapObject_SetHeldMovement(playerObj, 73);
                gymWork->unk_50 = 0;
                work->state++;
            }
        }
        break;
    case 4:
        if (gymWork->unk_50++ < 4) {
            break;
        }
        spinarakMdlEvent = ov01_021F3B44(fsys->bgModels, gymWork->spinarakNo);
        r7 = ov01_021FB9E0(fsys->unk_34);
        ov01_021E8DE8(
            fsys->_3dAnimationMgr,
            fsys->unk_58,
            1,
            118,
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
    case 5:
        startingPoint = gymWork->startingPoint;
        work_16 = gymWork->unk_16;
        work_15 = gymWork->unk_15;
        if (work_16) {
            if (gymWork->direction) {
                posvec = &ov04_022575A4[startingPoint][work_15].unk_4[gymWork->pathIdx];
                gymWork->unk_28 = &ov04_022575A4[startingPoint][work_15].unk_4[gymWork->pathIdx - 1];
            } else {
                posvec = &ov04_022575A4[startingPoint][work_15].unk_4[gymWork->pathIdx];
                gymWork->unk_28 = &ov04_022575A4[startingPoint][work_15].unk_4[gymWork->pathIdx + 1];
            }
            gymWork->vecTranslBuf = ov04_02254698(posvec, gymWork->unk_28);
            ov04_022546C8(&gymWork->vecTranslBuf, gymWork->unk_20);
            VEC_Normalize(&gymWork->vecTranslBuf, &gymWork->vecTranslBuf);
            {
                const VecFx32 tmp = {FX32_ONE, 0, 0};
                dotprod = VEC_DotProduct(&gymWork->vecTranslBuf, &tmp);
            }
            {
                VecFx32 tmp = {0,0,0};
                VEC_MultAdd(2 * FX32_ONE, &gymWork->vecTranslBuf, &tmp, &gymWork->vecTranslBuf);
            }
            if (gymWork->unk_1C == 0 && dotprod != 0 && dotprod != FX32_ONE) {
                gymWork->unk_1C = 1;
                ov01_021F6304(fsys->unk2C);
            } else if (gymWork->unk_1C == 1) {
                gymWork->unk_1C = 0;
                ov01_021F62E8(PlayerAvatar_GetPositionVecConst(fsys->playerAvatar), fsys->unk2C);
            }
            gymWork->unk_16 = 0;
        }
        dx = ov04_022546E8(gymWork->unk_20[0], gymWork->vecPos.x, gymWork->vecTranslBuf.x, gymWork->unk_28->x);
        dz = ov04_022546E8(gymWork->unk_20[1], gymWork->vecPos.z, gymWork->vecTranslBuf.z, gymWork->unk_28->z);
        if (dx == 2) {
            gymWork->vecTranslBuf.x = 0;
        }
        if (dz == 2) {
            gymWork->vecTranslBuf.z = 0;
        }
        if (dx != 0 && dz != 0) {
            gymWork->vecPos.x = gymWork->unk_28->x * 16 * FX32_ONE;
            gymWork->vecPos.z = gymWork->unk_28->z * 16 * FX32_ONE;
            gymWork->unk_14++;
            if (gymWork->unk_14 >= ov04_022575A4[startingPoint][work_15].unk_0 - 1) {
                union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(
                    Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
                gymmickUnion->azalea.spiders[gymWork->spinarakNo] = ov04_022575A4[startingPoint][work_15].unk_2;
                ov01_021E8ED0(fsys->_3dAnimationMgr, fsys->unk_58, 1);
                StopSE(SEQ_SE_GS_ITOMARU_ROBO, 1);
                work->state++;
            } else {
                if (gymWork->direction) {
                    gymWork->pathIdx--;
                } else {
                    gymWork->pathIdx++;
                }
                gymWork->unk_16 = 1;
            }
        } else {
            VEC_Add(&gymWork->vecPos, &gymWork->vecTranslBuf, &gymWork->vecPos);
        }
        model = ov01_021F3B44(fsys->bgModels, gymWork->modelIds[gymWork->spinarakNo]);
        {
            VecFx32 sp74 = gymWork->vecPos;
            sp74.x += 8 * FX32_ONE;
            BgModel_SetPosition(model, &sp74);
        }
        {
            VecFx32 sp68;
            const VecFx32 sp5C = {8*FX32_ONE,0,8*FX32_ONE};
            sp68 = gymWork->vecPos;
            VEC_Add(&sp68, &sp5C, &sp68);
            sp68.z += gymWork->playerZoff * 16 * FX32_ONE;
            MapObject_SetPositionVec(PlayerAvatar_GetMapObject(fsys->playerAvatar), &sp68);
            if (FollowingPokemon_IsActive(fsys)) {
                s8 posAdj = 1 - gymWork->playerZoff;
                VecFx32 sp50 = gymWork->vecPos;
                VEC_Add(&sp50, &sp5C, &sp50);
                sp50.z += posAdj * 16 * FX32_ONE;
                MapObject_SetPositionVec(FollowingPokemon_GetMapObject(fsys), &sp50);
            }
        }
        break;
    case 6:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        MapObject_SetCurrentX(playerObj, gymWork->unk_28->x);
        MapObject_SetCurrentHeight(playerObj, 0);
        MapObject_SetCurrentY(playerObj, gymWork->unk_28->z + gymWork->playerZoff);
        sub_02060F78(playerObj);
        MapObject_SetHeldMovement(playerObj, 74);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            MapObject_SetCurrentX(followPokeObj, gymWork->unk_28->x);
            MapObject_SetCurrentHeight(followPokeObj, 0);
            MapObject_SetCurrentY(followPokeObj, gymWork->unk_28->z + (1 - gymWork->playerZoff));
            sub_02060F78(followPokeObj);
        }
        gymWork->unk_44 = 0;
        gymWork->unk_48 = 0;
        if (PlayerAvatar_GetFacingDirection(fsys->playerAvatar) == DIR_SOUTH) {
            gymWork->unk_4C = FX32_ONE;
        } else {
            gymWork->unk_4C = -FX32_ONE;
        }
        work->state++;
        break;
    case 7: {
        VecFx32 sp44 = {0,0,gymWork->unk_4C};
        if (gymWork->unk_48++ == 0) {
            GF_Camera_ShiftBy(&sp44, fsys->camera);
            gymWork->unk_44++;
        } else if (gymWork->unk_48 > 1) {
            gymWork->unk_48 = 0;
            gymWork->unk_4C *= -1;
        }
        if (gymWork->unk_44 >= 4) {
            gymWork->unk_50 = 0;
            work->state++;
        }
        break;
    }
    case 8:
        if (gymWork->unk_50++ < 8) {
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
