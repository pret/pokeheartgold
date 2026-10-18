#ifndef POKEHEARTGOLD_BAG_VIEW_H
#define POKEHEARTGOLD_BAG_VIEW_H

#include "bag_cursor.h"
#include "field_use_item.h"
#include "item.h"
#include "player_data.h"
#include "save.h"

/**
 * Return code from using the bag
 * Processed by the start menu
 */
typedef enum BagViewReturnCode {
    BAG_VIEW_RETURN_CODE_USE_ON_PARTYMON,
    BAG_VIEW_RETURN_CODE_CHECK_BERRY_TAG,
    BAG_VIEW_RETURN_CODE_GIVE_ITEM,
    BAG_VIEW_RETURN_CODE_POFFIN_BERRY_CHOSEN,
    BAG_VIEW_RETURN_CODE_GIVE_FROM_MON_MENU,
    BAG_VIEW_RETURN_CODE_DONE,
} BagViewReturnCode;

/*
 * BagView *BagView_New(u8 heapID)
 *
 * Create a new BagView
 *
 * @param heapID: Heap to allocate from
 *
 * @returns: Pointer to new BagView
 */
BagView *BagView_New(u8 heapID);

/*
 * u32 BagView_sizeof(void)
 *
 * Gets the size of BagView
 *
 * @return: Size of BagView
 */
u32 BagView_sizeof(void);
void BagView_SetContext(BagView *bagView, u8 context);
void BagView_Init(BagView *bagView, SaveData *save, u8 context, BagCursor *cursor, MenuInputStateMgr *menuInputStateMgr);

/*
 * void BagView_SetItem(BagView *bagView, ItemSlot *slots, u8 pocketId, u8 position)
 *
 * Sets pocket view #pocketId to slots.
 * Called by Bag_CreateView in bag.c
 * BUG: Meant to set pocket view #position.
 * See note in bag_view.c
 *
 * @param bagView:     The BagView instance
 * @param slots:       ItemSlot array of pocket
 * @param pocketId:    Which pocket it is
 * @param position:    Unused
 */
void BagView_SetItem(BagView *bagView, ItemSlot *slots, u8 pocketId, u8 position);
void BagView_SetOnBike(BagView *bagView);
void BagView_SetCheckUseData(BagView *bagView, ItemCheckUseData *checkUseData);
void BagView_SetPartySlot(BagView *bagView, u8 partySlot);
void BagView_SetMapLoadType(BagView *bagView, u16 mapLoadType);
u16 BagView_GetItemId(BagView *bagView);
u16 BagView_GetReturnCode(BagView *bagView);
u8 BagView_GetPartySlot(BagView *bagView);
u8 sub_0207791C(BagView *bagView);

/*
 * BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, u32 heapID)
 *
 * Some key items, when used, only print a non_npc_msg.
 * If the selected item is one of these, formats the
 * non_npc_msg into dest and returns TRUE. Otherwise,
 * returns FALSE and leaves dest untouched.
 *
 * @param saveData:    Persistent game state
 * @param dest:        Output String
 * @param itemId:      ID of item to check
 * @param heapID:     Heap in which to allocate temp buffers
 *
 * @returns: TRUE if non_npc_msg formatted, else FALSE
 */
BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, enum HeapID heapID);

/*
 * void GetItemUseErrorMessage(PLAYERDATA *playerData, String *dest, u32 unused, enum ItemUseError code, u32 heapID)
 *
 * If you can't use the item for whatever reason, this
 * routine is called to format the non_npc_msg.
 * In the default case, it's just Oak telling you off.
 * There are special messages for Cycling Road and when
 * you have an NPC companion.
 *
 * @param playerProfile:  Pointer to PlayerProfile, used to get your
 *                        name in Oak's admonishment
 * @param dest:           Pointer to output String
 * @param itemId:         Unused
 * @param code:           Which non_npc_msg to output
 * @param heapID:        Heap to allocate temp buffers from
 */
void GetItemUseErrorMessage(PlayerProfile *playerProfile, String *dest, u16 itemId, enum ItemUseError code, enum HeapID heapID);

#endif // POKEHEARTGOLD_BAG_VIEW_H
