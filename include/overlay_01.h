#ifndef POKEHEARTGOLD_OVERLAY_01_H
#define POKEHEARTGOLD_OVERLAY_01_H

#include "overlay_01_rock_smash_item.h"
#include "script.h"
#include "unk_0206793C.h"

//todo: split

struct ErrorContinueEnv {
    int state;
    Location location;
};

struct FishingRodWork;

// TODO: does this struct have more members?
struct UnkStruct_Ov01_021EF4C4 {
    u8 textFrameDelay;
    u8 unk1;
    u8 unk2;
};

struct UnkStruct_ov01_021EDC28;

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
void ov01_021F6A9C(FieldSystem *fsys, int a1, void *a2);
int ov01_021F6B00(FieldSystem *fsys);
int ov01_021F6AEC(FieldSystem *fsys);
BOOL ov01_021F6B10(FieldSystem *fsys);
UnkStruct_0206793C *ov01_0220329C(LocalMapObject *obj, int a1);
void ov01_02205790(FieldSystem *fsys, u8 a1);
void ov01_02205784(LocalMapObject *object);
BOOL ov01_022057C4(FieldSystem *fsys);
BOOL ov01_02205D68(FieldSystem *fsys);
BOOL Field_PlayerCanStartSurfingByStandingAndFacingTileBehaviors(FIELD_PLAYER_AVATAR *fieldPlayerAvatar, int standingTile, int facingTile);
BOOL MetatileBehavior_IsRockClimbInDirection(int facingTile, int facingDirection);
BOOL FieldSys_FacingModelIsHeadbuttTree(FieldSystem *fsys);
BOOL Task_UseSweetScentInField(TaskManager *taskManager);
BOOL ov01_021EF348(SCRIPTCONTEXT* ctx);
void ov01_021EF4C4(struct UnkStruct_Ov01_021EF4C4*, SCRIPTCONTEXT* ctx);
void ov01_021EF4DC(SCRIPTCONTEXT* ctx, MSGDATA* msg_data, u8 msg_no, BOOL can_ab_speed_up, struct UnkStruct_Ov01_021EF4C4*);
void ov01_021F3D68(struct FieldSystemUnkSub68*, u8, u16);
void ov01_021F3D70(struct FieldSystemUnkSub68*, u8);
WINDOW* ov01_021F3D80(struct FieldSystemUnkSub68*);
u8 ov01_021F3D84(struct FieldSystemUnkSub68*);
BOOL ov01_021F3D88(struct FieldSystemUnkSub68*);
void ov01_021F3D98(FieldSystem* fsys);
struct UnkStruct_ov01_021EDC28 *ov01_021EDF78(FieldSystem *fsys, u8 x, u8 y, u8 initCursorPos, u8 cancellable, u16 *ret_p, MSGFMT *msgFmt, WINDOW *window, MSGDATA *msgData);
struct UnkStruct_ov01_021EDC28 **ov01_021F6B20(FieldSystem *fsys);
void ov01_021EDC7C(struct UnkStruct_ov01_021EDC28 *menu, u32 msgId, u32 value);
void ov01_021EDC84(struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EDF00(struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EDF38(struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EE014(struct UnkStruct_ov01_021EDC28 *menu, u16 a1);
void ov01_021EE0EC(struct UnkStruct_ov01_021EDC28 *menu, u16 *a1, u16 *a2);
void ov01_021EDFA4(struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EE974(struct UnkStruct_ov01_021EDC28 *menu, u8 a1);
void ov01_021EF018(struct UnkStruct_ov01_021EDC28 *menu, u8 a1);
void ov01_021EF034(struct UnkStruct_ov01_021EDC28 *menu, u8 a1);
void MoveTutorMenu_SetListItem(struct UnkStruct_ov01_021EDC28 *menu, int a1, int a2, int a3);
void ov01_021F7704(LocalMapObject *object);
void ov01_021F62E8(VecFx32 *vec, FsysUnkSub2C *a1);
void ov01_021F9408(LocalMapObject *object, u32 dir);
BOOL ov01_022055DC(LocalMapObject *object);
void ov01_02205604(LocalMapObject *object, int *p_x, int *p_y);
void ov01_021FF0E4(LocalMapObject *object, int a1, int x, int y, int a4);
void ov01_021FF964(LocalMapObject *object, int a1, int x, int y, int a4);
void ov01_021F729C(FieldSystem *fsys);
void ScriptCallTask_RockClimb(TaskManager *taskManager, int playerDirection, int partySlot);
void ScriptCallTask_Surf(TaskManager *taskManager, int playerDirection, int partySlot);
void ScriptCallTask_Waterfall(TaskManager *taskManager, int playerDirection, int partySlot);
void ScriptCallTask_Whirlpool(TaskManager *taskManager, int playerDirection, int partySlot);
void FieldWeatherUpdate_UsedFlash(void *unkWeatherRelated, int weatherType);
u32 ov01_021F149C(void *, int);
void ov01_021F14A8(void *, int, void *);
void ov01_021F1448(void *);
int MapNumToFloorNo(u32 mapId);
void PrintCurFloorInNewWindow(FieldSystem *fsys, u8 x, u8 y, u16 *p_ret, MSGFMT *msgFmt, u16 floor);
int Field_SaveGameNormal(FieldSystem *fsys);
void ov01_021E9AE8(FieldSystem *fsys, int a1, int a2, u8 a3);
void ov01_021E9C00(FieldSystem *fsys, u8 a1);
void ov01_021E9C20(FieldSystem *fsys, u8 a1);
void ov01_021E9BB8(FieldSystem *fsys, u8 a1);
void ov01_021E9BDC(FieldSystem *fsys, u8 a1);
int Field_PlayerMovementSavingSet(FieldSystem *fsys);
void Field_PlayerMovementSavingClear(int state);

struct SaveStatsPrinter;

struct SaveStatsPrinter *Field_CreateSaveStatsPrinter(FieldSystem *fsys, HeapID x, int y);
void SaveStatsPrinter_Print(struct SaveStatsPrinter *printer);
void SaveStatsPrinter_RemoveFromScreen(struct SaveStatsPrinter *printer);
void SaveStatsPrinter_Delete(struct SaveStatsPrinter *printer);
void ov01_02203AB4(FieldSystem *fsys, LocalMapObject *partnerPokeObj, int a2);
void ov01_02205AEC(FieldSystem *fsys);
void ov01_02205720(LocalMapObject *playerObj, LocalMapObject *tsurePokeObj, int a2, int a3);
void ov01_021EACBC(void *fsysUnk28, u8 a1);
void ov01_021F6ABC(FieldSystem *fsys, int a1, int a2, void *a3);

typedef BOOL (*UnkCallback_021F6B34)(struct UnkStruct_ov01_021EDC28 *menu, int idx);

void ov01_021F6B34(FieldSystem *fsys, UnkCallback_021F6B34 cb, struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EEF9C(struct UnkStruct_ov01_021EDC28 *menu, int idx);

struct UnkStruct_020FACDC {
    int filler_00[12/sizeof(int)];
};

void ov01_021F3C0C(void *fsys_unk9C, int a1, const struct UnkStruct_020FACDC *unk_FACDC, int a3, void *fsys_unk54);
BOOL ov01_022060B8(FieldSystem *fsys, u8 a1, u8 a2);

struct BankTransactionWorkSub {
    u32 max;
    int selected;
};

struct BankTransactionWork {
    struct BankTransactionWorkSub *sub;
    int mode;
};

void ov01_02204ED8(FieldSystem *fsys, u16 *a1);
WINDOW *ov01_021EEF68(FieldSystem *fsys, u16 a1);
void ov01_021EEF88(WINDOW *window);
BOOL ov01_02206268(FieldSystem *fsys);

#endif //POKEHEARTGOLD_OVERLAY_01_H
