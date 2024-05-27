#ifndef POKEHEARTGOLD_UNK_0203BC10_H
#define POKEHEARTGOLD_UNK_0203BC10_H

#include "field_use_item.h"
#include "party_menu.h"
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

typedef struct StartMenuTaskData {
    int unk_000;
    u8 filler_004[0x1C];
    BOOL unk_020;
    u16 unk_024;
    u16 state; // 26
    int unk_028;
    u32 unk_02C;
    u8 unk_030[10];
    u8 unk_03A[10];
    u8 filler_044[0x190];
    SpriteList *unk_1D4;
    GF_G2dRenderer unk_1D8;
    GF_2DGfxResMan *unk_300[4];
    GF_2DGfxResObj *unk_310[4];
    SpriteResourcesHeader unk_320;
    Sprite *unk_344;
    u8 filler_348[0x4];
    u32 unk_34C;
    BOOL unk_350;
    TaskFunc atexit_TaskFunc; // 354
    ItemCheckUseData unk_358;
    FieldMoveCheckData unk_370;
    void *atexit_TaskEnv; // 380
    void *unk_384;
    u8 filler_unk_388[4];
} StartMenuTaskData;

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
void sub_0203C8F0(StartMenuTaskData *env, TaskFunc func);
BOOL sub_0203CA9C(TaskManager *taskManager);
BOOL sub_0203D718(TaskManager *taskManager);
struct UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 a1, u8 a2);
BOOL sub_0203D830(TaskManager *taskManager);
BOOL sub_0203D9B4(TaskManager *taskManager);
BOOL Task_UseFlyInField(TaskManager *taskManager);

extern const u8 _020FA0B0[];

#endif //POKEHEARTGOLD_UNK_0203BC10_H
