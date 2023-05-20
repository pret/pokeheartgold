#ifndef POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
#define POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H

#include "save.h"
#include "global.h"

typedef struct MapObjectMan MapObjectMan;
typedef struct LocalMapObject LocalMapObject;
typedef struct FieldSystem FieldSystem;

typedef struct FlypointsPlayerSub {
    u16 hasRunningShoes;
    u16 unk2;
    u32 unk4;
} PlayerAvatar_SUB;

typedef struct PlayerAvatar {
    u32 unk0;
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
    PlayerAvatar_SUB *unk38;
    u32 unk3c;
} PlayerAvatar; //size: 0x40

int sub_0205C268(u32 unkA);
u8 sub_0205C278(void);
u8 sub_0205C298(SAVEDATA *savedata);
u8 sub_0205C2C0(u32 unkA);
u8 sub_0205C2E8(u32 unkA);
u8 sub_0205C310(u32 unkA);
u8 sub_0205C350(u32 unkA);
PlayerAvatar *sub_0205C390(MapObjectMan *man, int x, int y, int direction, int a4, int gender, int a6, struct FlypointsPlayerSub *a7);
PlayerAvatar *sub_0205C408(MapObjectMan *man, PlayerAvatar_SUB *avatar_sub, int gender);
void PlayerAvatar_FreeToHeap(PlayerAvatar *avatar);
void PlayerAvatar_DeleteFromMap(PlayerAvatar *avatar);
PlayerAvatar *sub_0205C4E0();
void sub_0205C500(PlayerAvatar *avatar, int state, u32 gender, PlayerAvatar_SUB *unkD);
void CreatePlayerAvatarMapObject(PlayerAvatar *avatar, MapObjectMan *man, u32 sprite, u32 direction, u32 x, u32 y);
LocalMapObject *sub_0205C600(MapObjectMan *man);
LocalMapObject *sub_0205C640(MapObjectMan *man);
int PlayerAvatar_GetFacingDirection(PlayerAvatar *avatar);
void PlayerAvatar_SetFacingDirection(PlayerAvatar *avatar, int direction);
u32 PlayerAvatar_GetNextFacing(PlayerAvatar *avatar);
int GetPlayerXCoord(PlayerAvatar *avatar);
int GetPlayerYCoord(PlayerAvatar *avatar);
int GetPlayerLastXCoord(PlayerAvatar *avatar);
int GetPlayerLastYCoord(PlayerAvatar *avatar);
void PlayerAvatar_GetPositionVec(PlayerAvatar *avatar, VecFx32 *vec);
VecFx32 *PlayerAvatar_GetPositionVecConst(PlayerAvatar *avatar);
void sub_0205C6C8(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C6CC(PlayerAvatar *avatar);
void sub_0205C6D0(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C6D4(PlayerAvatar *avatar);
void sub_0205C6D8(PlayerAvatar *avatar, LocalMapObject *obj);
LocalMapObject *PlayerAvatar_GetMapObject(PlayerAvatar *avatar);
LocalMapObject *PlayerAvatar_GetMapObjectConst(PlayerAvatar *avatar);
void PlayerAvatar_SetState(PlayerAvatar *avatar, int state);
int PlayerAvatar_GetState(PlayerAvatar *avatar);
void PlayerAvatar_OrrTransitionFlags(PlayerAvatar *avatar, u32 flag);
void PlayerAvatar_SetTransitionFlags(PlayerAvatar *avatar, u32 flag);
u32 PlayerAvatar_GetTransitionFlags(PlayerAvatar *avatar);
void PlayerAvatar_SetGender(PlayerAvatar *avatar, u32 gender);
int PlayerAvatar_GetGender(PlayerAvatar *avatar);
void sub_0205C728(PlayerAvatar *avatar, u32 unkA);
void sub_0205C730(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C73C(PlayerAvatar *avatar, u32 unkA);
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
void sub_0205C794(PlayerAvatar *avatar, PlayerAvatar_SUB *unkA);
PlayerAvatar_SUB *sub_0205C798(PlayerAvatar *avatar);
void sub_0205C79C(PlayerAvatar *avatar, u32 unkA);
u32 sub_0205C7A0(PlayerAvatar *avatar);
u32 sub_0205C7A4(PlayerAvatar *avatar);
void sub_0205C7A8(PlayerAvatar *avatar);
void sub_0205C7B4(PlayerAvatar *avatar);
void FlypointsPlayerSub_init(struct FlypointsPlayerSub *fpsub);
BOOL FlypointsPlayerSub_CheckRunningShoes(struct FlypointsPlayerSub *fpsub);
void FlypointsPlayerSub_SetRunningShoesFlag(struct FlypointsPlayerSub *fpsub, BOOL unkB);
int sub_0205C7EC(PlayerAvatar_SUB *avatar);
void sub_0205C7F8(PlayerAvatar_SUB *unkPtr, int state);
void sub_0205C800(PlayerAvatar *avatar, int state);
void sub_0205C810(PlayerAvatar *avatar, u32 unkA, u32 unkB);
void sub_0205C838(PlayerAvatar *avatar, int unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating(PlayerAvatar *avatar, u8 unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(PlayerAvatar *avatar, BOOL unkA);
u32 PlayerAvatar_GetSpriteByStateAndGender(u32 unkA, BOOL unkB);
u32 PlayerAvatar_GetTransitionBits(u32 unkA);
PlayerAvatar *FieldSys_GetPlayerAvatar(FieldSystem *fsys);
void sub_0205CA20(PlayerAvatar *avatar, BOOL unkA);
BOOL sub_0205CA38(PlayerAvatar *avatar);
void sub_0205CA4C(PlayerAvatar *avatar, BOOL unkA);
BOOL sub_0205CA64(PlayerAvatar *avatar);
void sub_0205CA78(PlayerAvatar *avatar, BOOL unkB);
BOOL sub_0205CA90(PlayerAvatar *avatar);
void sub_0205CAA4(PlayerAvatar *avatar, u8 unkA);
BOOL sub_0205CABC(PlayerAvatar *avatar);
void sub_0205CAD0(PlayerAvatar *avatar, BOOL unkA);
void sub_0205CAE8(PlayerAvatar *avatar);
void sub_0205CAF4(PlayerAvatar *avatar);
BOOL sub_0205CB00(PlayerAvatar *avatar);
void sub_0205CB14(PlayerAvatar *avatar, BOOL unkA);
u32 sub_0205CB2C(PlayerAvatar *avatar);
u16 sub_0205CB38(PlayerAvatar *avatar);
void sub_0205CB40(PlayerAvatar *avatar, u16 unkA);

#endif //POKEHEARTGOLD_PlayerAvatar_H
