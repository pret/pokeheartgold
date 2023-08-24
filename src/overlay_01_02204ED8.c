#include "global.h"
#include "assert.h"
#include "encounter.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "fieldmap.h"
#include "filesystem.h"
#include "heap.h"
#include "overlay_01_021EDAFC.h"
#include "overlay_01_02204ED8.h"
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
    u8 filler38[20];
    s16 unk4c[][2];
} UnkStruct_02204EFC;

static BOOL ov01_02204EFC(TaskManager*);
static s8 ov01_02204FE0(u16, u16, u32, u32, u32, s16[][2]);
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

void ov01_02204ED8(FieldSystem *fieldSystem, u16 *varPointer) {
    u16 **didHeadbuttStartBattle = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(didHeadbuttStartBattle));
    *didHeadbuttStartBattle = varPointer;
    *varPointer = FALSE;
    TaskManager_Call(fieldSystem->taskman, ov01_02204EFC, didHeadbuttStartBattle);
}

static BOOL ov01_02204EFC(TaskManager *taskManager) {
    UnkStruct_02204EFC *unk4;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u16 **didHeadbuttStartBattle = TaskManager_GetEnv(taskManager);
    unk4 = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_a_2_5_2, fieldSystem->location->mapId, HEAP_ID_FIELD);
    if (unk4->unk00 != 0 || unk4->unk02 != 0) {
        BattleSetup *setup;
        u32 x;
        u32 y;
        ov01_022050F8(fieldSystem, &x, &y);
        u32 trainerId = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        s32 unk0 = ov01_02204FE0(unk4->unk00, unk4->unk02, trainerId, x, y, unk4->unk4c);
        if (unk0 == -1) {
            FreeToHeap(unk4);
            FreeToHeap(didHeadbuttStartBattle);
            return TRUE;
        }
        void *unk2;
        if (unk0 == 0) {
            unk2 = &unk4->unk04;
        } else if (unk0 == 1) {
            unk2 = &unk4->unk1c;
        } else if (unk0 == 2) {
            unk2 = &unk4->unk34;
        } else {
            GF_ASSERT(FALSE);
            FreeToHeap(unk4);
            FreeToHeap(didHeadbuttStartBattle);
            return TRUE;
        }
        if (ov02_02247374(fieldSystem, &setup, unk2)) {
            **didHeadbuttStartBattle = TRUE;
            FreeToHeap(unk4);
            FreeToHeap(didHeadbuttStartBattle);
            sub_02050B90(fieldSystem, taskManager, setup);
            return FALSE;
        }
    }
    FreeToHeap(unk4);
    FreeToHeap(didHeadbuttStartBattle);
    return TRUE;  
}

static s8 ov01_02204FE0(u16 a0, u16 a1, u32 trainerId, u32 x, u32 y, s16 a5[][2]) {
    u16 i;
    u16 j = a0 * 6;
    u16 unkC = a1 * 6;
    for (i = 0; i < j; i++) {
        if (x == a5[i][0] && y == a5[i][1]) {
            return ov01_02205074(i / 6, a0, trainerId);
        }
    }
    s32 unk5 = j + unkC;
    for (; j < unk5; j++) {
        if (x == a5[j][0] && y == a5[j][1]) {
            return 2;
        }
    }
    return -1;
}

static s8 ov01_02205074(u8 a0, u8 a1, u32 trainerId) {
    s8 unk7 = -1;
    u8 unk4 = trainerId % 10;
    if (a1 >= 5) {
        u8 unk1 = a0 % 5;
        unk7 = ov01_0220969A[unk4][unk1];
    } else if (a1 == 4) {
        unk7 = ov01_02209672[unk4][a0];
    } else if (a1 == 3) {
        unk7 = ov01_02209654[unk4][a0];
    } else if (a1 == 2) {
        unk7 = ov01_02209640[unk4][a0];
    } else if (a1 == 1) {
        unk7 = ov01_02209634[unk4];
    } else {
        GF_ASSERT(FALSE);
    }
    return unk7;
}

static void ov01_022050F8(FieldSystem *fieldSystem, u32 *x, u32 *y) {
    u32 inFrontX, inFrontY;
    PlayerAvatar_GetCoordsInFront(fieldSystem->playerAvatar, &inFrontX, &inFrontY);
    if (FollowingPokemon_IsActive(fieldSystem)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(fieldSystem);
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
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 x = ScriptGetVar(ctx);
    u8 y = ScriptGetVar(ctx);
    Window **moneyBox = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_BOX);
    *moneyBox = ov01_021EED60(ctx->fieldSystem, x, y);
    return FALSE;
}

BOOL ScrCmd_796(ScriptContext *ctx) {
    Window **moneyBox = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MONEY_BOX);
    ov01_021EEE30(*moneyBox);
    return FALSE;
}

// Unused
BOOL ScrCmd_797(ScriptContext *ctx) {
    Window **moneyBox = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MONEY_BOX);
    ov01_021EEE44(ctx->fieldSystem, *moneyBox);
    return FALSE;
}
