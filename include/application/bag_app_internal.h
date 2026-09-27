#ifndef GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H

#include "application/bag_app.h"

#include "bag_types_def.h"
#include "bg_window.h"
#include "camera.h"
#include "message_format.h"
#include "message_printer.h"
#include "msgdata.h"
#include "player_data.h"
#include "sprite_system.h"
#include "yes_no_prompt.h"

/** Make sure we have the correct capacity for our string buffer array */
#define max(a, b)       ((a) > (b) ? (a) : (b))
#define NUM_BAG_STRINGS (max(max(max(max(max(max(max(NUM_BAG_ITEMS, NUM_BAG_MEDICINE), NUM_BAG_BALLS), NUM_BAG_TMS_HMS), NUM_BAG_BERRIES), NUM_BAG_MAIL), NUM_BAG_BATTLE_ITEMS), NUM_BAG_KEY_ITEMS))

typedef enum BagAppState {
    BAG_APP_STATE_WAIT_FADE_AND_ENTER,
    BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE,
    BAG_APP_STATE_SWITCH_POCKET_DPPT,
    BAG_APP_STATE_MOVE_ITEM,
    BAG_APP_STATE_CONTEXT_MENU,
    BAG_APP_STATE_TOSS_SELECT_QUANTITY,
    BAG_APP_STATE_CONFIRM_TOSS_PRINT_MESSAGE,
    BAG_APP_STATE_ABORT_TOSS,
    BAG_APP_STATE_CONFIRM_TOSS_WAIT_MESSAGE,
    BAG_APP_STATE_CONFIRM_TOSS_HANDLE_YESNO,
    BAG_APP_STATE_COMPLETE_TOSS_WAIT_MESSAGE,
    BAG_APP_STATE_COMPLETE_TOSS_WAIT_BUTTON,
    BAG_APP_STATE_ITEM_USE_ERROR_WAIT_MESSAGE,
    BAG_APP_STATE_USE_ITEM,
    BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM,
    BAG_APP_STATE_GIVE_ITEM_ERROR_WAIT_MESSAGE,
    BAG_APP_STATE_SELL_HANDLE_INPUT,
    BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY_WAIT_MESSAGE,
    BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY,
    BAG_APP_STATE_SELL_ITEM_PRINT_FINAL_CONFIRMATION,
    BAG_APP_STATE_SELL_ITEM_ABORT,
    BAG_APP_STATE_CONFIRM_SALE_WAIT_MESSAGE,
    BAG_APP_STATE_CONFIRM_SALE_WAIT_YESNO,
    BAG_APP_STATE_COMPLETE_SALE,
    BAG_APP_STATE_COMPLETE_SALE_WAIT_MESSAGE,
    BAG_APP_STATE_REGISTER_FAIL_WAIT_MESSAGE,
    BAG_APP_STATE_GARDENING,
    BAG_APP_STATE_OPEN_CONTEXT_MENU,
    BAG_APP_STATE_CANCEL_CONTEXT_MENU,
    BAG_APP_STATE_RUN_CONTEXT_MENU_ACTION,
    BAG_APP_STATE_TURN_POCKET_PAGE_RIGHT,
    BAG_APP_STATE_TURN_POCKET_PAGE_LEFT,
    BAG_APP_STATE_CANCEL_MOVE_ITEM,
    BAG_APP_STATE_APPLY_MOVE_ITEM,
    BAG_APP_STATE_HANDLE_SELECTED_ITEM_FOR_SALE,
    BAG_APP_STATE_RUN_SPRITE_ANIM_TRANSITION,
    BAG_APP_STATE_FADE_TO_EXIT,
    BAG_APP_STATE_WAIT_FADE_AND_EXIT,
} BagAppState;

typedef enum BagItemContextMenuAction {
    BAG_ITEM_CONTEXT_MENU_ACTION_USE,
    BAG_ITEM_CONTEXT_MENU_ACTION_WALK,
    BAG_ITEM_CONTEXT_MENU_ACTION_CHECK,
    BAG_ITEM_CONTEXT_MENU_ACTION_PLANT,
    BAG_ITEM_CONTEXT_MENU_ACTION_POFFIN_CASE_OPEN,
    BAG_ITEM_CONTEXT_MENU_ACTION_TRASH,
    BAG_ITEM_CONTEXT_MENU_ACTION_REGISTER,
    BAG_ITEM_CONTEXT_MENU_ACTION_DESELECT,
    BAG_ITEM_CONTEXT_MENU_ACTION_GIVE,
    BAG_ITEM_CONTEXT_MENU_ACTION_9,
    BAG_ITEM_CONTEXT_MENU_ACTION_CONFIRM,
    BAG_ITEM_CONTEXT_MENU_ACTION_CANCEL,
    BAG_ITEM_CONTEXT_MENU_ACTION_MOVE,
    BAG_ITEM_CONTEXT_MENU_ACTION_SELL,
    BAG_ITEM_CONTEXT_MENU_ACTION_USE_IN_BERRY_POTS,
    BAG_ITEM_CONTEXT_MENU_ACTION_STOP_GBSOUNDS,
    BAG_ITEM_CONTEXT_MENU_ACTION_MAX,
} BagItemContextMenuAction;

typedef enum BagAppWindowId {
    BAG_APP_WINDOW_MAIN_DESCRIPTION = 0,
    BAG_APP_WINDOW_MAIN_TMHM_DETAILS,
    BAG_APP_WINDOW_MAIN_ITEM_ACTION,
    BAG_APP_WINDOW_MAIN_MESSAGE,
    BAG_APP_WINDOW_MAIN_4,
    BAG_APP_WINDOW_MAIN_5,
    BAG_APP_WINDOW_MAIN_PAGE_COUNTER,
    BAG_APP_WINDOW_MAIN_CANCEL_BUTTON,
    BAG_APP_WINDOW_MAIN_MAX,

    BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 = 0,
    BAG_APP_WINDOW_SUB_ITEM_NAME_A_2,
    BAG_APP_WINDOW_SUB_ITEM_NAME_A_3,
    BAG_APP_WINDOW_SUB_ITEM_NAME_A_4,
    BAG_APP_WINDOW_SUB_ITEM_NAME_A_5,
    BAG_APP_WINDOW_SUB_ITEM_NAME_A_6,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_1,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_2,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_3,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_4,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_5,
    BAG_APP_WINDOW_SUB_ITEM_NAME_B_6,
    BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM,
    BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1,
    BAG_APP_WINDOW_SUB_CONTEXT_OPTION_2,
    BAG_APP_WINDOW_SUB_CONTEXT_OPTION_3,
    BAG_APP_WINDOW_SUB_CONTEXT_OPTION_4,
    BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1,
    BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_2,
    BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_3,
    BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON,
    BAG_APP_WINDOW_SUB_MESSAGE,
    BAG_APP_WINDOW_SUB_MONEY,
    BAG_APP_WINDOW_SUB_SELL_MONEY,
    BAG_APP_WINDOW_SUB_MAX,
} BagAppWindowId;

typedef enum BagAppSpriteId {
    BAG_APP_SPRITE_UNUSED_MOVE_ITEM_CURSOR = 0,
    BAG_APP_SPRITE_ITEM_ICON_1,
    BAG_APP_SPRITE_ITEM_ICON_2,
    BAG_APP_SPRITE_ITEM_ICON_3,
    BAG_APP_SPRITE_ITEM_ICON_4,
    BAG_APP_SPRITE_ITEM_ICON_5,
    BAG_APP_SPRITE_ITEM_ICON_6,
    BAG_APP_SPRITE_MOVE_TYPE_ICON,
    BAG_APP_SPRITE_MOVE_CATEGORY_ICON,
    BAG_APP_SPRITE_POCKET_ICON_1,
    BAG_APP_SPRITE_POCKET_ICON_2,
    BAG_APP_SPRITE_POCKET_ICON_3,
    BAG_APP_SPRITE_POCKET_ICON_4,
    BAG_APP_SPRITE_POCKET_ICON_5,
    BAG_APP_SPRITE_POCKET_ICON_6,
    BAG_APP_SPRITE_POCKET_ICON_7,
    BAG_APP_SPRITE_POCKET_ICON_8,
    BAG_APP_SPRITE_PAGE_LEFT_BUTTON,
    BAG_APP_SPRITE_PAGE_RIGHT_BUTTON,
    BAG_APP_SPRITE_B_BUTTON,
    BAG_APP_SPRITE_CURSOR,
    BAG_APP_SPRITE_ITEM_BUTTON_1,
    BAG_APP_SPRITE_ITEM_BUTTON_2,
    BAG_APP_SPRITE_ITEM_BUTTON_3,
    BAG_APP_SPRITE_ITEM_BUTTON_4,
    BAG_APP_SPRITE_ITEM_BUTTON_5,
    BAG_APP_SPRITE_ITEM_BUTTON_6,
    BAG_APP_SPRITE_UNUSED_CURSOR_2,
    BAG_APP_SPRITE_CONTEXT_MENU_ICON_1,
    BAG_APP_SPRITE_CONTEXT_MENU_ICON_2,
    BAG_APP_SPRITE_CONTEXT_MENU_ICON_3,
    BAG_APP_SPRITE_CONTEXT_MENU_ICON_4,
    BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP,
    BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP,
    BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_UP,
    BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN,
    BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN,
    BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_DOWN,
    BAG_APP_SPRITE_A_BUTTON,
    BAG_APP_SPRITE_MAX,
} BagAppSpriteId;

typedef enum BagAppCursorPos {
    BAG_APP_CURSOR_POS_POCKET_1,
    BAG_APP_CURSOR_POS_POCKET_2,
    BAG_APP_CURSOR_POS_POCKET_3,
    BAG_APP_CURSOR_POS_POCKET_4,
    BAG_APP_CURSOR_POS_POCKET_5,
    BAG_APP_CURSOR_POS_POCKET_6,
    BAG_APP_CURSOR_POS_POCKET_7,
    BAG_APP_CURSOR_POS_POCKET_8,
    BAG_APP_CURSOR_POS_ITEM_1,
    BAG_APP_CURSOR_POS_ITEM_2,
    BAG_APP_CURSOR_POS_ITEM_3,
    BAG_APP_CURSOR_POS_ITEM_4,
    BAG_APP_CURSOR_POS_ITEM_5,
    BAG_APP_CURSOR_POS_ITEM_6,
    BAG_APP_CURSOR_POS_PAGE_LEFT,
    BAG_APP_CURSOR_POS_PAGE_RIGHT,
    BAG_APP_CURSOR_POS_CANCEL,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_1,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_2,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_3,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_4,

    BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET = 17,
} BagAppCursorPos;

typedef struct BagAppData_UnusedPocketSelector {
    u8 nextPocket;
    u8 nextPocketDirection;
    u8 animStage;
    u8 animFrame;
    u8 pocketChangeState;
    u8 pocketChangeFrame;
    u8 pressedPocketBtnIdx;
    u8 isActive : 4;
    u8 isNotTouchHeld : 3;
    u8 unk_7_7 : 1;
} BagAppData_UnusedPocketSelector;

typedef struct BagAppSpriteAnimationTransitionManager {
    u8 spriteId;
    u8 plttOverride1 : 4;
    u8 plttOverride2 : 4;
    u8 animType;
    u8 plttAnimState : 4;
    u8 plttAnimFrame : 4;
    BagAppState nextState;
} BagAppSpriteAnimationTransitionManager;

typedef struct BagAppData BagAppData;

typedef BagAppState (*BagItemContextMenuFunc)(BagAppData *);

typedef struct BagApp3DModelData {
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *resMdl;
    NNSG3dResFileHeader *resHeader;
    void *unk_5C[8];
    void *unk_7C[8];
    void *unk_9C;
    NNSG3dAnmObj *unk_A0[8];
    NNSG3dAnmObj *unk_C0[8];
    NNSG3dAnmObj *unk_E0;
    int pocketIdx;
} BagApp3DModelData;

typedef struct BagApp3DState {
    NNSFndAllocator allocator;
    Camera *camera;
    BagApp3DModelData obj;
    VecFx32 cameraTarget;
    CameraParam cameraParam;
    int cameraAnchorsQueue[3];
    u16 frame;
    u16 duration;
    VecFx32 translation;
} BagApp3DState;

struct BagAppData {
    BgConfig *bgConfig;
    Window windows_main[BAG_APP_WINDOW_MAIN_MAX];
    Window windows_unused[3];
    Window windows_sub[BAG_APP_WINDOW_SUB_MAX];
    BagView *bagView;
    Bag *bag;
    PlayerProfile *playerProfile;
    Options *options;
    NARC *narc_a_0_1_5;
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    ManagedSprite *sprites[BAG_APP_SPRITE_MAX];
    MessagePrinter *msgPrinter;
    MsgData *msgData;
    MessageFormat *msgFormat;
    MsgData *itemNamesMsgdata;
    MsgData *moveNamesMsgData;
    String *contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_MAX];
    u8 filler_340[8];
    int unk_348;
    u8 filler_34C[4];
    String *itemNameStrings[NUM_BAG_STRINGS];
    String *formattedStrbuf;
    String *unk_5E8;
    String *unk_5EC;
    u8 filler_5F0[4];
    String *pocketNameStrings[8];
    u8 numPockets;
    u8 gender;
    u8 textPrinterId;
    // DPPt leftovers
    u8 pocketSelectorIconsX;
    u8 pocketSelectorIconsSpacing;
    BagAppData_UnusedPocketSelector pocketSelector;
    u8 filler_624[0x20];
    int cursorPos;
    u8 unk_648;
    u8 unk_649;
    u8 unk_64A;
    u8 unk_64B;
    u8 filler_64C[32];
    int moveItemCursorPos;
    u8 nextPocket;
    u8 moveItemMode;
    u8 moveItemOriginalSlot;
    int unk_674;
    u8 filler_678[3];
    u8 customCallbackState;
    BagItemContextMenuFunc customCallback;
    s16 quantity;
    u16 maxQuantity;
    int unitSellPrice;
    u8 filler_688[2];
    u8 itemNamesWindowSet;
    void *unk_68C;
    void *unk_690;
    NNSG2dPaletteData *unk_694[2];
    void *unk_69C;
    NNSG2dPaletteData *unk_6A0;
    u16 itemsInPocket[NUM_BAG_STRINGS];
    BagItemContextMenuFunc contextMenuActions[5];
    YesNoPrompt *yesNoPrompt;
    BagApp3DState threeDimState;
    BagAppSpriteAnimationTransitionManager spriteAnimTransitionMgr;
    int unk_948;
}; // size: 0x94C

void ov15_021F9C78(BagAppData *appData, BOOL a1);
u16 ov15_021F9D60(BagAppData *appData, u16 slot, BOOL fetchQuantity);
BOOL IsBerryOrMulch(u8 pocketId, u16 itemId);

void BagApp_CreateMainWindows(BagAppData *appData);
void BagApp_RemoveWindows(BagAppData *appData);
void BagApp_LoadPocketNames(BagAppData *appData);
void BagApp_DeletePocketNames(BagAppData *appData);
void ov15_021FE528(BagAppData *appData);
void ov15_021FE868(BagAppData *appData);
void ov15_021FE874(BagAppData *appData);
void ov15_021FE8A4(BagAppData *appData);
void BagApp_LoadContextMenuStrings(BagAppData *appData);
void BagApp_UnloadContextMenuStrings(BagAppData *appData);
void ov15_021FEB84(BagAppData *appData, u8 *stringIndices, int a2);
void BagApp_PrintItemDescriptionOnWindow(BagAppData *appData, Window *window, int itemId);
void BagApp_ClearItemDescriptionWindow(BagAppData *appData, Window *window);
void BagApp_PrintPocketDescriptionOnWindow(BagAppData *appData, Window *window, int pocket);
void ov15_021FED24(BagAppData *appData);
void ov15_021FED3C(BagAppData *appData);
void BagApp_RemoveContextMenuWindows(BagAppData *appData);
void BagApp_PrintMoveTheItemMessage(BagAppData *appData);
void ov15_021FEDEC(BagAppData *appData, u32 a1);
void ov15_021FEEA4(BagAppData *appData);
u8 BagApp_PrintMessage(BagAppData *appData, int a1);
void BagApp_CreateYesNoPrompt(BagAppData *appData);
void BagApp_DestroyYesNoPrompt(BagAppData *appData);
void ov15_021FF068(BagAppData *appData);
void ov15_021FF0FC(BagAppData *appData, int a1);
void ov15_021FF1E0(BagAppData *appData);
void BagApp_PrintCancel(BagAppData *appData, int centered);
void ov15_021FF364(BagAppData *appData, int scroll, int itemSlot, BOOL isMoveMode);
void BagApp_SwitchItemButtonWindowsToContextMenuMode(BagAppData *appData, int scroll, int offset);
void BagApp_ClearSelectedItemWindow(BagAppData *appData);
void BagApp_PrintPageCounter(BagAppData *appData, int pocketCount, int pocketScroll, int offset);
void BagApp_PrintContextMenuStringOnWindowCentered(Window *window, String **strings, int index);
void BagApp_ClearFourWindowsAt(Window *window);
void BagApp_PrintTrashContextOptionOnWindow(BagAppData *appData);
void BagApp_PrintSellContextOptionOnWindow(BagAppData *appData);
void BagApp_ClearTextOnSellOrTrashButton(BagAppData *appData);
void BagApp_ClearTextOnCancelButton(BagAppData *appData);

void BagApp_InitSpriteRendererAndSystem(BagAppData *appData);
void BagApp_FreeSpriteSystem(BagAppData *appData);
void ov15_021FF8D4(BagAppData *appData);
void ov15_021FF950(BagAppData *appData);
void ov15_021FF964(BagAppData *appData);
void ov15_021FF97C(BagAppData *appData, u16 itemId, int a2);
void BagApp_SetCursorSpritePos_PocketsItemsContext(BagAppData *appData, BagAppCursorPos a1);
void BagApp_HideCursorSprite(BagAppData *appData);
void BagApp_SetCursorSpritePos_ItemsOnly(BagAppData *appData, int a1);
void BagApp_SetCursorSpritePos_QuantitySelect(BagAppData *appData, int a1);
void ov15_02200030(BagAppData *appData, int pocket);
void ov15_0220005C(BagAppData *appData, int a1, int a2, int a3);
void BagApp_UpdateItemIconsVisibility(BagAppData *appData, BagViewPocket *pocket, int numShown, BOOL replaceIcon);
void BagApp_ShowOnlySelectedItemIcon(BagAppData *appData, BagViewPocket *pocket, int itemSlot);
void ov15_0220023C(BagAppData *appData, u8 *a1);
void BagApp_HideContextMenuIcons(BagAppData *appData);
void BagApp_CenterSelectedItemIconSprite(BagAppData *appData, int cursorPos);
int BagApp_GetNumberWidthType(int a0);
void BagApp_ShowQuantitySelectSpritesUI(BagAppData *appData, int a1, int a2);
void ov15_02200428(BagAppData *appData);
void BagApp_SetPocketIconsDrawFlag(BagAppData *appData, int drawState);
void BagApp_SetBButtonSpriteDrawFlag(BagAppData *appData, int flag);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
