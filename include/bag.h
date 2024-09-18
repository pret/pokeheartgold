#ifndef POKEHEARTGOLD_BAG_H
#define POKEHEARTGOLD_BAG_H

#include "constants/items.h"

#include "bag_cursor.h"
#include "bag_types_def.h"
#include "heap.h"
#include "item.h"
#include "save.h"

/*
 * u32 Save_Bag_sizeof(void)
 *
 * Returns the size of the player's inventory in save memory
 *
 * @returns: The size of Bag
 */
u32 Save_Bag_sizeof(void);

/*
 * Bag *Save_Bag_New(HeapID heapId)
 *
 * Allocates a new Bag
 *
 * @param heapId:     ID of the heap to alloc from
 *
 * @returns: Pointer to the Bag instance
 */
Bag *Save_Bag_New(HeapID heapId);

/*
 * void Save_Bag_Init(Bag *bagData)
 *
 * Initializes an existing Bag instance. This is also
 * called by Save_Bag_New.
 *
 * @param bagData:     The Bag instance
 */
void Save_Bag_Init(Bag *bagData);

/*
 * void Save_Bag_Copy(const Bag *src, Bag *dst)
 *
 * Copies Bag from src to dst
 *
 * @param src:         Origin Bag
 * @param dst:         Destination Bag
 */
void Save_Bag_Copy(const Bag *src, Bag *dst);

/*
 * u16 Bag_GetRegisteredItem1(Bag *bag)
 * u16 Bag_GetRegisteredItem2(Bag *bag)
 *
 * Returns the item ID registered to touch screen button 1 or 2
 *
 * @param bag:         Pointer to Bag
 *
 * @returns: Registered item ID in that slot
 */
u16 Bag_GetRegisteredItem1(Bag *bag);
u16 Bag_GetRegisteredItem2(Bag *bag);

/*
 * RegisterItemResult Bag_TryRegisterItem(Bag *bag, u16 itemId)
 *
 * Registers the item to the first available quick-access slot.
 * If none available, returns REG_ITEM_FAIL. Otherwise, returns
 * REG_ITEM_SLOT1 or REG_ITEM_SLOT2.
 *
 * @param bag:         Pointer to Bag
 * @param itemId:      Item to attempt registry
 *
 * @returns: Which slot the item was registered to, or 0 if failed
 */
RegisterItemResult Bag_TryRegisterItem(Bag *bag, u16 itemId);

/*
 * void Bag_UnregisterItem(Bag *bag, u16 itemId)
 *
 * Removes the specified item from the registered items slots.
 * If the item was in slot 1, and slot 2 is not empty, moves
 * slot 2 to slot 1.
 *
 * @param bag:         Pointer to Bag
 * @param itemId:      Item to attempt unregistry
 */
void Bag_UnregisterItem(Bag *bag, u16 itemId);

/*
 * BOOL Bag_HasSpaceForItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId)
 * BOOL Bag_AddItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId)
 * BOOL Bag_TakeItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId)
 * BOOL Bag_HasItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId)
 *
 * Inventory checkers and modifiers.
 * HasSpaceForItem checks whether there is an empty slot
 *   for the item in its pocket or, if that item already occupies
 *   a slot, if its quantity was incremented as specified, if it
 *   will still be under the maximum.
 * AddItem finds an item slot that would satisfy HasSpaceForItem,
 *   then increments the quantity. If the added item is a TM, HM,
 *   or Berry, it then sorts the pocket.
 * TakeItem finds an item slot containing the indicated item and,
 *   if the stored quantity meets or exceeds the requested amount,
 *   decrements the stored quantity by that amount. If the resulting
 *   stored quantity is 0, moves lower item slots up to fill the
 *   gap.
 * HasItem follows the same logic as TakeItem but, instead of
 *   removing the item, simply returns whether it can or not.
 *
 * @param bag:         Pointer to Bag
 * @param itemId:      ID of item to act upon
 * @param quantity:    Amount to add, remove, or check
 * @param heapId:     Heap to allocate temp buffers from
 *
 * @returns: TRUE if the action succeeded or would succeed,
 *   otherwise FALSE.
 */
BOOL Bag_HasSpaceForItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);
BOOL Bag_AddItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);
BOOL Bag_TakeItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);
BOOL Bag_HasItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);

/*
 * BOOL Pocket_TakeItem(ItemSlot *slots, u32 count, u16 itemId, u16 quantity)
 *
 * Like BAG_TakeItem, but acts directly on an array of item slots.
 *
 * @param slots:       Pointer to ItemSlot array
 * @param count:       Number of ItemSlot in slots
 * @param itemId:      ID of item to act upon
 * @param quantity:    Amount to add, remove, or check
 *
 * @returns: TRUE if the action succeeded, otherwise FALSE.
 */
BOOL Pocket_TakeItem(ItemSlot *slots, u32 count, u16 itemId, u16 quantity);

/*
 * BOOL Bag_PocketNotEmpty(Bag *bag, u32 pocket)
 *
 * Checks whether the indicated pocket has any items in it.
 *
 * @param bag:         Pointer to Bag
 * @param pocket:      POCKET_XXX constant
 *
 * @returns: TRUE if there is at least one item in the pocket,
 *   otherwise FALSE.
 */
BOOL Bag_PocketNotEmpty(Bag *bag, u32 pocket);

/*
 * u16 Bag_GetQuantity(Bag *bag, u16 itemId, HeapID heapId)
 * u16 Pocket_GetQuantity(ItemSlot *slots, u32 count, u16 itemId)
 *
 * Looks up the item in its pocket or the specified ItemSlot
 *   array. If found, returns its quantity. Otherwise,
 *   returns 0.
 *
 * @param bag:         (Bag_*) Pointer to Bag
 * @param slots:       (Pocket_*) Pointer to ItemSlot array
 * @param count:       (Pocket_*) Number of ItemSlot in slots
 * @param itemId:      Item to look up
 * @param heapId:     (Bag_*) Heap to allocate temp buffers from
 *
 * @returns: Quantity of that item in the bag or array.
 */
u16 Bag_GetQuantity(Bag *bag, u16 itemId, HeapID heapId);
u16 Pocket_GetQuantity(ItemSlot *slots, u32 count, u16 itemId);

/*
 * BagView *Bag_CreateView(Bag *bag, const u8 *pockets, HeapID heapId)
 *
 * Creates a BagView with a specified subset of pockets.
 *
 * @param bag:         Pointer to Bag
 * @param pockets:     Char array of POCKET_XXX IDs, terminated
 *                     with POCKET_BAG_VIEW_END
 * @param heapId:     Heap to allocate from
 *
 * @returns: Pointer to newly-allocated BagView
 */
BagView *Bag_CreateView(Bag *bag, const u8 *pockets, HeapID heapId);

/*
 * ItemSlot *Bag_GetPocketSlotN(Bag *bag, u8 pocket, u32 slot)
 *
 * Gets a pointer to the nth ItemSlot in the given pocket.
 *
 * @param bag:         Pointer to Bag
 * @param pocket:      POCKET_XXX index of the pocket to search
 * @param slot:           Index of slot within pocket
 *
 * @returns: Pointer to the requested ItemSlot, or NULL if
 *   out-of-bounds
 */
ItemSlot *Bag_GetPocketSlotN(Bag *bag, u8 pocket, u32 slot);

/*
 * Bag *Save_Bag_Get(SaveData *saveData)
 *
 * Gets the pointer to Bag loaded from the save file.
 *
 * @param saveData:    Pointer to SaveData
 *
 * @returns: Pointer to Bag
 */
Bag *Save_Bag_Get(SaveData *saveData);

#endif // POKEHEARTGOLD_BAG_H
