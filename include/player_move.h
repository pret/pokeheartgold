#ifndef POKEHEARTGOLD_PLAYER_MOVE_H
#define POKEHEARTGOLD_PLAYER_MOVE_H

#include "player_avatar.h"

void PlayerAvatar_MoveControl(PlayerAvatar *playerAvatar, MapLoadManager *mapLoadManager, int direction, u16 heldKeys, u16 newKeys, int movementFlag);
BOOL PlayerAvatar_CheckStartMove(PlayerAvatar *playerAvatar, int direction);
void PlayerAvatar_GetCoordsInFront(PlayerAvatar *playerAvatar, int *x, int *z);
void PlayerAvatar_UpdateMovement(PlayerAvatar *playerAvatar);
void PlayerAvatar_ClearMoveState(PlayerAvatar *playerAvatar);
BOOL PlayerAvatar_CheckForceStopMovement(PlayerAvatar *playerAvatar);
void PlayerAvatar_ForceStopMovement(PlayerAvatar *playerAvatar, int direction);
int PlayerAvatar_GetDirectionFromKeys(PlayerAvatar *playerAvatar, u16 heldKeys, u16 newKeys);
u32 PlayerAvatar_CheckCollision(PlayerAvatar *playerAvatar, LocalMapObject *mapObject, int direction);
int sub_0205DD94(PlayerAvatar *avatar, u16 newKeys, u16 heldKeys);
BOOL sub_0205DE98(PlayerAvatar *playerAvatar);

// TODO: Move to const file or c?
typedef enum WalkSounds {
    WALK_SOUND_GENERIC,
    WALK_SOUND_SNOW,
    WALK_SOUND_LEAVES,
    WALK_SOUND_BRANCHES,
    WALK_SOUND_GRASS,
    WALK_SOUND_SAND, // Only used in the Safari Zone.
    WALK_SOUND_STAIRS_ICE_GLASS,
    WALK_SOUND_METAL,
    WALK_SOUND_UNK_8,
    WALK_SOUND_UNK_9,
    WALK_SOUND_CAVERN_FLOOR,
    WALK_SOUND_UNK_11,
    WALK_SOUND_UNK_12,
    WALK_SOUND_WOOD,
    WALK_SOUND_UNK_14,
    WALK_SOUND_UNK_15,
    NUM_WALK_SOUNDS
} WalkSounds;

#endif // POKEHEARTGOLD_PLAYER_MOVE_H
