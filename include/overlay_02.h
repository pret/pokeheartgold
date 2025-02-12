#ifndef POKEHEARTGOLD_OVERLAY_02_H
#define POKEHEARTGOLD_OVERLAY_02_H

#include "battle/battle_setup.h"
#include "field/headbutt.h"

#include "heap.h"
#include "script.h"
#include "start_menu.h"
#include "sys_task.h"

typedef struct FieldMoveTaskEnvironment FieldMoveTaskEnvironment;

typedef struct SafariDecorationArgs {
    SaveData *saveData;
    BOOL *unk04; // points to fieldSystem->unk_10C
    u8 unk08;
    u8 deltaX;
    u8 unk0A;
    u8 deltaY;
    u8 unk0C;
    u8 unk0D;
    u8 unk0E; // not set
    u8 unk0F;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;
    u16 unk1C; // known from what's decompiled
    u8 *unk20; // points to fieldSystem->unk_111
} SafariDecorationArgs;

SysTask *ov02_0224B418(FieldSystem *fieldSystem, int gender);
BOOL ov02_0224B43C(SysTask *unk);
void ov02_0224B448(SysTask *unk);
struct FieldMoveTaskEnvironment *CreateFieldEscapeRopeTaskEnv(FieldSystem *fieldSystem, HeapID heapId);
struct FieldMoveTaskEnvironment *FieldMoveTask_CreateTeleportEnvironment(FieldSystem *fieldSystem, Pokemon *mon, u8 slotno, HeapID heapId);
struct FieldMoveTaskEnvironment *FieldMoveTask_CreateDigEnvironment(FieldSystem *fieldSystem, Pokemon *mon, u8 slotno, HeapID heapId);
BOOL Task_FieldEscapeRope(TaskManager *taskManager);
BOOL Task_FieldTeleport(TaskManager *taskManager);
BOOL Task_FieldDig(TaskManager *taskManager);
BOOL ov02_0224C1F8(TaskManager *taskManager);
void *ov02_0224C1D8(FieldSystem *fieldSystem, int a1, int a2);

// TODO: define the struct, figure out what a1 is
void *ov02_02249458(FieldSystem *fieldSystem, int a1, Pokemon *mon, int gender);
BOOL ov02_0224953C(void *work);
void ov02_02249548(void *work);

void ov02_02245B80(TaskManager *taskManager);
void ov02_022460AC(TaskManager *taskMan, u8 a1);
void ShowLegendaryWing(TaskManager *taskMan, u8 a1);
void ov02_022462E8(TaskManager *taskMan);
void PokecenterAnimCreate(FieldSystem *fieldSystem, u8 kind);
void ov02_0224BDE8(FieldSystem *fieldSystem, u8 direction, u8 length);
int ov02_0224CD38(PlayerProfile *profile, u16 a, u16 b, u16 c, u16 d, HeapID heapId);
int ov02_0224CD74(PlayerProfile *profile, u16 a, u16 b, u16 c, u16 d, HeapID heapId);
void ov02_0224BF58(FieldSystem *fieldSystem, u8 a1);
void ov02_0224BFC0(FieldSystem *fieldSystem, u8 a1);
void ov02_0224BFCC(FieldSystem *fieldSystem, u8 a1);
void ov02_0224CDB0(FieldSystem *fieldSystem, u8 a1);
void ov02_0224E074(FieldSystem *fieldSystem, u16 *p_ret, int a2, HeapID heapId);
void ov02_0224E0BC(LocalMapObject *obj1, LocalMapObject *obj2, TaskManager *taskManager);
void FieldSystem_FollowMonInteract(FieldSystem *fieldSystem);
BOOL ov02_02250780(FieldSystem *fieldSystem, u8 a1);
void ov02_022507B4(FieldSystem *fieldSystem, u8 a1);
void ov02_022508B4(FieldSystem *fieldSystem);
void ov02_022523B4(TaskManager *taskManager);

BOOL ov02_022470A0(FieldSystem *fieldSystem, BattleSetup **setupPtr);
void ov02_BattleExit_HandleRoamerAction(FieldSystem *fieldSystem, BattleSetup *setup);
BOOL FieldSystem_ChooseHeadbuttEncounter(FieldSystem *fieldSystem, BattleSetup **setup, const HeadbuttSlot *headbuttSlots);
void ov02_02247F30(FieldSystem *fieldSystem, u16 mon, u8 level, BOOL shiny, BattleSetup *setup);
void ov02_02246714(TaskManager *man, u32 a1, u32 a2, u32 a3, u32 a4);
void ov02_022469B4(TaskManager *man, LocalMapObject *obj1, LocalMapObject *obj2);
void OpenAlphHiddenRoom(TaskManager *man, u32 a1);

SafariDecorationArgs *SafariDecoration_CreateArgs(FieldSystem *fieldSystem, HeapID heapId);

#endif // POKEHEARTGOLD_OVERLAY_02_H
