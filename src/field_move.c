#include "field_move.h"

#include "constants/badge.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/std_script.h"
#include "constants/weather.h"

#include "fielddata/script/scr_seq/event_D24R0204.h"

#include "alph_checks.h"
#include "field_move_environment.h"
#include "field_player_avatar.h"
#include "launch_application.h"
#include "map_header.h"
#include "map_object.h"
#include "metatile_behavior.h"
#include "overlay_01.h"
#include "overlay_02.h"
#include "save_local_field_data.h"
#include "script.h"
#include "start_menu.h"
#include "sys_flags.h"
#include "unk_0203DB6C.h"
#include "unk_02054648.h"
#include "unk_0205CB48.h"

static FieldUseMoveEnvironment *FieldMove_CreateUseEnvironment(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static void FieldMove_DeleteUseEnvironment(FieldUseMoveEnvironment *environment);
static u32 FieldMove_CheckCut(const FieldMoveCheckData *checkData);
static void FieldMove_UseCut(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseCutInField(TaskManager *taskManager);
static u32 FieldMove_CheckFly(const FieldMoveCheckData *checkData);
static void FieldMove_UseFly(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static u32 FieldMove_CheckSurf(const FieldMoveCheckData *checkData);
static void FieldMove_UseSurf(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseSurfInField(TaskManager *taskManager);
static u32 FieldMove_CheckStrength(const FieldMoveCheckData *checkData);
static void FieldMove_UseStrength(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseStrengthInField(TaskManager *taskManager);
static u32 FieldMove_CheckRockSmash(const FieldMoveCheckData *checkData);
static void FieldMove_UseRockSmash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseRockSmashInField(TaskManager *taskManager);
static u32 FieldMove_CheckWaterfall(const FieldMoveCheckData *checkData);
static void FieldMove_UseWaterfall(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseWaterfallInField(TaskManager *taskManager);
static u32 FieldMove_CheckRockClimb(const FieldMoveCheckData *checkData);
static void FieldMove_UseRockClimb(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseRockClimbInField(TaskManager *taskManager);
static u32 FieldMove_CheckFlash(const FieldMoveCheckData *checkData);
static void FieldMove_UseFlash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseFlashInField(TaskManager *taskManager);
static u32 FieldMove_CheckTeleport(const FieldMoveCheckData *checkData);
static void FieldMove_UseTeleport(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseTeleportInField(TaskManager *taskManager);
static u32 FieldMove_CheckDig(const FieldMoveCheckData *checkData);
static void FieldMove_UseDig(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseDigInField(TaskManager *taskManager);
static u32 FieldMove_CheckSweetScent(const FieldMoveCheckData *checkData);
static void FieldMove_UseSweetScent(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static u32 FieldMove_CheckChatter(const FieldMoveCheckData *checkData);
static void FieldMove_UseChatter(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseChatterInField(TaskManager *taskManager);
static u32 FieldMove_CheckWhirlpool(const FieldMoveCheckData *checkData);
static void FieldMove_UseWhirlpool(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager);
static u32 FieldMove_CheckHeadbutt(const FieldMoveCheckData *checkData);
static void FieldMove_UseHeadbutt(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseHeadbuttInField(TaskManager *taskManager);

static const FieldMoveFuncData sFieldMoveFuncTable[] = {
    { FieldMove_UseCut,        FieldMove_CheckCut        },
    { FieldMove_UseFly,        FieldMove_CheckFly        },
    { FieldMove_UseSurf,       FieldMove_CheckSurf       },
    { FieldMove_UseStrength,   FieldMove_CheckStrength   },
    { FieldMove_UseRockSmash,  FieldMove_CheckRockSmash  },
    { FieldMove_UseWaterfall,  FieldMove_CheckWaterfall  },
    { FieldMove_UseRockClimb,  FieldMove_CheckRockClimb  },
    { FieldMove_UseFlash,      FieldMove_CheckFlash      },
    { FieldMove_UseTeleport,   FieldMove_CheckTeleport   },
    { FieldMove_UseDig,        FieldMove_CheckDig        },
    { FieldMove_UseSweetScent, FieldMove_CheckSweetScent },
    { FieldMove_UseChatter,    FieldMove_CheckChatter    },
    { FieldMove_UseWhirlpool,  FieldMove_CheckWhirlpool  },
    { FieldMove_UseHeadbutt,   FieldMove_CheckHeadbutt   },
};

static inline BOOL FieldMove_CheckSafariOrPalPark(const FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE || Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL FieldMove_CheckPalPark(const FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL FieldMove_CheckFlag(const FieldMoveCheckData *checkData, u32 flag) {
    if (checkData->flag & flag) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void *FieldMove_GetMoveFunc(FieldMoveFuncType funcType, u16 fieldMoveIndex) {
    if (funcType == FIELD_MOVE_FUNC_USE) {
        return sFieldMoveFuncTable[fieldMoveIndex].use;
    } else {
        return sFieldMoveFuncTable[fieldMoveIndex].check;
    }
}

void FieldMove_InitCheckData(FieldSystem *fieldSystem, FieldMoveCheckData *checkData) {
    checkData->fieldSystem = fieldSystem;
    checkData->mapId = fieldSystem->location->mapId;
    checkData->flag = 0;

    LocalMapObject *facingObject;

    FieldSystem_GetFacingObject(fieldSystem, &facingObject);
    checkData->facingObject = facingObject;

    if (facingObject != NULL) {
        switch (MapObject_GetSpriteID(facingObject)) {
        case SPRITE_ROCK:
            checkData->flag |= FIELD_MOVE_CHECK_ROCK;
            break;
        case SPRITE_BREAKROCK:
            checkData->flag |= FIELD_MOVE_CHECK_BREAKROCK;
            break;
        case SPRITE_TREE:
            checkData->flag |= FIELD_MOVE_CHECK_TREE;
            break;
        }
    }

    s32 x = GetPlayerXCoord(fieldSystem->playerAvatar);
    s32 z = GetPlayerZCoord(fieldSystem->playerAvatar);
    u32 standingTile = GetMetatileBehavior(fieldSystem, x, z);

    PlayerAvatar_GetCoordsInFront(fieldSystem->playerAvatar, &x, &z);
    u32 facingTile = GetMetatileBehavior(fieldSystem, x, z);

    if (Field_PlayerCanSurfOnTile(fieldSystem->playerAvatar, standingTile, facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_WATER;
    }
    if (MetatileBehavior_IsRockClimbInDirection(facingTile, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar))) {
        checkData->flag |= FIELD_MOVE_CHECK_ROCKCLIMB;
    }
    if (MetatileBehavior_IsWaterfall(facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_WATERFALL;
    }
    if (MetatileBehavior_IsWhirlpool(facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_WHIRLPOOL;
    }
    if (LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)) == WEATHER_FLASH) {
        checkData->flag |= FIELD_MOVE_CHECK_FLASH;
    }
    if (MetatileBehavior_IsHeadbutt(facingTile) || FieldSystem_FacingModelIsHeadbuttTree(fieldSystem)) {
        checkData->flag |= FIELD_MOVE_CHECK_HEADBUTT;
    }
}

static FieldUseMoveEnvironment *FieldMove_CreateUseEnvironment(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldUseMoveEnvironment *environment = Heap_Alloc(HEAP_ID_FIELD3, sizeof(FieldUseMoveEnvironment));
    environment->magic = 0x19740205;
    environment->facingObject = checkData->facingObject;
    environment->useData = *useData;
    return environment;
}

static void FieldMove_DeleteUseEnvironment(FieldUseMoveEnvironment *environment) {
    GF_ASSERT(environment->magic == 0x19740205);
    Heap_Free(environment);
}

static u32 FieldMove_CheckCut(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_HIVE)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_TREE)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseCut(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseCutInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseCutInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *environment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_cut, environment->facingObject);
    FieldMove_SetArgs(fieldSystem, environment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(environment);
    return FALSE;
}

static u32 FieldMove_CheckFly(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_STORM)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (!MapHeader_IsFlyAllowed(checkData->mapId)) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_HAVE_FOLLOWER;
    }
    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_NOW;
    }
    if (FieldMove_CheckSafariOrPalPark(checkData) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseFly(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldMoveData *fieldMoveData = Heap_Alloc(HEAP_ID_FIELD2, sizeof(FieldMoveData));
    fieldMoveData->partySlot = useData->partySlot;
    startMenu->exitTaskEnvironment2 = fieldMoveData;
    startMenu->exitTaskEnvironment = PokegearTownMap_LaunchApp(fieldSystem, 0);
    StartMenu_SetExitTaskFunc(startMenu, Task_UseFlyInField);
}

static u32 FieldMove_CheckSurf(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_FOG)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) == PLAYER_STATE_SURFING) {
        return FIELD_MOVE_RESPONSE_ALREADY_SURFING;
    }
    if (!FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_WATER)) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_HAVE_FOLLOWER;
    }
    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_NOW;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseSurf(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseSurfInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseSurfInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_surf, NULL);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckStrength(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_PLAIN)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (checkData->mapId == MAP_ICE_PATH_B2F) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_ROCK)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseStrength(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseStrengthInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseStrengthInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_strength, useMoveEnvironment->facingObject);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckRockSmash(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_ZEPHYR)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_BREAKROCK)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseRockSmash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseRockSmashInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseRockSmashInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_smash, useMoveEnvironment->facingObject);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckWaterfall(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_RISING)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_WATERFALL)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseWaterfall(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseWaterfallInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseWaterfallInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_waterfall, NULL);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckRockClimb(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_EARTH)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (!FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_ROCKCLIMB)) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_HAVE_FOLLOWER;
    }
    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_NOW;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseRockClimb(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseRockClimbInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseRockClimbInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_climb, NULL);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckFlash(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (CheckUseFlashInAlphChamber(checkData->fieldSystem)) {
        return FIELD_MOVE_RESPONSE_OK;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_FLASH)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseFlash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseFlashInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseFlashInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    if (CheckUseFlashInAlphChamber(fieldSystem)) {
        StartScriptFromMenu(taskManager, _EV_scr_seq_D24R0204_003, NULL);
    } else {
        StartScriptFromMenu(taskManager, std_menu_flash, NULL);
    }
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckTeleport(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!MapHeader_IsTeleportAllowed(checkData->mapId)) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_HAVE_FOLLOWER;
    }
    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_NOW;
    }
    if (FieldMove_CheckSafariOrPalPark(checkData) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseTeleport(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    FieldMoveEnvironment *fieldMoveEnvironment = FieldMove_CreateEnvironment(HEAP_ID_FIELD2, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *fieldMoveData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldMoveData));
    fieldMoveEnvironment->moveData = fieldMoveData;
    fieldMoveData->partySlot = useData->partySlot;
    startMenu->exitTaskFunc = Task_UseTeleportInField;
    startMenu->exitTaskEnvironment = fieldMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseTeleportInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldMoveEnvironment *fieldMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldMoveTaskEnvironment *fieldMoveTaskEnvironment = FieldMoveTask_CreateTeleportEnvironment(fieldSystem, fieldMoveEnvironment->mon, fieldMoveEnvironment->moveData->partySlot, HEAP_ID_FIELD1);
    Heap_Free(fieldMoveEnvironment->moveData);
    Heap_Free(fieldMoveEnvironment);
    TaskManager_Jump(taskManager, Task_FieldTeleport, fieldMoveTaskEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckDig(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (MapHeader_IsCave(checkData->mapId) != TRUE || MapHeader_IsEscapeRopeAllowed(checkData->mapId) != TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_HAVE_FOLLOWER;
    }
    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_NOW;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseDig(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    FieldMoveEnvironment *fieldMoveEnvironment = FieldMove_CreateEnvironment(HEAP_ID_FIELD2, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *fieldMoveData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldMoveData));
    fieldMoveEnvironment->moveData = fieldMoveData;
    fieldMoveData->partySlot = useData->partySlot;
    startMenu->exitTaskFunc = Task_UseDigInField;
    startMenu->exitTaskEnvironment = fieldMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseDigInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldMoveEnvironment *fieldMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldMoveTaskEnvironment *fieldMoveTaskEnvironment = FieldMoveTask_CreateDigEnvironment(fieldSystem, fieldMoveEnvironment->mon, fieldMoveEnvironment->moveData->partySlot, HEAP_ID_FIELD2);
    Heap_Free(fieldMoveEnvironment->moveData);
    Heap_Free(fieldMoveEnvironment);
    TaskManager_Jump(taskManager, Task_FieldDig, fieldMoveTaskEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckSweetScent(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (FieldMove_CheckPalPark(checkData) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseSweetScent(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldMoveEnvironment *fieldMoveEnvironment = FieldMove_CreateEnvironment(HEAP_ID_FIELD2, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *fieldMoveData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldMoveData));
    fieldMoveEnvironment->moveData = fieldMoveData;
    fieldMoveData->partySlot = useData->partySlot;
    FieldSystem_LoadFieldOverlay(fieldSystem);
    startMenu->exitTaskFunc = Task_UseSweetScentInField;
    startMenu->exitTaskEnvironment = fieldMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static u32 FieldMove_CheckChatter(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMove_UseChatter(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    startMenu->exitTaskFunc = Task_UseChatterInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseChatterInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_chatter, NULL);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckWhirlpool(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_GLACIER)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_WHIRLPOOL)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseWhirlpool(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseWhirlpoolInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_whirlpool, NULL);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}

static u32 FieldMove_CheckHeadbutt(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (FieldMove_CheckFlag(checkData, FIELD_MOVE_CHECK_HEADBUTT)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMove_UseHeadbutt(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *startMenu = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *useMoveEnvironment = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    startMenu->exitTaskFunc = Task_UseHeadbuttInField;
    startMenu->exitTaskEnvironment = useMoveEnvironment;
    startMenu->state = START_MENU_STATE_12;
}

static BOOL Task_UseHeadbuttInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *useMoveEnvironment = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_headbutt, useMoveEnvironment->facingObject);
    FieldMove_SetArgs(fieldSystem, useMoveEnvironment->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(useMoveEnvironment);
    return FALSE;
}
