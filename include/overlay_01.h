#ifndef POKEHEARTGOLD_OVERLAY_01_H
#define POKEHEARTGOLD_OVERLAY_01_H

#include "script.h"
#include "unk_0206793C.h"

//todo: split

struct ErrorContinueEnv {
    int unk0;
    Location location;
};

struct FishingRodWork;

// TODO: does this struct have more members?
struct UnkStruct_Ov01_021EF4C4 {
    u8 textFrameDelay;
    u8 unk1;
    u8 unk2;
};

void ov01_021E636C(int a0);
void ov01_021EFAF8(FieldSystem *fsys);
void ov01_PlayerAvatar_OrrTransitionFlags(FIELD_PLAYER_AVATAR *avatar, int a1);
void ov01_PlayerAvatar_ApplyTransitionFlags(FIELD_PLAYER_AVATAR *avatar);
void ov01_021F35C4(FieldSystem *fsys, int a1, int *a2);
u32 GetHoneySweetScentWorkSize(void);
BOOL Task_HoneyOrSweetScent(TaskManager *taskManager);
BOOL Task_OverworldFish(TaskManager *taskManager);
struct FishingRodWork *CreateFishingRodTaskEnv(FieldSystem *fsys, HeapID heapId, int rod);
void ov01_021F4440(FieldSystem *fsys);
void ov01_021F6A9C(FieldSystem *fsys, HeapID heapId, int a2);
int ov01_021F6B00(FieldSystem *fsys);
BOOL ov01_021F6B10(FieldSystem *fsys);
UnkStruct_0206793C *ov01_0220329C(LocalMapObject *obj, int a1);
void ov01_02205790(FieldSystem *fsys, u8 a1);
BOOL ov01_022057C4(FieldSystem *fsys);
void ov01_02205D68(FieldSystem *fsys);
BOOL Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors(FIELD_PLAYER_AVATAR *fieldPlayerAvatar, int standingTile, int facingTile);
BOOL MetatileBehavior_IsRockClimbInDirection(int facingTile, int facingDirection);
BOOL FieldSys_FacingModelIsHeadbuttTree(FieldSystem *fsys);
BOOL Task_UseSweetScentInField(TaskManager *taskManager);

#endif //POKEHEARTGOLD_OVERLAY_01_H
