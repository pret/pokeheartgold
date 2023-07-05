#include "assert.h"
#include "encounter.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "fieldmap.h"
#include "filesystem.h"
#include "heap.h"
#include "overlay_01.h"
#include "overlay_01_021EDAFC.h"
#include "overlay_02.h"
#include "player_data.h"
#include "scrcmd.h"
#include "script.h"
#include "task.h"
#include "unk_0205CB48.h"
#include "unk_0205FD20.h"

typedef struct UnkStruct_02204EFC {
    u16 unk00;
    u16 unk02;
    void *unk04;
    u8 filler08[20];
    void *unk1c;
    u8 filler20[20];
    void *unk34;
    u8 filler38[18];
    void *unk4c;
} UnkStruct_02204EFC;

static BOOL ov01_02204EFC(TaskManager*);
static s8 ov01_02204FE0(u16, u16, u32, u32, u32, void *);
static s8 ov01_02205074(u8, u8, u32);
static void ov01_022050F8(FieldSystem*, u32*, u32*);

const s8 ov01_02209634[] = {
    0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0,
};

const s8 ov01_02209640[][2] = {
    {0, 1},
    {1, 0},
    {0, 1},
    {1, 0},
    {0, 1},
    {1, 0},
    {0, 1},
    {1, 0},
    {0, 1},
    {1, 0},
};

const s8 ov01_02209654[][3] = {
    { 0,  1, -1},
    { 0, -1,  1},
    { 1,  0, -1},
    { 1, -1,  0},
    {-1,  0,  1},
    {-1,  1,  0},
    { 0,  1, -1},
    { 0, -1,  1},
    { 1,  0, -1},
    { 1, -1,  0},
};

const s8 ov01_02209672[][4] = {
    {-1,  0,  0,  1},
    { 1, -1,  0,  0},
    { 1,  1, -1,  0},
    { 0,  1,  1, -1},
    { 0,  0,  1,  1},
    {-1,  0,  1,  0},
    { 1, -1,  0,  1},
    { 0,  1, -1,  0},
    { 1,  0,  1, -1},
    { 0,  1,  0,  1},
};

const s8 ov01_0220969A[][5] = {
    {-1,  0,  0,  1,  1},
    { 1, -1,  0,  0,  1},
    { 1,  1, -1,  0,  0},
    { 0,  1,  1, -1,  0},
    { 0,  0,  1,  1, -1},
    {-1,  0,  1,  0,  1},
    { 1, -1,  0,  1,  0},
    { 0,  1, -1,  0,  1},
    { 1,  0,  1, -1,  0},
    { 0,  1,  0,  1, -1},
};

void ov01_02204ED8(FieldSystem *fsys, u16 *a1) {
    u16 **r2 = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(r2));
    *r2 = a1;
    *a1 = FALSE;
    TaskManager_Call(fsys->taskman, ov01_02204EFC, r2);
}

static BOOL ov01_02204EFC(TaskManager *taskManager) {
    UnkStruct_02204EFC *r4;
    FieldSystem *fsys = TaskManager_GetFieldSystem(taskManager);
    u16 **r6 = TaskManager_GetEnv(taskManager);
    r4 = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_a_2_5_2, fsys->location->mapId, HEAP_ID_FIELD);
    if (r4->unk00 != 0 || r4->unk02 != 0) {
        BATTLE_SETUP *sp10;
        u32 x;
        u32 y;
        ov01_022050F8(fsys, &x, &y);
        u32 trainerId = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfileAddr(fsys->savedata));
        s32 r0 = ov01_02204FE0(r4->unk00, r4->unk02, trainerId, x, y, &r4->unk4c);
        if (r0 == -1) {
            FreeToHeap(r4);
            FreeToHeap(r6);
            return TRUE;
        }
        void *r2;
        if (r0 == 0) {
            r2 = &r4->unk04;
        } else if (r0 == 1) {
            r2 = &r4->unk1c;
        } else if (r0 == 2) {
            r2 = &r4->unk34;
        } else {
            GF_ASSERT(FALSE);
            FreeToHeap(r4);
            FreeToHeap(r6);
            return TRUE;
        }
        if (ov02_02247374(fsys, &sp10, r2)) {
            **r6 = TRUE;
            FreeToHeap(r4);
            FreeToHeap(r6);
            sub_02050B90(fsys, taskManager, sp10);
            return FALSE;
        }
    }
    FreeToHeap(r4);
    FreeToHeap(r6);
    return TRUE;  
}

static s8 ov01_02204FE0(u16 a0, u16 a1, u32 trainerId, u32 x, u32 y, void *a5) {
    u16 r1 = a0 * 6;
    u16 ip = a1 * 6;
    for (u16 r0 = 0; r0 < r1; r0++) {
        if (x == *(s16*)(a5 + r0 * 4)) {
            if (y == *(s16*)(a5 + r0 * 4 + 2)) {
                return ov01_02205074(r0 / 6, a0, trainerId);
            }
        }
    }
    for (int r5 = r1 + ip; r1 < r5; r1++) {
        if (x == *(s16*)(a5 + r1 * 4)) {
            if (y == *(s16*)(a5 + r1 * 4 + 2)) {
                return 2;
            }
        }
    }
    return -1;
}

static s8 ov01_02205074(u8 a0, u8 a1, u32 trainerId) {
    s8 r7 = -1;
    u8 r4 = trainerId % 10;
    if (a1 >= 5) {
        u8 r1 = a0 % 5;
        r7 = ov01_0220969A[r4][r1];
    } else if (a1 == 4) {
        r7 = ov01_02209672[r4][a0];
    } else if (a1 == 3) {
        r7 = ov01_02209654[r4][a0];
    } else if (a1 == 2) {
        r7 = ov01_02209640[r4][a0];
    } else if (a1 == 1) {
        r7 = ov01_02209634[r4];
    } else {
        GF_ASSERT(FALSE);
    }
    return r7;
}

static void ov01_022050F8(FieldSystem *fsys, u32 *x, u32 *y) {
    u32 inFrontX, inFrontY;
    PlayerAvatar_GetCoordsInFront(fsys->playerAvatar, &inFrontX, &inFrontY);
    if (FollowingPokemon_IsActive(fsys)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(fsys);
        u32 followingMonX = MapObject_GetCurrentX(object);
        u32 followingMonY = MapObject_GetCurrentY(object);
        if (inFrontX == followingMonX && inFrontY == followingMonY) {
            u8 dir = MapObject_GetFacingDirection(object);
            inFrontX = GetDeltaXByFacingDirection(dir) + followingMonX;
            inFrontY = GetDeltaYByFacingDirection(dir) + followingMonY;
        }
    }
    *x = inFrontX;
    *y = inFrontY;
}

BOOL ScrCmd_795(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 x = ScriptGetVar(ctx);
    u8 y = ScriptGetVar(ctx);
    Window **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    *moneyBox = ov01_021EED60(ctx->fsys, x, y);
    return FALSE;
}

BOOL ScrCmd_796(ScriptContext *ctx) {
    Window **moneyBox = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MONEY_BOX);
    ov01_021EEE30(*moneyBox);
    return FALSE;
}

// Unused
BOOL ScrCmd_797(ScriptContext *ctx) {
    Window **moneyBox = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MONEY_BOX);
    ov01_021EEE44(ctx->fsys, *moneyBox);
    return FALSE;
}
