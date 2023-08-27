#include "script.h"
#include "field_move.h"
#include "field_map_object.h"
#include "field_alph_checks.h"
#include "field_player_avatar.h"
#include "unk_0203DB6C.h"
#include "unk_02054648.h"
#include "unk_0205CB48.h"
#include "save_local_field_data.h"
#include "overlay_01.h"
#include "overlay_02.h"
#include "metatile_behavior.h"
#include "unk_0203BC10.h"
#include "map_header.h"
#include "sys_flags.h"
#include "pokegear.h"
#include "constants/sprites.h"
#include "constants/std_script.h"
#include "constants/badge.h"
#include "constants/maps.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"

struct FieldMoveFuncDat {
    FieldMoveUseFunc use;
    FieldMoveCheckFunc check;
};

static u32 FieldMoveMenuCheck_Cut(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Cut(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseCutInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Fly(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Fly(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static u32 FieldMoveMenuCheck_Surf(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Surf(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseSurfInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Strength(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Strength(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseStrengthInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_RockSmash(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_RockSmash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseRockSmashInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Waterfall(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Waterfall(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseWaterfallInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_RockClimb(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_RockClimb(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseRockClimbInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Flash(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Flash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseFlashInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Teleport(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Teleport(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseTeleportInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Dig(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Dig(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseDigInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_SweetScent(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_SweetScent(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static u32 FieldMoveMenuCheck_Chatter(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Chatter(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseChatterInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Whirlpool(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Whirlpool(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager);
static u32 FieldMoveMenuCheck_Headbutt(const struct FieldMoveCheckData *checkData);
static void FieldMoveMenuUse_Headbutt(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
static BOOL Task_UseHeadbuttInField(TaskManager *taskManager);
static struct TeleportFieldEnv *sub_020689A4(HeapID heapId, u8 slotno, SaveData *saveData);

static const struct FieldMoveFuncDat sFieldMoveFuncTable[] = {
    { FieldMoveMenuUse_Cut,        FieldMoveMenuCheck_Cut        },
    { FieldMoveMenuUse_Fly,        FieldMoveMenuCheck_Fly        },
    { FieldMoveMenuUse_Surf,       FieldMoveMenuCheck_Surf       },
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

static inline BOOL MoveUseCheck_SafariOrPalPark(const struct FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE || Save_VarsFlags_CheckPalParkSysFlag(
        Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL MoveUseCheck_PalPark(const struct FieldMoveCheckData *checkData) {
    if (Save_VarsFlags_CheckPalParkSysFlag(
        Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static inline BOOL MoveUseCheck_FieldContextFlagCheck(const struct FieldMoveCheckData *checkData, int flagno) {
    if (checkData->flag & (1 << flagno)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void *PartyMenu_GetFieldMoveFunc(int funcType, int fieldMoveIdx) {
    if (funcType == FIELD_MOVE_FUNC_USE) {
        return sFieldMoveFuncTable[fieldMoveIdx].use;
    } else {
        return sFieldMoveFuncTable[fieldMoveIdx].check;
    }
}

void FieldSystem_MakeFieldMoveCheckData(FieldSystem *fieldSystem, struct FieldMoveCheckData *checkData) {
    LocalMapObject *facingObject;
    int x, y;
    u32 standingTile, facingTile;

    checkData->fieldSystem = fieldSystem;
    checkData->mapId = fieldSystem->location->mapId;
    checkData->flag = 0;

    FieldSystem_GetFacingObject(fieldSystem, &facingObject);
    checkData->facingObject = facingObject;
    if (facingObject != NULL) {
        switch (MapObject_GetGfxID(facingObject)) {
        case SPRITE_ROCK:
            checkData->flag |= (1 << FIELD_MOVE_CHECK_ROCK_F);
            break;
        case SPRITE_BREAKROCK:
            checkData->flag |= (1 << FIELD_MOVE_CHECK_BREAKROCK_F);
            break;
        case SPRITE_TREE:
            checkData->flag |= (1 << FIELD_MOVE_CHECK_TREE_F);
            break;
        }
    }
    x = GetPlayerXCoord(fieldSystem->playerAvatar);
    y = GetPlayerYCoord(fieldSystem->playerAvatar);
    standingTile = GetMetatileBehaviorAt(fieldSystem, x, y);

    PlayerAvatar_GetCoordsInFront(fieldSystem->playerAvatar, &x, &y);
    facingTile = GetMetatileBehaviorAt(fieldSystem, x, y);

    if (Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors(fieldSystem->playerAvatar, standingTile, facingTile)) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_WATER_F);
    }
    if (MetatileBehavior_IsRockClimbInDirection(facingTile, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar) )) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_ROCKCLIMB_F);
    }
    if (MetatileBehavior_IsWaterfall(facingTile)) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_WATERFALL_F);
    }
    if (MetatileBehavior_IsWhirlpool(facingTile)) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_WHIRLPOOL_F);
    }
    if (LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(fieldSystem->saveData)) == 11) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_FLASH_F);
    }
    if (MetatileBehavior_IsHeadbutt(facingTile) || FieldSystem_FacingModelIsHeadbuttTree(fieldSystem)) {
        checkData->flag |= (1 << FIELD_MOVE_CHECK_HEADBUTT_F);
    }
}

static struct FieldUseMoveEnv *PartyMenuEnv_create(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct FieldUseMoveEnv *ret = AllocFromHeap(HEAP_ID_32, sizeof(struct FieldUseMoveEnv));
    ret->magic = 0x19740205;
    ret->facingObject = checkData->facingObject;
    ret->useData = *useData;
    return ret;
}

static void PartyMenuEnv_Delete(struct FieldUseMoveEnv *env) {
    GF_ASSERT(env->magic == 0x19740205);
    FreeToHeap(env);
}

static u32 FieldMoveMenuCheck_Cut(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_HIVE)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }
    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_TREE_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }

    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Cut(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *bagWork = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *useMoveEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    bagWork->atexit_TaskFunc = Task_UseCutInField;
    bagWork->atexit_TaskEnv = useMoveEnv;
    bagWork->state = 12;
}

static BOOL Task_UseCutInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_cut, env->facingObject);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Fly(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_STORM)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (!MapHeader_IsFlyAllowed(checkData->mapId)) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    if (MoveUseCheck_SafariOrPalPark(checkData) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_Fly(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(useData->taskManager);
    struct FlyTaskStruct *flyEnv = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct FlyTaskStruct));
    flyEnv->partySlot = useData->partySlot;
    env->unk_0384 = flyEnv;
    env->atexit_TaskEnv = TownMap_New(fieldSystem, 0);
    sub_0203C8F0(env, Task_UseFlyInField);
}

static u32 FieldMoveMenuCheck_Surf(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_FOG)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) == PLAYER_STATE_SURFING) {
        return PARTY_MENU_RESPONSE_ALREADY_SURFING;
    }

    if (!MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_WATER_F)) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_Surf(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseSurfInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseSurfInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_surf, NULL);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Strength(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_PLAIN)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (checkData->mapId == MAP_D39R0103) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_ROCK_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }
    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Strength(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseStrengthInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseStrengthInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_strength, env->facingObject);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_RockSmash(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_ZEPHYR)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_BREAKROCK_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }
    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_RockSmash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseRockSmashInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseRockSmashInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_smash, env->facingObject);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Waterfall(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_RISING)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_WATERFALL_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }
    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Waterfall(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseWaterfallInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseWaterfallInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_waterfall, NULL);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_RockClimb(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_EARTH)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (!MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_ROCKCLIMB_F)) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_RockClimb(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseRockClimbInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseRockClimbInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_rock_climb, NULL);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Flash(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (CheckUseFlashInAlphChamber(checkData->fieldSystem)) {
        return PARTY_MENU_RESPONSE_OK;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_FLASH_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }

    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Flash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *retEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseFlashInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseFlashInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    if (CheckUseFlashInAlphChamber(fieldSystem)) {
        StartScriptFromMenu(taskManager, _EV_scr_seq_D24R0204_002 + 1, NULL);
    } else {
        StartScriptFromMenu(taskManager, std_menu_flash, NULL);
    }
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Teleport(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!MapHeader_IsOutdoors(checkData->mapId)) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    if (MoveUseCheck_SafariOrPalPark(checkData) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_Teleport(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    sub_020505C0(fieldSystem);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    struct FlyTaskStruct *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct FlyTaskStruct));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    menuEnv->atexit_TaskFunc = Task_UseTeleportInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseTeleportInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct TeleportFieldEnv *env = TaskManager_GetEnv(taskManager);
    struct FieldLongWarpTaskData *newEnv = CreateFieldTeleportTaskEnv(fieldSystem, env->mon, env->flySub->partySlot, HEAP_ID_4);
    FreeToHeap(env->flySub);
    FreeToHeap(env);
    TaskManager_Jump(taskManager, Task_FieldTeleport, newEnv);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Dig(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (MapHeader_IsCave(checkData->mapId) != TRUE || MapHeader_IsEscapeRopeAllowed(checkData->mapId) != TRUE) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(checkData->fieldSystem->saveData)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_Dig(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    sub_020505C0(fieldSystem);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    struct FlyTaskStruct *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct FlyTaskStruct));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    menuEnv->atexit_TaskFunc = Task_UseDigInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseDigInField(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct TeleportFieldEnv *env = TaskManager_GetEnv(taskManager);
    struct FieldLongWarpTaskData *newEnv = CreateFieldDigTaskEnv(fieldSystem, env->mon, env->flySub->partySlot, HEAP_ID_FIELD);
    FreeToHeap(env->flySub);
    FreeToHeap(env);
    TaskManager_Jump(taskManager, Task_FieldDig, newEnv);
    return FALSE;
}

static u32 FieldMoveMenuCheck_SweetScent(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_PalPark(checkData) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_SweetScent(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct TeleportFieldEnv *retEnv = sub_020689A4(HEAP_ID_FIELD, useData->partySlot, fieldSystem->saveData);
    struct FlyTaskStruct *retSub = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct FlyTaskStruct));
    retEnv->flySub = retSub;
    retSub->partySlot = useData->partySlot;
    sub_020505C0(fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseSweetScentInField;
    menuEnv->atexit_TaskEnv = retEnv;
    menuEnv->state = 12;
}

static u32 FieldMoveMenuCheck_Chatter(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    return PARTY_MENU_RESPONSE_OK;
}

static void FieldMoveMenuUse_Chatter(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(useData->taskManager);
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *partyEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseChatterInField;
    menuEnv->atexit_TaskEnv = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseChatterInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_chatter, NULL);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Whirlpool(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (PlayerAvatar_GetState(checkData->fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (!PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(checkData->fieldSystem->saveData), BADGE_GLACIER)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_WHIRLPOOL_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }

    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Whirlpool(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *partyEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseWhirlpoolInField;
    menuEnv->atexit_TaskEnv = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseWhirlpoolInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_whirlpool, NULL);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static u32 FieldMoveMenuCheck_Headbutt(const struct FieldMoveCheckData *checkData) {
    if (checkData->fieldSystem->unk70 == 2 || checkData->fieldSystem->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (MoveUseCheck_FieldContextFlagCheck(checkData, FIELD_MOVE_CHECK_HEADBUTT_F)) {
        return PARTY_MENU_RESPONSE_OK;
    }

    return PARTY_MENU_RESPONSE_NOT_HERE;
}

static void FieldMoveMenuUse_Headbutt(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *menuEnv = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *partyEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fieldSystem);
    menuEnv->atexit_TaskFunc = Task_UseHeadbuttInField;
    menuEnv->atexit_TaskEnv = partyEnv;
    menuEnv->state = 12;
}

static BOOL Task_UseHeadbuttInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    StartScriptFromMenu(taskManager, std_menu_headbutt, env->facingObject);
    FieldMoveArgsSet(fieldSystem, env->useData.partySlot, 0, 0, 0);
    PartyMenuEnv_Delete(env);
    return FALSE;
}

static struct TeleportFieldEnv *sub_020689A4(HeapID heapId, u8 slotno, SaveData *saveData) {
    struct TeleportFieldEnv *ret = AllocFromHeapAtEnd(heapId, sizeof(struct TeleportFieldEnv));
    ret->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), slotno);
    ret->flySub = NULL;
    return ret;
}
