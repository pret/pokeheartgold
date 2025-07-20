#ifndef POKEHEARTGOLD_OVERLAY_01_H
#define POKEHEARTGOLD_OVERLAY_01_H

#include "overlay_01_rock_smash_item.h"
#include "script.h"
#include "unk_0206793C.h"

// todo: split

struct ErrorContinueEnv {
    int state;
    Location location;
};

struct FishingRodWork;

// TODO: does this struct have more members?
struct UnkStruct_Ov01_021EF4C4 {
    u8 textFrameDelay;
    u8 unk1;
    u8 fontId;
};

struct UnkStruct_ov01_021EDC28;

typedef struct UnkStruct_field_021F4360 {
    // TODO: Fill this in
} UnkStruct_field_021F4360;

void ov01_021E636C(int a0);
void FieldSystem_DrawMapNameAnimation(FieldSystem *fieldSystem);
void ov01_021F35C4(FieldSystem *fieldSystem, int a1, int *a2);
u32 GetHoneySweetScentWorkSize(void);
BOOL Task_HoneyOrSweetScent(TaskManager *taskManager);
BOOL Task_OverworldFish(TaskManager *taskManager);
struct FishingRodWork *CreateFishingRodTaskEnv(FieldSystem *fieldSystem, HeapID heapId, int rod);
void ov01_021F4440(FieldSystem *fieldSystem);
void ov01_021F6A9C(FieldSystem *fieldSystem, int a1, void *a2);
int ov01_021F6B00(FieldSystem *fieldSystem);
int ov01_021F6AEC(FieldSystem *fieldSystem);
BOOL ov01_021F6B10(FieldSystem *fieldSystem);
UnkStruct_0206793C *ov01_0220329C(LocalMapObject *obj, int a1);
void ov01_02205790(FieldSystem *fieldSystem, u8 a1);
void ov01_02205784(LocalMapObject *object);
BOOL ov01_022057C4(FieldSystem *fieldSystem);
BOOL ov01_02205D68(FieldSystem *fieldSystem);
BOOL Field_PlayerCanSurfOnTile(PlayerAvatar *fieldPlayerAvatar, int standingTile, int facingTile);
BOOL MetatileBehavior_IsRockClimbInDirection(int facingTile, int facingDirection);
BOOL FieldSystem_FacingModelIsHeadbuttTree(FieldSystem *fieldSystem);
BOOL Task_UseSweetScentInField(TaskManager *taskManager);
BOOL ov01_021EF348(ScriptContext *ctx);
void ov01_021EF4C4(struct UnkStruct_Ov01_021EF4C4 *, ScriptContext *ctx);
void ov01_021EF4DC(ScriptContext *ctx, MsgData *msg_data, u16 msg_no, u8 can_ab_speed_up, struct UnkStruct_Ov01_021EF4C4 *);
void ov01_021F3D68(struct FieldSystemUnkSub68 *, u8, u16);
void ov01_021F3D70(struct FieldSystemUnkSub68 *, u8);
Window *ov01_021F3D80(struct FieldSystemUnkSub68 *);
u8 ov01_021F3D84(struct FieldSystemUnkSub68 *);
BOOL ov01_021F3D88(struct FieldSystemUnkSub68 *);
void ov01_021F3D98(FieldSystem *fieldSystem);
struct UnkStruct_ov01_021EDC28 *ov01_021EDF78(FieldSystem *fieldSystem, u8 x, u8 y, u8 initCursorPos, u8 cancellable, u16 *ret_p, MessageFormat *msgFmt, Window *window, MsgData *msgData);
struct UnkStruct_ov01_021EDC28 **ov01_021F6B20(FieldSystem *fieldSystem);
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
void ov01_021F62E8(VecFx32 *vec, FieldSystemUnkSub2C *a1);
void ov01_021F9408(LocalMapObject *object, u32 dir);
u8 ov01_022055DC(LocalMapObject *object);
void ov01_02205604(LocalMapObject *object, int *p_x, int *p_y);
void ov01_021FF0E4(LocalMapObject *object, int a1, int x, int y, int a4);
void ov01_021FF964(LocalMapObject *object, int a1, int x, int y, int a4);
void ov01_021F729C(FieldSystem *fieldSystem);
void CallFieldTask_RockClimb(TaskManager *taskManager, int playerDirection, int partySlot);
void CallFieldTask_Surf(TaskManager *taskManager, int playerDirection, int partySlot);
void CallFieldTask_Waterfall(TaskManager *taskManager, int playerDirection, int partySlot);
void CallFieldTask_Whirlpool(TaskManager *taskManager, int playerDirection, int partySlot);
void FieldWeatherUpdate_UsedFlash(void *unkWeatherRelated, int weatherType);
u32 ov01_021F149C(void *, int);
void ov01_021F14A8(void *, int, void *);
void ov01_021F1448(void *);
int MapNumToFloorNo(u32 mapId);
void PrintCurFloorInNewWindow(FieldSystem *fieldSystem, u8 x, u8 y, u16 *p_ret, MessageFormat *msgFmt, u16 floor);
int Field_SaveGameNormal(FieldSystem *fieldSystem);
void ov01_021E9AE8(FieldSystem *fieldSystem, int a1, int a2, u8 a3);
void ov01_021E9C00(FieldSystem *fieldSystem, u8 a1);
void ov01_021E9C20(FieldSystem *fieldSystem, u8 a1);
void ov01_021E9BB8(FieldSystem *fieldSystem, u8 a1);
void ov01_021E9BDC(FieldSystem *fieldSystem, u8 a1);
SysTask *Field_PlayerMovementSavingSet(FieldSystem *fieldSystem);
void Field_PlayerMovementSavingClear(SysTask *task);

struct SaveStatsPrinter;

struct SaveStatsPrinter *Field_SaveStatsPrinter_New(FieldSystem *fieldSystem, HeapID x, int y);
void Field_SaveStatsPrinter_Print(struct SaveStatsPrinter *printer);
void Field_SaveStatsPrinter_RemoveFromScreen(struct SaveStatsPrinter *printer);
void Field_SaveStatsPrinter_Delete(struct SaveStatsPrinter *printer);
void ov01_02203AB4(FieldSystem *fieldSystem, LocalMapObject *partnerPokeObj, int a2);
void ov01_02205AEC(FieldSystem *fieldSystem);
void ov01_02205720(LocalMapObject *playerObj, LocalMapObject *tsurePokeObj, int a2, int a3);
void ov01_021EACBC(void *fieldSystemUnk28, u8 a1);
void ov01_021F6ABC(FieldSystem *fieldSystem, int a1, int a2, void *a3);

typedef BOOL (*UnkCallback_021F6B34)(struct UnkStruct_ov01_021EDC28 *menu, int idx);

void ov01_021F6B34(FieldSystem *fieldSystem, UnkCallback_021F6B34 cb, struct UnkStruct_ov01_021EDC28 *menu);
void ov01_021EEF9C(struct UnkStruct_ov01_021EDC28 *menu, int idx);

struct UnkStruct_020FACDC {
    int filler_00[12 / sizeof(int)];
};

void ov01_021F3C0C(void *fieldSystem_unk9C, int a1, const VecFx32 *unk_FACDC, int a3, void *fieldSystem_unk54);
BOOL ov01_022060B8(FieldSystem *fieldSystem, u8 a1, u8 a2);

struct BankTransactionWorkSub {
    u32 max;
    int selected;
};

struct BankTransactionWork {
    struct BankTransactionWorkSub *sub;
    int mode;
};

Window *ov01_021EEF68(FieldSystem *fieldSystem, u16 a1);
void ov01_021EEF88(Window *window);
BOOL ov01_02206268(FieldSystem *fieldSystem);

void ov01_021F42F8(UnkStruct_field_021F4360 *a0);
void ov01_021F434C(UnkStruct_field_021F4360 *a0);
UnkStruct_field_021F4360 *ov01_021F4360(FieldSystem *fieldSystem, HeapID heapId, u8 a2);
void ov01_021F43D0(UnkStruct_field_021F4360 *a0);

#endif // POKEHEARTGOLD_OVERLAY_01_H
