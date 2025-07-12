#include "field/headbutt.h"

#include "global.h"

#include "assert.h"
#include "encounter.h"
#include "fieldmap.h"
#include "filesystem.h"
#include "follow_mon.h"
#include "heap.h"
#include "map_object.h"
#include "overlay_01_021EDAFC.h"
#include "overlay_01_02204ED8.h"
#include "overlay_02.h"
#include "player_data.h"
#include "scrcmd.h"
#include "script.h"
#include "task.h"
#include "unk_0205CB48.h"
#include "unk_0205FD20.h"

static BOOL Task_TryHeadbuttEncounter(TaskManager *taskManager);
static s8 Headbutt_GetTreeTypeFromTable(u16 numRegularTrees, u16 numSecretTrees, u32 trainerId, u32 x, u32 y, s16 treeCoords[][2]);
static s8 Headbutt_GetTreeType_Regular(u8 whichTree, u8 numTrees, u32 trainerId);
static void GetCoordsOfFacingTree(FieldSystem *fieldSystem, u32 *x, u32 *y);

enum TreeType {
    TREETYPE_COMMON,
    TREETYPE_RARE,
    TREETYPE_SECRET,
    TREETYPE_NONE = -1
};

static const s8 sRareTreeLUT_1[][1] = {
    { TREETYPE_COMMON },
    { TREETYPE_RARE },
    { TREETYPE_COMMON },
    { TREETYPE_RARE },
    { TREETYPE_COMMON },
    { TREETYPE_RARE },
    { TREETYPE_COMMON },
    { TREETYPE_RARE },
    { TREETYPE_COMMON },
    { TREETYPE_RARE },
    { TREETYPE_COMMON },
    { TREETYPE_COMMON },
};

static const s8 sRareTreeLUT_2[][2] = {
    { TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON },
};

static const s8 sRareTreeLUT_3[][3] = {
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE   },
    { TREETYPE_COMMON, TREETYPE_NONE,   TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_NONE   },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
    { TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_NONE,   TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE   },
    { TREETYPE_COMMON, TREETYPE_NONE,   TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_NONE   },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
};

static const s8 sRareTreeLUT_4[][4] = {
    { TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_COMMON },
    { TREETYPE_RARE,   TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_RARE,   TREETYPE_NONE   },
    { TREETYPE_COMMON, TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_RARE   },
    { TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
    { TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE   },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_RARE   },
};

static const s8 sRareTreeLUT_5Plus[][5] = {
    { TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_RARE,   TREETYPE_NONE   },
    { TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON, TREETYPE_RARE   },
    { TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE,   TREETYPE_COMMON },
    { TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_COMMON, TREETYPE_RARE,   TREETYPE_NONE   },
};

typedef struct TaskData_TryHeadbuttEncounter {
    u16 *resultPtr;
} TaskData_TryHeadbuttEncounter;

void FieldSystem_TryHeadbuttEncounter(FieldSystem *fieldSystem, u16 *varPointer) {
    TaskData_TryHeadbuttEncounter *didHeadbuttStartBattle = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(didHeadbuttStartBattle));
    didHeadbuttStartBattle->resultPtr = varPointer;
    *varPointer = FALSE;
    TaskManager_Call(fieldSystem->taskman, Task_TryHeadbuttEncounter, didHeadbuttStartBattle);
}

static BOOL Task_TryHeadbuttEncounter(TaskManager *taskManager) {
    HeadbuttEncounterData *headbuttTable;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    TaskData_TryHeadbuttEncounter *didHeadbuttStartBattle = TaskManager_GetEnvironment(taskManager);
    headbuttTable = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_arc_headbutt, fieldSystem->location->mapId, HEAP_ID_FIELD2);
    if (headbuttTable->numRegularTrees != 0 || headbuttTable->numSecretTrees != 0) {
        BattleSetup *setup;
        u32 x;
        u32 y;
        GetCoordsOfFacingTree(fieldSystem, &x, &y);
        u32 trainerId = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfile(fieldSystem->saveData));
        enum TreeType treeType = (enum TreeType)Headbutt_GetTreeTypeFromTable(headbuttTable->numRegularTrees, headbuttTable->numSecretTrees, trainerId, x, y, headbuttTable->treeCoords);
        if (treeType == TREETYPE_NONE) {
            Heap_Free(headbuttTable);
            Heap_Free(didHeadbuttStartBattle);
            return TRUE;
        }
        HeadbuttSlot *headbuttEncounterSlots;
        if (treeType == TREETYPE_COMMON) {
            headbuttEncounterSlots = headbuttTable->common;
        } else if (treeType == TREETYPE_RARE) {
            headbuttEncounterSlots = headbuttTable->rare;
        } else if (treeType == TREETYPE_SECRET) {
            headbuttEncounterSlots = headbuttTable->secret;
        } else {
            GF_ASSERT(FALSE);
            Heap_Free(headbuttTable);
            Heap_Free(didHeadbuttStartBattle);
            return TRUE;
        }
        if (FieldSystem_ChooseHeadbuttEncounter(fieldSystem, &setup, headbuttEncounterSlots)) {
            *didHeadbuttStartBattle->resultPtr = TRUE;
            Heap_Free(headbuttTable);
            Heap_Free(didHeadbuttStartBattle);
            FieldSystem_StartForcedWildBattle(fieldSystem, taskManager, setup);
            return FALSE;
        }
    }
    Heap_Free(headbuttTable);
    Heap_Free(didHeadbuttStartBattle);
    return TRUE;
}

static s8 Headbutt_GetTreeTypeFromTable(u16 numRegularTrees, u16 numSecretTrees, u32 trainerId, u32 x, u32 y, s16 treeCoords[][2]) {
    // Based on your trainer ID and the tree you're facing, choose which encounter table applies
    // Not all trees are headbuttable, this is determined by trainer ID
    u16 i;
    u16 numCoordsRegular = numRegularTrees * 6;
    u16 numCoordsSecret = numSecretTrees * 6;
    for (i = 0; i < numCoordsRegular; i++) {
        if (x == treeCoords[i][0] && y == treeCoords[i][1]) {
            return Headbutt_GetTreeType_Regular(i / 6, numRegularTrees, trainerId);
        }
    }
    // Check whether the facing tree is in the rare table
    for (i = numCoordsRegular; i < numCoordsRegular + numCoordsSecret; i++) {
        if (x == treeCoords[i][0] && y == treeCoords[i][1]) {
            return TREETYPE_SECRET;
        }
    }
    return TREETYPE_NONE;
}

static s8 Headbutt_GetTreeType_Regular(u8 whichTree, u8 numTrees, u32 trainerId) {
    s8 ret = TREETYPE_NONE;
    u8 trainerIdLastDigit = trainerId % 10;
    if (numTrees >= 5) {
        u8 column = whichTree % 5;
        ret = sRareTreeLUT_5Plus[trainerIdLastDigit][column];
    } else if (numTrees == 4) {
        ret = sRareTreeLUT_4[trainerIdLastDigit][whichTree];
    } else if (numTrees == 3) {
        ret = sRareTreeLUT_3[trainerIdLastDigit][whichTree];
    } else if (numTrees == 2) {
        ret = sRareTreeLUT_2[trainerIdLastDigit][whichTree];
    } else if (numTrees == 1) {
        ret = sRareTreeLUT_1[trainerIdLastDigit][0];
    } else {
        // numTrees == 0 --> unreachable
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
        u32 followingMonZ = MapObject_GetCurrentZ(object);
        if (inFrontX == followingMonX && inFrontY == followingMonZ) {
            u8 dir = MapObject_GetFacingDirection(object);
            inFrontX = GetDeltaXByFacingDirection(dir) + followingMonX;
            inFrontY = GetDeltaYByFacingDirection(dir) + followingMonZ;
        }
    }
    *x = inFrontX;
    *y = inFrontY;
}

// ---------------------------------------------------------------- //
// Not related to headbutt, should these be a separate file object? //
// ---------------------------------------------------------------- //

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
