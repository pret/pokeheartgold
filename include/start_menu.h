#ifndef POKEHEARTGOLD_UNK_0203BC10_H
#define POKEHEARTGOLD_UNK_0203BC10_H

#include "field_use_item.h"
#include "party_menu.h"
#include "task.h"

typedef enum StartMenuIcon {
    START_MENU_ICON_POKEDEX,
    START_MENU_ICON_POKEMON,
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
    BOOL cursorActive;
    u16 lastButtonSelected;
    u16 state; // 26
    int selectedIndex;
    u32 numActiveButtons;
    u8 insertionOrder[10];
    u8 selectionToAction[10];
    u8 filler_044[0x190];
    SpriteList *spriteList;
    GF_G2dRenderer g2dRenderer;
    GF_2DGfxResMan *gfxResMan[4];
    GF_2DGfxResObj *gfxResObj[4];
    SpriteResourcesHeader spriteResourcesHeader;
    Sprite *cursorSprite;
    u8 filler_348[0x4];
    u32 inhibitIconFlags;
    BOOL unk_350;
    TaskFunc atexit_TaskFunc; // 354
    ItemCheckUseData itemCheckUseData;
    FieldMoveCheckData fieldMoveCheckData;
    void *atexit_TaskEnv; // 380
    void *atexit_TaskEnv2;
    u8 filler_unk_388[4];
} StartMenuTaskData;

typedef struct UnkStruct_0203D818 {
    u16 itemId;
    u8 partySlot;
    u8 kind;
} UnkStruct_0203D818;

typedef struct FlyTaskStruct {
    u32 partySlot;
} FlyTaskStruct;

BOOL FieldSystem_MapIsNotMysteryZone(FieldSystem *fieldSystem);
void sub_0203BC28(FieldSystem *fieldSystem);
void sub_0203BCDC(FieldSystem *fieldSystem);
void sub_0203BD20(FieldSystem *fieldSystem);
void sub_0203BD64(FieldSystem *fieldSystem);
BOOL FieldSystem_ShouldDrawStartMenuIcon(FieldSystem *fieldSystem, StartMenuIcon icon);
void StartMenu_SetChildProcReturnTaskFunc(StartMenuTaskData *env, TaskFunc func);
BOOL Task_StartMenu_HandleReturn_Pokemon(TaskManager *taskManager);
BOOL Task_ReturnToMenuFromAppItem(TaskManager *taskManager);
BOOL Task_UseFlyInField(TaskManager *taskManager);
UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 kind, u8 partySlot);
BOOL Task_ReturnToMenuFromMail(TaskManager *taskManager);
BOOL Task_ReturnToMenuFromVSRecorder(TaskManager *taskManager);

extern const u8 _020FA0B0[];

#endif //POKEHEARTGOLD_UNK_0203BC10_H
