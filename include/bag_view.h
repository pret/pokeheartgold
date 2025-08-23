#ifndef POKEHEARTGOLD_BAG_VIEW_H
#define POKEHEARTGOLD_BAG_VIEW_H

#include "bag_cursor.h"
#include "field_use_item.h"
#include "item.h"
#include "player_data.h"
#include "save.h"

/*
 * BagView *BagView_New(u8 heapId)
 *
 * Create a new BagView
 *
 * @param heapId: Heap to allocate from
 *
 * @returns: Pointer to new BagView
 */
BagView *BagView_New(u8 heapId);

/*
 * u32 BagView_sizeof(void)
 *
 * Gets the size of BagView
 *
 * @return: Size of BagView
 */
u32 BagView_sizeof(void);
void sub_02077894(BagView *bagView, u8 a1);
void sub_0207789C(BagView *bagView, SaveData *save, u8 a2, BagCursor *cursor, MenuInputStateMgr *menuInputStateMgr);

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
void sub_020778C8(BagView *bagView);
void sub_020778DC(BagView *bagView, ItemCheckUseData *a1);
void sub_020778E0(BagView *bagView, u8 a1);
void sub_020778E8(BagView *bagView, u16 a1);
u16 BagView_GetItemId(BagView *bagView);
u16 sub_0207790C(BagView *bagView);
u8 sub_02077914(BagView *bagView);
u8 sub_0207791C(BagView *bagView);

/*
 * BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, u32 heapId)
 *
 * Some key items, when used, only print a non_npc_msg.
 * If the selected item is one of these, formats the
 * non_npc_msg into dest and returns TRUE. Otherwise,
 * returns FALSE and leaves dest untouched.
 *
 * @param saveData:    Persistent game state
 * @param dest:        Output String
 * @param itemId:      ID of item to check
 * @param heapId:     Heap in which to allocate temp buffers
 *
 * @returns: TRUE if non_npc_msg formatted, else FALSE
 */
BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, HeapID heapId);

/*
 * void GetItemUseErrorMessage(PLAYERDATA *playerData, String *dest, u32 unused, enum ItemUseError code, u32 heapId)
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
 * @param heapId:        Heap to allocate temp buffers from
 */
void GetItemUseErrorMessage(PlayerProfile *playerProfile, String *dest, u16 itemId, enum ItemUseError code, HeapID heapId);

#endif // POKEHEARTGOLD_BAG_VIEW_H
