#include "global.h"

#include "constants/field/map_load.h"

#include "application/bag_app_internal.h"
#include "graphic/bag/bag_graphics.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"

#include "bag.h"
#include "bag_types_def.h"
#include "bag_view.h"
#include "bg_window.h"
#include "field_use_item.h"
#include "font.h"
#include "gf_3d_render.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "list_menu_items.h"
#include "message_format.h"
#include "message_printer.h"
#include "msgdata.h"
#include "player_data.h"
#include "render_text.h"
#include "render_window.h"
#include "roamer.h"
#include "screen_fade.h"
#include "sound_02004A44.h"
#include "sprite_system.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_020210A0.h"
#include "unk_02026E30.h"
#include "unk_0203A3B0.h"
#include "unk_0208805C.h"
#include "vram_transfer_manager.h"

enum BagBgLayout {
    BAG_BG_LAYOUT_NORMAL = 0,
    BAG_BG_LAYOUT_MOVE,
    BAG_BG_LAYOUT_CONTEXT,
    BAG_BG_LAYOUT_TRASH,
    BAG_BG_LAYOUT_SELL,
};

typedef struct BagAppCameraAnchor {
    CameraAngle cameraAngle;
    fx32 distance;
    fx32 translationY;
} BagAppCameraAnchor;

static void BagApp_GetSaveStructPtrs(BagAppData *appData);
static RoamerSaveData *BagApp_GetSaveRoamers(BagAppData *appData);
static void BagApp_SetRepelStepCount(BagAppData *appData, u8 repelSteps);
static void BagApp_SetFlute(BagAppData *appData, u8 flute);
static void BagApp_VBlankIntrCB(void *cbArg);
static void BagApp_SetGfxBanks(void);
static void BagApp_InitBgLayers(BgConfig *bgConfig);
static void BagApp_TeardownBgLayers(BgConfig *bgConfig);
static void BagApp_LoadBgGraphics(BagAppData *appData);
static void BagApp_InitMsgSystem(BagAppData *appData);
static void BagApp_CountActivePockets(BagAppData *appData);
static void BagApp_GetItemNameIntoString(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID);
static void BagApp_GetTMHMMoveNameIntoString(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID);
static void BagApp_InitBagViewFromCursor(BagAppData *appData);
static void BagApp_SaveBagViewToCursor(BagAppData *appData);
static void BagApp_SetItemNameStringsFromCurPocket(BagAppData *appData);
static void BagApp_CreateItemNameStrings(BagAppData *appData);
static void BagApp_DeleteItemNameStrings(BagAppData *appData);
static void LimitItemListScroll(s16 *a0, u16 *a1, u8 a2);
static void RestrictItemListCursor(s16 *pScroll, u16 *pPos, u8 limit, u8 numVisibleSlots);
static int BagApp_GetNumItemsOnCurrentPage(BagAppData *appData);
static int BagApp_GetMoveItemOriginalSlotOnCurrentPage(BagAppData *appData);
static void BagApp_DPPt_CreateItemListMenu(BagAppData *appData);
static void BagApp_UpdateBagViewPocketCursorPos(BagAppData *appData, int a1);
static BOOL BagApp_TouchTargetIsNotTransitioningFromItemsToPocketButtons(BagAppData *appData, int a1);
static u16 BagApp_GetCurrentlySelectedItemId(BagAppData *appData);
static void BagApp_UpdateDescriptionOnTopScreen(BagAppData *appData);
static BagAppState BagAppMainTask_HandleInput_Normal(BagAppData *appData);
static BagAppState BagAppMainTask_OpenContextMenu(BagAppData *appData);
static BagAppState BagAppMainTask_TurnPocketPage(BagAppData *appData, int direction);
static void BagApp_CalcPocketSelectorIconsPos(BagAppData *appData);
static BOOL BagApp_ProcessInput_Gardening(BagAppData *appData);
static int BagApp_PocketIdToBagViewPosition(BagAppData *appData, u32 pocketId);
static int BagApp_GetPocketNeighbor(BagAppData *appData, int pocketId, int addend);
static void BagApp_DrawPocketPage_NormalMode(BagAppData *appData, BagViewPocket *pocket);
static BagAppState BagApp_HandleCursorAction(BagAppData *appData, BagAppCursorPos input, u8 *pSelectedItemOut, int a3, int a4, MenuInputState inputState);
static BOOL BagAppMainTask_SwitchPocket_DPPt(BagAppData *appData);
static BOOL BagApp_DoDPadPocketSwitch_DPPt(BagAppData *appData);
static BOOL BagApp_StepPocketSelectorAnim_DPPt(BagAppData *appData);
static int BagApp_ContextMenu_HandleInput(BagAppData *appData);
static u32 BagApp_HandleTouchInput(BagAppData *appData, int whichMenu);
static int BagApp_GetNextPocket_DPPt(BagAppData *appData);
static void BagApp_TransitionDrawStateToMoveItemMode(BagAppData *appData);
static int MoveItemHandleDPad(int curPos);
static void BagApp_DrawPocketPage_MoveItemMode(BagAppData *appData, BagViewPocket *pocket);
static int BagApp_MoveItem_HandleSelectedButton(BagAppData *appData, int newPos);
static BagAppState BagAppMainTask_MoveItem(BagAppData *appData);
static BagAppState BagAppMainTask_ApplyMoveItem(BagAppData *appData);
static BagAppState BagAppMainTask_FinishMoveItem(BagAppData *appData);
static void BagApp_SetMoveItemCursorSpritePosition(BagAppData *appData);
static void BagApp_PrepareContextMenu(BagAppData *appData);
static void BagApp_PrintContextMenuStrings(BagAppData *appData, u8 *indices);
static void BagApp_DrawDefaultLayout(BagAppData *appData);
static BagAppState BagAppMainTask_ContextMenu(BagAppData *appData);
static BagAppState BagAppMainTask_CancelContextMenu(BagAppData *appData);
static BagAppState BagAppMainTask_RunContextMenuAction(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Use(BagAppData *appData);
static BagAppState BagAppMainTask_ItemUseError_WaitMessage(BagAppData *appData);
static BagAppState BagApp_UseItem(BagAppData *appData);
static BagAppState BagAppMainTask_RunUseItemCallback(BagAppData *appData);
static BagAppState BagApp_UseTMHM(BagAppData *appData);
static BOOL BagApp_TryUseItemInPlace(BagAppData *appData, u16 itemId);
static String *BagApp_TryUseRepel(BagAppData *appData, u16 itemId);
static String *BagApp_ToggleGBSounds(BagAppData *appData, u16 itemId);
static void BagApp_DepleteItemAfterUse(BagAppData *appData);
static BagAppState BagApp_UseItemInPlaceMessage(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Unk9(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Confirm(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Trash(BagAppData *appData);
static int addWrapped(int base, int limit, int addend);
static BagAppState BagAppMainTask_Toss_SelectQuantity(BagAppData *appData);
static BagAppState BagAppMainTask_ConfirmToss_PrintMessage(BagAppData *appData);
static BagAppState BagAppMainTask_AbortToss(BagAppData *appData);
static BagAppState BagAppMainTask_ConfirmToss_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_ConfirmToss_HandleYesNo(BagAppData *appData);
static BagAppState BagAppMainTask_CompleteToss_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_CompleteToss_WaitButton(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Register(BagAppData *appData);
static BagAppState BagAppMainState_RegisterItemFailed_WaitMessage(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Deselect(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Move(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_Give(BagAppData *appData);
static BagAppState BagAppMainTask_HandleInput_GiveItem(BagAppData *appData);
static BagAppState BagAppMainTask_GiveItemError_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_HandleInput_Sell(BagAppData *appData);
static BagAppState BagAppMainTask_HandleSelectedItemForSale(BagAppData *appData);
static BagAppState BagAppMainTask_SellItem_ChooseQuanity_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_SellItem_ChooseQuantity(BagAppData *appData);
static BagAppState BagAppMainTask_SellItem_PrintFinalConfirmation(BagAppData *appData);
static BagAppState BagAppMainTask_SellItem_Abort(BagAppData *appData);
static BagAppState BagAppMainTask_ConfirmSale_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_ConfirmSale_HandleYesNo(BagAppData *appData);
static BagAppState BagAppMainTask_CompleteSale(BagAppData *appData);
static BagAppState BagAppMainTask_CompleteSale_WaitMessage(BagAppData *appData);
static BagAppState BagAppMainTask_Gardening(BagAppData *appData);
static BagAppState BagApp_ItemContextMenu_UseInBerryPots(BagAppData *appData);
static void BagApp_LoadBgPaletteByPocket(BagAppData *appData, int a1, int pocket);
static void BagApp_DrawItemBgButtons_NormalMode(BgConfig *bgConfig, int bgId, int limit);
static void BagApp_DrawItemBgButtons_MoveMode(BgConfig *bgConfig, int bgId, int limit, int cursorPos);
static void BagApp_DrawScreenLayout(BagAppData *appData, u32 layout, int limit, int cursorPos);
static void BagApp_SaveMenuInputStateToBagView(BagAppData *appData, MenuInputState state);
static void BagApp_SetCancelButtonDrawFlag(BagAppData *appData, int flag);
static BagAppState BagApp_SetSpritePaletteAnimTransitionToNextState(BagAppData *appData, u8 spriteId, u8 plttOverride1, u8 plttOverride2, BagAppState nextState);
static BagAppState BagApp_SetSpriteAnimationTransitionToNextState(BagAppData *appData, u8 spriteId, u8 animId, BagAppState nextState);
static BagAppState BagAppMainTask_RunSpriteAnimTransition(BagAppData *appData);
static void BagApp_Init3D(BagAppData *appData);
static void BagApp3DState_Init(BagApp3DState *threeDimState);
static void BagApp3DState_BeginMoveCamera(BagApp3DState *threeDimState, int cameraAnchorId, int duration);
static void BagApp3DState_UpdateCameraPosition(BagApp3DState *threeDimState, int gender);
static void BagApp_Teardown3D(BagAppData *appData);
static void BagApp_Update3D(BagAppData *appData);
static void FrameAdvance3dAnim(NNSG3dAnmObj *animObj);
static void BagApp_Load3dAssets(BagAppData *appData);
static void BagApp_Free3dAssets(BagAppData *appData);
static void BagApp_SwitchPlayerModelAnimsToNewPocket(BagAppData *appData);

static const BagAppCameraAnchor sCameraAnchors[][9] = {
    {
     { { 0xE982, 0x1420, 0x0000 }, FX32_CONST(339.707275390625), FX32_CONST(-40.0) },
     { { 0xEE82, 0x6719, 0x0000 }, FX32_CONST(339.708251953125), FX32_CONST(-37.0) },
     { { 0xE087, 0x4828, 0x0000 }, FX32_CONST(227.707275390625), FX32_CONST(-46.0) },
     { { 0xF07F, 0x7816, 0x0000 }, FX32_CONST(334.707763671875), FX32_CONST(-47.99951171875) },
     { { 0x0375, 0x5622, 0x0000 }, FX32_CONST(181.70654296875), FX32_CONST(-68.999755859375) },
     { { 0xE781, 0x7527, 0x0000 }, FX32_CONST(202.708984375), FX32_CONST(-59.99853515625) },
     { { 0xE87E, 0x741A, 0x0000 }, FX32_CONST(296.706787109375), FX32_CONST(-54.00048828125) },
     { { 0xEB80, 0x921B, 0x0000 }, FX32_CONST(209.70751953125), FX32_CONST(-70.0) },
     { { 0x0587, 0x8C1F, 0x0000 }, FX32_CONST(339.707275390625), FX32_CONST(-32.000244140625) },
     },
    {
     { { 0xE982, 0x1420, 0x0000 }, FX32_CONST(339.707275390625), FX32_CONST(-40.0) },
     { { 0xEC82, 0x3820, 0x0000 }, FX32_CONST(293.707763671875), FX32_CONST(-45.0) },
     { { 0xE982, 0x1F20, 0x0000 }, FX32_CONST(267.707275390625), FX32_CONST(-40.0) },
     { { 0xE982, 0x5E18, 0x0000 }, FX32_CONST(211.707763671875), FX32_CONST(-47.999755859375) },
     { { 0xF17C, 0x1A1E, 0x0000 }, FX32_CONST(339.707275390625), FX32_CONST(-40.0) },
     { { 0x0180, 0x3222, 0x0000 }, FX32_CONST(197.707275390625), FX32_CONST(-51.0) },
     { { 0xEC7B, 0x8116, 0x0000 }, FX32_CONST(199.705322265625), FX32_CONST(-60.999755859375) },
     { { 0xF17D, 0x721F, 0x0000 }, FX32_CONST(213.707275390625), FX32_CONST(-42.0) },
     { { 0x0587, 0x501D, 0x0000 }, FX32_CONST(339.707275390625), FX32_CONST(-32.0) },
     },
};

static GXRgb sEdgeColorTable[8] = {
    GX_RGB(10, 10, 10),
    GX_RGB(15, 9, 4),
    GX_RGB(20, 20, 20),
};

static const u8 sContextMenuDPadDestinations[][4] = {
    { 2, 2, 1, 1 },
    { 3, 3, 0, 0 },
    { 0, 0, 4, 3 },
    { 1, 1, 2, 4 },
    { 4, 4, 3, 2 },
};

static u8 sCursorPos_ContextMenu[] = {
    BAG_APP_CURSOR_POS_CONTEXT_MENU_1,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_2,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_3,
    BAG_APP_CURSOR_POS_CONTEXT_MENU_4,
    BAG_APP_CURSOR_POS_CANCEL,
};

static const u8 sMainListDPadDestinations[][4] = {
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_ITEM_1,               BAG_APP_CURSOR_POS_POCKET_8,  BAG_APP_CURSOR_POS_POCKET_2   },
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_ITEM_1,               BAG_APP_CURSOR_POS_POCKET_1,  BAG_APP_CURSOR_POS_POCKET_3   },
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_ITEM_1,               BAG_APP_CURSOR_POS_POCKET_2,  BAG_APP_CURSOR_POS_POCKET_4   },
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_ITEM_1,               BAG_APP_CURSOR_POS_POCKET_3,  BAG_APP_CURSOR_POS_POCKET_5   },
    { BAG_APP_CURSOR_POS_CANCEL,               BAG_APP_CURSOR_POS_ITEM_2,               BAG_APP_CURSOR_POS_POCKET_4,  BAG_APP_CURSOR_POS_POCKET_6   },
    { BAG_APP_CURSOR_POS_CANCEL,               BAG_APP_CURSOR_POS_ITEM_2,               BAG_APP_CURSOR_POS_POCKET_5,  BAG_APP_CURSOR_POS_POCKET_7   },
    { BAG_APP_CURSOR_POS_CANCEL,               BAG_APP_CURSOR_POS_ITEM_2,               BAG_APP_CURSOR_POS_POCKET_6,  BAG_APP_CURSOR_POS_POCKET_8   },
    { BAG_APP_CURSOR_POS_CANCEL,               BAG_APP_CURSOR_POS_ITEM_2,               BAG_APP_CURSOR_POS_POCKET_7,  BAG_APP_CURSOR_POS_POCKET_1   },
    { BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_ITEM_3,               BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_2     },
    { BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_ITEM_4,               BAG_APP_CURSOR_POS_ITEM_1,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_1,               BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_4     },
    { BAG_APP_CURSOR_POS_ITEM_2,               BAG_APP_CURSOR_POS_ITEM_6,               BAG_APP_CURSOR_POS_ITEM_3,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_3,               BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_6     },
    { BAG_APP_CURSOR_POS_ITEM_4,               BAG_APP_CURSOR_POS_CANCEL,               BAG_APP_CURSOR_POS_ITEM_5,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
    { BAG_APP_CURSOR_POS_ITEM_5,               BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
    { BAG_APP_CURSOR_POS_ITEM_6,               BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
};

static const u8 sMoveItemDPadDestinations[][4] = {
    { BAG_APP_CURSOR_POS_ITEM_5, BAG_APP_CURSOR_POS_ITEM_3, BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_2     },
    { BAG_APP_CURSOR_POS_CANCEL, BAG_APP_CURSOR_POS_ITEM_4, BAG_APP_CURSOR_POS_ITEM_1,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_1, BAG_APP_CURSOR_POS_ITEM_5, BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_4     },
    { BAG_APP_CURSOR_POS_ITEM_2, BAG_APP_CURSOR_POS_ITEM_6, BAG_APP_CURSOR_POS_ITEM_3,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_3, BAG_APP_CURSOR_POS_ITEM_1, BAG_APP_CURSOR_POS_PAGE_LEFT, BAG_APP_CURSOR_POS_ITEM_6     },
    { BAG_APP_CURSOR_POS_ITEM_4, BAG_APP_CURSOR_POS_CANCEL, BAG_APP_CURSOR_POS_ITEM_5,    BAG_APP_CURSOR_POS_PAGE_RIGHT },
    { BAG_APP_CURSOR_POS_ITEM_5, BAG_APP_CURSOR_POS_ITEM_1, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
    { BAG_APP_CURSOR_POS_ITEM_5, BAG_APP_CURSOR_POS_ITEM_1, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
    { BAG_APP_CURSOR_POS_ITEM_6, BAG_APP_CURSOR_POS_ITEM_2, BAG_APP_CURSOR_POS_CANCEL,    BAG_APP_CURSOR_POS_CANCEL     },
};

const OverlayManagerTemplate gOverlayManagerTemplate_Bag = {
    Bag_Init,
    Bag_Main,
    Bag_Exit,
    FS_OVERLAY_ID_NONE,
};

static const TouchscreenHitbox sTouchscreenHitboxes_NormalMenu[] = {
    { 0, 31, 0, 31 },
    { 0, 31, 32, 63 },
    { 0, 31, 64, 95 },
    { 0, 31, 96, 127 },
    { 0, 31, 128, 159 },
    { 0, 31, 160, 191 },
    { 0, 31, 192, 223 },
    { 0, 31, 224, 255 },
    { 32, 73, 0, 127 },
    { 32, 73, 128, 255 },
    { 74, 117, 0, 127 },
    { 74, 117, 128, 255 },
    { 118, 153, 0, 127 },
    { 118, 153, 128, 255 },
    { 168, 191, 0, 39 },
    { 168, 191, 40, 79 },
    { 168, 191, 192, 255 },
    { TOUCHSCREEN_RECTLIST_END },
};

static const TouchscreenHitbox sTouchscreenHitboxes_ContextMenu[] = {
    { 128, 159, 0, 93 },
    { 128, 159, 96, 191 },
    { 160, 191, 0, 93 },
    { 160, 191, 96, 191 },
    { 168, 191, 192, 255 },
    { TOUCHSCREEN_RECTLIST_END },
};
static const TouchscreenHitbox sTouchscreenHitboxes_ItemsOnly[] = {
    { 32, 73, 0, 127 },
    { 32, 73, 128, 255 },
    { 74, 117, 0, 127 },
    { 74, 117, 128, 255 },
    { 118, 153, 0, 127 },
    { 118, 153, 128, 255 },
    { 168, 191, 0, 39 },
    { 168, 191, 40, 79 },
    { 168, 191, 192, 255 },
    { TOUCHSCREEN_RECTLIST_END },
};
static const TouchscreenHitbox sTouchscreenHitboxes_3DigitQuantitySelect[] = {
    { 88, 111, 120, 151 },
    { 88, 111, 152, 183 },
    { 88, 111, 184, 215 },
    { 136, 159, 120, 151 },
    { 136, 159, 152, 183 },
    { 136, 159, 184, 215 },
    { 168, 191, 96, 173 },
    { 168, 191, 178, 255 },
    { TOUCHSCREEN_RECTLIST_END },
};
static const TouchscreenHitbox sTouchscreenHitboxes_2DigitQuantitySelect[] = {
    { 88, 111, 120, 151 },
    { 88, 111, 152, 183 },
    { 136, 159, 120, 151 },
    { 136, 159, 152, 183 },
    { 168, 191, 96, 173 },
    { 168, 191, 178, 255 },
    { TOUCHSCREEN_RECTLIST_END },
};

static const u8 sPocketCapacities[8] = {
    NUM_BAG_ITEMS,
    NUM_BAG_MEDICINE,
    NUM_BAG_BALLS,
    NUM_BAG_TMS_HMS,
    NUM_BAG_BERRIES,
    NUM_BAG_MAIL,
    NUM_BAG_BATTLE_ITEMS,
    NUM_BAG_KEY_ITEMS,
};

static BagItemContextMenuFunc sContextMenuFuncs[] = {
    [BAG_ITEM_CONTEXT_MENU_ACTION_USE] = BagApp_ItemContextMenu_Use,
    [BAG_ITEM_CONTEXT_MENU_ACTION_WALK] = BagApp_ItemContextMenu_Use,
    [BAG_ITEM_CONTEXT_MENU_ACTION_CHECK] = BagApp_ItemContextMenu_Use,
    [BAG_ITEM_CONTEXT_MENU_ACTION_PLANT] = BagApp_ItemContextMenu_Use,
    [BAG_ITEM_CONTEXT_MENU_ACTION_POFFIN_CASE_OPEN] = BagApp_ItemContextMenu_Use,
    [BAG_ITEM_CONTEXT_MENU_ACTION_TRASH] = BagApp_ItemContextMenu_Trash,
    [BAG_ITEM_CONTEXT_MENU_ACTION_REGISTER] = BagApp_ItemContextMenu_Register,
    [BAG_ITEM_CONTEXT_MENU_ACTION_DESELECT] = BagApp_ItemContextMenu_Deselect,
    [BAG_ITEM_CONTEXT_MENU_ACTION_GIVE] = BagApp_ItemContextMenu_Give,
    [BAG_ITEM_CONTEXT_MENU_ACTION_9] = BagApp_ItemContextMenu_Unk9,
    [BAG_ITEM_CONTEXT_MENU_ACTION_CONFIRM] = BagApp_ItemContextMenu_Confirm,
    [BAG_ITEM_CONTEXT_MENU_ACTION_MOVE] = BagApp_ItemContextMenu_Move,
    [BAG_ITEM_CONTEXT_MENU_ACTION_USE_IN_BERRY_POTS] = BagApp_ItemContextMenu_UseInBerryPots,
    [BAG_ITEM_CONTEXT_MENU_ACTION_STOP_GBSOUNDS] = BagApp_ItemContextMenu_Use,
};

BOOL Bag_Init(OverlayManager *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    G2_BlendNone();
    G2S_BlendNone();

    Heap_Create(HEAP_ID_3, HEAP_ID_BAG, 0x42000);
    BagAppData *appData = OverlayManager_CreateAndGetData(man, sizeof(BagAppData), HEAP_ID_BAG);
    memset(appData, 0, sizeof(BagAppData));
    appData->bagView = OverlayManager_GetArgs(man);
    BagApp_GetSaveStructPtrs(appData);
    appData->bgConfig = BgConfig_Alloc(HEAP_ID_BAG);
    appData->gender = PlayerProfile_GetTrainerGender(appData->playerProfile);

    BeginNormalPaletteFade(FADE_SUB_THEN_MAIN, FADE_TYPE_DOWNWARD_IN, FADE_TYPE_DOWNWARD_IN, RGB_BLACK, 6, 1, HEAP_ID_BAG);
    SetKeyRepeatTimers(3, 8);
    BagApp_InitBagViewFromCursor(appData);
    BagApp_InitMsgSystem(appData);
    BagApp_CreateItemNameStrings(appData);
    BagApp_CountActivePockets(appData);
    BagApp_CalcPocketSelectorIconsPos(appData);
    BagApp_SetGfxBanks();
    BagApp_InitBgLayers(appData->bgConfig);
    BagApp_LoadBgGraphics(appData);
    sub_020210BC();
    sub_02021148(4);
    BagApp_CreateMainWindows(appData);
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    BagApp_LoadPocketNames(appData);
    BagApp_ClearPocketNameBox(appData);
    BagApp_LoadContextMenuStrings(appData);
    BagApp_LoadItemCountStrings_DPPt(appData);
    BagApp_SetItemNameStringsFromCurPocket(appData);
    BagApp_PrintCancel(appData, 0);

    LimitItemListScroll(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count);
    RestrictItemListCursor(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count, 6);
    BagApp_InitSpriteRendererAndSystem(appData);
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_RedrawItemNameWindows(appData, appData->bagView->pockets[appData->bagView->curPocket].scroll, -1, 0);
    BagApp_LoadObjPaletteByPocket(appData, appData->bagView->curPocket);
    BagApp_LoadBgPaletteByPocket(appData, 1, appData->bagView->curPocket);
    BagApp_PrintPageCounter(appData, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->pockets[appData->bagView->curPocket].scroll, 0);
    BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 1);
    appData->cursorPos = appData->bagView->pockets[appData->bagView->curPocket].position + 8;
    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
    BagApp_UpdateDescriptionOnTopScreen(appData);
    if (appData->bagView->context == BAG_VIEW_CONTEXT_POFFIN_SINGLEPLAYER || appData->bagView->context == BAG_VIEW_CONTEXT_POFFIN_MULTIPLAYER) {
        BagApp_DrawPoffinCountMsgBox_DPPt(appData);
    }
    BagApp_Init3D(appData);
    Main_SetVBlankIntrCB(BagApp_VBlankIntrCB, appData);
    Sound_SetSceneAndPlayBGM(51, 0, 0);
    sub_0203A964();
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
    return TRUE;
}

BOOL Bag_Main(OverlayManager *man, int *state) {
    BagAppData *appData = OverlayManager_GetData(man);

    switch (*state) {
    case BAG_APP_STATE_WAIT_FADE_AND_ENTER:
        if (IsPaletteFadeFinished() == TRUE) {
            switch (appData->bagView->context) {
            case BAG_VIEW_CONTEXT_MART_SELL:
                *state = BAG_APP_STATE_SELL_HANDLE_INPUT;
                break;
            case BAG_VIEW_CONTEXT_GIVE_ITEM:
                *state = BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
                break;
            case BAG_VIEW_CONTEXT_GARDENING:
                *state = BAG_APP_STATE_GARDENING;
                break;
            default:
                *state = BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
                break;
            }
        }
        break;
    case BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE:
        *state = BagAppMainTask_HandleInput_Normal(appData);
        break;
    case BAG_APP_STATE_SWITCH_POCKET_DPPT:
        if (BagAppMainTask_SwitchPocket_DPPt(appData) == TRUE) {
            if (appData->bagView->context == BAG_VIEW_CONTEXT_MART_SELL) {
                *state = BAG_APP_STATE_SELL_HANDLE_INPUT;
            } else if (appData->bagView->context == BAG_VIEW_CONTEXT_GIVE_ITEM) {
                *state = BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
            } else if (appData->bagView->context == BAG_VIEW_CONTEXT_GARDENING) {
                *state = BAG_APP_STATE_GARDENING;
            } else {
                *state = BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
            }
        }
        break;
    case BAG_APP_STATE_MOVE_ITEM:
        *state = BagAppMainTask_MoveItem(appData);
        break;
    case BAG_APP_STATE_CONTEXT_MENU:
        *state = BagAppMainTask_ContextMenu(appData);
        break;
    case BAG_APP_STATE_TOSS_SELECT_QUANTITY:
        *state = BagAppMainTask_Toss_SelectQuantity(appData);
        break;
    case BAG_APP_STATE_CONFIRM_TOSS_PRINT_MESSAGE:
        *state = BagAppMainTask_ConfirmToss_PrintMessage(appData);
        break;
    case BAG_APP_STATE_ABORT_TOSS:
        *state = BagAppMainTask_AbortToss(appData);
        break;
    case BAG_APP_STATE_CONFIRM_TOSS_WAIT_MESSAGE:
        *state = BagAppMainTask_ConfirmToss_WaitMessage(appData);
        break;
    case BAG_APP_STATE_CONFIRM_TOSS_HANDLE_YESNO:
        *state = BagAppMainTask_ConfirmToss_HandleYesNo(appData);
        break;
    case BAG_APP_STATE_COMPLETE_TOSS_WAIT_MESSAGE:
        *state = BagAppMainTask_CompleteToss_WaitMessage(appData);
        break;
    case BAG_APP_STATE_COMPLETE_TOSS_WAIT_BUTTON:
        *state = BagAppMainTask_CompleteToss_WaitButton(appData);
        break;
    case BAG_APP_STATE_ITEM_USE_ERROR_WAIT_MESSAGE:
        *state = BagAppMainTask_ItemUseError_WaitMessage(appData);
        break;
    case BAG_APP_STATE_USE_ITEM:
        *state = BagAppMainTask_RunUseItemCallback(appData);
        break;
    case BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM:
        *state = BagAppMainTask_HandleInput_GiveItem(appData);
        break;
    case BAG_APP_STATE_GIVE_ITEM_ERROR_WAIT_MESSAGE:
        *state = BagAppMainTask_GiveItemError_WaitMessage(appData);
        break;
    case BAG_APP_STATE_SELL_HANDLE_INPUT:
        *state = BagAppMainTask_HandleInput_Sell(appData);
        break;
    case BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY_WAIT_MESSAGE:
        *state = BagAppMainTask_SellItem_ChooseQuanity_WaitMessage(appData);
        break;
    case BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY:
        *state = BagAppMainTask_SellItem_ChooseQuantity(appData);
        break;
    case BAG_APP_STATE_SELL_ITEM_PRINT_FINAL_CONFIRMATION:
        *state = BagAppMainTask_SellItem_PrintFinalConfirmation(appData);
        break;
    case BAG_APP_STATE_SELL_ITEM_ABORT:
        *state = BagAppMainTask_SellItem_Abort(appData);
        break;
    case BAG_APP_STATE_CONFIRM_SALE_WAIT_MESSAGE:
        *state = BagAppMainTask_ConfirmSale_WaitMessage(appData);
        break;
    case BAG_APP_STATE_CONFIRM_SALE_WAIT_YESNO:
        *state = BagAppMainTask_ConfirmSale_HandleYesNo(appData);
        break;
    case BAG_APP_STATE_COMPLETE_SALE:
        *state = BagAppMainTask_CompleteSale(appData);
        break;
    case BAG_APP_STATE_COMPLETE_SALE_WAIT_MESSAGE:
        *state = BagAppMainTask_CompleteSale_WaitMessage(appData);
        break;
    case BAG_APP_STATE_GARDENING:
        *state = BagAppMainTask_Gardening(appData);
        break;
    case BAG_APP_STATE_REGISTER_FAIL_WAIT_MESSAGE:
        *state = BagAppMainState_RegisterItemFailed_WaitMessage(appData);
        break;
    case BAG_APP_STATE_OPEN_CONTEXT_MENU:
        *state = BagAppMainTask_OpenContextMenu(appData);
        break;
    case BAG_APP_STATE_CANCEL_CONTEXT_MENU:
        *state = BagAppMainTask_CancelContextMenu(appData);
        break;
    case BAG_APP_STATE_RUN_CONTEXT_MENU_ACTION:
        *state = BagAppMainTask_RunContextMenuAction(appData);
        break;
    case BAG_APP_STATE_TURN_POCKET_PAGE_RIGHT:
        *state = BagAppMainTask_TurnPocketPage(appData, 1);
        break;
    case BAG_APP_STATE_TURN_POCKET_PAGE_LEFT:
        *state = BagAppMainTask_TurnPocketPage(appData, -1);
        break;
    case BAG_APP_STATE_CANCEL_MOVE_ITEM:
        *state = BagAppMainTask_FinishMoveItem(appData);
        break;
    case BAG_APP_STATE_APPLY_MOVE_ITEM:
        *state = BagAppMainTask_ApplyMoveItem(appData);
        break;
    case BAG_APP_STATE_HANDLE_SELECTED_ITEM_FOR_SALE:
        *state = BagAppMainTask_HandleSelectedItemForSale(appData);
        break;
    case BAG_APP_STATE_RUN_SPRITE_ANIM_TRANSITION:
        *state = BagAppMainTask_RunSpriteAnimTransition(appData);
        break;
    case BAG_APP_STATE_FADE_TO_EXIT:
        sub_020880CC(1, HEAP_ID_BAG);
        *state = BAG_APP_STATE_WAIT_FADE_AND_EXIT;
        break;
    case BAG_APP_STATE_WAIT_FADE_AND_EXIT:
        if (IsPaletteFadeFinished() == TRUE) {
            return TRUE;
        }
        break;
    }

    BagApp_UpdateSpriteAnims(appData);
    SpriteSystem_DrawSprites(appData->spriteManager);
    BagApp_Update3D(appData);
    return FALSE;
}

BOOL Bag_Exit(OverlayManager *man, int *state) {
    { // scope guard here to prevent use after free
        BagAppData *appData = OverlayManager_GetData(man);

        BagApp_Teardown3D(appData);
        BagApp_FreeSpriteSystem(appData);
        Heap_Free(appData->pocketBgPlttdataRaw[0]);
        Heap_Free(appData->pocketBgPlttdataRaw[1]);
        BagApp_DPPt_CreateItemListMenu(appData);
        BagApp_SaveBagViewToCursor(appData);
        BagApp_RemoveWindows(appData);
        BagApp_TeardownBgLayers(appData->bgConfig);
        sub_02021238();
        GF_DestroyVramTransferManager();
        BagApp_UnloadContextMenuStrings(appData);
        BagApp_DeletePocketNames(appData);
        BagApp_DeleteItemCountStrings_DPPt(appData);
        BagApp_DeleteItemNameStrings(appData);
        String_Delete(appData->formattedStrbuf);
        DestroyMsgData(appData->moveNamesMsgData);
        DestroyMsgData(appData->itemNamesMsgdata);
        DestroyMsgData(appData->msgData);
        MessagePrinter_Delete(appData->msgPrinter);
        MessageFormat_Delete(appData->msgFormat);
        NARC_Delete(appData->graphicsNarc);
    }
    OverlayManager_FreeData(man);
    // possible UB: a vblank intr here results in use after free
    sub_02004B10();
    Main_SetVBlankIntrCB(NULL, NULL);
    Heap_Destroy(HEAP_ID_BAG);
    return TRUE;
}

static void BagApp_GetSaveStructPtrs(BagAppData *appData) {
    appData->bag = Save_Bag_Get(appData->bagView->saveData);
    appData->playerProfile = Save_PlayerData_GetProfile(appData->bagView->saveData);
    appData->options = Save_PlayerData_GetOptionsAddr(appData->bagView->saveData);
}

static RoamerSaveData *BagApp_GetSaveRoamers(BagAppData *appData) {
    return Save_Roamers_Get(appData->bagView->saveData);
}

static void BagApp_SetRepelStepCount(BagAppData *appData, u8 repelSteps) {
    *RoamerSave_GetRepelAddr(BagApp_GetSaveRoamers(appData)) = repelSteps;
}

static void BagApp_SetFlute(BagAppData *appData, u8 flute) {
    RoamerSave_SetFlute(BagApp_GetSaveRoamers(appData), flute);
}

static void BagApp_VBlankIntrCB(void *cbArg) {
    BagAppData *appData = cbArg;

    DoScheduledBgGpuUpdates(appData->bgConfig);
    GF_RunVramTransferTasks();
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void BagApp_SetGfxBanks(void) {
    GraphicsBanks graphicsBanks = {
        GX_VRAM_BG_64_E,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_128_C,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_128_B,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_0_A,
        GX_VRAM_TEXPLTT_01_FG,
    };

    GfGfx_SetBanks(&graphicsBanks);
}

static void BagApp_InitBgLayers(BgConfig *bgConfig) {
    GraphicsModes graphicsModes = {
        GX_DISPMODE_GRAPHICS,
        GX_BGMODE_0,
        GX_BGMODE_0,
        GX_BG0_AS_3D,
    };
    SetBothScreensModesAndDisable(&graphicsModes);

    static const BgTemplate sBgTemplates_Main[3] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe800,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
    };
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &sBgTemplates_Main[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &sBgTemplates_Main[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &sBgTemplates_Main[2], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 32, 0x000, HEAP_ID_BAG);

    static const BgTemplate sBgTemplates_Sub[4] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf800,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xf000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0xe000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .mosaic = 0,
         },
    };

    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &sBgTemplates_Sub[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &sBgTemplates_Sub[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &sBgTemplates_Sub[2], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &sBgTemplates_Sub[3], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 32, 0x000, HEAP_ID_BAG);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 32, 0x000, HEAP_ID_BAG);

    G2_SetBlendAlpha(GX_PLANEMASK_NONE, GX_PLANEMASK_BG3, 0, 0);
}

static void BagApp_TeardownBgLayers(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_ALL, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_ALL & ~GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    Heap_FreeExplicit(HEAP_ID_BAG, bgConfig);
}

static void BagApp_LoadBgGraphics(BagAppData *appData) {
    appData->graphicsNarc = NARC_New(NARC_graphic_bag_bag_graphics, HEAP_ID_BAG);
    GfGfxLoader_LoadCharData(NARC_graphic_bag_bag_graphics, bag_graphics_00007_NCGR, appData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    GfGfxLoader_LoadScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00054_NSCR, appData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    if (appData->gender == PLAYER_GENDER_MALE) {
        GfGfxLoader_LoadScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00094_NSCR, appData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_BAG);
    } else {
        GfGfxLoader_LoadScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00093_NSCR, appData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_BAG);
    }
    GfGfxLoader_GXLoadPal(NARC_graphic_bag_bag_graphics, bag_graphics_00008_NCLR, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_graphic_bag_bag_graphics, bag_graphics_00017_NCLR, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_13_OFFSET, 32, HEAP_ID_BAG);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_11_OFFSET, HEAP_ID_BAG);
    LoadUserFrameGfx1(appData->bgConfig, GF_BG_LYR_MAIN_1, 0x3F7, 14, 0, HEAP_ID_BAG);
    LoadUserFrameGfx2(appData->bgConfig, GF_BG_LYR_MAIN_1, 0x3D9, 12, Options_GetFrame(appData->options), HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_graphic_bag_bag_graphics, bag_graphics_00038_NCLR, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_BAG);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_11_OFFSET, HEAP_ID_BAG);
    GfGfxLoader_LoadCharData(NARC_graphic_bag_bag_graphics, bag_graphics_00046_NCGR, appData->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, HEAP_ID_BAG);
    appData->pocketBgPlttdataRaw[0] = GfGfxLoader_GetPlttData(NARC_graphic_bag_bag_graphics, bag_graphics_00040_NCLR, &appData->pocketBgPlttData[0], HEAP_ID_BAG);
    appData->pocketBgPlttdataRaw[1] = GfGfxLoader_GetPlttData(NARC_graphic_bag_bag_graphics, bag_graphics_00041_NCLR, &appData->pocketBgPlttData[1], HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_graphic_bag_bag_graphics, bag_graphics_00008_NCLR, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_8_OFFSET, 128, HEAP_ID_BAG);
    LoadUserFrameGfx2(appData->bgConfig, GF_BG_LYR_SUB_0, 0x3E2, 12, Options_GetFrame(appData->options), HEAP_ID_BAG);
}

void BagApp_DrawTopScreenUI(BagAppData *appData, BOOL isNotTMHM) {
    if (isNotTMHM == TRUE) {
        GfGfxLoader_LoadScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00054_NSCR, appData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    } else {
        GfGfxLoader_LoadScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00009_NSCR, appData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    }
}

static void BagApp_InitMsgSystem(BagAppData *appData) {
    appData->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0010, HEAP_ID_BAG);
    appData->msgPrinter = MessagePrinter_New(1, 2, 0, HEAP_ID_BAG);
    appData->msgFormat = MessageFormat_New(HEAP_ID_BAG);
    appData->itemNamesMsgdata = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0222, HEAP_ID_BAG);
    appData->moveNamesMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0750, HEAP_ID_BAG);
    appData->formattedStrbuf = String_New(256, HEAP_ID_BAG);
}

static void BagApp_CountActivePockets(BagAppData *appData) {
    appData->numPockets = 0;
    for (u8 i = 0; i < POCKETS_COUNT; ++i) {
        if (appData->bagView->pockets[i].slots != NULL) {
            ++appData->numPockets;
        }
    }
}

u16 BagApp_FetchItemIdOrQuantity(BagAppData *appData, u16 slot, BOOL fetchQuantity) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    if (fetchQuantity == FALSE) {
        return pocket->slots[slot].id;
    } else {
        return pocket->slots[slot].quantity;
    }
}

static void BagApp_GetItemNameIntoString(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID) {
    ReadMsgDataIntoString(msgData, itemId, dest);
}

static void BagApp_GetTMHMMoveNameIntoString(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID) {
    ReadMsgDataIntoString(msgData, TMHMGetMove(itemId), dest);
}

static void BagApp_InitBagViewFromCursor(BagAppData *appData) {
    appData->bagView->curPocket = 0;
    BagViewPocket *pockets = appData->bagView->pockets;
    if (appData->bagView->cursor == NULL) {
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                pockets[i].position = 0;
                pockets[i].scroll = 0;
            }
        }
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                appData->bagView->curPocket = i;
                break;
            }
        }
    } else {
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                u8 position;
                u8 scroll;
                BagCursor_Field_PocketGetPosition(appData->bagView->cursor, pockets[i].pocketId, &position, &scroll);
                pockets[i].position = position;
                pockets[i].scroll = scroll;
            }
        }
        u16 pocket = BagCursor_Field_GetPocket(appData->bagView->cursor);
        if (pockets[pocket].slots == NULL) {
            for (u16 i = 0; i < POCKETS_COUNT; ++i) {
                if (pockets[i].slots != NULL) {
                    pocket = i;
                    break;
                }
            }
        }
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL && pocket == pockets[i].pocketId) {
                appData->bagView->curPocket = i;
                break;
            }
        }
    }
}

static void BagApp_SaveBagViewToCursor(BagAppData *appData) {
    if (appData->bagView->cursor != NULL) {
        BagViewPocket *pockets = appData->bagView->pockets;
        for (u32 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                BagCursor_Field_PocketSetPosition(appData->bagView->cursor, pockets[i].pocketId, pockets[i].position, pockets[i].scroll);
            }
        }
        BagCursor_Field_SetPocket(appData->bagView->cursor, pockets[appData->bagView->curPocket].pocketId);
    }
}

static void BagApp_SetItemNameStringsFromCurPocket(BagAppData *appData) {
    u32 i;
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];

    if (pocket->pocketId == POCKET_TMHMS) {
        for (i = 0; i < sPocketCapacities[pocket->pocketId]; ++i) {
            if (pocket->slots[i].id == ITEM_NONE || pocket->slots[i].quantity == 0) {
                break;
            }
            BagApp_GetTMHMMoveNameIntoString(appData->moveNamesMsgData, appData->itemNameStrings[i], pocket->slots[i].id, HEAP_ID_BAG);
            appData->itemsInPocket[i] = pocket->slots[i].id;
        }
        pocket->count = i;
    } else {
        for (i = 0; i < sPocketCapacities[pocket->pocketId]; ++i) {
            if (pocket->slots[i].id == ITEM_NONE || pocket->slots[i].quantity == 0) {
                break;
            }
            BagApp_GetItemNameIntoString(appData->itemNamesMsgdata, appData->itemNameStrings[i], pocket->slots[i].id, HEAP_ID_BAG);
            appData->itemsInPocket[i] = pocket->slots[i].id;
        }
        pocket->count = i;
    }
    int newScroll;
    if (pocket->count == 0) {
        newScroll = 0;
    } else {
        newScroll = ((pocket->count - 1) / 6) * 6;
    }
    if (pocket->scroll > newScroll) {
        pocket->scroll = newScroll;
    }
}

static void BagApp_CreateItemNameStrings(BagAppData *appData) {
    for (u32 i = 0; i < NUM_BAG_STRINGS; ++i) {
        appData->itemNameStrings[i] = String_New(18, HEAP_ID_BAG);
    }
}

static void BagApp_DeleteItemNameStrings(BagAppData *appData) {
    for (u32 i = 0; i < NUM_BAG_STRINGS; ++i) {
        String_Delete(appData->itemNameStrings[i]);
    }
}

static void LimitItemListScroll(s16 *pScroll, u16 *pPos, u8 limit) {
    if (*pScroll + *pPos > limit) {
        *pScroll = ((limit - 1) / 6) * 6;
    }
    if (*pScroll < 0) {
        *pScroll = 0;
    }
}

static void RestrictItemListCursor(s16 *pScroll, u16 *pPos, u8 limit, u8 numVisibleSlots) {
}

static int BagApp_GetNumItemsOnCurrentPage(BagAppData *appData) {
    int ret = appData->bagView->pockets[appData->bagView->curPocket].count - appData->bagView->pockets[appData->bagView->curPocket].scroll;
    if (ret > 6) {
        ret = 6;
    }
    return ret;
}

static int BagApp_GetMoveItemOriginalSlotOnCurrentPage(BagAppData *appData) {
    int scroll = appData->bagView->pockets[appData->bagView->curPocket].scroll;
    int moveItemOriginalSlot = appData->moveItemOriginalSlot;
    if ((moveItemOriginalSlot / 6) * 6 == scroll) {
        return moveItemOriginalSlot % 6;
    } else {
        return -1;
    }
}

static void BagApp_DPPt_CreateItemListMenu(BagAppData *appData) {
    appData->unk_348 = 0;
}

static void BagApp_UpdateBagViewPocketCursorPos(BagAppData *appData, int cursorPos) {
    if (cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && cursorPos < (BAG_APP_CURSOR_POS_ITEM_1 + 6)) {
        appData->bagView->pockets[appData->bagView->curPocket].position = cursorPos - BAG_APP_CURSOR_POS_ITEM_1;
    }
}

static BOOL BagApp_TouchTargetIsNotTransitioningFromItemsToPocketButtons(BagAppData *appData, int cursorPos) {
    if (cursorPos == BAG_APP_CURSOR_POS_PAGE_LEFT || cursorPos == BAG_APP_CURSOR_POS_PAGE_RIGHT) {
        return FALSE;
    }
    if (cursorPos <= BAG_APP_CURSOR_POS_POCKET_8 && appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
        return FALSE;
    }
    return TRUE;
}

static u16 BagApp_GetCurrentlySelectedItemId(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    u32 itemSlot = pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1;
    if (sPocketCapacities[appData->bagView->curPocket] <= itemSlot) {
        return ITEM_NONE;
    }
    return pocket->slots[itemSlot].id;
}

static void BagApp_UpdateDescriptionOnTopScreen(BagAppData *appData) {
    if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
        u16 itemId = BagApp_GetCurrentlySelectedItemId(appData);
        if (itemId != ITEM_NONE) {
            BagApp_PrintItemDescriptionOnWindow(appData, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION], itemId);
        } else {
            BagApp_ClearItemDescriptionWindow(appData, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        }
    } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_POCKET_8) {
        BagApp_PrintPocketDescriptionOnWindow(appData, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION], appData->cursorPos);
    } else {
        BagApp_ClearItemDescriptionWindow(appData, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
    }
}

static BagAppState BagAppMainTask_HandleInput_Normal(BagAppData *appData) {
    BOOL moved = FALSE;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        ++moved;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][0];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        ++moved;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][1];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        int movement = sMainListDPadDestinations[appData->cursorPos][2];
        if (movement == BAG_APP_CURSOR_POS_PAGE_LEFT) {
            u8 spC;
            return BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_LEFT, &spC, 1, 2, MENU_INPUT_STATE_BUTTONS);
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int new_dest = BagApp_GetPocketNeighbor(appData, appData->cursorPos, -1);
            if (appData->cursorPos != new_dest) {
                appData->cursorPos = new_dest;
                ++moved;
            }
        } else {
            appData->cursorPos = movement;
            ++moved;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        int movement = sMainListDPadDestinations[appData->cursorPos][3];
        if (movement == BAG_APP_CURSOR_POS_PAGE_RIGHT) {
            u8 spB;
            return BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_RIGHT, &spB, 1, 2, MENU_INPUT_STATE_BUTTONS);
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int new_dest = BagApp_GetPocketNeighbor(appData, appData->cursorPos, 1);
            if (appData->cursorPos != new_dest) {
                appData->cursorPos = new_dest;
                ++moved;
            }
        } else {
            appData->cursorPos = movement;
            ++moved;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_L) {
        u8 spA;
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            appData->cursorPos = BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, -1);
            BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
            return BagApp_HandleCursorAction(appData, appData->cursorPos, &spA, 1, 2, MENU_INPUT_STATE_BUTTONS);
        } else {
            return BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, -1), &spA, 1, 2, MENU_INPUT_STATE_BUTTONS);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        u8 sp9;
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            appData->cursorPos = BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, 1);
            BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
            return BagApp_HandleCursorAction(appData, appData->cursorPos, &sp9, 1, 2, MENU_INPUT_STATE_BUTTONS);
        } else {
            return BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, 1), &sp9, 1, 2, MENU_INPUT_STATE_BUTTONS);
        }
    }

    if (appData->cursorPos == BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET) {
        appData->cursorPos = appData->bagView->curPocket;
    }

    if (moved) {
        PlaySE(SEQ_SE_DP_SELECT);
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
        BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        BagApp_UpdateDescriptionOnTopScreen(appData);
    }

    u8 selectedItem = 0;
    u32 touchInput = BagApp_HandleTouchInput(appData, 0);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        if (BagApp_TouchTargetIsNotTransitioningFromItemsToPocketButtons(appData, touchInput)) {
            if (touchInput < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
                if (BagApp_PocketIdToBagViewPosition(appData, touchInput) != -1) {
                    appData->cursorPos = touchInput;
                    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                }
            } else {
                appData->cursorPos = touchInput;
                BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
                    BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
                }
            }
        }
        BagAppState r0 = BagApp_HandleCursorAction(appData, touchInput, &selectedItem, 1, 2, MENU_INPUT_STATE_TOUCH);
        if (r0 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            return r0;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        BagAppState returnState = BagApp_HandleCursorAction(appData, appData->cursorPos, &selectedItem, 1, 2, MENU_INPUT_STATE_BUTTONS);
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        if (returnState != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            return returnState;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        BagAppState returnState = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_CANCEL, &selectedItem, 1, 2, MENU_INPUT_STATE_BUTTONS);
        BagApp_SaveMenuInputStateToBagView(appData, MENU_INPUT_STATE_BUTTONS);
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        if (returnState != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            return returnState;
        }
        // This should be unreachable
    }

    if (selectedItem == 1) {
        return BagApp_SetSpriteAnimationTransitionToNextState(appData, BAG_APP_SPRITE_CURSOR, 41, BAG_APP_STATE_OPEN_CONTEXT_MENU);
    }

    return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
}

static BagAppState BagAppMainTask_OpenContextMenu(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];

    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_CONTEXT, 0, 0);
    BagApp_SwitchItemButtonWindowsToContextMenuMode(appData, pocket->scroll, appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
    BagApp_CenterSelectedItemIconSprite(appData, appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
    BagApp_PrepareContextMenu(appData);
    appData->bagView->itemId = pocket->slots[pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1].id;
    appData->maxQuantity = pocket->slots[pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1].quantity;
    return BAG_APP_STATE_CONTEXT_MENU;
}

static BagAppState BagAppMainTask_TurnPocketPage(BagAppData *appData, int direction) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];

    if (direction > 0) {
        if (pocket->scroll + 6 < pocket->count) {
            pocket->scroll += 6;
        } else {
            pocket->scroll = 0;
        }
    } else {
        if (pocket->scroll - 6 >= 0) {
            pocket->scroll -= 6;
        } else {
            pocket->scroll = ((pocket->count - 1) / 6) * 6;
        }
    }

    if (appData->moveItemMode == TRUE) {
        BagApp_DrawPocketPage_MoveItemMode(appData, pocket);
        BagApp_SetCursorSpritePos_ItemsOnly(appData, appData->moveItemCursorPos);
        return BAG_APP_STATE_MOVE_ITEM;
    } else {
        BagApp_DrawPocketPage_NormalMode(appData, pocket);
        BagApp_UpdateDescriptionOnTopScreen(appData);
        switch (appData->bagView->context) {
        case BAG_VIEW_CONTEXT_MART_SELL:
            return BAG_APP_STATE_SELL_HANDLE_INPUT;
        case BAG_VIEW_CONTEXT_GIVE_ITEM:
            return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
        case BAG_VIEW_CONTEXT_GARDENING:
            return BAG_APP_STATE_GARDENING;
        default:
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
    }
}

static void BagApp_CalcPocketSelectorIconsPos(BagAppData *appData) {
    appData->pocketSelectorIconsX = (90 - (appData->numPockets * 10)) / (appData->numPockets + 1) + 6;
    appData->pocketSelectorIconsSpacing = appData->pocketSelectorIconsX + 4;
}

static BOOL BagApp_ProcessInput_Gardening(BagAppData *appData) {
    static int sDebugVar1 = 0;
    static int sDebugVar2 = 1;

    if (gSystem.newKeys & PAD_BUTTON_DEBUG) {
        ++sDebugVar1;
        if (sDebugVar1 >= sDebugVar2) {
            sDebugVar1 = 0;
        }
        BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_MOVE, sDebugVar2, sDebugVar1);
    }
    return FALSE;
}

static int BagApp_PocketIdToBagViewPosition(BagAppData *appData, u32 pocketId) {
    for (int i = 0; i < 8; ++i) {
        if (appData->bagView->pockets[i].pocketId == pocketId && appData->bagView->pockets[i].slots != NULL) {
            return i;
        }
    }

    return -1;
}

static int BagApp_GetPocketNeighbor(BagAppData *appData, int pocketId, int addend) {
    for (int i = 0; i < 8; ++i) {
        pocketId += addend;
        if (pocketId < 0) {
            pocketId = POCKET_KEY_ITEMS;
        } else if (pocketId == POCKETS_COUNT) {
            pocketId = POCKET_ITEMS;
        }
        if (BagApp_PocketIdToBagViewPosition(appData, pocketId) != -1) {
            break;
        }
    }

    return pocketId;
}

static void BagApp_DrawPocketPage_NormalMode(BagAppData *appData, BagViewPocket *pocket) {
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_RedrawItemNameWindows(appData, pocket->scroll, -1, FALSE);
    BagApp_PrintPageCounter(appData, pocket->count, pocket->scroll, 0);
    BagApp_UpdateItemIconsVisibility(appData, pocket, BagApp_GetNumItemsOnCurrentPage(appData), 1);
}

static BagAppState BagApp_HandleCursorAction(BagAppData *appData, BagAppCursorPos input, u8 *pSelectedItemFlag, int a3, int a4, MenuInputState inputState) {
    BagAppState ret = BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
    switch (input) {
    case BAG_APP_CURSOR_POS_POCKET_1:
    case BAG_APP_CURSOR_POS_POCKET_2:
    case BAG_APP_CURSOR_POS_POCKET_3:
    case BAG_APP_CURSOR_POS_POCKET_4:
    case BAG_APP_CURSOR_POS_POCKET_5:
    case BAG_APP_CURSOR_POS_POCKET_6:
    case BAG_APP_CURSOR_POS_POCKET_7:
    case BAG_APP_CURSOR_POS_POCKET_8: {
        int pocketIndex = BagApp_PocketIdToBagViewPosition(appData, input);
        if (pocketIndex == -1) {
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
        if (pocketIndex == appData->bagView->curPocket && inputState == MENU_INPUT_STATE_BUTTONS) {
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
        appData->bagView->curPocket = pocketIndex;
        BagApp_SetItemNameStringsFromCurPocket(appData);
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_RedrawItemNameWindows(appData, pocket->scroll, -1, 0);
        BagApp_LoadObjPaletteByPocket(appData, appData->bagView->curPocket);
        BagApp_PrintPageCounter(appData, pocket->count, pocket->scroll, 0);
        BagApp_UpdateItemIconsVisibility(appData, pocket, BagApp_GetNumItemsOnCurrentPage(appData), 1);
        BagApp_LoadBgPaletteByPocket(appData, 1, appData->bagView->curPocket);
        PlaySE(SEQ_SE_DP_SELECT);
        BagApp_UpdateDescriptionOnTopScreen(appData);
        if (appData->cursorPos >= 8) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        BagApp_SwitchPlayerModelAnimsToNewPocket(appData);
        BagApp3DState_BeginMoveCamera(&appData->threeDimState, appData->bagView->curPocket + 1, 7);
        break;
    }

    case BAG_APP_CURSOR_POS_ITEM_1:
    case BAG_APP_CURSOR_POS_ITEM_2:
    case BAG_APP_CURSOR_POS_ITEM_3:
    case BAG_APP_CURSOR_POS_ITEM_4:
    case BAG_APP_CURSOR_POS_ITEM_5:
    case BAG_APP_CURSOR_POS_ITEM_6: {
        int slot = input - BAG_APP_CURSOR_POS_ITEM_1;
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        int bagSlot = pocket->scroll + slot;
        if (bagSlot < pocket->count) {
            appData->bagView->itemId = pocket->slots[bagSlot].id;
            *pSelectedItemFlag = TRUE;
            PlaySE(SEQ_SE_DP_SELECT);
        }
        BagApp_UpdateDescriptionOnTopScreen(appData);
        break;
    }

    case BAG_APP_CURSOR_POS_PAGE_RIGHT:
        if (appData->bagView->pockets[appData->bagView->curPocket].count > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            ret = BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_PAGE_RIGHT_BUTTON, 9, 8, BAG_APP_STATE_TURN_POCKET_PAGE_RIGHT);
        }
        break;
    case BAG_APP_CURSOR_POS_PAGE_LEFT:
        if (appData->bagView->pockets[appData->bagView->curPocket].count > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            ret = BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_PAGE_LEFT_BUTTON, 9, 8, BAG_APP_STATE_TURN_POCKET_PAGE_LEFT);
        }
        break;
    case BAG_APP_CURSOR_POS_CANCEL:
        appData->bagView->itemId = ITEM_NONE;
        appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_DONE;
        BagApp_SaveMenuInputStateToBagView(appData, inputState);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        ret = BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_FADE_TO_EXIT);
        break;
    }

    return ret;
}

static BOOL BagAppMainTask_SwitchPocket_DPPt(BagAppData *appData) {
    BagAppData_UnusedPocketSelector *pocketSelector = &appData->pocketSelector;

    if (!System_GetTouchHeld()) {
        pocketSelector->isNotTouchHeld = 1;
    }
    // this function always returns -1
    int nextPocket = BagApp_GetNextPocket_DPPt(appData);
    if (nextPocket == -1 || nextPocket != pocketSelector->nextPocket) {
        pocketSelector->isActive = 1;
    }
    if (!BagApp_DoDPadPocketSwitch_DPPt(appData) && pocketSelector->isNotTouchHeld == 1 && nextPocket != -1) {
        appData->bagView->curPocket = pocketSelector->nextPocket;
        if (pocketSelector->nextPocket > (u8)nextPocket) {
            pocketSelector->nextPocketDirection = 0;
            pocketSelector->animStage = 0;
        } else if (pocketSelector->nextPocket < (u8)nextPocket) {
            pocketSelector->nextPocketDirection = 1;
            pocketSelector->animStage = 0;
        } else {
            pocketSelector->nextPocketDirection = 2;
        }
        pocketSelector->nextPocket = (u8)nextPocket;
        pocketSelector->isActive = 0;
        pocketSelector->isNotTouchHeld = 0;
        pocketSelector->pocketChangeState = 0;
        appData->nextPocket = nextPocket;
        BagApp_StartPocketSwitchPressedButtonAnim_DPPt(appData);
        BagApp3DState_BeginMoveCamera(&appData->threeDimState, appData->nextPocket + 1, 7);
    }
    BagApp_StepPocketSelectorAnim_DPPt(appData);
    BagApp_StepPocketSwitchPressedButtonAnim_DPPt(appData);
    return FALSE;
}

static BOOL BagApp_DoDPadPocketSwitch_DPPt(BagAppData *appData) {
    BagAppData_UnusedPocketSelector *pocketSelector = &appData->pocketSelector;

    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (appData->numPockets == 1) {
            return TRUE;
        }
        PlaySE(SEQ_SE_DP_SELECT);
        appData->bagView->curPocket = pocketSelector->nextPocket;
        if (pocketSelector->nextPocket != 0) {
            --pocketSelector->nextPocket;
            --appData->nextPocket;
        } else {
            pocketSelector->nextPocket = appData->numPockets - 1;
            appData->nextPocket = appData->numPockets - 1;
        }
        pocketSelector->animStage = 0;
        pocketSelector->nextPocketDirection = 0;
        pocketSelector->isNotTouchHeld = 1;
        pocketSelector->isActive = 1;
        pocketSelector->animStarted = 0;
        if (pocketSelector->pocketChangeState != 3) {
            pocketSelector->pocketChangeState = 4;
        }
        BagApp_StartPocketSwitchPressedButtonAnim_DPPt(appData);
        return TRUE;
    }

    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (appData->numPockets == 1) {
            return TRUE;
        }
        PlaySE(SEQ_SE_DP_SELECT);
        appData->bagView->curPocket = pocketSelector->nextPocket;
        if (pocketSelector->nextPocket + 1 < appData->numPockets) {
            ++pocketSelector->nextPocket;
            ++appData->nextPocket;
        } else {
            pocketSelector->nextPocket = 0;
            appData->nextPocket = 0;
        }
        pocketSelector->animStage = 0;
        pocketSelector->nextPocketDirection = 1;
        pocketSelector->isNotTouchHeld = 1;
        pocketSelector->isActive = 1;
        pocketSelector->animStarted = 0;
        if (pocketSelector->pocketChangeState != 3) {
            pocketSelector->pocketChangeState = 4;
        }
        BagApp_StartPocketSwitchPressedButtonAnim_DPPt(appData);
        return TRUE;
    }

    return FALSE;
}

static BOOL BagApp_StepPocketSelectorAnim_DPPt(BagAppData *appData) {
    BagAppData_UnusedPocketSelector *pocketSelector = &appData->pocketSelector;

    switch (pocketSelector->animStage) {
    case 0:
        pocketSelector->animFrame = 0;
        ++pocketSelector->animStage;
        break;
    case 1:
        if (pocketSelector->animFrame < 8) {
            ++pocketSelector->animFrame;
        } else {
            appData->bagView->curPocket = pocketSelector->nextPocket;
            BagApp_SetItemNameStringsFromCurPocket(appData);
            BagApp_RedrawItemNameWindows(appData, appData->bagView->pockets[appData->bagView->curPocket].scroll, -1, 0);
            BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
            BagApp_LoadObjPaletteByPocket(appData, appData->bagView->curPocket);
            BagApp_LoadBgPaletteByPocket(appData, 1, appData->bagView->curPocket);
            LimitItemListScroll(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count);
            RestrictItemListCursor(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count, 6);
            ++pocketSelector->animStage;
            return TRUE;
        }
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

enum {
    BAG_TOUCHSCREEN_MENU_NORMAL,
    BAG_TOUCHSCREEN_MENU_CONTEXT,
    BAG_TOUCHSCREEN_MENU_ITEMS_ONLY,
    BAG_TOUCHSCREEN_MENU_3_DIGIT_QUANTITY_SELECT,
    BAG_TOUCHSCREEN_MENU_2_DIGIT_QUANTITY_SELECT,
};

static u32 BagApp_HandleTouchInput(BagAppData *appData, int whichMenu) {
    static const TouchscreenHitbox *sTouchscreenHitboxes[] = {
        [BAG_TOUCHSCREEN_MENU_NORMAL] = sTouchscreenHitboxes_NormalMenu,
        [BAG_TOUCHSCREEN_MENU_CONTEXT] = sTouchscreenHitboxes_ContextMenu,
        [BAG_TOUCHSCREEN_MENU_ITEMS_ONLY] = sTouchscreenHitboxes_ItemsOnly,
        [BAG_TOUCHSCREEN_MENU_3_DIGIT_QUANTITY_SELECT] = sTouchscreenHitboxes_3DigitQuantitySelect,
        [BAG_TOUCHSCREEN_MENU_2_DIGIT_QUANTITY_SELECT] = sTouchscreenHitboxes_2DigitQuantitySelect,
    };

    return TouchscreenHitbox_FindRectAtTouchNew(sTouchscreenHitboxes[whichMenu]);
}

static int BagApp_GetNextPocket_DPPt(BagAppData *appData) {
    // This might have been a debug function
    return -1;
}

static void BagApp_TransitionDrawStateToMoveItemMode(BagAppData *appData) {
    {
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        appData->moveItemMode = TRUE;
        appData->moveItemOriginalSlot = pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1;
    }
    BagApp_PrintMoveTheItemMessage(appData);
    BagApp_SetMoveItemCursorSpritePosition(appData);
    BagApp_HideContextMenuIcons(appData);
    BagApp_ClearSelectedItemWindow(appData);
    BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
    BagApp_RemoveContextMenuWindows(appData);

    {
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_MOVE, BagApp_GetNumItemsOnCurrentPage(appData), appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
        BagApp_RedrawItemNameWindows(appData, pocket->scroll, appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1, TRUE);
        BagApp_PrintPageCounter(appData, pocket->count, pocket->scroll, 0);
        BagApp_UpdateItemIconsVisibility(appData, pocket, BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_ShowOnlySelectedItemIcon(appData, pocket, pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
        appData->moveItemCursorPos = appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1;
    }
}

static int MoveItemHandleDPad(int curPos) {
    if (gSystem.newKeys & PAD_KEY_UP) {
        return sMoveItemDPadDestinations[curPos][0] - BAG_APP_CURSOR_POS_ITEM_1;
    }
    if (gSystem.newKeys & PAD_KEY_DOWN) {
        return sMoveItemDPadDestinations[curPos][1] - BAG_APP_CURSOR_POS_ITEM_1;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        return sMoveItemDPadDestinations[curPos][2] - BAG_APP_CURSOR_POS_ITEM_1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return sMoveItemDPadDestinations[curPos][3] - BAG_APP_CURSOR_POS_ITEM_1;
    }

    return curPos;
}

static void BagApp_DrawPocketPage_MoveItemMode(BagAppData *appData, BagViewPocket *pocket) {
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_MOVE, BagApp_GetNumItemsOnCurrentPage(appData), BagApp_GetMoveItemOriginalSlotOnCurrentPage(appData));
    BagApp_RedrawItemNameWindows(appData, pocket->scroll, BagApp_GetMoveItemOriginalSlotOnCurrentPage(appData), TRUE);
    BagApp_ShowOnlySelectedItemIcon(appData, pocket, appData->moveItemOriginalSlot);
    BagApp_PrintPageCounter(appData, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->pockets[appData->bagView->curPocket].scroll, 0);
}

static int BagApp_MoveItem_HandleSelectedButton(BagAppData *appData, int newPos) {
    int ret = LIST_NOTHING_CHOSEN;

    switch (newPos) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        if (BagApp_GetNumItemsOnCurrentPage(appData) > newPos) {
            ret = appData->moveItemCursorPos;
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            PlaySE(SEQ_SE_DP_BOX03);
        }
        break;
    case 6:
        ret = 14;
        break;
    case 7:
        ret = 15;
        break;
    case 8:
        ret = LIST_CANCEL;
        break;
    }

    return ret;
}

static BagAppState BagAppMainTask_MoveItem(BagAppData *appData) {
    u32 input = LIST_NOTHING_CHOSEN;
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    u16 newPos = MoveItemHandleDPad(appData->moveItemCursorPos);
    if (appData->moveItemCursorPos != newPos) {
        if (newPos == 6 || newPos == 7) {
            input = BagApp_MoveItem_HandleSelectedButton(appData, newPos);
        } else {
            appData->moveItemCursorPos = newPos;
            BagApp_SetCursorSpritePos_ItemsOnly(appData, appData->moveItemCursorPos);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    }
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_ITEMS_ONLY);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        if (touchInput == 8) {
            input = BagApp_MoveItem_HandleSelectedButton(appData, touchInput);
            BagApp_SetCursorSpritePos_ItemsOnly(appData, touchInput);
        } else if (touchInput == 6 || touchInput == 7) {
            input = BagApp_MoveItem_HandleSelectedButton(appData, touchInput);
        } else {
            appData->moveItemCursorPos = touchInput;
            if (BagApp_GetNumItemsOnCurrentPage(appData) > touchInput) {
                input = BagApp_MoveItem_HandleSelectedButton(appData, touchInput);
            } else {
                PlaySE(SEQ_SE_DP_BOX03);
            }
            BagApp_SetCursorSpritePos_ItemsOnly(appData, appData->moveItemCursorPos);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        input = BagApp_MoveItem_HandleSelectedButton(appData, appData->moveItemCursorPos);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        input = LIST_CANCEL;
    }
    switch (input) {
    case LIST_NOTHING_CHOSEN:
        break;
    case LIST_CANCEL:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        pocket->scroll = appData->moveItemOriginalSlot / 6 * 6;
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_CANCEL_MOVE_ITEM);
    case 14:
        if (pocket->count > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_PAGE_LEFT_BUTTON, 9, 8, BAG_APP_STATE_TURN_POCKET_PAGE_LEFT);
        }
        break;
    case 15:
        if (pocket->count > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_PAGE_RIGHT_BUTTON, 9, 8, BAG_APP_STATE_TURN_POCKET_PAGE_RIGHT);
        }
        break;
    default:
        PlaySE(SEQ_SE_DP_SELECT);
        if (appData->moveItemOriginalSlot == pocket->scroll + appData->moveItemCursorPos) {
            return BagApp_SetSpriteAnimationTransitionToNextState(appData, BAG_APP_SPRITE_CURSOR, 41, BAG_APP_STATE_APPLY_MOVE_ITEM);
        } else {
            return BagApp_SetSpriteAnimationTransitionToNextState(appData, BAG_APP_SPRITE_CURSOR, 42, BAG_APP_STATE_APPLY_MOVE_ITEM);
        }
    }

    return BAG_APP_STATE_MOVE_ITEM;
}

static BagAppState BagAppMainTask_ApplyMoveItem(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    u16 itemPos = pocket->scroll + appData->moveItemCursorPos;
    if (appData->moveItemOriginalSlot != itemPos) {
        MoveItemSlotInList(pocket->slots, appData->moveItemOriginalSlot, itemPos, appData->bagView->curPocket, HEAP_ID_BAG);
        BagApp_SetItemNameStringsFromCurPocket(appData);
        appData->cursorPos = appData->moveItemCursorPos + 8;
        BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
    }
    return BagAppMainTask_FinishMoveItem(appData);
}

static BagAppState BagAppMainTask_FinishMoveItem(BagAppData *appData) {
    appData->unk_348 = 0;
    appData->moveItemMode = FALSE;
    appData->moveItemOriginalSlot = 0;
    appData->unk_674 = 0;
    BagApp_SetMoveItemCursorSpritePosition(appData);
    BagApp_SetItemNameStringsFromCurPocket(appData);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_RedrawItemNameWindows(appData, pocket->scroll, -1, 0);
    BagApp_LoadObjPaletteByPocket(appData, appData->bagView->curPocket);
    BagApp_LoadBgPaletteByPocket(appData, 1, appData->bagView->curPocket);
    BagApp_PrintPageCounter(appData, pocket->count, pocket->scroll, 0);
    BagApp_UpdateItemIconsVisibility(appData, pocket, BagApp_GetNumItemsOnCurrentPage(appData), 1);
    BagApp_ClearItemActionMessageWindow(appData);
    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
    return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
}

static void BagApp_SetMoveItemCursorSpritePosition(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    if (appData->moveItemMode) {
        ManagedSprite_SetPositionXY(appData->sprites[BAG_APP_SPRITE_UNUSED_MOVE_ITEM_CURSOR], 177, 16 * (pocket->position - 1) + 16);
    }
}

static void BagApp_PrepareContextMenu(BagAppData *appData) {
    int i; // forward decl required to match
    u8 stringIndices[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
    ItemData *itemData = LoadItemDataOrGfx(appData->bagView->itemId, ITEMNARC_PARAM, HEAP_ID_BAG);
    u8 pocketId = appData->bagView->pockets[appData->bagView->curPocket].pocketId;
    for (i = 0; i < 5; ++i) {
        appData->contextMenuActions[i] = NULL;
    }
    if (appData->bagView->context == BAG_VIEW_CONTEXT_NORMAL) {
        if (appData->bagView->mapLoadType == MAP_LOAD_TYPE_UNION || appData->bagView->mapLoadType == MAP_LOAD_TYPE_COLOSSEUM) {
            if (appData->bagView->pockets[appData->bagView->curPocket].pocketId == POCKET_MAIL) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_CHECK;
            }
        } else if ((ItemFieldUseFunc)GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FIELDUSEFUNC) != NULL) {
            if (appData->bagView->itemId == ITEM_BICYCLE && appData->bagView->onBike == TRUE) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_WALK;
            } else if (appData->bagView->pockets[appData->bagView->curPocket].pocketId == POCKET_MAIL) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_CHECK;
            } else if (appData->bagView->itemId == ITEM_POFFIN_CASE) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_POFFIN_CASE_OPEN;
            } else if (appData->bagView->pockets[appData->bagView->curPocket].pocketId == POCKET_BERRIES && Leftover_CanPlantBerry(appData->bagView->checkUseData) == TRUE) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_PLANT;
            } else if (appData->bagView->itemId == ITEM_GB_SOUNDS && SoundSys_GetGBSoundsState() == TRUE) {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_STOP_GBSOUNDS;
            } else {
                stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_USE;
            }
        }
        if (!GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PREVENT_TOSS)) {
            if (ItemIdIsNotJohtoBall(appData->bagView->itemId) == TRUE) {
                stringIndices[2] = BAG_ITEM_CONTEXT_MENU_ACTION_GIVE;
            }
            if (pocketId != POCKET_TMHMS) {
                stringIndices[1] = BAG_ITEM_CONTEXT_MENU_ACTION_TRASH;
            }
        }
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SELECTABLE)) {
            if (appData->bagView->itemId == Bag_GetRegisteredItem1(appData->bag) || appData->bagView->itemId == Bag_GetRegisteredItem2(appData->bag)) {
                stringIndices[1] = BAG_ITEM_CONTEXT_MENU_ACTION_DESELECT;
            } else {
                stringIndices[1] = BAG_ITEM_CONTEXT_MENU_ACTION_REGISTER;
            }
        }
    } else if (appData->bagView->context == BAG_VIEW_CONTEXT_BERRY_POTS && IsBerryOrMulch(pocketId, appData->bagView->itemId) == TRUE) {
        stringIndices[0] = BAG_ITEM_CONTEXT_MENU_ACTION_USE_IN_BERRY_POTS;
    }
    if (appData->bagView->context != BAG_VIEW_CONTEXT_BERRY_POTS && pocketId != POCKET_TMHMS && pocketId != POCKET_BERRIES) {
        stringIndices[3] = BAG_ITEM_CONTEXT_MENU_ACTION_MOVE;
    }
    stringIndices[4] = BAG_ITEM_CONTEXT_MENU_ACTION_CANCEL;
    for (i = 0; i < 5; ++i) {
        if (stringIndices[i] != 0xFF) {
            appData->contextMenuActions[i] = sContextMenuFuncs[stringIndices[i]];
        }
    }
    BagApp_DrawContextMenuTopScreen(appData, stringIndices, 5);
    BagApp_PrintContextMenuStrings(appData, stringIndices);
    Heap_Free(itemData);
}

static void BagApp_PrintContextMenuStrings(BagAppData *appData, u8 *indices) {
    appData->moveItemCursorPos = 0;
    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, sCursorPos_ContextMenu[appData->moveItemCursorPos]);
    BagApp_DrawContextMenuButtonSprites(appData, indices);
    BagApp_PrintContextMenuStringOnWindowCentered(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1], appData->contextMenuStrings, indices[0]);
    BagApp_PrintContextMenuStringOnWindowCentered(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_2], appData->contextMenuStrings, indices[1]);
    BagApp_PrintContextMenuStringOnWindowCentered(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_3], appData->contextMenuStrings, indices[2]);
    BagApp_PrintContextMenuStringOnWindowCentered(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_4], appData->contextMenuStrings, indices[3]);
}

static int BagApp_ContextMenu_HandleInput(BagAppData *appData) {
    int input = appData->moveItemCursorPos;
    if (gSystem.newKeys & PAD_KEY_UP) {
        input = sContextMenuDPadDestinations[input][0];
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        input = sContextMenuDPadDestinations[input][1];
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        input = sContextMenuDPadDestinations[input][2];
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        input = sContextMenuDPadDestinations[input][3];
    }
    if (input != appData->moveItemCursorPos) {
        appData->moveItemCursorPos = input;
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, sCursorPos_ContextMenu[input]);
        PlaySE(SEQ_SE_DP_SELECT);
        return LIST_NOTHING_CHOSEN;
    }
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_CONTEXT);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        BagApp_SaveMenuInputStateToBagView(appData, MENU_INPUT_STATE_TOUCH);
        appData->moveItemCursorPos = touchInput;
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, sCursorPos_ContextMenu[touchInput]);
        if (touchInput == 4) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            return LIST_CANCEL;
        } else if (appData->contextMenuActions[touchInput] != NULL) {
            PlaySE(SEQ_SE_DP_SELECT);
            return touchInput;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        if (appData->contextMenuActions[input] != NULL) {
            PlaySE(SEQ_SE_DP_SELECT);
            BagApp_SaveMenuInputStateToBagView(appData, MENU_INPUT_STATE_BUTTONS);
            return input;
        } else if (input == 4) {
            PlaySE(SEQ_SE_DP_SELECT);
            return LIST_CANCEL;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return LIST_CANCEL;
    }
    return LIST_NOTHING_CHOSEN;
}

static void BagApp_DrawDefaultLayout(BagAppData *appData) {
    BagApp_SetItemNameStringsFromCurPocket(appData);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_NORMAL, BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_RedrawItemNameWindows(appData, pocket->scroll, -1, 0);
    BagApp_LoadObjPaletteByPocket(appData, appData->bagView->curPocket);
    BagApp_LoadBgPaletteByPocket(appData, 1, appData->bagView->curPocket);
    BagApp_PrintPageCounter(appData, pocket->count, pocket->scroll, 0);
    BagApp_UpdateItemIconsVisibility(appData, pocket, BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
    BagApp_DrawTopScreenUI(appData, TRUE);
}

static BagAppState BagAppMainTask_ContextMenu(BagAppData *appData) {
    u32 input = BagApp_ContextMenu_HandleInput(appData);
    switch (input) {
    case LIST_NOTHING_CHOSEN:
        break;
    case LIST_CANCEL:
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_CANCEL_CONTEXT_MENU);
    default:
        appData->selectedContextMenuActionId = input;
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, input + BAG_APP_SPRITE_CONTEXT_MENU_ICON_1, 9, 8, BAG_APP_STATE_RUN_CONTEXT_MENU_ACTION);
    }

    return BAG_APP_STATE_CONTEXT_MENU;
}

static BagAppState BagAppMainTask_CancelContextMenu(BagAppData *appData) {
    BagApp_HideContextMenuIcons(appData);
    BagApp_ClearSelectedItemWindow(appData);
    BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
    BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_ClearTMHMDetailsWindow(appData);
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_DrawDefaultLayout(appData);
    return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
}

static BagAppState BagAppMainTask_RunContextMenuAction(BagAppData *appData) {
    BagApp_HideContextMenuIcons(appData);
    BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
    return appData->contextMenuActions[appData->selectedContextMenuActionId](appData);
}

static BagAppState BagApp_ItemContextMenu_Use(BagAppData *appData) {
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    BagApp_HideCursorSprite(appData);
    ItemCheckUseFunc func = GetItemFieldUseFunc(USE_ITEM_TASK_CHECK, GetItemAttr(appData->bagView->itemId, ITEMATTR_FIELDUSEFUNC, HEAP_ID_BAG));
    if (func != NULL) {
        ItemUseError result = func(appData->bagView->checkUseData);
        if (result != ITEMUSEERROR_OKAY) {
            GetItemUseErrorMessage(appData->playerProfile, appData->formattedStrbuf, appData->bagView->itemId, result, HEAP_ID_BAG);
            appData->textPrinterId = BagApp_PrintMessage(appData, 0);
            return BAG_APP_STATE_ITEM_USE_ERROR_WAIT_MESSAGE;
        }
    }
    return BagApp_UseItem(appData);
}

static BagAppState BagAppMainTask_ItemUseError_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
        if (appData->bagView->context != BAG_VIEW_CONTEXT_GARDENING) {
            BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        }
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        BagApp_DrawDefaultLayout(appData);
        if (appData->bagView->context == BAG_VIEW_CONTEXT_GARDENING) {
            return BAG_APP_STATE_GARDENING;
        } else {
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
    }

    return BAG_APP_STATE_ITEM_USE_ERROR_WAIT_MESSAGE;
}

static BagAppState BagApp_UseItem(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    appData->customCallbackState = 0;
    if (pocket->pocketId == POCKET_TMHMS) {
        appData->customCallback = BagApp_UseTMHM;
        return BAG_APP_STATE_USE_ITEM;
    }
    if (TryFormatRegisteredKeyItemUseMessage(appData->bagView->saveData, appData->formattedStrbuf, appData->bagView->itemId, HEAP_ID_BAG) == TRUE) {
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        return BAG_APP_STATE_ITEM_USE_ERROR_WAIT_MESSAGE;
    }
    if (BagApp_TryUseItemInPlace(appData, appData->bagView->itemId) == TRUE) {
        appData->customCallback = BagApp_UseItemInPlaceMessage;
        return BAG_APP_STATE_USE_ITEM;
    }
    sub_020880CC(1, HEAP_ID_BAG);
    appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_USE_ON_PARTYMON;
    return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
}

static BagAppState BagAppMainTask_RunUseItemCallback(BagAppData *appData) {
    return appData->customCallback(appData);
}

static BagAppState BagApp_UseTMHM(BagAppData *appData) {
    switch (appData->customCallbackState) {
    case 0: {
        u16 move = TMHMGetMove(appData->bagView->itemId);
        BufferMoveName(appData->msgFormat, 0, move);
        if (MoveIsHM(move) == TRUE) {
            ReadMsgDataIntoString(appData->msgData, msg_0010_00060, appData->formattedStrbuf);
        } else {
            ReadMsgDataIntoString(appData->msgData, msg_0010_00059, appData->formattedStrbuf);
        }
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        appData->customCallbackState = 1;
    } break;
    case 1:
        if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
            String *r5 = NewString_ReadMsgData(appData->msgData, msg_0010_00061);
            FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], 15);
            StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, r5);
            String_Delete(r5);
            appData->textPrinterId = BagApp_PrintMessage(appData, 0);
            appData->customCallbackState = 2;
        }
        break;
    case 2:
        if (!TextPrinterCheckActive(appData->textPrinterId)) {
            BagApp_CreateYesNoPrompt(appData);
            appData->customCallbackState = 3;
        }
        break;
    case 3:
        switch (YesNoPrompt_HandleInput(appData->yesNoPrompt)) {
        default:
            break;
        case YESNORESPONSE_YES:
            BagApp_DestroyYesNoPrompt(appData);
            sub_020880CC(1, HEAP_ID_BAG);
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_USE_ON_PARTYMON;
            return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
        case YESNORESPONSE_NO:
            BagApp_DestroyYesNoPrompt(appData);
            BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
            ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
            ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
            ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
            BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
            BagApp_ClearTMHMDetailsWindow(appData);
            BagApp_HideContextMenuIcons(appData);
            BagApp_DrawDefaultLayout(appData);
            BagApp_SetCancelButtonDrawFlag(appData, TRUE);
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
        break;
    }

    return BAG_APP_STATE_USE_ITEM;
}

static BOOL BagApp_TryUseItemInPlace(BagAppData *appData, u16 itemId) {
    String *string;

    BufferPlayersName(appData->msgFormat, 0, appData->playerProfile);
    BufferItemName(appData->msgFormat, 1, itemId);
    if (itemId == ITEM_BLACK_FLUTE) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00065);
        BagApp_SetFlute(appData, FLUTE_BLACK);
        appData->quantity = 0;
    } else if (itemId == ITEM_WHITE_FLUTE) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00064);
        BagApp_SetFlute(appData, FLUTE_WHITE);
        appData->quantity = 0;
    } else if (itemId == ITEM_MAX_REPEL || itemId == ITEM_SUPER_REPEL || itemId == ITEM_REPEL) {
        string = BagApp_TryUseRepel(appData, itemId);
    } else if (itemId == ITEM_GB_SOUNDS) {
        string = BagApp_ToggleGBSounds(appData, itemId);
        appData->quantity = 0;
    } else {
        return FALSE;
    }
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    return TRUE;
}

static String *BagApp_TryUseRepel(BagAppData *appData, u16 itemId) {
    if (!RoamerSave_RepelNotInUse(BagApp_GetSaveRoamers(appData))) {
        appData->quantity = 0;
        return NewString_ReadMsgData(appData->msgData, msg_0010_00063);
    }
    BagApp_SetRepelStepCount(appData, GetItemAttr(itemId, ITEMATTR_HOLD_EFFECT_PARAM, HEAP_ID_BAG));
    appData->quantity = 1;
    PlaySE(SEQ_SE_DP_CARD2);
    return NewString_ReadMsgData(appData->msgData, msg_0010_00062);
}

static String *BagApp_ToggleGBSounds(BagAppData *appData, u16 itemId) {
    if (SoundSys_GetGBSoundsState() == TRUE) {
        SoundSys_ToggleGBSounds();
        return NewString_ReadMsgData(appData->msgData, msg_0010_00105);
    } else {
        SoundSys_ToggleGBSounds();
        return NewString_ReadMsgData(appData->msgData, msg_0010_00104);
    }
}

static void BagApp_DepleteItemAfterUse(BagAppData *appData) {
    Pocket_TakeItem(appData->bagView->pockets[appData->bagView->curPocket].slots, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->itemId, appData->quantity, HEAP_ID_BAG);
    BagApp_SetItemNameStringsFromCurPocket(appData);
    LimitItemListScroll(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count);
    RestrictItemListCursor(&appData->bagView->pockets[appData->bagView->curPocket].scroll, &appData->bagView->pockets[appData->bagView->curPocket].position, appData->bagView->pockets[appData->bagView->curPocket].count, 6);
}

static BagAppState BagApp_UseItemInPlaceMessage(BagAppData *appData) {
    switch (appData->customCallbackState) {
    case 0:
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        appData->customCallbackState = 1;
        break;
    case 1:
        if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
            BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
            ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
            ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
            BagApp_DepleteItemAfterUse(appData);
            BagApp_DrawDefaultLayout(appData);
            BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 1);
            BagApp_UpdateDescriptionOnTopScreen(appData);
            ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
            BagApp_SetCancelButtonDrawFlag(appData, TRUE);
            appData->customCallbackState = 0;
            return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
        }
        break;
    }

    return BAG_APP_STATE_USE_ITEM;
}

static BagAppState BagApp_ItemContextMenu_Unk9(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    sub_020880CC(1, HEAP_ID_BAG);
    appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_CHECK_BERRY_TAG;
    return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
}

static BagAppState BagApp_ItemContextMenu_Confirm(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    sub_020880CC(1, HEAP_ID_BAG);
    appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_POFFIN_BERRY_CHOSEN;
    return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
}

static BagAppState BagApp_ItemContextMenu_Trash(BagAppData *appData) {
    appData->quantity = 1;
    BagApp_HideCursorSprite(appData);
    if (Pocket_GetQuantity(appData->bagView->pockets[appData->bagView->curPocket].slots, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->itemId, HEAP_ID_BAG) == 1) {
        BagApp_PrintOkToTrashItemsMessage(appData);
        BagApp_SetCancelButtonDrawFlag(appData, FALSE);
        return BAG_APP_STATE_CONFIRM_TOSS_WAIT_MESSAGE;
    }
    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_TRASH, 0, 0);
    BagApp_ShowQuantitySelectSpritesUI(appData, 3, appData->maxQuantity);
    BagApp_PrintQuantityDigitWindows(appData, 3);
    BagApp_PrintTrashContextOptionOnWindow(appData);
    BagApp_PrintCancel(appData, 1);
    return BAG_APP_STATE_TOSS_SELECT_QUANTITY;
}

static int addWrapped(int base, int limit, int addend) {
    if (addend > 0) {
        if (base == limit) {
            return 1;
        } else if (base + addend > limit) {
            return limit;
        }
    } else {
        if (base == 1) {
            return limit;
        } else if (base + addend <= 0) {
            return 1;
        }
    }
    return base + addend;
}

static BagAppState BagAppMainTask_Toss_SelectQuantity(BagAppData *appData) {
    int input = 0;
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_3_DIGIT_QUANTITY_SELECT);
    if (touchInput != LIST_NOTHING_CHOSEN) {
        switch (BagApp_GetNumberWidthType(appData->maxQuantity)) {
        case 1:
            if (touchInput == 0 || touchInput == 3) {
                touchInput = LIST_NOTHING_CHOSEN;
            }
            break;
        case 2:
            if (touchInput == 0 || touchInput == 1 || touchInput == 3 || touchInput == 4) {
                touchInput = LIST_NOTHING_CHOSEN;
            }
            break;
        }
        switch (touchInput) {
        case 0:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, 100);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP], 26);
            input = 1;
            break;
        case 1:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, 10);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP], 26);
            input = 1;
            break;
        case 2:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, 1);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_UP], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_UP], 26);
            input = 1;
            break;
        case 3:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, -100);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN], 28);
            input = 2;
            break;
        case 4:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, -10);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN], 28);
            input = 2;
            break;
        case 5:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, -1);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_DOWN], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_ONES_PLACE_DOWN], 28);
            input = 2;
            break;
        case 6:
            input = 3;
            break;
        case 7:
            input = 4;
            break;
        }
    } else {
        input = AdjustQuantityUsingDPad(&appData->quantity, appData->maxQuantity);
        if (input == 0) {
            if (gSystem.newKeys & PAD_BUTTON_A) {
                input = 3;
            } else if (gSystem.newKeys & PAD_BUTTON_B) {
                input = 4;
            }
        }
    }
    switch (input) {
    case 0:
        break;
    case 1:
    case 2:
        BagApp_PrintQuantityDigitWindows(appData, 3);
        PlaySE(SEQ_SE_DP_BAG_004);
        return BAG_APP_STATE_TOSS_SELECT_QUANTITY;
    case 3:
        PlaySE(SEQ_SE_DP_SELECT);
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_A_BUTTON, 9, 8, BAG_APP_STATE_CONFIRM_TOSS_PRINT_MESSAGE);
    case 4:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_ABORT_TOSS);
    }
    return BAG_APP_STATE_TOSS_SELECT_QUANTITY;
}

static BagAppState BagAppMainTask_ConfirmToss_PrintMessage(BagAppData *appData) {
    BagApp_PrintOkToTrashItemsMessage(appData);
    BagApp_HideQuantitySelectSpritesUI(appData);
    BagApp_HideCursorSprite(appData);
    BagApp_ClearTextOnSellOrTrashButton(appData);
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    return BAG_APP_STATE_CONFIRM_TOSS_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_AbortToss(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_DrawDefaultLayout(appData);
    BagApp_HideQuantitySelectSpritesUI(appData);
    BagApp_PrintCancel(appData, 0);
    ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 0);
    ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 16);
    return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
}

static BagAppState BagAppMainTask_ConfirmToss_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId)) {
        BagApp_CreateYesNoPrompt(appData);
        return BAG_APP_STATE_CONFIRM_TOSS_HANDLE_YESNO;
    }

    return BAG_APP_STATE_CONFIRM_TOSS_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_ConfirmToss_HandleYesNo(BagAppData *appData) {
    switch ((u32)YesNoPrompt_HandleInput(appData->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        BagApp_DestroyYesNoPrompt(appData);
        {
            String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00054);
            if (appData->quantity == 1) {
                BufferItemName(appData->msgFormat, 0, appData->bagView->itemId);
            } else {
                BufferItemNamePlural(appData->msgFormat, 0, appData->bagView->itemId);
            }
            BufferIntegerAsString(appData->msgFormat, 1, appData->quantity, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
            String_Delete(string);
        }
        FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], 15);
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        return BAG_APP_STATE_COMPLETE_TOSS_WAIT_MESSAGE;
    case LIST_NOTHING_CHOSEN:
        break;
    case YESNORESPONSE_NO:
        BagApp_DestroyYesNoPrompt(appData);
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        BagApp_DrawDefaultLayout(appData);
        return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
    }

    return BAG_APP_STATE_CONFIRM_TOSS_HANDLE_YESNO;
}

static BagAppState BagAppMainTask_CompleteToss_WaitMessage(BagAppData *appData) {
    if (TextPrinterCheckActive(appData->textPrinterId)) {
        return BAG_APP_STATE_COMPLETE_TOSS_WAIT_MESSAGE;
    }
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
    return BAG_APP_STATE_COMPLETE_TOSS_WAIT_BUTTON;
}

static BagAppState BagAppMainTask_CompleteToss_WaitButton(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        Pocket_TakeItem(appData->bagView->pockets[appData->bagView->curPocket].slots, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->itemId, appData->quantity, HEAP_ID_BAG);
        BagApp_SetItemNameStringsFromCurPocket(appData);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 1);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_DrawDefaultLayout(appData);
        BagApp_UpdateDescriptionOnTopScreen(appData);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
    }

    return BAG_APP_STATE_COMPLETE_TOSS_WAIT_BUTTON;
}

static BagAppState BagApp_ItemContextMenu_Register(BagAppData *appData) {
    if (!Bag_TryRegisterItem(appData->bag, appData->bagView->itemId)) {
        String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00103);
        FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], 15);
        StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
        String_Delete(string);
        BagApp_PrintMessage(appData, 0);
        BagApp_HideContextMenuIcons(appData);
        BagApp_HideCursorSprite(appData);
        BagApp_SetCancelButtonDrawFlag(appData, FALSE);
        return BAG_APP_STATE_REGISTER_FAIL_WAIT_MESSAGE;
    } else {
        BagApp_HideContextMenuIcons(appData);
        BagApp_ClearSelectedItemWindow(appData);
        BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_DrawDefaultLayout(appData);
        return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
    }
}

static BagAppState BagAppMainState_RegisterItemFailed_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        BagApp_HideContextMenuIcons(appData);
        BagApp_ClearSelectedItemWindow(appData);
        BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_DrawDefaultLayout(appData);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
    }

    return BAG_APP_STATE_REGISTER_FAIL_WAIT_MESSAGE;
}

static BagAppState BagApp_ItemContextMenu_Deselect(BagAppData *appData) {
    Bag_UnregisterItem(appData->bag, appData->bagView->itemId);
    BagApp_HideContextMenuIcons(appData);
    BagApp_ClearSelectedItemWindow(appData);
    BagApp_ClearFourWindowsAt(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1]);
    BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_ClearTMHMDetailsWindow(appData);
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_DrawDefaultLayout(appData);
    return BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE;
}

static BagAppState BagApp_ItemContextMenu_Move(BagAppData *appData) {
    BagApp_TransitionDrawStateToMoveItemMode(appData);
    return BAG_APP_STATE_MOVE_ITEM;
}

static BagAppState BagApp_ItemContextMenu_Give(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    BagApp_HideCursorSprite(appData);
    sub_020880CC(1, HEAP_ID_BAG);
    appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_ITEM;
    return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
}

static BagAppState BagAppMainTask_HandleInput_GiveItem(BagAppData *appData) {
    int moved = 0;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        ++moved;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][0];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        ++moved;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][1];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        u8 input = sMainListDPadDestinations[appData->cursorPos][2];
        if (input == BAG_APP_CURSOR_POS_PAGE_LEFT) {
            u8 selectedItemFlag;
            BagAppState r0 = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_LEFT, &selectedItemFlag, 0, 2, MENU_INPUT_STATE_BUTTONS);
            if (r0 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
                return r0;
            }
            return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int r0 = BagApp_GetPocketNeighbor(appData, appData->cursorPos, -1);
            if (appData->cursorPos != r0) {
                appData->cursorPos = r0;
                ++moved;
            }
        } else {
            appData->cursorPos = input;
            ++moved;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        u8 input = sMainListDPadDestinations[appData->cursorPos][3];
        if (input == BAG_APP_CURSOR_POS_PAGE_RIGHT) {
            u8 selectedItemFlag;
            BagAppState r0 = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_RIGHT, &selectedItemFlag, 0, 2, MENU_INPUT_STATE_BUTTONS);
            if (r0 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
                return r0;
            }
            return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int r0 = BagApp_GetPocketNeighbor(appData, appData->cursorPos, 1);
            if (appData->cursorPos != r0) {
                appData->cursorPos = r0;
                ++moved;
            }
        } else {
            appData->cursorPos = input;
            ++moved;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_L) {
        u8 selectedItemFlag;
        BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, -1), &selectedItemFlag, 1, 2, MENU_INPUT_STATE_BUTTONS);
        return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        u8 selectedItemFlag;
        BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, 1), &selectedItemFlag, 1, 2, MENU_INPUT_STATE_BUTTONS);
        return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
    }
    if (appData->cursorPos == BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET) {
        appData->cursorPos = appData->bagView->curPocket;
    }
    if (moved) {
        PlaySE(SEQ_SE_DP_SELECT);
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
        BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        BagApp_UpdateDescriptionOnTopScreen(appData);
    }
    u8 sp8 = 0;
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_NORMAL);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        if (BagApp_TouchTargetIsNotTransitioningFromItemsToPocketButtons(appData, touchInput)) {
            if (touchInput < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
                if (BagApp_PocketIdToBagViewPosition(appData, touchInput) != -1) {
                    appData->cursorPos = touchInput;
                    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                }
            } else {
                appData->cursorPos = touchInput;
                BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
                    BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
                }
            }
        }
        BagAppState r1 = BagApp_HandleCursorAction(appData, touchInput, &sp8, 0, 2, MENU_INPUT_STATE_TOUCH);
        if (r1 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU;
            return r1;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        BagAppState r4_3 = BagApp_HandleCursorAction(appData, appData->cursorPos, &sp8, 0, 2, MENU_INPUT_STATE_BUTTONS);
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        if (r4_3 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU;
            return r4_3;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        BagAppState r4_4 = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_CANCEL, &sp8, 0, 2, MENU_INPUT_STATE_BUTTONS);
        appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU;
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        return r4_4;
    }
    if (sp8 == 1) {
        if (GetItemAttr(appData->bagView->itemId, ITEMATTR_PREVENT_TOSS, HEAP_ID_BAG) || !ItemIdIsNotJohtoBall(appData->bagView->itemId)) {
            BufferItemName(appData->msgFormat, 0, appData->bagView->itemId);
            String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00047);
            StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
            String_Delete(string);
            appData->textPrinterId = BagApp_PrintMessage(appData, 0);
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_DONE;
            return BAG_APP_STATE_GIVE_ITEM_ERROR_WAIT_MESSAGE;
        } else {
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU;
            return BagApp_SetSpriteAnimationTransitionToNextState(appData, BAG_APP_SPRITE_CURSOR, 41, BAG_APP_STATE_FADE_TO_EXIT);
        }
    }

    return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
}

static BagAppState BagAppMainTask_GiveItemError_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        BagApp_RedrawItemNameWindows(appData, appData->bagView->pockets[appData->bagView->curPocket].scroll, -1, 0);
        return BAG_APP_STATE_HANDLE_INPUT_GIVE_ITEM;
    }

    return BAG_APP_STATE_GIVE_ITEM_ERROR_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_HandleInput_Sell(BagAppData *appData) {
    int r4 = 0;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        ++r4;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][0];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        ++r4;
        appData->cursorPos = sMainListDPadDestinations[appData->cursorPos][1];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        u8 r3 = sMainListDPadDestinations[appData->cursorPos][2];
        if (r3 == BAG_APP_CURSOR_POS_PAGE_LEFT) {
            u8 spC;
            BagAppState r0 = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_LEFT, &spC, 1, 4, MENU_INPUT_STATE_BUTTONS);
            if (r0 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
                return r0;
            }
            return BAG_APP_STATE_SELL_HANDLE_INPUT;
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int r0 = BagApp_GetPocketNeighbor(appData, appData->cursorPos, -1);
            if (appData->cursorPos != r0) {
                appData->cursorPos = r0;
                ++r4;
            }
        } else {
            appData->cursorPos = r3;
            ++r4;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        u8 r3 = sMainListDPadDestinations[appData->cursorPos][3];
        if (r3 == BAG_APP_CURSOR_POS_PAGE_RIGHT) {
            u8 spB;
            BagAppState r0 = BagApp_HandleCursorAction(appData, BAG_APP_CURSOR_POS_PAGE_RIGHT, &spB, 1, 4, MENU_INPUT_STATE_BUTTONS);
            if (r0 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
                return r0;
            }
            return BAG_APP_STATE_SELL_HANDLE_INPUT;
        } else if (appData->cursorPos == BAG_APP_CURSOR_POS_CANCEL) {
        } else if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            int r0 = BagApp_GetPocketNeighbor(appData, appData->cursorPos, 1);
            if (appData->cursorPos != r0) {
                appData->cursorPos = r0;
                ++r4;
            }
        } else {
            appData->cursorPos = r3;
            ++r4;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_L) {
        u8 spA;
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            appData->cursorPos = BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, -1);
            BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
            BagApp_HandleCursorAction(appData, appData->cursorPos, &spA, 1, 4, MENU_INPUT_STATE_BUTTONS);
        } else {
            BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, -1), &spA, 1, 4, MENU_INPUT_STATE_BUTTONS);
        }
        return BAG_APP_STATE_SELL_HANDLE_INPUT;
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        u8 sp9;
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_POCKET_1 && appData->cursorPos < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
            appData->cursorPos = BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, 1);
            BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
            BagApp_HandleCursorAction(appData, appData->cursorPos, &sp9, 1, 4, MENU_INPUT_STATE_BUTTONS);
        } else {
            BagApp_HandleCursorAction(appData, BagApp_GetPocketNeighbor(appData, appData->bagView->curPocket, 1), &sp9, 1, 4, MENU_INPUT_STATE_BUTTONS);
        }
        return BAG_APP_STATE_SELL_HANDLE_INPUT;
    }
    if (appData->cursorPos == BAG_APP_CURSOR_POS_RESET_TO_CURR_POCKET) {
        appData->cursorPos = appData->bagView->curPocket;
    }
    if (r4) {
        PlaySE(SEQ_SE_DP_SELECT);
        BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
        BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        BagApp_UpdateDescriptionOnTopScreen(appData);
    }
    u8 selectedItem = 0;
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_NORMAL);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        if (BagApp_TouchTargetIsNotTransitioningFromItemsToPocketButtons(appData, touchInput)) {
            if (touchInput < BAG_APP_CURSOR_POS_POCKET_8 + 1) {
                if (BagApp_PocketIdToBagViewPosition(appData, touchInput) != -1) {
                    appData->cursorPos = touchInput;
                    BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                }
            } else {
                appData->cursorPos = touchInput;
                BagApp_SetCursorSpritePos_PocketsItemsContext(appData, appData->cursorPos);
                if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
                    BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
                }
            }
        }
        BagAppState r1 = BagApp_HandleCursorAction(appData, touchInput, &selectedItem, 1, 4, MENU_INPUT_STATE_TOUCH);
        if (r1 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_DONE;
            return r1;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        BagAppState r4_3 = BagApp_HandleCursorAction(appData, appData->cursorPos, &selectedItem, 1, 4, MENU_INPUT_STATE_BUTTONS);
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        if (r4_3 != BAG_APP_STATE_HANDLE_INPUT_NORMAL_MODE) {
            appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_DONE;
            return r4_3;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        appData->bagView->itemId = ITEM_NONE;
        appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_DONE;
        BagApp_SaveMenuInputStateToBagView(appData, MENU_INPUT_STATE_BUTTONS);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        if (appData->cursorPos >= BAG_APP_CURSOR_POS_ITEM_1 && appData->cursorPos <= BAG_APP_CURSOR_POS_ITEM_6) {
            BagApp_UpdateBagViewPocketCursorPos(appData, appData->cursorPos);
        }
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_FADE_TO_EXIT);
    }
    if (selectedItem == 1) {
        return BagApp_SetSpriteAnimationTransitionToNextState(appData, BAG_APP_SPRITE_CURSOR, 41, BAG_APP_STATE_HANDLE_SELECTED_ITEM_FOR_SALE);
    }

    return BAG_APP_STATE_SELL_HANDLE_INPUT;
}

static BagAppState BagAppMainTask_HandleSelectedItemForSale(BagAppData *appData) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];

    BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_SELL, 0, 0);
    appData->quantity = 1;
    appData->unitSellPrice = GetItemAttr(appData->bagView->itemId, ITEMATTR_PRICE, HEAP_ID_BAG) >> 1;
    BagApp_DrawItemBgButtons_NormalMode(appData->bgConfig, GF_BG_LYR_SUB_1, 0);
    ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_1);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_LEFT_BUTTON], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[BAG_APP_SPRITE_PAGE_RIGHT_BUTTON], FALSE);
    BagApp_SetPocketIconsDrawFlag(appData, 0);
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    BagApp_SwitchItemButtonWindowsToContextMenuMode(appData, pocket->scroll, appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
    BagApp_CenterSelectedItemIconSprite(appData, appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1);
    BagApp_PrintItemDescriptionOnWindow(appData, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION], appData->bagView->itemId);
    BagApp_HideCursorSprite(appData);
    if (GetItemAttr(appData->bagView->itemId, ITEMATTR_PREVENT_TOSS, HEAP_ID_BAG) || appData->unitSellPrice == 0) {
        String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00076);
        BufferItemName(appData->msgFormat, 0, appData->bagView->itemId);
        StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
        String_Delete(string);
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        return BAG_APP_STATE_COMPLETE_SALE_WAIT_MESSAGE;
    }
    BagApp_PrintMoneyOnWindow(appData, 0);
    BagApp_PrintSaleTotalInWindow(appData);
    BagApp_PrintQuantityDigitWindows(appData, 2);
    if (Pocket_GetQuantity(appData->bagView->pockets[appData->bagView->curPocket].slots, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->itemId, HEAP_ID_BAG) == 1) {
        String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00078);
        BufferIntegerAsString(appData->msgFormat, 0, appData->quantity * appData->unitSellPrice, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
        StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
        String_Delete(string);
        appData->textPrinterId = BagApp_PrintMessage(appData, 1);
        return BAG_APP_STATE_CONFIRM_SALE_WAIT_MESSAGE;
    }
    appData->maxQuantity = pocket->slots[pocket->scroll + appData->cursorPos - BAG_APP_CURSOR_POS_ITEM_1].quantity;
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00077);
    BufferItemName(appData->msgFormat, 0, appData->bagView->itemId);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    appData->textPrinterId = BagApp_PrintMessage(appData, 1);
    return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_SellItem_ChooseQuanity_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId)) {
        if (appData->maxQuantity > 99) {
            appData->maxQuantity = 99;
        }
        BagApp_DrawScreenLayout(appData, BAG_BG_LAYOUT_SELL, 0, 0);
        BagApp_ShowQuantitySelectSpritesUI(appData, 2, appData->maxQuantity);
        BagApp_PrintSellContextOptionOnWindow(appData);
        BagApp_PrintCancel(appData, 1);
        BagApp_SetBButtonSpriteDrawFlag(appData, TRUE);
        BagApp_SetCursorSpritePos_QuantitySelect(appData, 0);
        return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY;
    }

    return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_SellItem_ChooseQuantity(BagAppData *appData) {
    int input = 0;
    u32 touchInput = BagApp_HandleTouchInput(appData, BAG_TOUCHSCREEN_MENU_2_DIGIT_QUANTITY_SELECT);
    if (touchInput != TOUCH_MENU_NO_INPUT) {
        if (BagApp_GetNumberWidthType(appData->maxQuantity) == 2) {
            if (touchInput == 0 || touchInput == 2) {
                touchInput = TOUCH_MENU_NO_INPUT;
            }
        }
        switch (touchInput) {
        case 0:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, 10);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_UP], 26);
            input = 1;
            break;
        case 1:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, 1);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_UP], 26);
            input = 1;
            break;
        case 2:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, -10);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_HUNDREDS_PLACE_DOWN], 28);
            input = 2;
            break;
        case 3:
            appData->quantity = addWrapped(appData->quantity, appData->maxQuantity, -1);
            ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN], 0);
            ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_TOSS_QUANTITY_TENS_PLACE_DOWN], 28);
            input = 2;
            break;
        case 4:
            input = 3;
            break;
        case 5:
            input = 4;
            break;
        }
    } else {
        input = AdjustQuantityUsingDPad(&appData->quantity, appData->maxQuantity);
        if (input == 0) {
            if (gSystem.newKeys & PAD_BUTTON_A) {
                input = 3;
            } else if (gSystem.newKeys & PAD_BUTTON_B) {
                input = 4;
            }
        }
    }
    switch (input) {
    case 0:
        break;
    case 1:
        BagApp_PrintSaleTotalInWindow(appData);
        BagApp_PrintQuantityDigitWindows(appData, 2);
        PlaySE(SEQ_SE_DP_BAG_004);
        return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY;
    case 2:
        BagApp_PrintSaleTotalInWindow(appData);
        BagApp_PrintQuantityDigitWindows(appData, 2);
        PlaySE(SEQ_SE_DP_BAG_004);
        return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY;
    case 3:
        PlaySE(SEQ_SE_DP_SELECT);
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_A_BUTTON, 9, 8, BAG_APP_STATE_SELL_ITEM_PRINT_FINAL_CONFIRMATION);
    case 4:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return BagApp_SetSpritePaletteAnimTransitionToNextState(appData, BAG_APP_SPRITE_B_BUTTON, 9, 8, BAG_APP_STATE_SELL_ITEM_ABORT);
    }

    return BAG_APP_STATE_SELL_ITEM_CHOOSE_QUANTITY;
}

static BagAppState BagAppMainTask_SellItem_PrintFinalConfirmation(BagAppData *appData) {
    sub_0200E5D4(&appData->windows_main[BAG_APP_WINDOW_MAIN_4], TRUE);
    BagApp_ClearTextOnSellOrTrashButton(appData);
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], 15);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00078);
    BufferIntegerAsString(appData->msgFormat, 0, appData->quantity * appData->unitSellPrice, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    appData->textPrinterId = BagApp_PrintMessage(appData, 1);
    BagApp_HideQuantitySelectSpritesUI(appData);
    BagApp_HideCursorSprite(appData);
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    return BAG_APP_STATE_CONFIRM_SALE_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_SellItem_Abort(BagAppData *appData) {
    appData->unitSellPrice = 0;
    sub_0200E5D4(&appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY], TRUE);
    sub_0200E5D4(&appData->windows_main[BAG_APP_WINDOW_MAIN_4], TRUE);
    ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
    BagApp_HideQuantitySelectSpritesUI(appData);
    BagApp_HideCursorSprite(appData);
    BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
    BagApp_ClearTMHMDetailsWindow(appData);
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_DrawDefaultLayout(appData);
    BagApp_SetPocketIconsDrawFlag(appData, 1);
    BagApp_SetCancelButtonDrawFlag(appData, TRUE);
    return BAG_APP_STATE_SELL_HANDLE_INPUT;
}

static BagAppState BagAppMainTask_ConfirmSale_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId)) {
        BagApp_CreateYesNoPrompt(appData);
        return BAG_APP_STATE_CONFIRM_SALE_WAIT_YESNO;
    }

    return BAG_APP_STATE_CONFIRM_SALE_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_ConfirmSale_HandleYesNo(BagAppData *appData) {
    u32 response = YesNoPrompt_HandleInput(appData->yesNoPrompt);
    switch (response) {
    case YESNORESPONSE_YES:
        BagApp_DestroyYesNoPrompt(appData);
        {
            String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00079);
            if (appData->quantity > 1) {
                BufferItemNamePlural(appData->msgFormat, 0, appData->bagView->itemId);
            } else {
                BufferItemName(appData->msgFormat, 0, appData->bagView->itemId);
            }
            BufferIntegerAsString(appData->msgFormat, 1, appData->quantity * appData->unitSellPrice, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
            StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
            String_Delete(string);
        }
        appData->textPrinterId = BagApp_PrintMessage(appData, 0);
        return BAG_APP_STATE_COMPLETE_SALE;
    case LIST_NOTHING_CHOSEN:
        break;
    case YESNORESPONSE_NO:
        BagApp_DestroyYesNoPrompt(appData);
        appData->unitSellPrice = 0;
        sub_0200E5D4(&appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY], TRUE);
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 0);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_DrawDefaultLayout(appData);
        BagApp_SetPocketIconsDrawFlag(appData, 1);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        return BAG_APP_STATE_SELL_HANDLE_INPUT;
    }

    return BAG_APP_STATE_CONFIRM_SALE_WAIT_YESNO;
}

static BagAppState BagAppMainTask_CompleteSale(BagAppData *appData) {
    if (TextPrinterCheckActive(appData->textPrinterId)) {
        return BAG_APP_STATE_COMPLETE_SALE;
    }
    PlaySE(SEQ_SE_DP_REGI);
    PlayerProfile_AddMoney(appData->playerProfile, appData->quantity * appData->unitSellPrice);
    if (appData->quantity == 1) {
        if (appData->bagView->soldAmount != 0xFF) {
            ++appData->bagView->soldAmount;
        }
    } else {
        appData->bagView->soldAmount = 2;
    }
    Pocket_TakeItem(appData->bagView->pockets[appData->bagView->curPocket].slots, appData->bagView->pockets[appData->bagView->curPocket].count, appData->bagView->itemId, appData->quantity, HEAP_ID_BAG);
    BagApp_SetItemNameStringsFromCurPocket(appData);
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
    return BAG_APP_STATE_COMPLETE_SALE_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_CompleteSale_WaitMessage(BagAppData *appData) {
    if (!TextPrinterCheckActive(appData->textPrinterId) && (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B) || gSystem.touchNew)) {
        appData->unitSellPrice = 0;
        sub_0200E5D4(&appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY], TRUE);
        ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE]);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        BagApp_UpdateItemIconsVisibility(appData, &appData->bagView->pockets[appData->bagView->curPocket], BagApp_GetNumItemsOnCurrentPage(appData), 1);
        BagApp_ClearTMHMDetailsWindow(appData);
        BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
        BagApp_DrawDefaultLayout(appData);
        BagApp_UpdateDescriptionOnTopScreen(appData);
        BagApp_SetPocketIconsDrawFlag(appData, 1);
        BagApp_SetCancelButtonDrawFlag(appData, TRUE);
        return BAG_APP_STATE_SELL_HANDLE_INPUT;
    }

    return BAG_APP_STATE_COMPLETE_SALE_WAIT_MESSAGE;
}

static BagAppState BagAppMainTask_Gardening(BagAppData *appData) {
    if (BagApp_ProcessInput_Gardening(appData) == TRUE) {
        // unreachable
        return BAG_APP_STATE_SWITCH_POCKET_DPPT;
    }

    return BAG_APP_STATE_GARDENING;
}

static BagAppState BagApp_ItemContextMenu_UseInBerryPots(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(appData);
    BagApp_SetCancelButtonDrawFlag(appData, FALSE);
    BagApp_HideCursorSprite(appData);
    sub_020880CC(1, HEAP_ID_BAG);
    appData->bagView->returnCode = BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU;
    return BAG_APP_STATE_WAIT_FADE_AND_EXIT;
}

BOOL IsBerryOrMulch(u8 pocketId, u16 itemId) {
    return pocketId == POCKET_BERRIES || (itemId >= ITEM_GROWTH_MULCH && itemId < (ITEM_GOOEY_MULCH + 1));
}

static void BagApp_LoadBgPaletteByPocket(BagAppData *appData, int a1, int pocket) {
    const u16 *r5 = appData->pocketBgPlttData[a1]->pRawData;
    if (pocket <= 7) {
        GXS_LoadBGPltt(r5 + 16 * pocket, 0, 32);
        GXS_LoadBGPltt(r5 + 16 * pocket, 32, 64);
        GXS_LoadBGPltt(r5 + 16 * pocket, 96, 32);
    }
}

//        mode, srcX, srcY, dstX, dstY, width, height, unused
//        mode=1: copy
//        mode=2: zero out
static u8 sTilemapCommands_ItemButtons[6][4][8] = {
    {
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 2, 0, 0, 0, 4, 32, 16, 0 },
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 0, 0, 0, 16, 4, 16, 16, 0 },
     },
    {
     { 1, 0, 19, 0, 9, 16, 1, 0 },
     { 2, 0, 0, 0, 10, 16, 10, 0 },
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 2, 0, 0, 16, 4, 16, 16, 0 },
     },
    {
     { 1, 0, 19, 0, 9, 16, 1, 0 },
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 1, 16, 19, 16, 9, 16, 1, 0 },
     { 2, 0, 0, 0, 10, 32, 10, 0 },
     },
    {
     { 1, 0, 19, 0, 14, 16, 1, 0 },
     { 2, 0, 0, 0, 15, 16, 5, 0 },
     { 1, 16, 19, 16, 9, 16, 1, 0 },
     { 2, 0, 0, 16, 10, 16, 10, 0 },
     },
    {
     { 1, 0, 19, 0, 14, 16, 1, 0 },
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 1, 16, 19, 16, 14, 16, 1, 0 },
     { 2, 0, 0, 0, 15, 32, 5, 0 },
     },
    {
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 0, 0, 0, 0, 0, 0, 0, 0 },
     { 1, 16, 19, 16, 14, 16, 1, 0 },
     { 2, 0, 0, 16, 15, 16, 5, 0 },
     },
};

static void BagApp_DrawItemBgButtons_NormalMode(BgConfig *bgConfig, int bgId, int limit) {
    u16 *tilemapBuffer = GetBgTilemapBuffer(bgConfig, bgId);

    if (limit != 6) {
        const u8(*r5)[8] = sTilemapCommands_ItemButtons[limit];
        for (int i = 0; i < 4; ++i) {
            if (r5[i][0] == 1) {
                LoadRectToBgTilemapRect(bgConfig, bgId, tilemapBuffer + (r5[i][1] + 32 * r5[i][2]), r5[i][3], r5[i][4], r5[i][5], r5[i][6]);
            } else if (r5[i][0] == 2) {
                FillBgTilemapRect(bgConfig, bgId, 0, r5[i][3], r5[i][4], r5[i][5], r5[i][6], 0);
            }
        }
    }
}

static u8 sMoveModeFillBgParam[5][2][4] = {
    {
     { 0, 11, 16, 9 },
     { 16, 6, 16, 16 },
     },
    {
     { 0, 11, 32, 9 },
     { 0, 0, 0, 0 },
     },
    {
     { 0, 16, 16, 4 },
     { 16, 11, 16, 9 },
     },
    {
     { 0, 16, 32, 4 },
     { 0, 0, 0, 0 },
     },
    {
     { 0, 0, 0, 0 },
     { 16, 16, 16, 4 },
     },
};

static u8 sMoveModeDrawSelectedItemButtonParam[6][4] = {
    { 0,  4,  16, 6 },
    { 16, 4,  16, 6 },
    { 0,  9,  16, 6 },
    { 16, 9,  16, 6 },
    { 0,  14, 16, 6 },
    { 16, 14, 16, 6 },
};

static void BagApp_DrawItemBgButtons_MoveMode(BgConfig *bgConfig, int bgId, int limit, int cursorPos) {

    u16 *tilemapBuffer = GetBgTilemapBuffer(bgConfig, bgId);

    const u8(*r5)[4] = sMoveModeFillBgParam[limit - 1];
    for (int i = 0; i < 2; ++i) {
        FillBgTilemapRect(bgConfig, bgId, 0, r5[i][0], r5[i][1], r5[i][2], r5[i][3], 0);
    }
    if (cursorPos != -1) {
        const u8 *r3 = sMoveModeDrawSelectedItemButtonParam[cursorPos];
        if (cursorPos == 0 || cursorPos == 1) {
            LoadRectToBgTilemapRect(bgConfig, bgId, tilemapBuffer + 0x300, r3[0], r3[1], r3[2], r3[3]);
        } else {
            LoadRectToBgTilemapRect(bgConfig, bgId, tilemapBuffer + 0x360, r3[0], r3[1], r3[2], r3[3]);
        }
    }
}

static void BagApp_DrawScreenLayout(BagAppData *appData, u32 layout, int limit, int cursorPos) {
    NNSG2dScreenData *pScrnData;
    void *pRawScrnData;

    GF_ASSERT(layout <= 4);

    switch (layout) {
    case BAG_BG_LAYOUT_NORMAL:
        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00043_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_1, pScrnData->rawData, pScrnData->szByte);
        DC_FlushRange(GetBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_SUB_1), pScrnData->szByte);
        BagApp_DrawItemBgButtons_NormalMode(appData->bgConfig, GF_BG_LYR_SUB_1, limit);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_1);
        Heap_Free(pRawScrnData);

        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00039_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_2, pScrnData->rawData, pScrnData->szByte);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_2);
        Heap_Free(pRawScrnData);

        BagApp_UpdateItemButtonsDrawState(appData, 0, 0, FALSE);
        break;
    case BAG_BG_LAYOUT_MOVE:
        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00044_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_1, pScrnData->rawData, pScrnData->szByte);
        DC_FlushRange(GetBgTilemapBuffer(appData->bgConfig, GF_BG_LYR_SUB_1), pScrnData->szByte);
        BagApp_DrawItemBgButtons_MoveMode(appData->bgConfig, GF_BG_LYR_SUB_1, limit, cursorPos);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_1);
        Heap_Free(pRawScrnData);

        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00042_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_2, pScrnData->rawData, pScrnData->szByte);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_2);
        Heap_Free(pRawScrnData);

        BagApp_HideContextMenuIcons(appData);
        BagApp_UpdateItemButtonsDrawState(appData, limit, BagApp_GetMoveItemOriginalSlotOnCurrentPage(appData), FALSE);
        break;
    case BAG_BG_LAYOUT_CONTEXT:
        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00045_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_2, pScrnData->rawData, pScrnData->szByte);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_2);
        Heap_Free(pRawScrnData);
        BagApp_DrawItemBgButtons_NormalMode(appData->bgConfig, GF_BG_LYR_SUB_1, limit);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_1);
        break;
    case BAG_BG_LAYOUT_TRASH:
        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00052_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_2, pScrnData->rawData, pScrnData->szByte);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_2);
        Heap_Free(pRawScrnData);
        break;
    case BAG_BG_LAYOUT_SELL:
        pRawScrnData = GfGfxLoader_GetScrnData(NARC_graphic_bag_bag_graphics, bag_graphics_00053_NSCR, FALSE, &pScrnData, HEAP_ID_BAG);
        BG_LoadScreenTilemapData(appData->bgConfig, GF_BG_LYR_SUB_2, pScrnData->rawData, pScrnData->szByte);
        ScheduleBgTilemapBufferTransfer(appData->bgConfig, GF_BG_LYR_SUB_2);
        Heap_Free(pRawScrnData);
        break;
    }
}

static void BagApp_SaveMenuInputStateToBagView(BagAppData *appData, MenuInputState state) {
    if (appData->bagView->menuInputStateMgr != NULL) {
        MenuInputStateMgr_SetState(appData->bagView->menuInputStateMgr, state);
    }
}

static void BagApp_SetCancelButtonDrawFlag(BagAppData *appData, int flag) {
    if (flag == 1) {
        BagApp_SetBButtonSpriteDrawFlag(appData, TRUE);
        BagApp_PrintCancel(appData, 0);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON]);
        ManagedSprite_SetAnimationFrame(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 0);
        ManagedSprite_SetAnim(appData->sprites[BAG_APP_SPRITE_B_BUTTON], 16);
    } else {
        BagApp_SetBButtonSpriteDrawFlag(appData, FALSE);
        BagApp_ClearTextOnCancelButton(appData);
    }
}

static BagAppState BagApp_SetSpritePaletteAnimTransitionToNextState(BagAppData *appData, u8 spriteId, u8 plttOverride1, u8 plttOverride2, BagAppState nextState) {
    BagAppSpriteAnimationTransitionManager *spriteAnimTransitionMgr = &appData->spriteAnimTransitionMgr;
    spriteAnimTransitionMgr->animType = 0;
    spriteAnimTransitionMgr->spriteId = spriteId;
    spriteAnimTransitionMgr->plttOverride1 = plttOverride1;
    spriteAnimTransitionMgr->plttOverride2 = plttOverride2;
    spriteAnimTransitionMgr->nextState = nextState;
    spriteAnimTransitionMgr->plttAnimState = 0;
    spriteAnimTransitionMgr->plttAnimFrame = 0;
    return BAG_APP_STATE_RUN_SPRITE_ANIM_TRANSITION;
}

static BagAppState BagApp_SetSpriteAnimationTransitionToNextState(BagAppData *appData, u8 spriteId, u8 animId, BagAppState nextState) {
    BagAppSpriteAnimationTransitionManager *spriteAnimTransitionMgr = &appData->spriteAnimTransitionMgr;
    spriteAnimTransitionMgr->animType = 1;
    spriteAnimTransitionMgr->spriteId = spriteId;
    spriteAnimTransitionMgr->nextState = nextState;
    spriteAnimTransitionMgr->plttAnimState = 0;
    spriteAnimTransitionMgr->plttAnimFrame = 0;
    ManagedSprite_SetAnimationFrame(appData->sprites[spriteId], 0);
    ManagedSprite_SetAnim(appData->sprites[spriteId], animId);
    return BAG_APP_STATE_RUN_SPRITE_ANIM_TRANSITION;
}

static BagAppState BagAppMainTask_RunSpriteAnimTransition(BagAppData *appData) {
    BagAppSpriteAnimationTransitionManager *spriteAnimTransitionMgr = &appData->spriteAnimTransitionMgr;

    if (spriteAnimTransitionMgr->animType == 1) {
        if (!ManagedSprite_IsAnimated(appData->sprites[spriteAnimTransitionMgr->spriteId])) {
            return spriteAnimTransitionMgr->nextState;
        }
    } else {
        switch (spriteAnimTransitionMgr->plttAnimState) {
        case 0:
            ManagedSprite_SetPaletteOverride(appData->sprites[spriteAnimTransitionMgr->spriteId], spriteAnimTransitionMgr->plttOverride1);
            ++spriteAnimTransitionMgr->plttAnimState;
            break;
        case 1:
            ++spriteAnimTransitionMgr->plttAnimFrame;
            if (spriteAnimTransitionMgr->plttAnimFrame == 4) {
                ManagedSprite_SetPaletteOverride(appData->sprites[spriteAnimTransitionMgr->spriteId], spriteAnimTransitionMgr->plttOverride2);
                spriteAnimTransitionMgr->plttAnimFrame = 0;
                ++spriteAnimTransitionMgr->plttAnimState;
            }
            break;
        case 2:
            ++spriteAnimTransitionMgr->plttAnimFrame;
            if (spriteAnimTransitionMgr->plttAnimFrame == 2) {
                return spriteAnimTransitionMgr->nextState;
            }
            break;
        }
    }

    return BAG_APP_STATE_RUN_SPRITE_ANIM_TRANSITION;
}

static const CameraParam sCameraParam = {
    .distance = FX32_CONST(339.707275390625),
    .angle = { .x = 0xE982, .y = 0x1420 },
    .perspectiveType = 0,
    .perspective = 0xA01,
};

static const VecFx32 sTranslationVec = { 0, FX32_CONST(-45), 0 };

static const VecFx32 sCameraTargetVec = { 0, 0, 0 };

static void BagApp_Init3D(BagAppData *appData) {
    GF3dRender_InitSimpleManager(HEAP_ID_BAG);
    G3X_AntiAlias(TRUE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0, FALSE);
    NNS_G3dGlbMaterialColorDiffAmb(GX_RGB(15, 15, 15), GX_RGB(10, 10, 10), FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(GX_RGB(15, 15, 15), GX_RGB(15, 15, 15), FALSE);
    NNS_G3dGlbPolygonAttr(15, GX_POLYGONMODE_MODULATE, GX_CULL_NONE, 0, 31, 0);
    G3X_EdgeMarking(TRUE);
    G3X_SetEdgeColorTable(sEdgeColorTable);
    SetBgPriority(GF_BG_LYR_MAIN_0, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);

    appData->threeDimState.camera = Camera_New(HEAP_ID_BAG);
    appData->threeDimState.cameraTarget = sCameraTargetVec;
    appData->threeDimState.cameraParam = sCameraParam;
    Camera_Init_FromTargetDistanceAndAngle(&appData->threeDimState.cameraTarget, appData->threeDimState.cameraParam.distance, &appData->threeDimState.cameraParam.angle, appData->threeDimState.cameraParam.perspective, appData->threeDimState.cameraParam.perspectiveType, TRUE, appData->threeDimState.camera);
    appData->threeDimState.translation = sTranslationVec;
    BagApp3DState_Init(&appData->threeDimState);
    BagApp3DState_BeginMoveCamera(&appData->threeDimState, appData->bagView->curPocket + 1, 7);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(123), FX32_CONST(1700), appData->threeDimState.camera);
    Camera_SetStaticPtr(appData->threeDimState.camera);
    for (int i = 0; i < 4u; ++i) {
        NNS_G3dGlbLightVector((GXLightId)i, FX32_ONE, 0, 0);
        NNS_G3dGlbLightColor((GXLightId)i, RGB_WHITE);
    }

    BagApp_Load3dAssets(appData);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON); // didn't we just do this?
    G2_SetBG0Priority(2);
}

static void BagApp3DState_Init(BagApp3DState *threeDimState) {
    threeDimState->cameraAnchorsQueue[0] = 0;
    threeDimState->cameraAnchorsQueue[1] = 0;
    threeDimState->cameraAnchorsQueue[2] = -1;
    threeDimState->frame = 7;
    threeDimState->duration = 7;
}

static void BagApp3DState_BeginMoveCamera(BagApp3DState *threeDimState, int cameraAnchorId, int duration) {
    if (threeDimState->frame == threeDimState->duration) {
        threeDimState->cameraAnchorsQueue[0] = threeDimState->cameraAnchorsQueue[1];
        threeDimState->cameraAnchorsQueue[1] = cameraAnchorId;
        threeDimState->frame = 0;
        threeDimState->duration = duration;
    } else {
        threeDimState->cameraAnchorsQueue[2] = cameraAnchorId;
    }
}

#define ABS(x) ((x) < 0 ? -(x) : (x))

static void BagApp3DState_UpdateCameraPosition(BagApp3DState *threeDimState, int gender) {
    const BagAppCameraAnchor *anchorData = sCameraAnchors[gender];
    if (threeDimState->frame != threeDimState->duration) {
        ++threeDimState->frame;
        fx32 dxMag = ABS(anchorData[threeDimState->cameraAnchorsQueue[1]].cameraAngle.x - anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.x);
        int dxSign;
        if (anchorData[threeDimState->cameraAnchorsQueue[1]].cameraAngle.x < anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.x) {
            dxSign = -1;
        } else {
            dxSign = 1;
        }
        if (dxMag > FX32_ONE * 8) {
            dxMag = FX32_ONE * 16 - dxMag;
            dxSign *= -1;
        }
        fx32 x;
        if (dxSign > 0) {
            x = anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.x + dxMag / threeDimState->duration * threeDimState->frame;
        } else {
            x = anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.x - dxMag / threeDimState->duration * threeDimState->frame;
        }
        fx32 y = anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.y + (anchorData[threeDimState->cameraAnchorsQueue[1]].cameraAngle.y - anchorData[threeDimState->cameraAnchorsQueue[0]].cameraAngle.y) / threeDimState->duration * threeDimState->frame;
        fx32 distance = anchorData[threeDimState->cameraAnchorsQueue[0]].distance + (anchorData[threeDimState->cameraAnchorsQueue[1]].distance - anchorData[threeDimState->cameraAnchorsQueue[0]].distance) / threeDimState->duration * threeDimState->frame;
        fx32 translationY = anchorData[threeDimState->cameraAnchorsQueue[0]].translationY + (anchorData[threeDimState->cameraAnchorsQueue[1]].translationY - anchorData[threeDimState->cameraAnchorsQueue[0]].translationY) / threeDimState->duration * threeDimState->frame;
        threeDimState->cameraParam.angle.x = x;
        threeDimState->cameraParam.angle.y = y;
        threeDimState->cameraParam.distance = distance;
        threeDimState->translation.y = translationY;
    }
    if (threeDimState->frame == threeDimState->duration) {
        if (threeDimState->cameraAnchorsQueue[2] != -1) {
            threeDimState->cameraAnchorsQueue[0] = threeDimState->cameraAnchorsQueue[1];
            threeDimState->cameraAnchorsQueue[1] = threeDimState->cameraAnchorsQueue[2];
            threeDimState->cameraAnchorsQueue[2] = -1;
            threeDimState->frame = 0;
        }
    }
}

static void BagApp_Teardown3D(BagAppData *appData) {
    BagApp_Free3dAssets(appData);
    Camera_Delete(appData->threeDimState.camera);
    GF3dRender_DeleteSimpleManager();
}

static void BagApp_Update3D(BagAppData *appData) {
    MtxFx33 rotation = {
        .m = {
              { FX32_ONE, 0, 0 },
              { 0, FX32_ONE, 0 },
              { 0, 0, FX32_ONE },
              },
    };

    VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };

    BagApp3DState_UpdateCameraPosition(&appData->threeDimState, appData->gender);
    Camera_Init_FromTargetDistanceAndAngle(&appData->threeDimState.cameraTarget, appData->threeDimState.cameraParam.distance, &appData->threeDimState.cameraParam.angle, appData->threeDimState.cameraParam.perspective, appData->threeDimState.cameraParam.perspectiveType, TRUE, appData->threeDimState.camera);
    Thunk_G3X_Reset();
    Camera_PushLookAtToNNSGlb();
    BagApp3DModelData *r4 = &appData->threeDimState.obj;
    FrameAdvance3dAnim(r4->patternAnimObjs[r4->pocketIdx]);
    FrameAdvance3dAnim(r4->skeletalAnimObjs[r4->pocketIdx]);
    FrameAdvance3dAnim(r4->materialAnimObj);
    GF3dRender_DrawModel(&r4->renderObj, &appData->threeDimState.translation, &rotation, &scale);
    RequestSwap3DBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_Z);
}

static void FrameAdvance3dAnim(NNSG3dAnmObj *animObj) {
    if (animObj->frame + FX32_ONE < NNS_G3dAnmObjGetNumFrame(animObj)) {
        animObj->frame += FX32_ONE;
    } else {
        animObj->frame = 0;
    }
}

static void BagApp_Load3dAssets(BagAppData *appData) {
    NARC *narc;
    BagApp3DModelData *modelData;
    NNSG3dResTex *tex;
    void *pResAnm;
    u32 nsbtp, nsbca, nsbta, nsbmd;
    u32 i;

    narc = NARC_New(NARC_graphic_bag_bag_graphics, HEAP_ID_BAG);
    HeapExp_FndInitAllocator(&appData->threeDimState.allocator, HEAP_ID_BAG, 4);
    modelData = &appData->threeDimState.obj;
    if (appData->gender == PLAYER_GENDER_MALE) {
        nsbmd = bag_graphics_00055_NSBMD;
        nsbtp = bag_graphics_00057_NSBTP;
        nsbca = bag_graphics_00065_NSBCA;
        nsbta = bag_graphics_00073_NSBTA;
    } else {
        nsbmd = bag_graphics_00074_NSBMD;
        nsbtp = bag_graphics_00076_NSBTP;
        nsbca = bag_graphics_00084_NSBCA;
        nsbta = bag_graphics_00092_NSBTA;
    }
    modelData->resHeader = NARC_AllocAndReadWholeMember(narc, nsbmd, HEAP_ID_BAG);
    GF3dRender_InitObjFromHeader(&modelData->renderObj, &modelData->resMdl, &modelData->resHeader);
    tex = NNS_G3dGetTex(modelData->resHeader);
    NNS_G3dMdlUseMdlDiff(modelData->resMdl);
    NNS_G3dMdlUseMdlAmb(modelData->resMdl);
    NNS_G3dMdlUseMdlSpec(modelData->resMdl);
    NNS_G3dMdlUseMdlEmi(modelData->resMdl);
    NNS_G3dMdlUseMdlPolygonID(modelData->resMdl);
    for (i = 0; i < 8; ++i) {
        modelData->patternAnimsRaw[i] = NARC_AllocAndReadWholeMember(narc, nsbtp + i, HEAP_ID_BAG);
        pResAnm = NNS_G3dGetAnmByIdx(modelData->patternAnimsRaw[i], 0);
        modelData->patternAnimObjs[i] = NNS_G3dAllocAnmObj(&appData->threeDimState.allocator, pResAnm, modelData->resMdl);
        NNS_G3dAnmObjInit(modelData->patternAnimObjs[i], pResAnm, modelData->resMdl, tex);
        modelData->skeletalAnimsRaw[i] = NARC_AllocAndReadWholeMember(narc, nsbca + i, HEAP_ID_BAG);
        pResAnm = NNS_G3dGetAnmByIdx(modelData->skeletalAnimsRaw[i], 0);
        modelData->skeletalAnimObjs[i] = NNS_G3dAllocAnmObj(&appData->threeDimState.allocator, pResAnm, modelData->resMdl);
        NNS_G3dAnmObjInit(modelData->skeletalAnimObjs[i], pResAnm, modelData->resMdl, tex);
    }
    modelData->materialAnimRaw = NARC_AllocAndReadWholeMember(narc, nsbta, HEAP_ID_BAG);
    pResAnm = NNS_G3dGetAnmByIdx(modelData->materialAnimRaw, 0);
    modelData->materialAnimObj = NNS_G3dAllocAnmObj(&appData->threeDimState.allocator, pResAnm, modelData->resMdl);
    NNS_G3dAnmObjInit(modelData->materialAnimObj, pResAnm, modelData->resMdl, tex);

    modelData->pocketIdx = appData->bagView->curPocket;
    NNS_G3dRenderObjAddAnmObj(&modelData->renderObj, modelData->patternAnimObjs[modelData->pocketIdx]);
    NNS_G3dRenderObjAddAnmObj(&modelData->renderObj, modelData->skeletalAnimObjs[modelData->pocketIdx]);
    NNS_G3dRenderObjAddAnmObj(&modelData->renderObj, modelData->materialAnimObj);
    NARC_Delete(narc);
}

static void BagApp_Free3dAssets(BagAppData *appData) {
    BagApp3DModelData *modelData = &appData->threeDimState.obj;

    for (u32 i = 0; i < 8; ++i) {
        NNS_G3dFreeAnmObj(&appData->threeDimState.allocator, modelData->patternAnimObjs[i]);
        NNS_G3dFreeAnmObj(&appData->threeDimState.allocator, modelData->skeletalAnimObjs[i]);
        Heap_Free(modelData->patternAnimsRaw[i]);
        Heap_Free(modelData->skeletalAnimsRaw[i]);
    }
    NNS_G3dFreeAnmObj(&appData->threeDimState.allocator, modelData->materialAnimObj);
    Heap_Free(modelData->materialAnimRaw);
    Heap_Free(modelData->resHeader);
}

static void BagApp_SwitchPlayerModelAnimsToNewPocket(BagAppData *appData) {
    BagApp3DModelData *modelData = &appData->threeDimState.obj;

    NNS_G3dRenderObjRemoveAnmObj(&modelData->renderObj, modelData->skeletalAnimObjs[modelData->pocketIdx]);
    NNS_G3dRenderObjRemoveAnmObj(&modelData->renderObj, modelData->patternAnimObjs[modelData->pocketIdx]);
    modelData->pocketIdx = appData->bagView->curPocket;
    modelData->patternAnimObjs[modelData->pocketIdx]->frame = 0;
    modelData->skeletalAnimObjs[modelData->pocketIdx]->frame = 0;
    modelData->materialAnimObj->frame = 0;
    NNS_G3dRenderObjAddAnmObj(&modelData->renderObj, modelData->patternAnimObjs[modelData->pocketIdx]);
    NNS_G3dRenderObjAddAnmObj(&modelData->renderObj, modelData->skeletalAnimObjs[modelData->pocketIdx]);
}
