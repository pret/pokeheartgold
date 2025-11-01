#ifndef POKEHEARTGOLD_PLAYER_AVATAR_H
#define POKEHEARTGOLD_PLAYER_AVATAR_H

#include "global.h"

#include "field_types_def.h"
#include "save.h"

typedef enum PlayerAvatarFlags {
    AVATAR_FLAG_UNK0 = (1 << 0),
    AVATAR_FLAG_UNK1 = (1 << 1),
    AVATAR_FLAG_UNK2 = (1 << 2),
    AVATAR_FLAG_LOCK_BIKE_STATE = (1 << 3), // Blocks the player from mounting/dismounting their bike (though this was intended to stop dismounting during Cycling Road)
    AVATAR_FLAG_UNK4 = (1 << 4),
    AVATAR_FLAG_UNK5 = (1 << 5),
    AVATAR_FLAG_UNK6 = (1 << 6),
    AVATAR_FLAG_UNK7 = (1 << 7),
} PlayerAvatarFlags;

typedef struct PlayerSaveData {
    u16 hasRunningShoes; // bool16
    u16 runningShoesLock;
    s32 state;
} PlayerSaveData;

struct PlayerAvatar {
    PlayerAvatarFlags flags;
    u32 transitionFlags;
    u32 unk8;
    BOOL unkC;
    u32 unk10;
    u32 unk14;
    s32 state;
    u32 gender;
    u32 unk20;
    s32 unk24;
    s32 unk28;
    s32 unk2C;
    LocalMapObject *mapObject;
    u32 unk34;
    PlayerSaveData *playerSaveData;
    u32 unk3c;
}; // size: 0x40

u32 sub_0205C268(u32 param0);
u8 sub_0205C278(void);
u8 sub_0205C298(SaveData *saveData);
u8 sub_0205C2C0(u32 param0);
u8 sub_0205C2E8(u32 param0);
u8 sub_0205C310(u32 param0);
u8 sub_0205C350(u32 param0);
PlayerAvatar *PlayerAvatar_CreateWithParams(MapObjectManager *manager, u32 x, u32 z, u32 direction, s32 state, u32 gender, u32 param6, PlayerSaveData *playerSaveData);
PlayerAvatar *PlayerAvatar_CreateWithActiveMapObject(MapObjectManager *manager, PlayerSaveData *playerSaveData, u32 gender);
void sub_0205C46C(PlayerAvatar *avatar);
void PlayerAvatar_FreeToHeap(PlayerAvatar *avatar);
void PlayerAvatar_DeleteFromMap(PlayerAvatar *avatar);
LocalMapObject *MapObjectManager_GetFirstActiveObjectWithMovement1(MapObjectManager *manager);
u32 PlayerAvatar_GetFacingDirection(PlayerAvatar *avatar);
void PlayerAvatar_SetFacingDirection(PlayerAvatar *avatar, u32 direction);
u32 PlayerAvatar_GetNextFacingDirection(PlayerAvatar *avatar);
u32 PlayerAvatar_GetXCoord(PlayerAvatar *avatar);
u32 PlayerAvatar_GetZCoord(PlayerAvatar *avatar);
u32 PlayerAvatar_GetPreviousXCoord(PlayerAvatar *avatar);
u32 PlayerAvatar_GetPreviousZCoord(PlayerAvatar *avatar);
void PlayerAvatar_CopyPositionVector(PlayerAvatar *avatar, VecFx32 *vector);
VecFx32 *PlayerAvatar_GetPositionVector(PlayerAvatar *avatar);
void PlayerAvatar_SetUnk10(PlayerAvatar *avatar, u32 param1);
u32 PlayerAvatar_GetUnk10(PlayerAvatar *avatar);
void PlayerAvatar_SetUnk14(PlayerAvatar *avatar, u32 param1);
u32 PlayerAvatar_GetUnk14(PlayerAvatar *avatar);
void PlayerAvatar_SetMapObject(PlayerAvatar *avatar, LocalMapObject *mapObject);
LocalMapObject *PlayerAvatar_GetMapObject(PlayerAvatar *avatar);
void PlayerAvatar_SetState(PlayerAvatar *avatar, s32 state);
s32 PlayerAvatar_GetState(PlayerAvatar *avatar);
void PlayerAvatar_SetTransitionFlagsBits(PlayerAvatar *avatar, u32 flags);
void PlayerAvatar_SetTransitionFlags(PlayerAvatar *avatar, u32 flags);
u32 PlayerAvatar_GetTransitionFlags(PlayerAvatar *avatar);
u32 PlayerAvatar_GetGender(PlayerAvatar *avatar);
s32 PlayerAvatar_GetUnk24(PlayerAvatar *avatar);
void PlayerAvatar_SetUnk24(PlayerAvatar *avatar, s32 param1);
void PlayerAvatar_ClearUnk24ClearFlag2(PlayerAvatar *avatar);
s32 PlayerAvatar_Unk24AddWithCeiling(PlayerAvatar *avatar, s32 param1, s32 param2);
s32 PlayerAvatar_GetUnk28(PlayerAvatar *avatar);
s32 PlayerAvatar_GetUnk2C(PlayerAvatar *avatar);
void PlayerAvatar_SetUnk28Unk2C(PlayerAvatar *avatar, s32 unk28, s32 unk2C);
void PlayerAvatar_SetUnk34(PlayerAvatar *avatar, u32 param1);
u32 PlayerAvatar_GetUnk34(PlayerAvatar *avatar);
PlayerSaveData *PlayerAvatar_GetPlayerSaveData(PlayerAvatar *avatar);
void PlayerAvatar_SetUnk8(PlayerAvatar *avatar, u32 unkA);
u32 PlayerAvatar_GetUnk8(PlayerAvatar *avatar);
BOOL PlayerAvatar_GetUnkC(PlayerAvatar *avatar);
void PlayerAvatar_ToggleUnkC(PlayerAvatar *avatar);
void PlayerAvatar_ResetUnkC(PlayerAvatar *avatar);
void PlayerSaveData_Init(PlayerSaveData *playerSaveData);
BOOL PlayerSaveData_CheckRunningShoes(PlayerSaveData *playerSaveData);
void PlayerSaveData_SetRunningShoesFlag(PlayerSaveData *playerSaveData, BOOL flag);
s32 PlayerSaveData_GetState(PlayerSaveData *playerSaveData);
void sub_0205C810(PlayerAvatar *avatar, VecFx32 *position, u32 direction);
void PlayerAvatar_SetMapObjectYPosition(PlayerAvatar *avatar, fx32 yVal);
void PlayerAvatar_ToggleAutomaticHeightUpdating(PlayerAvatar *avatar, u8 flag);
void PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(PlayerAvatar *avatar, BOOL flag);
u32 PlayerAvatar_GetSpriteByStateAndGender(s32 state, u32 gender);
u32 PlayerAvatar_GetTransitionBits(s32 state);
PlayerAvatar *FieldSystem_GetPlayerAvatar(FieldSystem *fieldSystem);
void PlayerAvatar_SetFlag0(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag0(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag1(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag1(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag2(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag2(PlayerAvatar *avatar);
void PlayerAvatar_SetBikeStateLock(PlayerAvatar *avatar, BOOL lock);
BOOL PlayerAvatar_CheckBikeStateLocked(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag5(PlayerAvatar *avatar, BOOL set);
void PlayerAvatar_SetFlag6(PlayerAvatar *avatar);
void PlayerAvatar_ClearFlag6(PlayerAvatar *avatar);
BOOL PlayerAvatar_CheckFlag6(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag7(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag7(PlayerAvatar *avatar);
u16 PlayerAvatar_CheckRunningShoesLock(PlayerAvatar *avatar);
void PlayerAvatar_SetRunningShoesLock(PlayerAvatar *avatar, u16 lock);

#endif // POKEHEARTGOLD_PLAYER_AVATAR_H
