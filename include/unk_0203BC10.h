#ifndef POKEHEARTGOLD_UNK_0203BC10_H
#define POKEHEARTGOLD_UNK_0203BC10_H

#include "task.h"

typedef enum StartMenuIcon {
    START_MENU_ICON_POKEDEX,
    START_MENU_ICOM_POKEMON,
    START_MENU_ICON_BAG,
    START_MENU_ICON_POKEGEAR,
    START_MENU_ICON_TRAINER_CARD,
    START_MENU_ICON_SAVE,
    START_MENU_ICON_OPTIONS,
    START_MENU_ICON_RUNNING_SHOES,
} StartMenuIcon;

struct BagViewAppWork {
    int unk_0000;
    u8 filler_0004[0x22];
    u16 state; // 26
    u8 filler_0028[0x32C];
    TaskFunc atexit_TaskFunc; // 354
    u8 filler_0358[0x18];
    u32 unk_0370[4];
    void *atexit_TaskEnv; // 380
    void *unk_0384;
};

struct UnkStruct_0203D818 {
    u16 itemId;
    u8 unk2;
    u8 unk3;
};

struct FlyTaskStruct {
    u32 partySlot;
};

BOOL sub_0203BC10(FieldSystem *fieldSystem);
void sub_0203BC28(FieldSystem *fieldSystem);
void sub_0203BCDC(FieldSystem *fieldSystem);
void sub_0203BD20(FieldSystem *fieldSystem);
void sub_0203BD64(FieldSystem *fieldSystem);
BOOL sub_0203C3CC(FieldSystem *fieldSystem, int a1);
void sub_0203C8F0(struct BagViewAppWork *env, TaskFunc func);
BOOL sub_0203CA9C(TaskManager *taskManager);
BOOL sub_0203D718(TaskManager *taskManager);
struct UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 a1, u8 a2);
BOOL sub_0203D830(TaskManager *taskManager);
BOOL sub_0203D9B4(TaskManager *taskManager);
BOOL Task_UseFlyInField(TaskManager *taskManager);

#endif //POKEHEARTGOLD_UNK_0203BC10_H
