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
 * buttons.
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

u32 Sav2_Bag_sizeof(void);
BAG_DATA *Sav2_Bag_new(u32 heap_id);
void Sav2_Bag_init(BAG_DATA *);
void Sav2_Bag_copy(const BAG_DATA *src, BAG_DATA *dst);
u16 Bag_GetRegisteredItemSlot1(BAG_DATA *bag);
u16 Bag_GetRegisteredItemSlot2(BAG_DATA *bag);
RegisterItemResult Bag_TryRegisterItem(BAG_DATA *bag, u16 itemId);
void Bag_UnregisterItem(BAG_DATA *bag, u16 itemId);
BOOL Bag_HasSpaceForItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_AddItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_TakeItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Pocket_TakeItem(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity);
BOOL Bag_HasItem(BAG_DATA *bag, u16 itemId, u16 quantity, u32 heap_id);
BOOL Bag_PocketNotEmpty(BAG_DATA *bag, int pocket);
u16 Bag_GetQuantity(BAG_DATA *bag, u16 itemId, u32 heap_id);
u16 Pocket_GetQuantity(ITEM_SLOT *slots, u32 count, u16 itemId);

BAG_VIEW *CreateBagView(BAG_DATA *bag, const u8 *pockets, u32 heap_id);
ITEM_SLOT *Bag_GetPocketSlotN(BAG_DATA *bag, u8 pocket, int n);
BAG_DATA *Sav2_Bag_get(SAVEDATA *saveData);

BAG_CURSOR *BagCursor_new(u32 heap_id);
void BagCursor_Field_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p);
u16 BagCursor_Field_GetPocket(BAG_CURSOR *cursor);
void BagCursor_Field_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll);
void BagCursor_Field_SetPocket(BAG_CURSOR *cursor, u16 a1);
void BagCursor_Battle_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p);
u16 BagCursor_Battle_GetLastUsedItem(BAG_CURSOR *cursor);
u16 BagCursor_Battle_GetLastUsedPocket(BAG_CURSOR *cursor);
u16 BagCursor_Battle_GetPocket(BAG_CURSOR *cursor);
void BagCursor_Battle_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll);
void BagCursor_Battle_Init(BAG_CURSOR *cursor);
void BagCursor_SetLastUsedItem(BAG_CURSOR *cursor, u16 itemId, u16 usedOnPoke);
void BagCursor_Battle_SetPocket(BAG_CURSOR *cursor, u16 pocket);

#endif //POKEHEARTGOLD_BAG_H
