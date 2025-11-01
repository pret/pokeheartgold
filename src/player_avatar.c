#include "player_avatar.h"

#include "global.h"

#include "constants/global_fieldmap.h"
#include "constants/sprites.h"

#include "assert.h"
#include "heap.h"
#include "map_object.h"
#include "overlay_00_thumb.h"
#include "overlay_01.h"
#include "overlay_01_021FE780.h"
#include "overlay_01_02200858.h"
#include "player_data.h"
#include "scrcmd.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_0205FD20.h"

static PlayerAvatar *PlayerAvatar_Create(void);
static void PlayerAvatar_Setup(PlayerAvatar *avatar, s32 state, u32 gender, PlayerSaveData *playerSaveData);
static void PlayerAvatar_CreateMapObjectWithParams(PlayerAvatar *avatar, MapObjectManager *manager, u32 sprite, u32 direction, u32 x, u32 z);
static LocalMapObject *PlayerAvatar_GetActiveMapObjectWithMovement1(MapObjectManager *manager);
static LocalMapObject *PlayerAvatar_GetMapObjectConst(PlayerAvatar *avatar);
static void PlayerAvatar_SetGender(PlayerAvatar *avatar, u32 gender);
static void PlayerAvatar_SetFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags flags);
static void PlayerAvatar_ClearFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags flags);
static PlayerAvatarFlags PlayerAvatar_GetFlagsBitsMask(PlayerAvatar *avatar, PlayerAvatarFlags flags);
static void PlayerAvatar_SetUnk28(PlayerAvatar *avatar, s32 param1);
static void PlayerAvatar_SetUnk2C(PlayerAvatar *avatar, s32 param1);
static void PlayerAvatar_SetPlayerSaveData(PlayerAvatar *avatar, PlayerSaveData *playerSaveData);
static void PlayerSaveData_SetState(PlayerSaveData *playerSaveData, s32 state);
static void PlayerAvatar_SetPlayerSaveDataState(PlayerAvatar *avatar, s32 state);

u32 sub_0205C268(u32 param0) {
    if (param0 < 100) {
        return 255;
    }
    return ov00_021E6EBC();
}

u8 sub_0205C278(void) {
    PlayerProfile *profile = sub_02034818(sub_0203769C() ^ 1);
    GF_ASSERT(profile != NULL);
    return PlayerProfile_GetVersion(profile);
}

u8 sub_0205C298(SaveData *saveData) {
    if (PlayerProfile_GetVersion(Save_PlayerData_GetProfile(saveData)) == 0) {
        return 1;
    }
    if (sub_0205C278() == 0) {
        return 1;
    }
    return 0;
}

u8 sub_0205C2C0(u32 param0) {
    switch (param0) {
    case 0:
        return 95;
    case 1:
        return 97;
    case 2:
        return 99;
    case 3:
        return 143;
    }
}

u8 sub_0205C2E8(u32 param0) {
    switch (param0) {
    case 0:
        return 94;
    case 1:
        return 96;
    case 2:
        return 98;
    case 3:
        return 142;
    }
}

u8 sub_0205C310(u32 param0) {
    u8 ret;
    switch (param0) {
    case 0:
        ret = 1;
        break;
    case 1:
        ret = 3;
        break;
    case 2:
        ret = 5;
        break;
    case 3:
        ret = 7;
        break;
    case 4:
        ret = 9;
        break;
    case 6:
        ret = 113;
        break;
    case 5:
    default:
        GF_ASSERT(FALSE);
        break;
    }
    return ret;
}

u8 sub_0205C350(u32 param0) {
    u8 ret;
    switch (param0) {
    case 0:
        ret = 0;
        break;
    case 1:
        ret = 2;
        break;
    case 2:
        ret = 4;
        break;
    case 3:
        ret = 6;
        break;
    case 4:
        ret = 8;
        break;
    case 6:
        ret = 112;
        break;
    default:
    case 5:
        GF_ASSERT(FALSE);
        break;
    }
    return ret;
}

PlayerAvatar *PlayerAvatar_CreateWithParams(MapObjectManager *manager, u32 x, u32 z, u32 direction, s32 state, u32 gender, u32 param6, PlayerSaveData *playerSaveData) {
    PlayerAvatar *avatar = PlayerAvatar_Create();
    PlayerAvatar_Setup(avatar, state, gender, playerSaveData);
    u32 sprite;
    if (param6 == 2) {
        sprite = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    } else if (param6 == 0) {
        if (gender == PLAYER_GENDER_MALE) {
            sprite = SPRITE_PL_BOY01C;
        } else {
            sprite = SPRITE_PL_GIRL01C;
        }
    } else if (param6 == 1) {
        if (gender == PLAYER_GENDER_MALE) {
            sprite = SPRITE_HERO_2;
        } else {
            sprite = SPRITE_HEROINE_2;
        }
    } else {
        GF_ASSERT(FALSE);
        sprite = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    }
    PlayerAvatar_CreateMapObjectWithParams(avatar, manager, sprite, direction, x, z);
    return avatar;
}

PlayerAvatar *PlayerAvatar_CreateWithActiveMapObject(MapObjectManager *manager, PlayerSaveData *playerSaveData, u32 gender) {
    PlayerAvatar *avatar = PlayerAvatar_Create();
    s32 state = PlayerSaveData_GetState(playerSaveData);
    PlayerAvatar_Setup(avatar, state, gender, playerSaveData);
    LocalMapObject *mapObject = PlayerAvatar_GetActiveMapObjectWithMovement1(manager);
    MapObject_SetSpriteID(mapObject, PlayerAvatar_GetSpriteByStateAndGender(state, gender));
    MapObject_SetFlagsBits(mapObject, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK13 | MAPOBJECTFLAG_KEEP));
    MapObject_ClearFlagsBits(mapObject, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK8 | MAPOBJECTFLAG_UNK7));
    MapObject_SetFlag29(mapObject, TRUE);
    PlayerAvatar_SetMapObject(avatar, mapObject);
    return avatar;
}

void sub_0205C46C(PlayerAvatar *avatar) {
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(avatar);
    GF_ASSERT(mapObject != NULL);
    MapObject_GetManager(mapObject);
    ov01_022008B4(avatar);
    if (PlayerAvatar_GetState(avatar) == PLAYER_STATE_SURFING) {
        u32 x = PlayerAvatar_GetXCoord(avatar);
        u32 z = PlayerAvatar_GetZCoord(avatar);
        u32 direction = PlayerAvatar_GetFacingDirection(avatar);
        PlayerAvatar_SetUnk34(avatar, ov01_021FE7DC(mapObject, x, z, direction, 1));
    }
}

void PlayerAvatar_FreeToHeap(PlayerAvatar *avatar) {
    Heap_Free(avatar);
}

void PlayerAvatar_DeleteFromMap(PlayerAvatar *avatar) {
    MapObject_Remove(PlayerAvatar_GetMapObject(avatar));
    PlayerAvatar_FreeToHeap(avatar);
}

static PlayerAvatar *PlayerAvatar_Create(void) {
    PlayerAvatar *avatar = Heap_Alloc(HEAP_ID_FIELD2, sizeof(PlayerAvatar));
    GF_ASSERT(avatar != NULL);
    memset(avatar, 0, sizeof(PlayerAvatar));
    return avatar;
}

static void PlayerAvatar_Setup(PlayerAvatar *avatar, s32 state, u32 gender, PlayerSaveData *playerSaveData) {
    PlayerAvatar_SetPlayerSaveData(avatar, playerSaveData);
    PlayerAvatar_SetUnk10(avatar, 0);
    PlayerAvatar_SetUnk14(avatar, 0);
    PlayerAvatar_SetState(avatar, state);
    PlayerAvatar_SetGender(avatar, gender);
    PlayerAvatar_SetTransitionFlags(avatar, 0);
    PlayerAvatar_ClearUnk24ClearFlag2(avatar);
    PlayerAvatar_SetUnk28(avatar, -1);
    PlayerAvatar_SetUnk2C(avatar, -1);
    PlayerAvatar_SetUnk8(avatar, 255); // obj_player?
    PlayerAvatar_SetFlag1(avatar, TRUE);
}

static void PlayerAvatar_CreateMapObjectWithParams(PlayerAvatar *avatar, MapObjectManager *manager, u32 sprite, u32 direction, u32 x, u32 z) {
    LocalMapObject *mapObject = MapObject_Create(manager, x, z, direction, sprite, 1, 1);
    GF_ASSERT(mapObject != NULL);
    MapObject_SetID(mapObject, obj_player);
    MapObject_SetType(mapObject, 0);
    MapObject_SetEventFlag(mapObject, 0);
    MapObject_SetScriptID(mapObject, 0);
    MapObject_SetParam(mapObject, 0, 0);
    MapObject_SetParam(mapObject, 0, 1);
    MapObject_SetParam(mapObject, 0, 2);
    MapObject_SetXRange(mapObject, -1);
    MapObject_SetYRange(mapObject, -1);
    MapObject_SetFlagsBits(mapObject, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK13 | MAPOBJECTFLAG_KEEP));
    MapObject_ClearFlagsBits(mapObject, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK8 | MAPOBJECTFLAG_UNK7));
    MapObject_SetFlag29(mapObject, TRUE);
    PlayerAvatar_SetMapObject(avatar, mapObject);
}

LocalMapObject *MapObjectManager_GetFirstActiveObjectWithMovement1(MapObjectManager *manager) {
    s32 index = 0;
    LocalMapObject *mapObject = NULL;
    while (MapObjectManager_GetNextObjectWithFlagFromIndex(manager, &mapObject, &index, MAPOBJECTFLAG_ACTIVE)) {
        if (MapObject_GetMovement(mapObject) == 1) {
            break;
        }
    }
    return mapObject;
}

static LocalMapObject *PlayerAvatar_GetActiveMapObjectWithMovement1(MapObjectManager *manager) {
    LocalMapObject *mapObject = MapObjectManager_GetFirstActiveObjectWithMovement1(manager);
    GF_ASSERT(mapObject != NULL);
    return mapObject;
}

u32 PlayerAvatar_GetFacingDirection(PlayerAvatar *avatar) {
    return MapObject_GetFacingDirection(PlayerAvatar_GetMapObject(avatar));
}

void PlayerAvatar_SetFacingDirection(PlayerAvatar *avatar, u32 direction) {
    MapObject_SetFacingDirection(PlayerAvatar_GetMapObject(avatar), direction);
}

u32 PlayerAvatar_GetNextFacingDirection(PlayerAvatar *avatar) {
    return MapObject_GetNextFacingDirection(PlayerAvatar_GetMapObject(avatar));
}

u32 PlayerAvatar_GetXCoord(PlayerAvatar *avatar) {
    return MapObject_GetXCoord(PlayerAvatar_GetMapObject(avatar));
}

u32 PlayerAvatar_GetZCoord(PlayerAvatar *avatar) {
    return MapObject_GetZCoord(PlayerAvatar_GetMapObject(avatar));
}

u32 PlayerAvatar_GetPreviousXCoord(PlayerAvatar *avatar) {
    return MapObject_GetPreviousXCoord(PlayerAvatar_GetMapObject(avatar));
}

u32 PlayerAvatar_GetPreviousZCoord(PlayerAvatar *avatar) {
    return MapObject_GetPreviousZCoord(PlayerAvatar_GetMapObject(avatar));
}

void PlayerAvatar_CopyPositionVector(PlayerAvatar *avatar, VecFx32 *vector) {
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(avatar), vector);
}

VecFx32 *PlayerAvatar_GetPositionVector(PlayerAvatar *avatar) {
    return MapObject_GetPositionVector(PlayerAvatar_GetMapObjectConst(avatar));
}

void PlayerAvatar_SetUnk10(PlayerAvatar *avatar, u32 param1) {
    avatar->unk10 = param1;
}

u32 PlayerAvatar_GetUnk10(PlayerAvatar *avatar) {
    return avatar->unk10;
}

void PlayerAvatar_SetUnk14(PlayerAvatar *avatar, u32 param1) {
    avatar->unk14 = param1;
}

u32 PlayerAvatar_GetUnk14(PlayerAvatar *avatar) {
    return avatar->unk14;
}

void PlayerAvatar_SetMapObject(PlayerAvatar *avatar, LocalMapObject *mapObject) {
    avatar->mapObject = mapObject;
}

LocalMapObject *PlayerAvatar_GetMapObject(PlayerAvatar *avatar) {
    return avatar->mapObject;
}

static LocalMapObject *PlayerAvatar_GetMapObjectConst(PlayerAvatar *avatar) {
    return avatar->mapObject;
}

void PlayerAvatar_SetState(PlayerAvatar *avatar, s32 state) {
    GF_ASSERT(state < PLAYER_STATE_USE_HM);
    avatar->state = state;
    PlayerAvatar_SetPlayerSaveDataState(avatar, state);
}

s32 PlayerAvatar_GetState(PlayerAvatar *avatar) {
    GF_ASSERT(avatar != NULL);
    return avatar->state;
}

void PlayerAvatar_SetTransitionFlagsBits(PlayerAvatar *avatar, u32 flags) {
    avatar->transitionFlags |= flags;
}

void PlayerAvatar_SetTransitionFlags(PlayerAvatar *avatar, u32 flags) {
    avatar->transitionFlags = flags;
}

u32 PlayerAvatar_GetTransitionFlags(PlayerAvatar *avatar) {
    return avatar->transitionFlags;
}

static void PlayerAvatar_SetGender(PlayerAvatar *avatar, u32 gender) {
    avatar->gender = gender;
}

u32 PlayerAvatar_GetGender(PlayerAvatar *avatar) {
    return avatar->gender;
}

static void PlayerAvatar_SetFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags flags) {
    avatar->flags |= flags;
}

static void PlayerAvatar_ClearFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags flags) {
    avatar->flags &= ~flags;
}

static PlayerAvatarFlags PlayerAvatar_GetFlagsBitsMask(PlayerAvatar *avatar, PlayerAvatarFlags flags) {
    return (PlayerAvatarFlags)(avatar->flags & flags);
}

s32 PlayerAvatar_GetUnk24(PlayerAvatar *avatar) {
    return avatar->unk24;
}

void PlayerAvatar_SetUnk24(PlayerAvatar *avatar, s32 param1) {
    avatar->unk24 = param1;
}

void PlayerAvatar_ClearUnk24ClearFlag2(PlayerAvatar *avatar) {
    avatar->unk24 = 0;
    PlayerAvatar_SetFlag2(avatar, FALSE);
}

s32 PlayerAvatar_Unk24AddWithCeiling(PlayerAvatar *avatar, s32 param1, s32 param2) {
    s32 var = avatar->unk24 + param1;
    avatar->unk24 = var;
    if (var > param2) {
        avatar->unk24 = param2;
    }
    return avatar->unk24;
}

static void PlayerAvatar_SetUnk28(PlayerAvatar *avatar, s32 param1) {
    avatar->unk28 = param1;
}

s32 PlayerAvatar_GetUnk28(PlayerAvatar *avatar) {
    return avatar->unk28;
}

static void PlayerAvatar_SetUnk2C(PlayerAvatar *avatar, s32 param1) {
    avatar->unk2C = param1;
}

s32 PlayerAvatar_GetUnk2C(PlayerAvatar *avatar) {
    return avatar->unk2C;
}

void PlayerAvatar_SetUnk28Unk2C(PlayerAvatar *avatar, s32 unk28, s32 unk2C) {
    PlayerAvatar_SetUnk28(avatar, unk28);
    PlayerAvatar_SetUnk2C(avatar, unk2C);
}

void PlayerAvatar_SetUnk34(PlayerAvatar *avatar, u32 param1) {
    avatar->unk34 = param1;
}

u32 PlayerAvatar_GetUnk34(PlayerAvatar *avatar) {
    return avatar->unk34;
}

static void PlayerAvatar_SetPlayerSaveData(PlayerAvatar *avatar, PlayerSaveData *playerSaveData) {
    avatar->playerSaveData = playerSaveData;
}

PlayerSaveData *PlayerAvatar_GetPlayerSaveData(PlayerAvatar *avatar) {
    return avatar->playerSaveData;
}

void PlayerAvatar_SetUnk8(PlayerAvatar *avatar, u32 param1) {
    avatar->unk8 = param1;
}

u32 PlayerAvatar_GetUnk8(PlayerAvatar *avatar) {
    return avatar->unk8;
}

BOOL PlayerAvatar_GetUnkC(PlayerAvatar *avatar) {
    return avatar->unkC;
}

void PlayerAvatar_ToggleUnkC(PlayerAvatar *avatar) {
    avatar->unkC = (avatar->unkC + 1) & TRUE;
}

void PlayerAvatar_ResetUnkC(PlayerAvatar *avatar) {
    avatar->unkC = FALSE;
}

void PlayerSaveData_Init(PlayerSaveData *playerSaveData) {
    playerSaveData->hasRunningShoes = FALSE;
    playerSaveData->runningShoesLock = FALSE;
    playerSaveData->state = 0;
}

BOOL PlayerSaveData_CheckRunningShoes(PlayerSaveData *playerSaveData) {
    if (playerSaveData != NULL && playerSaveData->hasRunningShoes == TRUE) {
        return TRUE;
    }
    return FALSE;
}

void PlayerSaveData_SetRunningShoesFlag(PlayerSaveData *playerSaveData, BOOL flag) {
    if (flag == TRUE) {
        playerSaveData->hasRunningShoes = TRUE;
    } else {
        playerSaveData->hasRunningShoes = FALSE;
    }
}

s32 PlayerSaveData_GetState(PlayerSaveData *playerSaveData) {
    if (!playerSaveData) {
        return 0;
    }
    return playerSaveData->state;
}

static void PlayerSaveData_SetState(PlayerSaveData *playerSaveData, s32 state) {
    if (!playerSaveData) {
        return;
    }
    playerSaveData->state = state;
}

static void PlayerAvatar_SetPlayerSaveDataState(PlayerAvatar *avatar, s32 state) {
    PlayerSaveData_SetState(PlayerAvatar_GetPlayerSaveData(avatar), state);
}

void sub_0205C810(PlayerAvatar *avatar, VecFx32 *position, u32 direction) {
    MapObject_SetPositionFromVectorAndDirection(PlayerAvatar_GetMapObject(avatar), position, direction);
    PlayerAvatar_SetUnk10(avatar, 0);
    PlayerAvatar_SetUnk14(avatar, 0);
}

void PlayerAvatar_SetMapObjectYPosition(PlayerAvatar *avatar, fx32 yVal) {
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(avatar);
    VecFx32 position;
    MapObject_CopyPositionVector(mapObject, &position);
    position.y = yVal;
    MapObject_SetPositionVector(mapObject, &position);
}

void PlayerAvatar_ToggleAutomaticHeightUpdating(PlayerAvatar *avatar, u8 flag) {
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(avatar);
    if (flag == TRUE) {
        MapObject_SetIgnoreHeights(mapObject, FALSE);
    } else {
        MapObject_SetIgnoreHeights(mapObject, TRUE);
    }
}

void PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(PlayerAvatar *avatar, BOOL flag) {
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(avatar);
    if (flag == TRUE) {
        MapObject_SetIgnoreHeights(mapObject, FALSE);
        sub_02061070(mapObject);
    } else {
        MapObject_SetIgnoreHeights(mapObject, TRUE);
    }
}

u32 PlayerAvatar_GetSpriteByStateAndGender(s32 state, u32 gender) {
    if (gender == PLAYER_GENDER_MALE) {
        switch (state) {
        case PLAYER_STATE_WALKING:
            return SPRITE_HERO;
        case PLAYER_STATE_CYCLING:
            return SPRITE_CYCLEHERO;
        case PLAYER_STATE_SURFING:
            return SPRITE_SWIMHERO;
        case PLAYER_STATE_USE_HM:
            return SPRITE_SPHERO;
        case PLAYER_STATE_WATERING:
            return SPRITE_WATERHERO;
        case PLAYER_STATE_FISHING:
            return SPRITE_FISHINGHERO;
        case PLAYER_STATE_POKETCH:
            return SPRITE_POKEHERO;
        case PLAYER_STATE_SAVING:
            return SPRITE_SAVEHERO;
        case PLAYER_STATE_HEAL:
            return SPRITE_BANZAIHERO;
        case PLAYER_STATE_LADDER:
            return SPRITE_LADDERHERO;
        case PLAYER_STATE_ROCKET:
            return SPRITE_RHERO;
        case PLAYER_STATE_ROCKET_HEAL:
            return SPRITE_RBANZAIHERO;
        case PLAYER_STATE_POKEATHLON:
            return SPRITE_PKTHHERO;
        case PLAYER_STATE_APRICORN_SHAKE:
            return SPRITE_SHAKEHERO;
        case PLAYER_STATE_ROCKET_SAVING:
            return SPRITE_SAVERHERO;
        }
    } else {
        switch (state) {
        case PLAYER_STATE_WALKING:
            return SPRITE_HEROINE;
        case PLAYER_STATE_CYCLING:
            return SPRITE_CYCLEHEROINE;
        case PLAYER_STATE_SURFING:
            return SPRITE_SWIMHEROINE;
        case PLAYER_STATE_USE_HM:
            return SPRITE_SPHEROINE;
        case PLAYER_STATE_WATERING:
            return SPRITE_WATERHEROINE;
        case PLAYER_STATE_FISHING:
            return SPRITE_FISH_HEROINE;
        case PLAYER_STATE_POKETCH:
            return SPRITE_POKEHEROINE;
        case PLAYER_STATE_SAVING:
            return SPRITE_SAVEHEROINE;
        case PLAYER_STATE_HEAL:
            return SPRITE_BANZAIHEROINE;
        case PLAYER_STATE_LADDER:
            return SPRITE_LADDERHEROINE;
        case PLAYER_STATE_ROCKET:
            return SPRITE_RHEROINE;
        case PLAYER_STATE_ROCKET_HEAL:
            return SPRITE_RBANZAIINE;
        case PLAYER_STATE_POKEATHLON:
            return SPRITE_PKTHHEROINE;
        case PLAYER_STATE_APRICORN_SHAKE:
            return SPRITE_SHAKEHEROINE;
        case PLAYER_STATE_ROCKET_SAVING:
            return SPRITE_SAVERHEROINE;
        }
    }
    GF_ASSERT(FALSE);
    return 0;
}

u32 PlayerAvatar_GetTransitionBits(s32 state) {
    switch (state) {
    case PLAYER_STATE_WALKING:
        return PLAYER_TRANSITION_WALKING;
    case PLAYER_STATE_CYCLING:
        return PLAYER_TRANSITION_CYCLING;
    case PLAYER_STATE_SURFING:
        return PLAYER_TRANSITION_SURFING;
    case PLAYER_STATE_WATERING:
        return PLAYER_TRANSITION_WATERING;
    case PLAYER_STATE_FISHING:
        return PLAYER_TRANSITION_FISHING;
    case PLAYER_STATE_POKETCH:
        return PLAYER_TRANSITION_POKETCH;
    case PLAYER_STATE_SAVING:
        return PLAYER_TRANSITION_SAVING;
    case PLAYER_STATE_HEAL:
        return PLAYER_TRANSITION_HEAL;
    case PLAYER_STATE_LADDER:
        return PLAYER_TRANSITION_LADDER;
    case PLAYER_STATE_ROCKET:
        return PLAYER_TRANSITION_ROCKET;
    case PLAYER_STATE_ROCKET_HEAL:
        return PLAYER_TRANSITION_ROCKET_HEAL;
    case PLAYER_STATE_POKEATHLON:
        return PLAYER_TRANSITION_POKEATHLON;
    case PLAYER_STATE_APRICORN_SHAKE:
        return PLAYER_TRANSITION_APRICORN_SHAKE;
    case PLAYER_STATE_ROCKET_SAVING:
        return PLAYER_TRANSITION_ROCKET_SAVING;
    case PLAYER_STATE_USE_HM:
    default:
        GF_ASSERT(FALSE);
        return PLAYER_TRANSITION_WALKING;
    }
}

PlayerAvatar *FieldSystem_GetPlayerAvatar(FieldSystem *fieldSystem) {
    return fieldSystem->playerAvatar;
}

void PlayerAvatar_SetFlag0(PlayerAvatar *avatar, BOOL set) {
    if (set == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK0);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK0);
    }
}

BOOL PlayerAvatar_CheckFlag0(PlayerAvatar *avatar) {
    if (PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_UNK0)) {
        return TRUE;
    }
    return FALSE;
}

void PlayerAvatar_SetFlag1(PlayerAvatar *avatar, BOOL set) {
    if (set == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK1);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK1);
    }
}

BOOL PlayerAvatar_CheckFlag1(PlayerAvatar *avatar) {
    if (PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_UNK1)) {
        return TRUE;
    }
    return FALSE;
}

void PlayerAvatar_SetFlag2(PlayerAvatar *avatar, BOOL set) {
    if (set == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK2);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK2);
    }
}

BOOL PlayerAvatar_CheckFlag2(PlayerAvatar *avatar) {
    if (PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_UNK2)) {
        return TRUE;
    }
    return FALSE;
}

void PlayerAvatar_SetBikeStateLock(PlayerAvatar *avatar, BOOL lock) {
    if (lock == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_LOCK_BIKE_STATE);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_LOCK_BIKE_STATE);
    }
}

BOOL PlayerAvatar_CheckBikeStateLocked(PlayerAvatar *avatar) {
    if (PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_LOCK_BIKE_STATE)) {
        return TRUE;
    }
    return FALSE;
}

void PlayerAvatar_SetFlag5(PlayerAvatar *avatar, BOOL set) {
    if (set == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK5);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK5);
    }
}

void PlayerAvatar_SetFlag6(PlayerAvatar *avatar) {
    PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK6);
}

void PlayerAvatar_ClearFlag6(PlayerAvatar *avatar) {
    PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK6);
}

BOOL PlayerAvatar_CheckFlag6(PlayerAvatar *avatar) {
    if (PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_UNK6)) {
        return TRUE;
    }
    return FALSE;
}

void PlayerAvatar_SetFlag7(PlayerAvatar *avatar, BOOL set) {
    if (set == TRUE) {
        PlayerAvatar_SetFlagsBits(avatar, AVATAR_FLAG_UNK7);
    } else {
        PlayerAvatar_ClearFlagsBits(avatar, AVATAR_FLAG_UNK7);
    }
}

BOOL PlayerAvatar_CheckFlag7(PlayerAvatar *avatar) {
    return PlayerAvatar_GetFlagsBitsMask(avatar, AVATAR_FLAG_UNK7);
}

u16 PlayerAvatar_CheckRunningShoesLock(PlayerAvatar *avatar) {
    return avatar->playerSaveData->runningShoesLock;
}

void PlayerAvatar_SetRunningShoesLock(PlayerAvatar *avatar, u16 lock) {
    avatar->playerSaveData->runningShoesLock = lock;
}
