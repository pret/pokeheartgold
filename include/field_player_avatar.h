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
} FIELD_PLAYER_AVATAR_SUB;

typedef struct FIELD_PLAYER_AVATAR {
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
    LocalMapObject* mapObject;
    u32 unk34;
    FIELD_PLAYER_AVATAR_SUB* unk38;
    u32 unk3c;
} FIELD_PLAYER_AVATAR; //size: 0x40

int sub_0205C268(u32 unkA);
u8 sub_0205C278(void);
u8 sub_0205C298(SAVEDATA* savedata);
u8 sub_0205C2C0(u32 unkA);
u8 sub_0205C2E8(u32 unkA);
u8 sub_0205C310(u32 unkA);
u8 sub_0205C350(u32 unkA);
FIELD_PLAYER_AVATAR* sub_0205C390(MapObjectMan *man, int x, int y, int direction, int a4, int gender, int a6, struct FlypointsPlayerSub *a7);
FIELD_PLAYER_AVATAR* sub_0205C408(MapObjectMan* man, FIELD_PLAYER_AVATAR_SUB* avatar_sub, int gender);
void PlayerAvatar_FreeToHeap(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_DeleteFromMap(FIELD_PLAYER_AVATAR* avatar);
FIELD_PLAYER_AVATAR* sub_0205C4E0();
void sub_0205C500(FIELD_PLAYER_AVATAR* avatar, int state, u32 gender, FIELD_PLAYER_AVATAR_SUB* unkD);
void CreatePlayerAvatarMapObject(FIELD_PLAYER_AVATAR* avatar, MapObjectMan* man, u32 sprite, u32 direction, u32 x, u32 y);
LocalMapObject* sub_0205C600(MapObjectMan* man);
LocalMapObject* sub_0205C640(MapObjectMan* man);
int PlayerAvatar_GetFacingDirection(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_SetFacingDirection(FIELD_PLAYER_AVATAR* avatar, int direction);
u32 PlayerAvatar_GetNextFacing(FIELD_PLAYER_AVATAR* avatar);
int GetPlayerXCoord(FIELD_PLAYER_AVATAR* avatar);
int GetPlayerYCoord(FIELD_PLAYER_AVATAR* avatar);
int GetPlayerLastXCoord(FIELD_PLAYER_AVATAR* avatar);
int GetPlayerLastYCoord(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_GetPositionVec(FIELD_PLAYER_AVATAR* avatar, VecFx32* vec);
VecFx32* PlayerAvatar_GetPositionVecConst(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C6C8(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C6CC(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C6D0(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C6D4(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C6D8(FIELD_PLAYER_AVATAR* avatar, LocalMapObject* obj);
LocalMapObject* PlayerAvatar_GetMapObject(FIELD_PLAYER_AVATAR* avatar);
LocalMapObject* PlayerAvatar_GetMapObjectConst(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_SetState(FIELD_PLAYER_AVATAR* avatar, int state);
int PlayerAvatar_GetState(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_OrrTransitionFlags(FIELD_PLAYER_AVATAR* avatar, u32 flag);
void PlayerAvatar_SetTransitionFlags(FIELD_PLAYER_AVATAR* avatar, u32 flag);
u32 PlayerAvatar_GetTransitionFlags(FIELD_PLAYER_AVATAR* avatar);
void PlayerAvatar_SetGender(FIELD_PLAYER_AVATAR* avatar, u32 gender);
int PlayerAvatar_GetGender(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C728(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
void sub_0205C730(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C73C(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C744(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C748(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
void sub_0205C74C(FIELD_PLAYER_AVATAR* avatar);
int sub_0205C758(FIELD_PLAYER_AVATAR* avatar, int unkB, int unkC);
void sub_0205C768(FIELD_PLAYER_AVATAR* avatar, int unkA);
int sub_0205C76C(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C770(FIELD_PLAYER_AVATAR* avatar, int unkA);
int sub_0205C774(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C778(FIELD_PLAYER_AVATAR* avatar, int unkB, int unkC);
void sub_0205C78C(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C790(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C794(FIELD_PLAYER_AVATAR* avatar, FIELD_PLAYER_AVATAR_SUB* unkA);
FIELD_PLAYER_AVATAR_SUB* sub_0205C798(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C79C(FIELD_PLAYER_AVATAR* avatar, u32 unkA);
u32 sub_0205C7A0(FIELD_PLAYER_AVATAR* avatar);
u32 sub_0205C7A4(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C7A8(FIELD_PLAYER_AVATAR* avatar);
void sub_0205C7B4(FIELD_PLAYER_AVATAR* avatar);
void FlypointsPlayerSub_init(struct FlypointsPlayerSub* fpsub);
BOOL FlypointsPlayerSub_CheckRunningShoes(struct FlypointsPlayerSub* fpsub);
void FlypointsPlayerSub_SetRunningShoesFlag(struct FlypointsPlayerSub* fpsub, BOOL unkB);
int sub_0205C7EC(FIELD_PLAYER_AVATAR_SUB* avatar);
void sub_0205C7F8(FIELD_PLAYER_AVATAR_SUB* unkPtr, int state);
void sub_0205C800(FIELD_PLAYER_AVATAR* avatar, int state);
void sub_0205C810(FIELD_PLAYER_AVATAR* avatar, u32 unkA, u32 unkB);
void sub_0205C838(FIELD_PLAYER_AVATAR* avatar, int unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating(FIELD_PLAYER_AVATAR* avatar, u8 unkA);
void PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(FIELD_PLAYER_AVATAR* avatar, BOOL unkA);
u32 PlayerAvatar_GetSpriteByStateAndGender(u32 unkA, BOOL unkB);
u32 PlayerAvatar_GetTransitionBits(u32 unkA);
FIELD_PLAYER_AVATAR* FieldSys_GetPlayerAvatar(FieldSystem* fsys);
void sub_0205CA20(FIELD_PLAYER_AVATAR* avatar, BOOL unkA);
BOOL sub_0205CA38(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CA4C(FIELD_PLAYER_AVATAR* avatar, BOOL unkA);
BOOL sub_0205CA64(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CA78(FIELD_PLAYER_AVATAR* avatar, BOOL unkB);
BOOL sub_0205CA90(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CAA4(FIELD_PLAYER_AVATAR* avatar, u8 unkA);
BOOL sub_0205CABC(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CAD0(FIELD_PLAYER_AVATAR* avatar, BOOL unkA);
void sub_0205CAE8(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CAF4(FIELD_PLAYER_AVATAR* avatar);
BOOL sub_0205CB00(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CB14(FIELD_PLAYER_AVATAR* avatar, BOOL unkA);
u32 sub_0205CB2C(FIELD_PLAYER_AVATAR* avatar);
u16 sub_0205CB38(FIELD_PLAYER_AVATAR* avatar);
void sub_0205CB40(FIELD_PLAYER_AVATAR* avatar, u16 unkA);

#endif //POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
