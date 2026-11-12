#include "player_move.h"

#include "global.h"

#include "constants/player_avatar.h"
#include "constants/sndseq.h"

#include "map_object.h"
#include "metatile_behavior.h"
#include "overlay_01_021F1AFC.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "unk_0205FD20.h"
#include "unk_02062108.h"

static BOOL PlayerAvatar_CheckStartMoveInternal(PlayerAvatar *playerAvatar, int direction);
static void PlayerAvatar_StartMoveInit(PlayerAvatar *playerAvatar, int dir_unused, u16 heldKeys_unused, u16 newKeys);
static void PlayerAvatar_EnableTileBehaviorCheck(PlayerAvatar *playerAvatar);
static void PlayerAvatar_PlayWalkSE(PlayerAvatar *playerAvatar);
static void PlayWalkSEWithCooldown(LocalMapObject *playerMapObject, PlayerAvatar *playerAvatar);
static BOOL PlayerAvatar_TryMoveFromCurrentTileBehavior(PlayerAvatar *playerAvatar, int direction);

u32 PlayerAvatar_GetTileMovement(PlayerAvatar *playerAvatar, int direction);
int PlayerAvatar_TryMoveTileBehavior(PlayerAvatar *playerAvatar, u32 tileMove, int direction);
void sub_0205D340(PlayerAvatar *playerAvatar, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys);
BOOL sub_0205D40C(PlayerAvatar *playerAvatar, int direction);
s32 sub_0205DD9C(u16 newKeys);
s32 sub_0205DDB8(u16 newKeys);
BOOL sub_0205DE64(u32 movementCommand);
int sub_02062390(u32 movementCommand);

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

    sub_0205D340(playerAvatar, mapLoadManager, direction, heldKeys, newKeys); // PlayerAvatar_SetMovementFromState?

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
        u32 flags = sub_0205DA34(playerAvatar, mapObject, direction);    // PlayerAvatar_CheckCollision?

        if (flags == 0) {
            return TRUE;
        }

        // PLAYER_COLLISION_WATER?
        return flags == 0x20 && PlayerAvatar_GetState(playerAvatar) == PLAYER_STATE_SURFING;
    }

    return FALSE;
}

static void PlayerAvatar_StartMoveInit(PlayerAvatar *playerAvatar, int dir_unused, u16 heldKeys_unused, u16 newKeys) {
    PlayerAvatar_SetUnk28Unk2C(playerAvatar, sub_0205DD9C(newKeys), sub_0205DDB8(newKeys)); // PlayerAvatar_SetFaceDirection, Movement_FaceLeftRightFromInput, Movement_FaceUpDownFromInput
    PlayerAvatar_ClearFlag6(playerAvatar);                                                  // PlayerAvatar_EndStep
}

static void PlayerAvatar_EnableTileBehaviorCheck(PlayerAvatar *playerAvatar) {
    if (PlayerAvatar_CheckFlag6(playerAvatar) == TRUE && PlayerAvatar_GetMoveState(playerAvatar) == AVATAR_MOVE_STATE_MOVING) {
        PlayerAvatar_SetFlag1(playerAvatar, FALSE);
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

    if (tileMovement != 0 && tileMovement != 2) { // TILE_MOVE_NONE, TILE_MOVE_CYCLING_ROAD_DOWN
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