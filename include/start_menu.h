#ifndef POKEHEARTGOLD_START_MENU_H
#define POKEHEARTGOLD_START_MENU_H

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

typedef enum StartMenuState {
    START_MENU_STATE_INIT,
    START_MENU_STATE_INIT_FORCE_CURSOR,
    START_MENU_STATE_2,
    START_MENU_STATE_HANDLE_INPUT,
    START_MENU_STATE_WAIT_FADE,
    START_MENU_STATE_WAIT_APP,
    START_MENU_STATE_SAVE,
    START_MENU_STATE_7,
    START_MENU_STATE_EVOLUTION,
    START_MENU_STATE_WAIT_EVOLUTION,
    START_MENU_STATE_10,
    START_MENU_STATE_11,
    START_MENU_STATE_12,
    START_MENU_STATE_13,
    START_MENU_STATE_14,
    START_MENU_STATE_RETURN,
    START_MENU_STATE_CLOSE,
    START_MENU_STATE_RETURN_WAIT_FADE,
    START_MENU_STATE_18,
    START_MENU_STATE_19,
    START_MENU_STATE_20,
} StartMenuState;

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
    G2dRenderer g2dRenderer;
    GF_2DGfxResMan *gfxResMan[4];
    SpriteResource *gfxResObj[4];
    SpriteResourcesHeader spriteResourcesHeader;
    Sprite *cursorSprite;
    u8 filler_348[0x4];
    u32 inhibitIconFlags;
    BOOL unk_350;
    TaskFunc exitTaskFunc; // 354
    ItemCheckUseData itemCheckUseData;
    FieldMoveCheckData fieldMoveCheckData;
    void *exitTaskEnvironment; // 380
    void *exitTaskEnvironment2;
    u8 filler_unk_388[4];
} StartMenuTaskData;

typedef struct UnkStruct_0203D818 {
    u16 itemId;
    u8 partySlot;
    u8 kind;
} UnkStruct_0203D818;

BOOL FieldSystem_MapIsNotMysteryZone(FieldSystem *fieldSystem);
void sub_0203BC28(FieldSystem *fieldSystem);
void sub_0203BCDC(FieldSystem *fieldSystem);
void sub_0203BD20(FieldSystem *fieldSystem);
void sub_0203BD64(FieldSystem *fieldSystem);
BOOL FieldSystem_ShouldDrawStartMenuIcon(FieldSystem *fieldSystem, StartMenuIcon icon);
void StartMenu_SetExitTaskFunc(StartMenuTaskData *env, TaskFunc func);
BOOL Task_StartMenu_HandleReturn_Pokemon(TaskManager *taskManager);
BOOL Task_ReturnToMenuFromAppItem(TaskManager *taskManager);
BOOL Task_UseFlyInField(TaskManager *taskManager);
UnkStruct_0203D818 *sub_0203D818(u16 itemId, u8 kind, u8 partySlot);
BOOL Task_ReturnToMenuFromMail(TaskManager *taskManager);
BOOL Task_ReturnToMenuFromVSRecorder(TaskManager *taskManager);

extern const u8 _020FA0B0[];

#endif // POKEHEARTGOLD_START_MENU_H
