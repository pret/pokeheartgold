#include "player_move.h"

#include "global.h"

#include "constants/player_avatar.h"
#include "constants/sndseq.h"

#include "follow_mon.h"
#include "gymmick_init.h"
#include "map_object.h"
#include "metatile_behavior.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_022053EC.h"
#include "overlay_04.h"
#include "player_avatar.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0205FD20.h"
#include "unk_02062108.h"
#include "unk_0206D494.h"

typedef BOOL (*MetatileBehaviorFunc)(u8 tileBehavior);

typedef struct MetatileBehaviorCheck {
    MetatileBehaviorFunc func;
    u32 tileMove;
} MetatileBehaviorCheck;

static BOOL PlayerAvatar_CheckStartMoveInternal(PlayerAvatar *playerAvatar, int direction);
static void PlayerAvatar_StartMoveInit(PlayerAvatar *playerAvatar, int dir_unused, u16 heldKeys_unused, u16 newKeys);
static void PlayerAvatar_EnableTileBehaviorCheck(PlayerAvatar *playerAvatar);
static void PlayerAvatar_PlayWalkSE(PlayerAvatar *playerAvatar);
static void PlayWalkSEWithCooldown(LocalMapObject *playerMapObject, PlayerAvatar *playerAvatar);
static BOOL PlayerAvatar_TryMoveFromCurrentTileBehavior(PlayerAvatar *playerAvatar, int direction);
static u32 PlayerAvatar_GetTileMovement(PlayerAvatar *playerAvatar, int direction);
static int PlayerAvatar_TryMoveTileBehavior(PlayerAvatar *playerAvatar, u32 tileMove, int direction);
static void PlayerAvatar_ClearTileForcedMovement(PlayerAvatar *playerAvatar);
static int PlayerAvatar_CheckIceHeightChange(PlayerAvatar *playerAvatar, int direction);
static BOOL PlayerAvatar_UpdateIceSpeedFromHeightChange(PlayerAvatar *playerAvatar, int heightChange); // TODO: Check about height change enum
static void PlayerAvatar_SetIceMovement(PlayerAvatar *playerAvatar, int direction);
static void PlayerAvatar_SetMovementFromState(PlayerAvatar *playerAvatar, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys);
static void PlayerAvatar_SetMovement_Normal(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys);
static int sub_0205D40C(PlayerAvatar *playerAvatar, int direction);
/*static*/ int PlayerAvatar_ValidateState(int moveState);
static int MapObject_DummyReturnMovementAction(LocalMapObject *playerMapObject_unused, u8 tileBehavior_unused, int movementAction);
/*static*/ int PlayerAvatar_UpdateMoveState(PlayerAvatar* playerAvatar, int direction);
static void PlayerAvatar_SetMovement_NotMoving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction_unused, u16 heldKeys_unused, u16 newKeys_unused);
static void PlayerAvatar_SetMovement_Moving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys, u16 newKeys);
static void PlayerAvatar_SetMovement_Turning(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys, u16 newKeys);
static void PlayerAvatar_SetMovement_Bike(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys);
static void PlayerAvatar_SetMovement_BikeThirdGear(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys);
static int PlayerAvatar_UpdateBikeStateThirdGear(PlayerAvatar *playerAvatar, int direction);
/*static*/ int PlayerAvatarBikeState_GetMoveStateThirdGear(int bikeState);
/*static*/ int PlayerAvatar_GetBikeStateThirdGear(PlayerAvatar *playerAvatar, int direction);
static void PlayerAvatar_SetMovement_BikeThirdGearStop(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys_unused, u16 newKeys_unused);
static void PlayerAvatar_SetMovement_BikeThirdGearMoving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys_unused, u16 newKeys_unused);
static void PlayerAvatar_SetMovement_BikeThirdGearTurning(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys_unused, u16 newKeys_unused);

/*static*/ void PlayerAvatar_SetMovement_BikeThirdGearBrake(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys, u16 newKeys);

s32 sub_0205DD9C(u16 newKeys);
s32 sub_0205DDB8(u16 newKeys);
BOOL sub_0205DE64(u32 movementCommand);
/*static*/ BOOL PlayerAvatar_IsRunButtonHeld(PlayerAvatar *playerAvatar, u16 pad);
/*static*/ void PlayerAvatar_IncrementStepsRecord(PlayerAvatar *playerAvatar);
int sub_02062390(u32 movementCommand);
BOOL PlayerAvatar_IsOnCyclingRoadBridge(PlayerAvatar *playerAvatar, u32 tileBehavior, int direction);
/*static*/ void PlayerAvatar_SetMovement(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, u32 movement);

const extern MetatileBehaviorCheck sTileBehaviorCheckTable[];
extern int (*const sTileMovementFunctions[TILE_MOVE_MAX])(PlayerAvatar *playerAvatar, int direction);

void PlayerAvatar_MoveControl(PlayerAvatar *playerAvatar, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys, int movementFlag) {
    if (direction == DIR_NONE) {
        direction = PlayerAvatar_GetDirectionFromKeys(playerAvatar, heldKeys, newKeys);
    }

    if (PlayerAvatar_CheckStartMoveInternal(playerAvatar, direction) == FALSE) {
        return;
    }

    PlayerAvatar_StartMoveInit(playerAvatar, direction, heldKeys, newKeys);
    Field_PlayerAvatar_ApplyTransitionFlags(playerAvatar);

    if (PlayerAvatar_TryMoveFromCurrentTileBehavior(playerAvatar, direction) == TRUE) {
        ov01_021F2F24(playerAvatar);
        return;
    }

    if (PlayerAvatar_GetState(playerAvatar) == PLAYER_STATE_WALKING) {
        if (sub_0205D40C(playerAvatar, direction)) {
            ov01_021F2F24(playerAvatar);
        } else if (movementFlag == 1) {
            ov01_021F2EDC(playerAvatar);
        }
    }

    PlayerAvatar_SetMovementFromState(playerAvatar, mapLoadManager, direction, heldKeys, newKeys);

    PlayerAvatar_EnableTileBehaviorCheck(playerAvatar);
    PlayerAvatar_PlayWalkSE(playerAvatar);
}

BOOL PlayerAvatar_CheckStartMove(PlayerAvatar *playerAvatar, int direction) {
    return PlayerAvatar_CheckStartMoveInternal(playerAvatar, direction);
}

static BOOL PlayerAvatar_CheckStartMoveInternal(PlayerAvatar *playerAvatar, int direction) {
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(playerAvatar);

    if (MapObject_AreBitsSetForMovementScriptInit(mapObject) == TRUE) {
        return TRUE;
    }

    if (direction == DIR_NONE) {
        return FALSE;
    }

    if (sub_0205DE64(MapObject_GetMovementCommand(mapObject)) == TRUE) { // MovementAction_IsWalkOnSpotSlow?
        u32 flags = PlayerAvatar_CheckCollision(playerAvatar, mapObject, direction);

        if (flags == PLAYER_COLLISION_NONE) {
            return TRUE;
        }

        return flags == PLAYER_COLLISION_WATER && PlayerAvatar_GetState(playerAvatar) == PLAYER_STATE_SURFING;
    }

    return FALSE;
}

static void PlayerAvatar_StartMoveInit(PlayerAvatar *playerAvatar, int dir_unused, u16 heldKeys_unused, u16 newKeys) {
    PlayerAvatar_SetFaceDirection(playerAvatar, sub_0205DD9C(newKeys), sub_0205DDB8(newKeys)); // Movement_FaceLeftRightFromInput, Movement_FaceUpDownFromInput
    PlayerAvatar_ClearFlag6(playerAvatar);                                                  // PlayerAvatar_EndStep
}

static void PlayerAvatar_EnableTileBehaviorCheck(PlayerAvatar *playerAvatar) {
    if (PlayerAvatar_CheckFlag6(playerAvatar) == TRUE && PlayerAvatar_GetMoveState(playerAvatar) == AVATAR_MOVE_STATE_MOVING) {
        PlayerAvatar_SetIgnoreTileBehavior(playerAvatar, FALSE);
    }
}

static void PlayerAvatar_PlayWalkSE(PlayerAvatar *playerAvatar) {
    if (PlayerAvatar_GetMoveState(playerAvatar) == AVATAR_MOVE_STATE_MOVING) {
        LocalMapObject *playerMapObject = PlayerAvatar_GetMapObject(playerAvatar);
        u8 curTile, nextTile = MapObject_GetMetatileBehavior(playerMapObject);
        int direction = sub_02062390(MapObject_GetMovementCommand(playerMapObject)); // GetDirectionForMovement

        if (direction == DIR_NONE) {
            curTile = nextTile;
        } else {
            curTile = LocalMapObject_GetNextPositionMetatileBehavior(playerMapObject, direction);
        }

        if (MetatileBehavior_IsPuddle(nextTile) == TRUE) {
            PlaySE(SEQ_SE_DP_FOOT3_0);
        }

        if (MetatileBehavior_IsShallowWater(nextTile) == TRUE) {
            PlaySE(SEQ_SE_DP_FOOT3_1);
        }

        // Does nothing.
        MetatileBehavior_IsSand(nextTile);

        if (MetatileBehavior_IsMud(nextTile) == TRUE) {
            PlaySE(SEQ_SE_DP_MARSH_WALK);
        }

        int movement = MapObject_GetMovementCommand(playerMapObject);

        // Does nothing, and also does not occur in Platinum.
        PlayerAvatar_GetState(playerAvatar);

        if (sub_0205DE64(movement) == FALSE) {
            if (MetatileBehavior_IsVeryTallGrass(nextTile) == TRUE || MetatileBehavior_IsVeryTallGrass(curTile) == TRUE) {
                PlaySE(SEQ_SE_DP_KUSA);
            }
            if (MetatileBehavior_IsTallGrass(nextTile) == TRUE || MetatileBehavior_IsTallGrass(curTile) == TRUE) {
                PlaySE(SEQ_SE_GS_KUSA2);
            }
        }
        PlayWalkSEWithCooldown(playerMapObject, playerAvatar);
    }
}

extern u16 sWalkSounds[16][2]; /*= {
    [0] = {SEQ_SE_GS_ASHIOTO_A_WALK, FALSE},
    [1] = {SEQ_SE_GS_ASHIOTO_A, FALSE},
    [2] = {SEQ_SE_GS_OCHIBA, FALSE},
    [3] = {SEQ_SE_GS_EDAPAKI, FALSE},
    [4] = {SEQ_SE_GS_KUSA2, FALSE},
    [5] = {SEQ_SE_GS_ASHIOTO_B, TRUE},
    [6] = {SEQ_SE_GS_ASHIOTO_D, TRUE},
    [7] = {SEQ_SE_GS_ASHIOTO_D_2, FALSE},
    [8] = {SEQ_SE_GS_ASHIOTO_E, FALSE},
    [9] = {SEQ_SE_GS_ASHIOTO_B, TRUE},
    [10] = {SEQ_SE_GS_ASHIOTO_F, TRUE},
    [11] = {SEQ_SE_GS_ASHIOTO_D, FALSE},
    [12] = {SEQ_SE_GS_ASHIOTO_H, FALSE},
    [13] = {SEQ_SE_GS_ASHIOTO_G, FALSE},
    [14] = {SEQ_SE_DP_BOX02, FALSE},
    [15] = {SEQ_SE_DP_BOX01, FALSE}
};*/

static void PlayWalkSEWithCooldown(LocalMapObject* playerMapObject, PlayerAvatar* playerAvatar) {
    int direction = sub_02062390(MapObject_GetMovementCommand(playerMapObject)); // TODO: GetDirectionForMovement?
    u8 walkSoundIndex = MapObject_GetMetatileBehavior(playerMapObject);
    u8 tile = MapObject_GetMetatileBehavior(playerMapObject);
    if (!MetatileBehavior_IsVeryTallGrass(tile) && MetatileBehavior_IsPuddle(tile) != TRUE && MetatileBehavior_IsShallowWater(tile) != TRUE && !MetatileBehavior_IsTallGrass(tile)) {
        if (direction != DIR_NONE) { // TODO: Should never be false?
            walkSoundIndex = sub_02060FE0(playerMapObject, direction); // TODO: Likely calls Plat's TerrainCollisionManager_GetTileBehavior on tile in direction
        }
        
        if (sWalkSounds[walkSoundIndex][0] == SEQ_SE_GS_EDAPAKI) { // WALK_SOUND_BRANCHES
            PlayerAvatar_ResetFootstepCooldown(playerAvatar);
        } else if (PlayerAvatar_GetPlayerMoveState(playerAvatar) == PLAYER_MOVE_STATE_NONE) {
            PlayerAvatar_ResetFootstepCooldown(playerAvatar);
        } else { // With few exceptions, this means the code below should trigger every other step.
            PlayerAvatar_ToggleFootstepCooldown(playerAvatar);
        }
        
        if (PlayerAvatar_GetFootstepCooldown(playerAvatar) == FALSE) {
            int playerState = PlayerAvatar_GetState(playerAvatar);
            if (playerState != PLAYER_STATE_CYCLING && playerState != PLAYER_STATE_SURFING) {
                if (walkSoundIndex < NUM_WALK_SOUNDS) {
                    if (walkSoundIndex == WALK_SOUND_GENERIC && sub_0205DE98(playerAvatar) == TRUE) { // Returns true if any 'movement face' is derived from Unk8
                        walkSoundIndex = WALK_SOUND_SNOW; // TODO: Is this actually snow? I don't trust DSPRE on this anymore.
                    }

                    u16 walkSound;
                    if (sWalkSounds[walkSoundIndex][1] == TRUE) {
                        walkSound = sWalkSounds[walkSoundIndex][0];
                        sub_02006088(walkSound);
                    } else {
                        walkSound = sWalkSounds[walkSoundIndex][0];
                        PlaySE(walkSound);
                    }
                    
                    sub_02005BA8(walkSound);
                } else {
                    GF_ASSERT(walkSoundIndex < NUM_WALK_SOUNDS);
                }
            }
        }
    }
}

void PlayerAvatar_UpdateMovement(PlayerAvatar* playerAvatar) {
    int avatarMoveState = PlayerAvatar_GetMoveState(playerAvatar);
    int playerMoveState = PlayerAvatar_GetPlayerMoveState(playerAvatar);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(playerAvatar);

    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_NONE);

    u32 tileMovement = PlayerAvatar_GetTileMovement(playerAvatar, DIR_NONE);

    if (tileMovement != TILE_MOVE_NONE && tileMovement != TILE_MOVE_CYCLING_ROAD_DOWN) {
        PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_MOVING);
    } else if (MapObject_AreBitsSetForMovementScriptInit(playerObj) == FALSE) {
        switch (avatarMoveState) {
        case AVATAR_MOVE_STATE_NONE:
            break;
        case AVATAR_MOVE_STATE_MOVING:
            if (sub_0205DE64(MapObject_GetMovementCommand(playerObj)) != TRUE) {
                if (playerMoveState == PLAYER_MOVE_STATE_NONE || playerMoveState == PLAYER_MOVE_STATE_END) {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_START);
                } else {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_MOVING);
                }
            }
            break;
        case AVATAR_MOVE_STATE_TURNING:
            PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_MOVING);
            break;
        }
    } else if (MapObject_IsMovementPaused(playerObj) == TRUE && avatarMoveState != AVATAR_MOVE_STATE_NONE) {
        switch (avatarMoveState) {
        case AVATAR_MOVE_STATE_MOVING:
            if (playerMoveState != PLAYER_MOVE_STATE_NONE) {
                if (playerMoveState == PLAYER_MOVE_STATE_END) {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_NONE);
                } else {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_END);
                }
            }
            break;
        case AVATAR_MOVE_STATE_TURNING:
            if (playerMoveState != PLAYER_MOVE_STATE_NONE) {
                if (playerMoveState == PLAYER_MOVE_STATE_END) {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_NONE);
                } else {
                    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_END);
                }
            }
            break;
        }
    }
}

void PlayerAvatar_ClearMoveState(PlayerAvatar *playerAvatar) {
    PlayerAvatar_SetMoveState(playerAvatar, PLAYER_AVATAR_WALKING);
    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_NONE);
    PlayerAvatar_ClearSpeed(playerAvatar);
}

BOOL PlayerAvatar_CheckForceStopMovement(PlayerAvatar* playerAvatar) {
    int avatarMoveState = PlayerAvatar_GetMoveState(playerAvatar);
    int playerMoveState = PlayerAvatar_GetPlayerMoveState(playerAvatar);
    
    if (avatarMoveState == AVATAR_MOVE_STATE_NONE) {
        return TRUE;
    }
    
    if (avatarMoveState == AVATAR_MOVE_STATE_TURNING) {
        return TRUE;
    }
    
    if (avatarMoveState == AVATAR_MOVE_STATE_MOVING) {
        if (playerMoveState == PLAYER_MOVE_STATE_NONE || playerMoveState == PLAYER_MOVE_STATE_END) {
            return TRUE;
        }
        
        LocalMapObject *playerMapObj = PlayerAvatar_GetMapObject(playerAvatar);
        
        if (MapObject_AreBitsSetForMovementScriptInit(playerMapObj) == TRUE) {
            return TRUE;
        }
        
        if (sub_0205DE64(MapObject_GetMovementCommand(playerMapObj)) == TRUE) {
            return TRUE;
        }
    }
    
    return FALSE;
}

void PlayerAvatar_ForceStopMovement(PlayerAvatar* playerAvatar, int direction) {
    PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_NONE);
    PlayerAvatar_SetPlayerMoveState(playerAvatar, PLAYER_MOVE_STATE_NONE);
    
    LocalMapObject *playerMapObj = PlayerAvatar_GetMapObject(playerAvatar);
    
    MapObject_SetFacingDirection(playerMapObj, direction);
    sub_0205F328(playerMapObj, 0);
    sub_02060F78(playerMapObj); // TODO: MapObject_UpdateCoords
    MapObject_ClearHeldMovement(playerMapObj);
    MapObject_SetHeldMovement(playerMapObj, sub_0206234C(direction, MOVEMENT_FACE_UP)); // TODO: MovementAction_TurnActionTowardsDir
}

static BOOL PlayerAvatar_TryMoveFromCurrentTileBehavior(PlayerAvatar *playerAvatar, int direction) {
    u32 tileMovement = PlayerAvatar_GetTileMovement(playerAvatar, direction);

    return PlayerAvatar_TryMoveTileBehavior(playerAvatar, tileMovement, direction);
}

static u32 PlayerAvatar_GetTileMovement(PlayerAvatar* playerAvatar, int direction) {
    int i = 0;
    u32 tileBehavior = MapObject_GetMetatileBehavior(PlayerAvatar_GetMapObject(playerAvatar));
    
    if (PlayerAvatar_IsOnCyclingRoadBridge(playerAvatar, tileBehavior, direction) == TRUE) {
        return TILE_MOVE_CYCLING_ROAD_DOWN;
    }
    
    if (PlayerAvatar_CheckIgnoreTileBehavior(playerAvatar) == TRUE) {
        return TILE_MOVE_NONE;
    }

    do {
        if (sTileBehaviorCheckTable[i].func(tileBehavior) == TRUE) {
            return sTileBehaviorCheckTable[i].tileMove;
        }
        i++;
    } while(sTileBehaviorCheckTable[i].func != NULL);
    
    return TILE_MOVE_NONE;
}

/*static const TileBehaviorCheck sTileBehaviorCheckTable[] = {
    { TileBehavior_IsIce, TILE_MOVE_ICE },
    { NULL, TILE_MOVE_MAX }
};*/

static BOOL PlayerAvatar_TryMoveTileBehavior(PlayerAvatar *playerAvatar, u32 tileMove, int direction) {
    if (sTileMovementFunctions[tileMove](playerAvatar, direction) == TRUE) {
        return TRUE;
    }

    return FALSE;
}

BOOL PlayerAvatar_TileMove_None(PlayerAvatar *playerAvatar, int direction);
/*static*/ BOOL PlayerAvatar_TileMove_None(PlayerAvatar *playerAvatar, int direction) {
    PlayerAvatar_ClearTileForcedMovement(playerAvatar);
    return FALSE;
}

BOOL PlayerAvatar_TileMove_Ice(PlayerAvatar* playerAvatar);
/*static*/ BOOL PlayerAvatar_TileMove_Ice(PlayerAvatar* playerAvatar) {
    LocalMapObject *playerMapObj = PlayerAvatar_GetMapObject(playerAvatar);
    int nextDirection = MapObject_GetNextFacingDirection(playerMapObj);
    int heightChange = PlayerAvatar_CheckIceHeightChange(playerAvatar, nextDirection);
    u32 flags = PlayerAvatar_CheckCollision(playerAvatar, playerMapObj, nextDirection);
    
    PlayerAvatar_SetForcedMovement(playerAvatar, TRUE);
    
    if (flags != PLAYER_COLLISION_NONE) {
        FieldSystem *fieldSystem = MapObject_GetFieldSystem(playerMapObj);
        PlayerAvatar_SetIgnoreTileBehavior(playerAvatar, TRUE);
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_NONE);
        if (sub_0206D494(fieldSystem) == FALSE) {
            PlayerAvatar_ClearTileForcedMovement(playerAvatar);
            return FALSE;
        }
        return TRUE;
    }
    
    if (PlayerAvatar_UpdateIceSpeedFromHeightChange(playerAvatar, heightChange) == FALSE) {
        PlayerAvatar_ClearTileForcedMovement(playerAvatar);
        nextDirection = Direction_GetOpposite(nextDirection);
        
        if (PlayerAvatar_CheckCollision(playerAvatar, playerMapObj, nextDirection) != PLAYER_COLLISION_NONE) {
            return FALSE;
        }
        
        MapObject_SetFlagsBits(playerMapObj, (MapObjectFlagBits)(MAPOBJECTFLAG_LOCK_DIRECTION | MAPOBJECTFLAG_PAUSE_ANIMATION));
        PlayerAvatar_SetMovement(playerAvatar, playerMapObj, sub_0206234C(nextDirection, 8)); // MovementAction_TurnActionTowardsDir
        PlayerAvatar_SetIgnoreTileBehavior(playerAvatar, TRUE);
        PlayerAvatar_SetForcedMovement(playerAvatar, TRUE);
        PlayerAvatar_SetFaceDirection(playerAvatar, DIR_NONE, DIR_NONE);
    } else {
        MapObject_SetFlagsBits(playerMapObj, (MapObjectFlagBits)(MAPOBJECTFLAG_LOCK_DIRECTION | MAPOBJECTFLAG_PAUSE_ANIMATION));
        PlayerAvatar_SetIceMovement(playerAvatar, nextDirection);
    }
    
    PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
    return TRUE;
}

BOOL PlayerAvatar_TileMove_CyclingRoadDown(PlayerAvatar* playerAvatar);
/*static*/ BOOL PlayerAvatar_TileMove_CyclingRoadDown(PlayerAvatar* playerAvatar) {
    LocalMapObject *playerMapObj = PlayerAvatar_GetMapObject(playerAvatar);
    
    if (PlayerAvatar_CheckCollision(playerAvatar, playerMapObj, DIR_SOUTH) == PLAYER_COLLISION_NONE) {
        PlayerAvatar_SetMovement(playerAvatar, playerMapObj, sub_0206234C(DIR_SOUTH, MOVEMENT_WALK_FASTER_UP));
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
        PlayerAvatar_SetSpeed(playerAvatar, 3);
        return TRUE;
    } else {
        PlayerAvatar_SetMovement(playerAvatar, playerMapObj, sub_0206234C(DIR_SOUTH, MOVEMENT_FACE_DOWN));
        PlayerAvatar_ClearSpeed(playerAvatar);
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_NONE);
        PlayerAvatar_SetBikeBrake(playerAvatar, FALSE);
    }
    
    return TRUE;
}

/*static BOOL (*const sTileMovementFunctions[TILE_MOVE_MAX])(PlayerAvatar *playerAvatar, int direction) = {
    [TILE_MOVE_NONE] = PlayerAvatar_TileMove_None,
    [TILE_MOVE_ICE] = PlayerAvatar_TileMove_Ice,
    [TILE_MOVE_CYCLING_ROAD_DOWN] = PlayerAvatar_TileMove_CyclingRoadDown
};*/

static void PlayerAvatar_ClearTileForcedMovement(PlayerAvatar *playerAvatar) {
    if (PlayerAvatar_CheckForcedMovement(playerAvatar) == TRUE) {
        MapObject_ClearFlagsBits(PlayerAvatar_GetMapObject(playerAvatar), (MapObjectFlagBits)(MAPOBJECTFLAG_LOCK_DIRECTION | MAPOBJECTFLAG_PAUSE_ANIMATION));

        if (PlayerAvatar_CheckForcedMovementRetainSpeed(playerAvatar) == FALSE) {
            PlayerAvatar_ClearSpeed(playerAvatar);
        }

        PlayerAvatar_SetForcedMovement(playerAvatar, FALSE);
        PlayerAvatar_SetForcedMovementRetainSpeed(playerAvatar, FALSE);
        PlayerAvatar_SetMoveThroughMudFlag(playerAvatar, FALSE);
    }
}

static int PlayerAvatar_CheckIceHeightChange(PlayerAvatar* playerAvatar, int direction) {
    LocalMapObject *playerMapObject = PlayerAvatar_GetMapObject(playerAvatar);
    FieldSystem *fieldSystem = MapObject_GetFieldSystem(playerMapObject);

    VecFx32 cur;
    MapObject_CopyPositionVector(playerMapObject, &cur);
    VecFx32 next = cur;
    
    VecFx32_StepDirection(direction, &next, ((16 * FX32_ONE) >> 1) / 2);
    
    if (MapObject_RecalculatePositionHeight(fieldSystem, &next) == FALSE || cur.y == next.y) {
        return 0; // PLAYER_HEIGHT_CHANGE_NONE
    }
        
    if (cur.y > next.y) {
        return 2; // PLAYER_HEIGHT_CHANGE_DECREASE
    }
    
    return 1; // PLAYER_HEIGHT_CHANGE_INCREASE
}

static BOOL PlayerAvatar_UpdateIceSpeedFromHeightChange(PlayerAvatar *playerAvatar, int heightChange) {
    int speed = PlayerAvatar_GetSpeed(playerAvatar);

    if (heightChange == 1) { // PLAYER_HEIGHT_CHANGE_INCREASE
        speed--;

        if (speed < 0) {// AVATAR_MOVE_SPEED_0
            return FALSE;
        }
    } else if (heightChange == 2) { // PLAYER_HEIGHT_CHANGE_DECREASE
        speed++;

        if (speed > 3) { // AVATAR_MOVE_SPEED_3
            speed = 3;
        }
    }

    PlayerAvatar_SetSpeed(playerAvatar, speed);
    return TRUE;
}

static void PlayerAvatar_SetIceMovement(PlayerAvatar* playerAvatar, int direction) {
    LocalMapObject *playerMapObject = PlayerAvatar_GetMapObject(playerAvatar);
    int movement = MOVEMENT_WALK_FAST_UP;
    int speed = PlayerAvatar_GetSpeed(playerAvatar);
    switch (speed) {
    case 1: // AVATAR_MOVE_SPEED_1
        movement = MOVEMENT_WALK_SLIGHTLY_FASTER_UP;
        break;
    case 2: // AVATAR_MOVE_SPEED_2
        movement = MOVEMENT_WALK_FASTER_UP;
        break;
    case 3: // AVATAR_MOVE_SPEED_3
        movement = MOVEMENT_WALK_FASTER_UP;
        break;
    }
    movement = sub_0206234C(direction, movement);
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, movement);
    
    FieldSystem *fieldSystem = MapObject_GetFieldSystem(playerMapObject);
    if (FollowMon_IsActive(fieldSystem)) {
        ov01_02205990(movement, MapObject_GetPreviousXCoord(playerMapObject), MapObject_GetPreviousZCoord(playerMapObject), &fieldSystem->followMon);
    }
}

static void PlayerAvatar_SetMovementFromState(PlayerAvatar* playerAvatar, MapLoadManager* manager, int direction, u16 heldKeys, u16 newKeys) {
    int state = PlayerAvatar_GetState(playerAvatar);
    LocalMapObject *playerMapObject = PlayerAvatar_GetMapObject(playerAvatar);

    switch(state) {
        case PLAYER_STATE_WALKING:
        case PLAYER_STATE_SURFING:
        case PLAYER_STATE_ROCKET:
            PlayerAvatar_SetMovement_Normal(playerAvatar, playerMapObject, manager, direction, heldKeys, newKeys); 
            break;
        case PLAYER_STATE_CYCLING:
            PlayerAvatar_SetMovement_Bike(playerAvatar, playerMapObject, manager, direction, heldKeys, newKeys);
            break;
        default:
            GF_ASSERT(FALSE);
            break;
    }
}

static void PlayerAvatar_SetMovement_Normal(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *manager, int direction, u16 heldKeys, u16 newKeys) {
    switch (sub_0205D40C(playerAvatar, direction)) { // PlayerAvatar_UpdateMoveState2?
    case AVATAR_MOVE_STATE_NONE:
        PlayerAvatar_SetMovement_NotMoving(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    case AVATAR_MOVE_STATE_MOVING:
        PlayerAvatar_SetMovement_Moving(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    case AVATAR_MOVE_STATE_TURNING:
        PlayerAvatar_SetMovement_Turning(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    }
}

static int sub_0205D40C(PlayerAvatar* playerAvatar, int direction) { // PlayerAvatar_UpdateMoveState2
    int updateMoveState = PlayerAvatar_UpdateMoveState(playerAvatar, direction);
    int moveState = PlayerAvatar_ValidateState(updateMoveState); // TODO: Check if still redundant

    PlayerAvatar_SetMoveState(playerAvatar, moveState); // Redundant since it gets set in PlayerAvatar_UpdateMoveState.
    return updateMoveState;
}

/*static*/ int PlayerAvatar_ValidateState(int moveState) {
    switch (moveState) {
    case AVATAR_MOVE_STATE_NONE:
        return AVATAR_MOVE_STATE_NONE;
    case AVATAR_MOVE_STATE_MOVING:
        return AVATAR_MOVE_STATE_MOVING;
    case AVATAR_MOVE_STATE_TURNING:
        return AVATAR_MOVE_STATE_TURNING;
    }

    GF_ASSERT(FALSE);
    return AVATAR_MOVE_STATE_NONE;
}

static int MapObject_DummyReturnMovementAction(LocalMapObject *playerMapObject_unused, u8 tileBehavior_unused, int movementAction) {
    return movementAction;
}

/*static*/ int PlayerAvatar_UpdateMoveState(PlayerAvatar* playerAvatar, int direction) {
    if (direction == DIR_NONE) {
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_NONE);
        return PLAYER_MOVE_STATE_NONE;
    }

    int facingDirection = PlayerAvatar_GetFacingDirection(playerAvatar);
    if (facingDirection != direction && PlayerAvatar_GetMoveState(playerAvatar) != AVATAR_MOVE_STATE_MOVING) {
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_TURNING);
        return PLAYER_MOVE_STATE_MOVING;
    }

    PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
    return PLAYER_MOVE_STATE_START;
}

static void PlayerAvatar_SetMovement_NotMoving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction_unused, u16 heldKeys_unused, u16 newKeys_unused) {
    int movementAction = sub_0206234C(MapObject_GetFacingDirection(playerMapObject), MOVEMENT_FACE_UP);
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, movementAction); // PLAYER_ACTION_SPEED_NOT_MOVING
}

static void PlayerAvatar_SetMovement_Moving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys, u16 newKeys) {
    int movement;
    FieldSystem *fieldSystem;

    BOOL followMonShouldWait = FALSE;
    u32 flags = PlayerAvatar_CheckCollision(playerAvatar, playerMapObject, direction);
    
    if (PlayerAvatar_GetState(playerAvatar) != PLAYER_STATE_SURFING) {
        if (4 & flags) { // PLAYER_COLLISION_JUMP
            movement = MOVEMENT_JUMP_FAR_UP;
        } else if (flags != 0) { // PLAYER_COLLISION_NONE
            movement = MOVEMENT_WALK_IN_PLACE_SLOW_FACE_UP;
            if (!(8 & flags)) { // PLAYER_COLLISION_WARP
                fieldSystem = MapObject_GetFieldSystem(playerMapObject);
                if (FieldSystem_IsSaveGymmickTypeEqualTo(fieldSystem, GYMMICK_FUCHSIA)) {
                    int x = MapObject_GetXCoord(playerMapObject);
                    x += GetDeltaXByFacingDirection(direction);
                    int y = MapObject_GetZCoord(playerMapObject);
                    y += GetDeltaYByFacingDirection(direction);
                    FuchsiaGymmick_CheckCollision(fieldSystem, x, y);
                } else {
                    PlaySE(SEQ_SE_DP_WALL_HIT);
                }
            }
            MapObject_SetNextFacingDirection(playerMapObject, direction);
            followMonShouldWait = TRUE;
        } else {
            movement = MOVEMENT_STEP_UP;
            if (PlayerSaveData_CheckRunningShoes(PlayerAvatar_GetPlayerSaveData(playerAvatar)) == TRUE && PlayerAvatar_IsRunButtonHeld(playerAvatar, newKeys) == TRUE) {
                movement = MOVEMENT_RUN_UP;
            }
            
            movement = MapObject_DummyReturnMovementAction(playerMapObject, MapObject_GetMetatileBehavior(playerMapObject), movement); // Originally handled deep snow in Platinum.
            
            PlayerAvatar_IncrementStepsRecord(playerAvatar);
            PlayerAvatar_SetFlag6(playerAvatar); // PlayerAvatar_StartStep
        }
    } else if (flags == 0 || flags == 32) { // PLAYER_COLLISION_NONE || PLAYER_COLLISION_WATER
        movement = MapObject_DummyReturnMovementAction(playerMapObject, MapObject_GetMetatileBehavior(playerMapObject), MOVEMENT_WALK_FAST_UP);
        PlayerAvatar_IncrementStepsRecord(playerAvatar);
        PlayerAvatar_SetFlag6(playerAvatar); // PlayerAvatar_StartStep
    } else {
        movement = MOVEMENT_WALK_IN_PLACE_SLOW_FACE_UP;
        
        if (!(8 & flags)) { // PLAYER_COLLISION_WARP
            PlaySE(SEQ_SE_DP_WALL_HIT);
        }
        
        MapObject_SetNextFacingDirection(playerMapObject, direction);
    }
    movement = sub_0206234C(direction, movement);
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, movement);
    
    if (followMonShouldWait == FALSE) {
        fieldSystem = MapObject_GetFieldSystem(playerMapObject);
        ov01_02205990(movement, MapObject_GetPreviousXCoord(playerMapObject), MapObject_GetPreviousZCoord(playerMapObject), &fieldSystem->followMon);
    }
}

static void PlayerAvatar_SetMovement_Turning(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys, u16 newKeys) {
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, sub_0206234C(direction, MOVEMENT_WALK_IN_PLACE_FAST_UP));
    MapObject_SetNextFacingDirection(playerMapObject, direction);
    
    PlayerAvatar_ResetFootstepCooldown(playerAvatar);
    PlayerAvatar_ToggleFootstepCooldown(playerAvatar);
}

static void PlayerAvatar_SetMovement_Bike(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys) {
    PlayerAvatar_SetMovement_BikeThirdGear(playerAvatar, playerMapObject, mapLoadManager, direction, heldKeys, newKeys);
}

int PlayerAvatar_GetMovementActionFromSpeed(PlayerAvatar *playerAvatar, int direction);
/*static*/ int PlayerAvatar_GetMovementActionFromSpeed(PlayerAvatar *playerAvatar, int direction) {
    int movement = MOVEMENT_WALK_SLIGHTLY_FAST_UP;
    switch (PlayerAvatar_GetSpeed(playerAvatar)) {
    case 1:
        movement = MOVEMENT_WALK_FAST_UP;
        break;
    case 2:
        movement = MOVEMENT_WALK_SLIGHTLY_FASTER_UP;
        break;
    case 3:
        movement = MOVEMENT_WALK_FASTER_UP;
        break;
    }
    return sub_0206234C(direction, movement);
}

BOOL PlayerAvatar_AccelerateBike(PlayerAvatar *playerAvatar);
/*static*/ BOOL PlayerAvatar_AccelerateBike(PlayerAvatar *playerAvatar) {
    int speed = PlayerAvatar_AddSpeed(playerAvatar, 1, 3); // AVATAR_MOVE_SPEED_3

    if (PlayerAvatar_CheckBikeBrake(playerAvatar) == FALSE) {
        if (speed >= 2) { // AVATAR_MOVE_SPEED_BIKE_BRAKE
            PlayerAvatar_SetBikeBrake(playerAvatar, TRUE);
        }
    }

    return (speed == 3); // AVATAR_MOVE_SPEED_3
}

BOOL PlayerAvatar_DecelerateBike(PlayerAvatar *playerAvatar);
/*static*/ BOOL PlayerAvatar_DecelerateBike(PlayerAvatar *playerAvatar) {
    int decelerated = TRUE;
    int speed = PlayerAvatar_GetSpeed(playerAvatar);

    speed--;

    if (speed < 0) { // AVATAR_MOVE_SPEED_0
        speed = 0; // AVATAR_MOVE_SPEED_0
        decelerated = FALSE;
    }

    PlayerAvatar_SetSpeed(playerAvatar, speed);

    if (PlayerAvatar_CheckBikeBrake(playerAvatar) == TRUE) {
        if (speed == 0) { // AVATAR_MOVE_SPEED_0
            PlayerAvatar_SetBikeBrake(playerAvatar, FALSE);
        }
    }

    return decelerated;
}

static void PlayerAvatar_SetMovement_BikeThirdGear(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, MapLoadManager *mapLoadManager_unused, int direction, u16 heldKeys, u16 newKeys) {
    int bikeState = PlayerAvatar_UpdateBikeStateThirdGear(playerAvatar, direction);

    switch (bikeState) {
    case AVATAR_BIKE_STATE_NONE:
        PlayerAvatar_SetMovement_BikeThirdGearStop(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    case AVATAR_BIKE_STATE_MOVING:
        PlayerAvatar_SetMovement_BikeThirdGearMoving(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    case AVATAR_BIKE_STATE_TURNING:
        PlayerAvatar_SetMovement_BikeThirdGearTurning(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    case AVATAR_BIKE_STATE_BRAKE:
        PlayerAvatar_SetMovement_BikeThirdGearBrake(playerAvatar, playerMapObject, direction, heldKeys, newKeys);
        break;
    }
}

static int PlayerAvatar_UpdateBikeStateThirdGear(PlayerAvatar *playerAvatar, int direction) {
    int bikeState = PlayerAvatar_GetBikeStateThirdGear(playerAvatar, direction);
    int moveState = PlayerAvatarBikeState_GetMoveStateThirdGear(bikeState);

    PlayerAvatar_SetMoveState(playerAvatar, moveState);
    return bikeState;
}

/*static*/ int PlayerAvatarBikeState_GetMoveStateThirdGear(int bikeState) {
    switch (bikeState) {
    case AVATAR_BIKE_STATE_NONE:
        return AVATAR_MOVE_STATE_NONE;
    case AVATAR_BIKE_STATE_MOVING:
        return AVATAR_MOVE_STATE_MOVING;
    case AVATAR_BIKE_STATE_TURNING:
        return AVATAR_MOVE_STATE_TURNING;
    case AVATAR_BIKE_STATE_BRAKE:
        return AVATAR_MOVE_STATE_MOVING;
    }

    GF_ASSERT(FALSE);
    return AVATAR_MOVE_STATE_NONE;
}

/*static*/ int PlayerAvatar_GetBikeStateThirdGear(PlayerAvatar *playerAvatar, int direction) {
    int speed = PlayerAvatar_GetSpeed(playerAvatar);
    if (direction == DIR_NONE) {
        if (speed < 2) {
            PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_NONE);
            return AVATAR_BIKE_STATE_NONE;
        }
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
        return AVATAR_BIKE_STATE_BRAKE;
    }

    int facingDirection = PlayerAvatar_GetFacingDirection(playerAvatar);
    if (facingDirection != direction && PlayerAvatar_GetMoveState(playerAvatar) != AVATAR_MOVE_STATE_MOVING) {
        if (speed < 2) {
            PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_TURNING);
            return AVATAR_BIKE_STATE_TURNING;
        }
        PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
        return AVATAR_BIKE_STATE_BRAKE;
    }

    PlayerAvatar_SetMoveState(playerAvatar, AVATAR_MOVE_STATE_MOVING);
    return AVATAR_BIKE_STATE_MOVING;
}

static void PlayerAvatar_SetMovement_BikeThirdGearStop(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction_unused, u16 heldKeys_unused, u16 newKeys_unused) {
    int movementAction = sub_0206234C(MapObject_GetFacingDirection(playerMapObject), MOVEMENT_FACE_UP);

    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, movementAction);
    PlayerAvatar_ClearSpeed(playerAvatar);
}

static void PlayerAvatar_SetMovement_BikeThirdGearMoving(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys_unused, u16 newKeys_unused) {
    int movement;
    
    u32 collision = PlayerAvatar_CheckCollision(playerAvatar, playerMapObject, direction); // Returns 8-bit flags (0x10, 0x40, 0x80 unused?)
    
    if (0x4 & collision) { // PLAYER_COLLISION_JUMP
        movement = sub_0206234C(direction, MOVEMENT_JUMP_FAR_UP);
        PlayerAvatar_AccelerateBike(playerAvatar);
        PlayerAvatar_IncrementStepsRecord(playerAvatar);
        PlayerAvatar_SetFlag6(playerAvatar);
    } else if (0x10 & collision) { // TODO: Unreachable?
        if (PlayerAvatar_GetSpeed(playerAvatar) >= 3) {
            movement = PlayerAvatar_GetMovementActionFromSpeed(playerAvatar, direction);
            PlayerAvatar_SetFlag6(playerAvatar);
            PlayerAvatar_SetForcedMovement(playerAvatar, TRUE);
        } else {
            movement = sub_0206234C(direction, MOVEMENT_WALK_IN_PLACE_SLOW_FACE_UP);
            if (!(8 & collision)) {
                PlaySE(SEQ_SE_DP_WALL_HIT);
            }
            MapObject_SetNextFacingDirection(playerMapObject, direction);
            PlayerAvatar_ClearSpeed(playerAvatar);
        }
    } else if (0x40 & collision) { // Unreachable?
        int nextDirection = MapObject_GetNextFacingDirection(playerMapObject);
        movement = sub_0206234C(nextDirection, 0);
        MapObject_SetNextFacingDirection(playerMapObject, nextDirection);
        PlayerAvatar_ClearSpeed(playerAvatar);
        PlayerAvatar_SetFaceDirection(playerAvatar, -1, -1);
    } else if (collision) {
        movement = sub_0206234C(direction, MOVEMENT_WALK_IN_PLACE_SLOW_FACE_UP);
        if (!(0x8 & collision)) {
            PlaySE(SEQ_SE_DP_WALL_HIT);
        }
        MapObject_SetNextFacingDirection(playerMapObject, direction);
        PlayerAvatar_ClearSpeed(playerAvatar);
    } else {
        movement = PlayerAvatar_GetMovementActionFromSpeed(playerAvatar, direction);
        PlayerAvatar_AccelerateBike(playerAvatar);
        PlayerAvatar_IncrementStepsRecord(playerAvatar);
        PlayerAvatar_SetFlag6(playerAvatar);
    }
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, movement);
}

static void PlayerAvatar_SetMovement_BikeThirdGearTurning(PlayerAvatar *playerAvatar, LocalMapObject *playerMapObject, int direction, u16 heldKeys_unused, u16 newKeys_unused) {
    PlayerAvatar_ClearSpeed(playerAvatar);
    PlayerAvatar_SetMovement(playerAvatar, playerMapObject, sub_0206234C(direction, MOVEMENT_WALK_IN_PLACE_FAST_UP));
    MapObject_SetNextFacingDirection(playerMapObject, direction);
    PlayerAvatar_ClearSpeed(playerAvatar);
}
