#include "field_map_object.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_apricorn_tree_anim.h"
#include "script.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_02055418.h"
#include "unk_0205CB48.h"
#include "unk_02062108.h"
#include "constants/apricorns.h"
#include "constants/scrcmd.h"
#include "constants/sndseq.h"

#define TREE_WIGGLE_FRAMES   16
#define TREE_EXPEL_FRAMES     8

#define APRICORN_JUMP_FRAMES 16

#define NUM_TREE_WIGGLES      2

typedef struct {
    int state;
    LocalMapObject *apricorn;
    LocalMapObject *tree;
    s32 jumpTimer;
    u32 unk10;
    u32 jumpDx;
    u32 unk18;
    u32 jumpDz;
    s16 expelTimer;
    s8 wiggleTimer;
    u8 treeWiggles;
    u16 *unk24;
} AnimApricornTreeWork;

typedef struct {
    int timer;
} AnimPlayerShakeTreeWork;

static const s8 sApricornJumpDy[APRICORN_JUMP_FRAMES] = {
     4,  3,  3,  2,  2,  1,  1,  0,
     0, -1, -2, -3, -4, -5, -6, -7,
};

static BOOL Task_AnimApricornTree(TaskManager *taskman);
static BOOL Task_AnimPlayerShakeTree(TaskManager *taskman);
static LocalMapObject *CreateJumpingApricornObj(MapObjectMan *taskman, u32 sprite, u32 x, u32 z);
BOOL DoApricornJump(AnimApricornTreeWork *env);

void FieldSys_AnimApricornTree(FieldSystem *fsys, LocalMapObject *tree, u16 *a2) {
    AnimApricornTreeWork *env = AllocFromHeap(32, sizeof(AnimApricornTreeWork));
    MI_CpuFill8(env, 0, sizeof(AnimApricornTreeWork));
    env->state = 0;
    env->tree = tree;
    env->unk24 = a2;

    TaskManager_Call(fsys->taskman, Task_AnimApricornTree, env);
}

static BOOL Task_AnimApricornTree(TaskManager *taskman) {
    int direction;
    int posX;
    int posZ;
    VecFx32 pos;
    int apricornType;

    FieldSystem *fsys = TaskManager_GetSys(taskman);
    AnimApricornTreeWork *env = TaskManager_GetEnv(taskman);

    switch (env->state) {
    case 0:
        if (!sub_02055708(fsys, env->tree)) {
            *env->unk24 = 0;
            env->state = 10;
            break;
        }
        AnimPlayerShakeTreeWork *ptr = AllocFromHeapAtEnd(11, sizeof(AnimPlayerShakeTreeWork));
        TaskManager_Call(taskman, Task_AnimPlayerShakeTree, ptr);
        env->state = 1;
        break;
    case 1:
        MapObject_UnpauseMovement(env->tree);
        sub_0205F328(env->tree, 1);
        env->treeWiggles = 0;
        env->wiggleTimer = TREE_WIGGLE_FRAMES;
        env->state = 2;
        PlaySE(SEQ_SE_GS_KI_YURERU);
        break;
    case 2:
        if(--env->wiggleTimer <= 0) {
            env->treeWiggles++;
            env->wiggleTimer = TREE_WIGGLE_FRAMES;
        }
        if (env->treeWiggles < NUM_TREE_WIGGLES) {
            break;
        }
        sub_0205F328(env->tree, 0);
        MapObject_PauseMovement(env->tree);
        if (sub_02055708(fsys, env->tree)) {
            sub_02055760(fsys, env->tree);
            *env->unk24 = 1;
            env->state = 3;
            break;
        }
        *env->unk24 = 0;
        env->state = 10;
        break;
    case 3:
        direction = PlayerAvatar_GetFacingDirection(fsys->playerAvatar);
        env->jumpDx = 0;
        env->jumpDz = 0;
        env->unk18 = 0;
        switch (direction) {
        case DIR_NORTH:
            env->jumpDz = FX32_ONE;
            break;
        case DIR_SOUTH:
            env->jumpDz = -FX32_ONE;
            break;
        case DIR_EAST:
            env->jumpDx = -FX32_ONE;
            break;
        case DIR_WEST:
            env->jumpDx = FX32_ONE;
            break;
        }
        env->state = 4;
        break;
    case 4:
        PlayerAvatar_GetCoordsInFront(fsys->playerAvatar, &posX, &posZ);
        apricornType = FieldSys_ApricornTree_TryGetApricorn(fsys, env->tree) - 1;
        GF_ASSERT(apricornType >= APRICORN_NONE);
        env->apricorn = CreateJumpingApricornObj(fsys->mapObjectMan, SPRITE_BONMI_R + apricornType, posX, posZ);
        MapObject_GetPositionVec(env->apricorn, &pos);
        pos.y += 12 * FX32_ONE;
        MapObject_SetPositionVec(env->apricorn, &pos);
        env->state = 5;
        break;
    case 5:
        if (ov01_021FA2D4(env->apricorn)) {
            break;
        }
        ov01_021FA930(env->tree, 0x00000106);
        env->state = 7;
        break;
    case 6:
        break;
    case 7:
        if (ov01_021FA2D4(env->tree)) {
            break;
        }
        env->expelTimer = TREE_EXPEL_FRAMES;
        sub_0205F328(env->tree, 2);
        MapObject_UnpauseMovement(env->tree);
        env->state = 8;
        break;
    case 8:
        if (--env->expelTimer > 0) {
            break;
        }
        MapObject_ClearBits(env->apricorn, 0x20 << 4);
        env->jumpTimer = 0;
        PlaySE(SEQ_SE_GS_FW255E);
        env->state = 9;
        break;
    case 9:
        if (!DoApricornJump(env)) {
            break;
        }
        sub_0205F328(env->tree, 0);
        env->state = 10;
        break;
    case 10:
        MapObject_PauseMovement(env->tree);
        FreeToHeap(env);
        return TRUE;
    }
    return FALSE;
}

static LocalMapObject *CreateJumpingApricornObj(MapObjectMan *taskman, u32 sprite, u32 x, u32 z) {
    LocalMapObject *obj = CreateSpecialFieldObject(taskman, x, z, 0, sprite, 0, 1);
    GF_ASSERT(obj != NULL);

    MapObject_SetID(obj, obj_apricorn);
    MapObject_SetType(obj, 0);
    MapObject_SetFlagID(obj, 0);
    MapObject_SetXRange(obj, -1);
    MapObject_SetYRange(obj, -1);
    MapObject_SetBits(obj, 0x00002400);
    MapObject_ClearBits(obj, 0x00000180);
    sub_0205F89C(obj, TRUE);
    MapObject_SetBits(obj, 0x00000200);
    return obj;
}

static BOOL DoApricornJump(AnimApricornTreeWork *env) {
    VecFx32 pos;
    MapObject_GetPositionVec(env->apricorn, &pos);
    pos.y += sApricornJumpDy[env->jumpTimer] * FX32_ONE;
    pos.x += env->jumpDx;
    pos.z += env->jumpDz;
    MapObject_SetPositionVec(env->apricorn, &pos);

    if (++env->jumpTimer >= APRICORN_JUMP_FRAMES) {
        MapObject_Remove(env->apricorn);
        return TRUE;
    }
    return FALSE;
}

static BOOL Task_AnimPlayerShakeTree(TaskManager *taskman) {
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
    int *state_p = TaskManager_GetStatePtr(taskman);
    AnimPlayerShakeTreeWork *env = TaskManager_GetEnv(taskman);

    switch (*state_p) {
    case 0:
        MapObject_UnpauseMovement(playerObj);
        *state_p += 1;
        break;
    case 1:
        if (MapObject_AreBitsSetForMovementScriptInit(playerObj) == TRUE) {
            MapObject_ClearHeldMovementIfActive(playerObj);
            ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 0x2000);
            ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
            sub_0205F328(playerObj, 0);
            env->timer = 0;
            *state_p += 1;
        }
        break;
    case 2:
        if (++env->timer > 24) {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) == TRUE) {
                MapObject_ClearHeldMovementIfActive(playerObj);
                int flags = sub_0205C99C(PlayerAvatar_GetState(fsys->playerAvatar));
                ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, flags);
                ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
                *state_p += 1;
            }
        }
        break;
    case 3:
        MapObject_PauseMovement(playerObj);
        FreeToHeap(env);
        return TRUE;
    }
    return FALSE;
}
