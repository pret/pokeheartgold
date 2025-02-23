#ifndef POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
#define POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H

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
    u16 hasRunningShoes;
    u16 runningShoesLock;
    u32 unk4;
} PlayerSaveData;

struct PlayerAvatar {
    PlayerAvatarFlags flags;
    u32 transFlag;
    u32 unk8;
    u32 unkc;
    u32 unk10;
    u32 unk14;
    int state;
    u32 gender;
    u8 unk20;
    u32 unk24;
    int unk28;
    int unk2c;
    LocalMapObject *mapObject;
    u32 unk34;
    PlayerSaveData *playerSaveData;
    u32 unk3c;
}; // size: 0x40

int sub_0205C268(u32 unkA);
u8 sub_0205C278(void);
u8 sub_0205C298(SaveData *saveData);
u8 sub_0205C2C0(u32 unkA);
u8 sub_0205C2E8(u32 unkA);
u8 sub_0205C310(u32 unkA);
u8 sub_0205C350(u32 unkA);
PlayerAvatar *sub_0205C390(MapObjectManager *man, int x, int y, int direction, int a4, int gender, int a6, struct PlayerSaveData *playerSaveData);
PlayerAvatar *sub_0205C408(MapObjectManager *man, PlayerSaveData *playerSaveData, int gender);
void sub_0205C46C(PlayerAvatar *avatar);
void PlayerAvatar_FreeToHeap(PlayerAvatar *avatar);
void PlayerAvatar_DeleteFromMap(PlayerAvatar *avatar);
PlayerAvatar *sub_0205C4E0();
void sub_0205C500(PlayerAvatar *avatar, int state, u32 gender, PlayerSaveData *playerSaveData);
void CreatePlayerAvatarMapObject(PlayerAvatar *avatar, MapObjectManager *man, u32 sprite, u32 direction, u32 x, u32 y);
LocalMapObject *sub_0205C600(MapObjectManager *man);
LocalMapObject *sub_0205C640(MapObjectManager *man);
int PlayerAvatar_GetFacingDirection(PlayerAvatar *avatar);
void PlayerAvatar_SetFacingDirection(PlayerAvatar *avatar, int direction);
u32 PlayerAvatar_GetNextFacing(PlayerAvatar *avatar);
int GetPlayerXCoord(PlayerAvatar *avatar);
int GetPlayerZCoord(PlayerAvatar *avatar);
int GetPlayerLastXCoord(PlayerAvatar *avatar);
int GetPlayerLastZCoord(PlayerAvatar *avatar);
void PlayerAvatar_GetPositionVec(PlayerAvatar *avatar, VecFx32 *vec);
VecFx32 *PlayerAvatar_GetPositionVecConst(PlayerAvatar *avatar);
void sub_0205C6C8(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C6CC(PlayerAvatar *avatar);
void sub_0205C6D0(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C6D4(PlayerAvatar *avatar);
void PlayerAvatar_SetMapObject(PlayerAvatar *avatar, LocalMapObject *obj);
LocalMapObject *PlayerAvatar_GetMapObject(PlayerAvatar *avatar);
LocalMapObject *PlayerAvatar_GetMapObjectConst(PlayerAvatar *avatar);
void PlayerAvatar_SetState(PlayerAvatar *avatar, int state);
int PlayerAvatar_GetState(PlayerAvatar *avatar);
void PlayerAvatar_OrrTransitionFlags(PlayerAvatar *avatar, u32 flag);
void PlayerAvatar_SetTransitionFlags(PlayerAvatar *avatar, u32 flag);
u32 PlayerAvatar_GetTransitionFlags(PlayerAvatar *avatar);
void PlayerAvatar_SetGender(PlayerAvatar *avatar, u32 gender);
int PlayerAvatar_GetGender(PlayerAvatar *avatar);
void PlayerAvatar_SetFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags bits);
void PlayerAvatar_ClearFlagsBits(PlayerAvatar *avatar, PlayerAvatarFlags bits);
PlayerAvatarFlags PlayerAvatar_GetFlagsBitsMask(PlayerAvatar *avatar, PlayerAvatarFlags bits);
u32 sub_0205C744(PlayerAvatar *avatar);
void sub_0205C748(PlayerAvatar *avatar, u32 unkA);
void sub_0205C74C(PlayerAvatar *avatar);
int sub_0205C758(PlayerAvatar *avatar, int unkB, int unkC);
void sub_0205C768(PlayerAvatar *avatar, int unkA);
int sub_0205C76C(PlayerAvatar *avatar);
void sub_0205C770(PlayerAvatar *avatar, int unkA);
int sub_0205C774(PlayerAvatar *avatar);
void sub_0205C778(PlayerAvatar *avatar, int unkB, int unkC);
void sub_0205C78C(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C790(PlayerAvatar *avatar);
void PlayerAvatar_SetPlayerSaveData(PlayerAvatar *avatar, PlayerSaveData *playerSaveData);
PlayerSaveData *PlayerAvatar_GetPlayerSaveData(PlayerAvatar *avatar);
void sub_0205C79C(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C7A0(PlayerAvatar *avatar);
u32 sub_0205C7A4(PlayerAvatar *avatar);
void sub_0205C7A8(PlayerAvatar *avatar);
void sub_0205C7B4(PlayerAvatar *avatar);
void PlayerSaveData_Init(struct PlayerSaveData *playerSaveData);
BOOL PlayerSaveData_CheckRunningShoes(struct PlayerSaveData *playerSaveData);
void PlayerSaveData_SetRunningShoesFlag(struct PlayerSaveData *playerSaveData, BOOL flag);
int sub_0205C7EC(PlayerSaveData *playerSaveData);
void sub_0205C7F8(PlayerSaveData *playerSaveData, int state);
void sub_0205C800(PlayerAvatar *avatar, int state);
void sub_0205C810(PlayerAvatar *avatar, VecFx32 *pos, u32 dir);
void sub_0205C838(PlayerAvatar *avatar, int unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating(PlayerAvatar *avatar, u8 unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(PlayerAvatar *avatar, BOOL unkA);
u32 PlayerAvatar_GetSpriteByStateAndGender(u32 unkA, BOOL unkB);
u32 PlayerAvatar_GetTransitionBits(u32 unkA);
PlayerAvatar *FieldSystem_GetPlayerAvatar(FieldSystem *fieldSystem);
void PlayerAvatar_SetFlag0(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag0(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag1(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag1(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag2(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag2(PlayerAvatar *avatar);
void PlayerAvatar_SetBikeStateLock(PlayerAvatar *avatar, BOOL lock);
BOOL PlayerAvatar_IsBikeStateLocked(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag5(PlayerAvatar *avatar, BOOL set);
void PlayerAvatar_SetFlag6(PlayerAvatar *avatar);
void PlayerAvatar_ClearFlag6(PlayerAvatar *avatar);
BOOL PlayerAvatar_CheckFlag6(PlayerAvatar *avatar);
void PlayerAvatar_SetFlag7(PlayerAvatar *avatar, BOOL set);
BOOL PlayerAvatar_CheckFlag7(PlayerAvatar *avatar);
u16 PlayerAvatar_CheckRunningShoesLock(PlayerAvatar *avatar);
void PlayerAvatar_SetRunningShoesLock(PlayerAvatar *avatar, u16 lock);

#endif // POKEHEARTGOLD_PlayerAvatar_H
