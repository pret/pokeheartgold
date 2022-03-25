#include "script.h"
#include "field_move.h"
#include "field_map_object.h"
#include "field_player_avatar.h"
#include "unk_0203DB6C.h"
#include "unk_02054648.h"
#include "unk_0205CB48.h"
#include "save_flypoints.h"
#include "overlay_01.h"
#include "unk_0205B6E8.h"
#include "unk_0203BC10.h"
#include "map_header.h"
#include "sys_flags.h"
#include "pokegear.h"
#include "constants/moves.h"
#include "constants/sprites.h"
#include "constants/std_script.h"
#include "constants/badge.h"

struct FieldMoveFuncDat {
    FieldMoveUseFunc use;
    FieldMoveCheckFunc check;
};

u32 FieldMoveMenuCheck_Cut(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Cut(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseCutInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Fly(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Fly(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
//BOOL Task_UseFlyInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Surf(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Surf(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseSurfInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Strength(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Strength(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseStrengthInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_RockSmash(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_RockSmash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseRockSmashInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Waterfall(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Waterfall(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseWaterfallInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_RockClimb(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_RockClimb(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseRockClimbInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Flash(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Flash(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseFlashInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Teleport(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Teleport(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseTeleportInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Dig(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Dig(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseDigInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_SweetScent(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_SweetScent(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
//BOOL Task_UseSweetScentInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Chatter(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Chatter(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseChatterInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Whirlpool(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Whirlpool(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseWhirlpoolInField(TaskManager *taskManager);
u32 FieldMoveMenuCheck_Headbutt(const struct FieldMoveCheckData *checkData);
void FieldMoveMenuUse_Headbutt(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData);
BOOL Task_UseHeadbuttInField(TaskManager *taskManager);

static const struct FieldMoveFuncDat _020FE7BC[] = {
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

static inline BOOL ItemUseCheck_SafariOrPalPark(const struct FieldMoveCheckData *checkData) {
    if (ScriptState_CheckSafariSysFlag(SavArray_Flags_get(checkData->fsys->savedata)) == TRUE || ScriptState_CheckPalParkSysFlag(
        SavArray_Flags_get(checkData->fsys->savedata)) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void *PartyMenu_GetFieldMoveFunc(int funcType, int fieldMoveIdx) {
    if (funcType == FIELD_MOVE_FUNC_USE) {
        return _020FE7BC[fieldMoveIdx].use;
    } else {
        return _020FE7BC[fieldMoveIdx].check;
    }
}

void sub_02067E10(FieldSystem *fsys, struct FieldMoveCheckData *checkData) {
    LocalMapObject *facingObject;
    int x, y;
    u32 standingTile, facingTile;

    checkData->fsys = fsys;
    checkData->mapId = fsys->location->mapId;
    checkData->flag = 0;

    Fsys_GetFacingObject(fsys, &facingObject);
    checkData->facingObject = facingObject;
    if (facingObject != NULL) {
        switch (MapObject_GetGfxID(facingObject)) {
        case SPRITE_ROCK:
            checkData->flag |= FIELD_MOVE_CHECK_ROCK_F;
            break;
        case SPRITE_BREAKROCK:
            checkData->flag |= FIELD_MOVE_CHECK_BREAKROCK_F;
            break;
        case SPRITE_TREE:
            checkData->flag |= FIELD_MOVE_CHECK_TREE_F;
            break;
        }
    }
    x = GetPlayerXCoord(fsys->playerAvatar);
    y = GetPlayerYCoord(fsys->playerAvatar);
    standingTile = GetMetatileBehaviorAt(fsys, x, y);

    sub_0205E02C(fsys->playerAvatar, &x, &y);
    facingTile = GetMetatileBehaviorAt(fsys, x, y);

    if (ov01_021F20C0(fsys->playerAvatar, standingTile, facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx04_F;
    }
    if (ov01_021F25E8(facingTile, PlayerAvatar_GetFacingDirection(fsys->playerAvatar) )) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx40_F;
    }
    if (sub_0205B8DC(facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx20_F;
    }
    if (sub_0205B8E8(facingTile)) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx1000_F;
    }
    if (FlyPoints_GetWeatherType(Save_FlyPoints_get(fsys->savedata)) == 11) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx80_F;
    }
    if (sub_0205BAF8(facingTile) || ov01_021E7FA8(fsys)) {
        checkData->flag |= FIELD_MOVE_CHECK_UNKx2000_F;
    }
}

struct FieldUseMoveEnv *PartyMenuEnv_create(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct FieldUseMoveEnv *ret = AllocFromHeap(32, sizeof(struct FieldUseMoveEnv));
    ret->magic = 0x19740205;
    ret->facingObject = checkData->facingObject;
    ret->useData = *useData;
    return ret;
}

void PartyMenuEnv_delete(struct FieldUseMoveEnv *env) {
    GF_ASSERT(env->magic == 0x19740205);
    FreeToHeap(env);
}

u32 FieldMoveMenuCheck_Cut(const struct FieldMoveCheckData *checkData) {
    if (checkData->fsys->unk70 == 2 || checkData->fsys->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Sav2_PlayerData_GetProfileAddr(checkData->fsys->savedata), BADGE_HIVE)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }
    if (checkData->flag & FIELD_MOVE_CHECK_TREE_F) {
        return PARTY_MENU_RESPONSE_OK;
    }

    return PARTY_MENU_RESPONSE_NOT_HERE;
}

void FieldMoveMenuUse_Cut(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    struct BagViewAppWork *bagWork = TaskManager_GetEnv(useData->taskManager);
    struct FieldUseMoveEnv *useMoveEnv = PartyMenuEnv_create(useData, checkData);
    sub_020505C0(checkData->fsys);
    bagWork->atexit_TaskFunc = Task_UseCutInField;
    bagWork->atexit_TaskEnv = useMoveEnv;
    bagWork->state = 12;
}

BOOL Task_UseCutInField(TaskManager *taskManager) {
    struct FieldUseMoveEnv *env = TaskManager_GetEnv(taskManager);
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    StartScriptFromMenu(taskManager, std_menu_cut, env->facingObject);
    FieldMoveArgsSet(fsys, env->useData.unk4, 0, 0, 0);
    PartyMenuEnv_delete(env);
    return FALSE;
}

u32 FieldMoveMenuCheck_Fly(const struct FieldMoveCheckData *checkData) {
    if (checkData->fsys->unk70 == 2 || checkData->fsys->unk70 == 3) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }
    if (!PlayerProfile_TestBadgeFlag(Sav2_PlayerData_GetProfileAddr(checkData->fsys->savedata), BADGE_STORM)) {
        return PARTY_MENU_RESPONSE_NEED_BADGE;
    }

    if (!MapHeader_IsFlyAllowed(checkData->mapId)) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    if (ScriptState_CheckHaveFollower(SavArray_Flags_get(checkData->fsys->savedata)) == TRUE) {
        return PARTY_MENU_RESPONSE_HAVE_FOLLOWER;
    }

    if (ScriptState_CheckRocketCostumeFlag(SavArray_Flags_get(checkData->fsys->savedata)) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_NOW;
    }

    if (ItemUseCheck_SafariOrPalPark(checkData) == TRUE) {
        return PARTY_MENU_RESPONSE_NOT_HERE;
    }

    return PARTY_MENU_RESPONSE_OK;
}

void FieldMoveMenuUse_Fly(struct FieldMoveUseData *useData, const struct FieldMoveCheckData *checkData) {
    FieldSystem *fsys = TaskManager_GetSys(useData->taskManager);
    struct BagViewAppWork *env = TaskManager_GetEnv(useData->taskManager);
    struct FlyTaskStruct *flyEnv = AllocFromHeap(11, sizeof(struct FlyTaskStruct));
    flyEnv->unk0 = useData->unk4;
    env->unk_0384 = flyEnv;
    env->atexit_TaskEnv = TownMap_new(fsys, 0);
    sub_0203C8F0(env, Task_UseFlyInField);
}
