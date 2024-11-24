#include "field_move.h"

#include "constants/badge.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/std_script.h"
#include "constants/weather.h"

#include "fielddata/script/scr_seq/event_D24R0204.h"

#include "alph_checks.h"
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
static u32 FieldMoveMenuCheck_Strength(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Strength(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseStrengthInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_RockSmash(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_RockSmash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseRockSmashInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Waterfall(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Waterfall(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseWaterfallInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_RockClimb(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_RockClimb(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseRockClimbInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Flash(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Flash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseFlashInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Teleport(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Teleport(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseTeleportInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Dig(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Dig(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseDigInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_SweetScent(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_SweetScent(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static u32 FieldMoveMenuCheck_Chatter(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Chatter(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseChatterInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Whirlpool(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Whirlpool(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Headbutt(const FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Headbutt(FieldMoveUseData *useData, const FieldMoveCheckData *checkData);
static BOOL Task_UseHeadbuttInField(TaskManager *taskManager);
static struct TeleportFieldEnv *sub_020689A4(HeapID heapId, u8 slotno, SaveData *saveData);

static const FieldMoveFuncData sFieldMoveFuncTable[] = {
    { FieldMove_UseCut,            FieldMove_CheckCut            },
    { FieldMove_UseFly,            FieldMove_CheckFly            },
    { FieldMove_UseSurf,           FieldMove_CheckSurf           },
    { FieldMoveMenuUse_Strength,   FieldMoveMenuCheck_Strength   },
    { FieldMoveMenuUse_RockSmash,  FieldMoveMenuCheck_RockSmash  },
    { FieldMoveMenuUse_Waterfall,  FieldMoveMenuCheck_Waterfall  },
    { FieldMoveMenuUse_RockClimb,  FieldMoveMenuCheck_RockClimb  },
    { FieldMoveMenuUse_Flash,      FieldMoveMenuCheck_Flash      },
    { FieldMoveMenuUse_Teleport,   FieldMoveMenuCheck_Teleport   },
    { FieldMoveMenuUse_Dig,        FieldMoveMenuCheck_Dig        },
    { FieldMoveMenuUse_SweetScent, FieldMoveMenuCheck_SweetScent },
    { FieldMoveMenuUse_Chatter,    FieldMoveMenuCheck_Chatter    },
    { FieldMoveMenuUse_Whirlpool,  FieldMoveMenuCheck_Whirlpool  },
    { FieldMoveMenuUse_Headbutt,   FieldMoveMenuCheck_Headbutt   },
};

static inline BOOL FieldMove_CheckSafariOrPalPark(const FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE || Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL MoveUseCheck_PalPark(const FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckPalParkSysFlag(
            Save_VarsFlags_Get(checkData->fieldSystem->saveData))
        == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL MoveUseCheck_FieldContextFlagCheck(const FieldMoveCheckData *checkData, int flagno) {
    if (checkData->flag & (1 << flagno)) {
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
    FieldUseMoveEnvironment *environment = AllocFromHeap(HEAP_ID_32, sizeof(FieldUseMoveEnvironment));
    environment->magic = 0x19740205;
    environment->facingObject = checkData->facingObject;
    environment->useData = *useData;
    return environment;
}

static void FieldMove_DeleteUseEnvironment(FieldUseMoveEnvironment *environment) {
    GF_ASSERT(environment->magic == 0x19740205);
    FreeToHeap(environment);
}

static u32 FieldMove_CheckCut(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_HIVE)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }
    if (checkData->flag & FIELD_MOVE_CHECK_TREE) {
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
    FieldMoveData *fieldMoveData = AllocFromHeap(HEAP_ID_FIELD, sizeof(FieldMoveData));
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
    if (!(checkData->flag & FIELD_MOVE_CHECK_WATER)) {
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

static u32 FieldMoveMenuCheck_Strength(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_PLAIN)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }

    if (checkData->mapId == MAP_ICE_PATH_B2F) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_ROCK_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }
    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Strength(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *retEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseStrengthInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseStrengthInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_strength, env->facingObject);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_RockSmash(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_ZEPHYR)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_BREAKROCK_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }
    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_RockSmash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *retEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseRockSmashInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseRockSmashInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_smash, env->facingObject);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Waterfall(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_RISING)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_WATERFALL_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }
    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Waterfall(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *retEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseWaterfallInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseWaterfallInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_waterfall, NULL);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_RockClimb(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_EARTH)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }

    if (!MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_ROCKCLIMB_F)) {
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

static void FieldMoveMenuUse_RockClimb(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *retEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseRockClimbInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseRockClimbInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_climb, NULL);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Flash(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (CheckUseFlashInAlphChamber(checkData->fieldSystem)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_FLASH_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Flash(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *retEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseFlashInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseFlashInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    if (CheckUseFlashInAlphChamber(fieldSystem)) {
        StartScriptFromMenu(taskManager, _EV_scr_seq_D24R0204_002 + 1, NULL);
    } else {
        StartScriptFromMenu(taskManager, std_menu_flash, NULL);
    }
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Teleport(const FieldMoveCheckData *checkData) {
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

static void FieldMoveMenuUse_Teleport(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldMoveData));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    menuEnv->exitTaskFunc = Task_UseTeleportInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseTeleportInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct TeleportFieldEnv *env = TaskManager_GetEnvironment(taskManager);
    struct FieldLongWarpTaskData *newEnv = CreateFieldTeleportTaskEnv(fieldSystem, env->mon, env->flySub->partySlot, HEAP_ID_4);
    FreeToHeap(env->flySub);
    FreeToHeap(env);
    TaskManager_Jump(taskManager, Task_FieldTeleport, newEnv);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Dig(const FieldMoveCheckData *checkData) {
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

static void FieldMoveMenuUse_Dig(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldMoveData));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    menuEnv->exitTaskFunc = Task_UseDigInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseDigInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct TeleportFieldEnv *env = TaskManager_GetEnvironment(taskManager);
    struct FieldLongWarpTaskData *newEnv = CreateFieldDigTaskEnv(fieldSystem, env->mon, env->flySub->partySlot, HEAP_ID_FIELD);
    FreeToHeap(env->flySub);
    FreeToHeap(env);
    TaskManager_Jump(taskManager, Task_FieldDig, newEnv);
    return FALSE;
}

static u32 FieldMoveMenuCheck_SweetScent(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_PalPark(checkData) == TRUE) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMoveMenuUse_SweetScent(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    FieldMoveData *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldMoveData));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    FieldSystem_LoadFieldOverlay(fieldSystem);
    menuEnv->exitTaskFunc = Task_UseSweetScentInField;
    menuEnv->exitTaskEnvironment = retEnv;
    menuEnv->state = 12;
}

static u32 FieldMoveMenuCheck_Chatter(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    return FIELD_MOVE_RESPONSE_OK;
}

static void FieldMoveMenuUse_Chatter(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *partyEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    menuEnv->exitTaskFunc = Task_UseChatterInField;
    menuEnv->exitTaskEnvironment = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseChatterInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_chatter, NULL);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Whirlpool(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(checkData->fieldSystem->saveData), BADGE_GLACIER)) {
        return FIELD_MOVE_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_WHIRLPOOL_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Whirlpool(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *partyEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseWhirlpoolInField;
    menuEnv->exitTaskEnvironment = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_whirlpool, NULL);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Headbutt(const FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return FIELD_MOVE_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_HEADBUTT_F)) {
        return FIELD_MOVE_RESPONSE_OK;
    }

    return FIELD_MOVE_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Headbutt(FieldMoveUseData *useData, const FieldMoveCheckData *checkData) {
    StartMenuTaskData *menuEnv = TaskManager_GetEnvironment(useData->taskManager);
    FieldUseMoveEnvironment *partyEnv = FieldMove_CreateUseEnvironment(useData, checkData);
    FieldSystem_LoadFieldOverlay(checkData->fieldSystem);
    menuEnv->exitTaskFunc = Task_UseHeadbuttInField;
    menuEnv->exitTaskEnvironment = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseHeadbuttInField(TaskManager *taskManager) {
    FieldUseMoveEnvironment *env = TaskManager_GetEnvironment(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_headbutt, env->facingObject);
    FieldMove_SetArgs(fieldSystem, env->useData.partySlot, 0, 0, 0);
    FieldMove_DeleteUseEnvironment(env);
    return FALSE;
}

static struct TeleportFieldEnv *sub_020689A4(HeapID heapId, u8 slotno, SaveData *saveData) {
    struct TeleportFieldEnv *ret = AllocFromHeapAtEnd(heapId, sizeof(struct TeleportFieldEnv));
    ret->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), slotno);
    ret->flySub = NULL;
    return ret;
}
