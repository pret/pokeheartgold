#ifndef POKEHEARTGOLD_BAG_H
#define POKEHEARTGOLD_BAG_H

#include "constants/items.h"
#include "item.h"
#include "save.h"
#include "bag_view.h"
#include "bag_cursor.h"

/*
 * Return value of Bag_TryRegisterItem
 */
typedef enum RegisterItemResult {
    REG_ITEM_FAIL,
    REG_ITEM_SLOT1,
    REG_ITEM_SLOT2,
} RegisterItemResult;

/*
 * The player's inventory. All items in all pockets,
 * and the two items registered to the touchscreen
 * buttons. This is saved to flash.
 */
typedef struct BagData {
    ITEM_SLOT items[NUM_BAG_ITEMS];                // General items
    ITEM_SLOT keyItems[NUM_BAG_KEY_ITEMS];         // Key items
    ITEM_SLOT TMsHMs[NUM_BAG_TMS_HMS];             // Move machines
    ITEM_SLOT mail[NUM_BAG_MAIL];                  // Mail items
    ITEM_SLOT medicine[NUM_BAG_MEDICINE];          // Healing items
    ITEM_SLOT berries[NUM_BAG_BERRIES];            // Berries
    ITEM_SLOT balls[NUM_BAG_BALLS];                // Balls
    ITEM_SLOT battleItems[NUM_BAG_BATTLE_ITEMS];   // Battle-only items
    u16 registeredItems[2];                        // IDs of registered key items
} BAG_DATA;

/*
 * u32 Sav2_Bag_sizeof(void)
 *
 * Returns the size of the player's inventory in save memory
 *
 * @returns: The size of BAG_DATA
 */
u32 Sav2_Bag_sizeof(void);

/*
 * BAG_DATA *Sav2_Bag_new(u32 heap_id)
 *
 * Allocates a new BAG_DATA
 *
 * @param heap_id:     ID of the heap to alloc from
 *
 * @returns: Pointer to the BAG_DATA instance
 */
BAG_DATA *Sav2_Bag_new(u32 heap_id);

/*
 * void Sav2_Bag_init(BAG_DATA *bagData)
 *
 * Initializes an existing BAG_DATA instance. This is also
 * called by Sav2_Bag_new.
 *
 * @param bagData:     The BAG_DATA instance
 */
void Sav2_Bag_init(BAG_DATA *bagData);

/*
 * void Sav2_Bag_copy(const BAG_DATA *src, BAG_DATA *dst)
 *
 * Copies BAG_DATA from src to dst
 *
 * @param src:         Origin BAG_DATA
 * @param dst:         Destination BAG_DATA
 */
void Sav2_Bag_copy(const BAG_DATA *src, BAG_DATA *dst);

/*
 * u16 Bag_GetRegisteredItemSlot1(BAG_DATA *bag)
 * u16 Bag_GetRegisteredItemSlot2(BAG_DATA *bag)
 *
 * Returns the item ID registered to touch screen button 1 or 2
 *
 * @param bag:         Pointer to BAG_DATA
 *
 * @returns: Registered item ID in that slot
 */
u16 Bag_GetRegisteredItemSlot1(BAG_DATA *bag);
u16 Bag_GetRegisteredItemSlot2(BAG_DATA *bag);

/*
 * RegisterItemResult Bag_TryRegisterItem(BAG_DATA *bag, u16 itemId)
 *
 * Registers the item to the first available quick-access slot.
 * If none available, returns REG_ITEM_FAIL. Otherwise, returns
 * REG_ITEM_SLOT1 or REG_ITEM_SLOT2.
 *
 * @param bag:         Pointer to BAG_DATA
 * @param itemId:      Item to attempt registry
 *
 * @returns: Which slot the item was registered to, or 0 if failed
 */
RegisterItemResult Bag_TryRegisterItem(BAG_DATA *bag, u16 itemId);

/*
 * void Bag_UnregisterItem(BAG_DATA *bag, u16 itemId)
 *
 * Removes the specified item from the registered items slots.
 * If the item was in slot 1, and slot 2 is not empty, moves
 * slot 2 to slot 1.
 *
 * @param bag:         Pointer to BAG_DATA
 * @param itemId:      Item to attempt unregistry
 */
void Bag_UnregisterItem(BAG_DATA *bag, u16 itemId);

/*
 * BOOL Bag_HasSpaceForItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id)
 * BOOL Bag_AddItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id)
 * BOOL Bag_TakeItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id)
 * BOOL Bag_HasItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id)
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
 * @param bag:         Pointer to BAG_DATA
 * @param itemId:      ID of item to act upon
 * @param quantity:    Amount to add, remove, or check
 * @param heap_id:     Heap to allocate temp buffers from
 *
 * @returns: TRUE if the action succeeded or would succeed,
 *   otherwise FALSE.
 */
BOOL Bag_HasSpaceForItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_AddItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_TakeItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_HasItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);

/*
 * BOOL Pocket_TakeItem(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity)
 *
 * Like BAG_TakeItem, but acts directly on an array of item slots.
 *
 * @param slots:       Pointer to ITEM_SLOT array
 * @param count:       Number of ITEM_SLOT in slots
 * @param itemId:      ID of item to act upon
 * @param quantity:    Amount to add, remove, or check
 *
 * @returns: TRUE if the action succeeded, otherwise FALSE.
 */
BOOL Pocket_TakeItem(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity);

/*
 * BOOL Bag_PocketNotEmpty(BAG_DATA *bag, int pocket)
 *
 * Checks whether the indicated pocket has any items in it.
 *
 * @param bag:         Pointer to BAG_DATA
 * @param pocket:      POCKET_XXX constant
 *
 * @returns: TRUE if there is at least one item in the pocket,
 *   otherwise FALSE.
 */
BOOL Bag_PocketNotEmpty(BAG_DATA *bag, int pocket);

/*
 * u16 Bag_GetQuantity(BAG_DATA *bag, u16 itemId, u32 heap_id)
 * u16 Pocket_GetQuantity(ITEM_SLOT *slots, u32 count, u16 itemId)
 *
 * Looks up the item in its pocket or the specified ITEM_SLOT
 *   array. If found, returns its quantity. Otherwise,
 *   returns 0.
 *
 * @param bag:         (Bag_*) Pointer to BAG_DATA
 * @param slots:       (Pocket_*) Pointer to ITEM_SLOT array
 * @param count:       (Pocket_*) Number of ITEM_SLOT in slots
 * @param itemId:      Item to look up
 * @param heap_id:     (Bag_*) Heap to allocate temp buffers from
 *
 * @returns: Quantity of that item in the bag or array.
 */
u16 Bag_GetQuantity(BAG_DATA *bag, u16 itemId, u32 heap_id);
u16 Pocket_GetQuantity(ITEM_SLOT *slots, u32 count, u16 itemId);

/*
 * BAG_VIEW *CreateBagView(BAG_DATA *bag, const u8 *pockets, u32 heap_id)
 *
 * Creates a BAG_VIEW with a specified subset of pockets.
 *
 * @param bag:         Pointer to BAG_DATA
 * @param pockets:     Char array of POCKET_XXX IDs, terminated
 *                     with POCKET_BAG_VIEW_END
 * @param heap_id:     Heap to allocate from
 *
 * @returns: Pointer to newly-allocated BAG_VIEW
 */
BAG_VIEW *CreateBagView(BAG_DATA *bag, const u8 *pockets, u32 heap_id);

/*
 * ITEM_SLOT *Bag_GetPocketSlotN(BAG_DATA *bag, u8 pocket, int n)
 *
 * Gets a pointer to the nth ITEM_SLOT in the given pocket.
 *
 * @param bag:         Pointer to BAG_DATA
 * @param pocket:      POCKET_XXX index of the pocket to search
 * @param n:           Index of slot within pocket
 *
 * @returns: Pointer to the requested ITEM_SLOT, or NULL if
 *   out-of-bounds
 */
ITEM_SLOT *Bag_GetPocketSlotN(BAG_DATA *bag, u8 pocket, int n);

/*
 * BAG_DATA *Sav2_Bag_get(SAVEDATA *saveData)
 *
 * Gets the pointer to BAG_DATA loaded from the save file.
 *
 * @param saveData:    Pointer to SAVEDATA
 *
 * @returns: Pointer to BAG_DATA
 */
BAG_DATA *Sav2_Bag_get(SAVEDATA *saveData);

#endif //POKEHEARTGOLD_BAG_H
