#include "overlay_01_apricorn_tree_anim.h"

#include "constants/apricorns.h"
#include "constants/scrcmd.h"
#include "constants/sndseq.h"

#include "map_object.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_021F944C.h"
#include "script.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_02055418.h"
#include "unk_0205CB48.h"
#include "unk_02062108.h"

#define TREE_WIGGLE_FRAMES 16
#define TREE_EXPEL_FRAMES  8

#define APRICORN_JUMP_FRAMES 16

#define NUM_TREE_WIGGLES 2

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
    4,
    3,
    3,
    2,
    2,
    1,
    1,
    0,
    0,
    -1,
    -2,
    -3,
    -4,
    -5,
    -6,
    -7,
};

static BOOL Task_AnimApricornTree(TaskManager *taskman);
static BOOL Task_AnimPlayerShakeTree(TaskManager *taskman);
static LocalMapObject *CreateJumpingApricornObj(MapObjectManager *taskman, u32 sprite, u32 x, u32 z);
static BOOL DoApricornJump(AnimApricornTreeWork *env);

void FieldSystem_AnimApricornTree(FieldSystem *fieldSystem, LocalMapObject *tree, u16 *a2) {
    AnimApricornTreeWork *env = AllocFromHeap(HEAP_ID_32, sizeof(AnimApricornTreeWork));
    MI_CpuFill8(env, 0, sizeof(AnimApricornTreeWork));
    env->state = 0;
    env->tree = tree;
    env->unk24 = a2;

    TaskManager_Call(fieldSystem->taskman, Task_AnimApricornTree, env);
}

static BOOL Task_AnimApricornTree(TaskManager *taskman) {
    int direction;
    int posX;
    int posZ;
    VecFx32 pos;
    int apricornType;

    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    AnimApricornTreeWork *env = TaskManager_GetEnvironment(taskman);

    switch (env->state) {
    case 0:
        if (!sub_02055708(fieldSystem, env->tree)) {
            *env->unk24 = 0;
            env->state = 10;
            break;
        }
        AnimPlayerShakeTreeWork *ptr = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(AnimPlayerShakeTreeWork));
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
        if (--env->wiggleTimer <= 0) {
            env->treeWiggles++;
            env->wiggleTimer = TREE_WIGGLE_FRAMES;
        }
        if (env->treeWiggles < NUM_TREE_WIGGLES) {
            break;
        }
        sub_0205F328(env->tree, 0);
        MapObject_PauseMovement(env->tree);
        if (sub_02055708(fieldSystem, env->tree)) {
            sub_02055760(fieldSystem, env->tree);
            *env->unk24 = 1;
            env->state = 3;
            break;
        }
        *env->unk24 = 0;
        env->state = 10;
        break;
    case 3:
        direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
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
        PlayerAvatar_GetCoordsInFront(fieldSystem->playerAvatar, &posX, &posZ);
        apricornType = FieldSystem_ApricornTree_TryGetApricorn(fieldSystem, env->tree) - 1;
        GF_ASSERT(apricornType >= APRICORN_NONE);
        env->apricorn = CreateJumpingApricornObj(fieldSystem->mapObjectManager, SPRITE_BONMI_R + apricornType, posX, posZ);
        MapObject_CopyPositionVector(env->apricorn, &pos);
        pos.y += 12 * FX32_ONE;
        MapObject_SetPositionVector(env->apricorn, &pos);
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
        MapObject_ClearFlagsBits(env->apricorn, MAPOBJECTFLAG_VISIBLE);
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
        Heap_Free(env);
        return TRUE;
    }
    return FALSE;
}

static LocalMapObject *CreateJumpingApricornObj(MapObjectManager *taskman, u32 sprite, u32 x, u32 z) {
    LocalMapObject *obj = MapObject_Create(taskman, x, z, 0, sprite, 0, 1);
    GF_ASSERT(obj != NULL);

    MapObject_SetID(obj, obj_apricorn);
    MapObject_SetType(obj, 0);
    MapObject_SetEventFlag(obj, 0);
    MapObject_SetXRange(obj, -1);
    MapObject_SetYRange(obj, -1);
    MapObject_SetFlagsBits(obj, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK13 | MAPOBJECTFLAG_KEEP));
    MapObject_ClearFlagsBits(obj, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK8 | MAPOBJECTFLAG_UNK7));
    MapObject_SetFlag29(obj, TRUE);
    MapObject_SetFlagsBits(obj, MAPOBJECTFLAG_VISIBLE);
    return obj;
}

static BOOL DoApricornJump(AnimApricornTreeWork *env) {
    VecFx32 pos;
    MapObject_CopyPositionVector(env->apricorn, &pos);
    pos.y += sApricornJumpDy[env->jumpTimer] * FX32_ONE;
    pos.x += env->jumpDx;
    pos.z += env->jumpDz;
    MapObject_SetPositionVector(env->apricorn, &pos);

    if (++env->jumpTimer >= APRICORN_JUMP_FRAMES) {
        MapObject_Remove(env->apricorn);
        return TRUE;
    }
    return FALSE;
}

static BOOL Task_AnimPlayerShakeTree(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    u32 *state_p = TaskManager_GetStatePtr(taskman);
    AnimPlayerShakeTreeWork *env = TaskManager_GetEnvironment(taskman);

    switch (*state_p) {
    case 0:
        MapObject_UnpauseMovement(playerObj);
        ++(*state_p);
        break;
    case 1:
        if (MapObject_AreBitsSetForMovementScriptInit(playerObj) == TRUE) {
            MapObject_ClearHeldMovementIfActive(playerObj);
            Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 0x2000);
            Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
            sub_0205F328(playerObj, 0);
            env->timer = 0;
            ++(*state_p);
        }
        break;
    case 2:
        if (++env->timer > 24) {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) == TRUE) {
                MapObject_ClearHeldMovementIfActive(playerObj);
                int flags = PlayerAvatar_GetTransitionBits(PlayerAvatar_GetState(fieldSystem->playerAvatar));
                Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, flags);
                Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
                ++(*state_p);
            }
        }
        break;
    case 3:
        MapObject_PauseMovement(playerObj);
        Heap_Free(env);
        return TRUE;
    }
    return FALSE;
}
