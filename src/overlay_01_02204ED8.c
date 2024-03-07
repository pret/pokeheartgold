#include "global.h"
#include "headbutt_encounter.h"
#include "assert.h"
#include "encounter.h"
#include "follow_mon.h"
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

static BOOL ov01_02204EFC(TaskManager *taskManager);
static s8 ov01_02204FE0(u16 uncommonTableLength, u16 rareTableLength, u32 trainerId, u32 x, u32 y, s16 treeCoords[][2]);
static s8 ov01_02205074(u8 tableIndex, u8 whichTable, u32 trainerId);
static void GetCoordsOfFacingTree(FieldSystem *fieldSystem, u32 *x, u32 *y);

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
    HeadbuttEncounterData *unk4;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u16 **didHeadbuttStartBattle = TaskManager_GetEnvironment(taskManager);
    unk4 = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_arc_headbutt, fieldSystem->location->mapId, HEAP_ID_FIELD);
    if (unk4->numUncommon != 0 || unk4->numRare != 0) {
        BattleSetup *setup;
        u32 x;
        u32 y;
        GetCoordsOfFacingTree(fieldSystem, &x, &y);
        u32 trainerId = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        s32 unk0 = ov01_02204FE0(unk4->numUncommon, unk4->numRare, trainerId, x, y, unk4->treeCoords);
        if (unk0 == -1) {
            FreeToHeap(unk4);
            FreeToHeap(didHeadbuttStartBattle);
            return TRUE;
        }
        HeadbuttSlot *unk2;
        if (unk0 == 0) {
            unk2 = unk4->common;
        } else if (unk0 == 1) {
            unk2 = unk4->uncommon;
        } else if (unk0 == 2) {
            unk2 = unk4->rare;
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

static s8 ov01_02204FE0(u16 uncommonTableLength, u16 rareTableLength, u32 trainerId, u32 x, u32 y, s16 treeCoords[][2]) {
    u16 i;
    u16 j = uncommonTableLength * 6;
    u16 unkC = rareTableLength * 6;
    for (i = 0; i < j; i++) {
        if (x == treeCoords[i][0] && y == treeCoords[i][1]) {
            return ov01_02205074(i / 6, uncommonTableLength, trainerId);
        }
    }
    s32 unk5 = j + unkC;
    for (; j < unk5; j++) {
        if (x == treeCoords[j][0] && y == treeCoords[j][1]) {
            return 2;
        }
    }
    return -1;
}

static s8 ov01_02205074(u8 tableIndex, u8 whichTable, u32 trainerId) {
    s8 ret = -1;
    u8 trainerIdLastDigit = trainerId % 10;
    if (whichTable >= 5) {
        u8 unk1 = tableIndex % 5;
        ret = ov01_0220969A[trainerIdLastDigit][unk1];
    } else if (whichTable == 4) {
        ret = ov01_02209672[trainerIdLastDigit][tableIndex];
    } else if (whichTable == 3) {
        ret = ov01_02209654[trainerIdLastDigit][tableIndex];
    } else if (whichTable == 2) {
        ret = ov01_02209640[trainerIdLastDigit][tableIndex];
    } else if (whichTable == 1) {
        ret = ov01_02209634[trainerIdLastDigit];
    } else {
        GF_ASSERT(FALSE);
    }
    return ret;
}

static void GetCoordsOfFacingTree(FieldSystem *fieldSystem, u32 *x, u32 *y) {
    int inFrontX, inFrontY;
    PlayerAvatar_GetCoordsInFront(fieldSystem->playerAvatar, &inFrontX, &inFrontY);
    if (FollowMon_IsActive(fieldSystem)) {
        LocalMapObject *object = FollowMon_GetMapObject(fieldSystem);
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
