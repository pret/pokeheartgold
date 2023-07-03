#include "global.h"
#include "constants/items.h"
#include "save.h"
#include "bag.h"
#include "heap.h"

static u32 Bag_GetItemPocket(Bag *bag, u16 itemId, ItemSlot **itemSlots, u32 *countPtr, HeapID heapId);
static ItemSlot *Pocket_GetItemSlotForAdd(ItemSlot *slots, u32 count, u16 itemId, u16 quantity, u16 maxQuantity);
static ItemSlot *Bag_GetItemSlotForAdd(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);
static ItemSlot *Pocket_GetItemSlotForRemove(ItemSlot *slots, u32 count, u16 itemId, u16 quantity);
static ItemSlot *Bag_GetItemSlotForRemove(Bag *bag, u16 itemId, u16 quantity, HeapID heapId);
static void SwapItemSlots(ItemSlot *a, ItemSlot *b);
static void PocketCompaction(ItemSlot *slots, u32 count);
static void SortPocket(ItemSlot *slots, u32 count);

u32 Save_Bag_sizeof(void) {
    return sizeof(Bag);
}

Bag *Save_Bag_New(HeapID heapId) {
    Bag *bag = (Bag *) AllocFromHeap(heapId, sizeof(Bag));
    Save_Bag_Init(bag);
    return bag;
}

void Save_Bag_Init(Bag *bag) {
    MI_CpuClear16(bag, sizeof(Bag));
}

void Save_Bag_Copy(const Bag *src, Bag *dst) {
    MI_CpuCopy8(src, dst, sizeof(Bag));
}

u16 Bag_GetRegisteredItem1(Bag *bag) {
    return bag->registeredItems[0];
}

u16 Bag_GetRegisteredItem2(Bag *bag) {
    return bag->registeredItems[1];
}

RegisterItemResult Bag_TryRegisterItem(Bag *bag, u16 itemId) {
    RegisterItemResult result = REG_ITEM_FAIL;

    if (bag->registeredItems[0] == ITEM_NONE) {
        bag->registeredItems[0] = itemId;
        result = REG_ITEM_SLOT1;
    } else if (bag->registeredItems[1] == ITEM_NONE) {
        bag->registeredItems[1] = itemId;
        result = REG_ITEM_SLOT2;
    }
    return result;
}

void Bag_UnregisterItem(Bag *bag, u16 itemId) {
    if (bag->registeredItems[1] == itemId) {
        bag->registeredItems[1] = ITEM_NONE;
    } else if (bag->registeredItems[0] == itemId) {
        if (bag->registeredItems[1] != ITEM_NONE) {
            bag->registeredItems[0] = bag->registeredItems[1];
            bag->registeredItems[1] = ITEM_NONE;
        } else {
            bag->registeredItems[0] = ITEM_NONE;
        }
    }
}

static u32 Bag_GetItemPocket(Bag *bag, u16 itemId, ItemSlot **itemSlots, u32 *countPtr, HeapID heapId) {
    u32 pocket = GetItemAttr(itemId, ITEMATTR_FIELD_POCKET, heapId);
    switch (pocket) {
        case POCKET_KEY_ITEMS:
            *itemSlots = bag->keyItems;
            *countPtr = NUM_BAG_KEY_ITEMS;
            break;
        case POCKET_ITEMS:
            *itemSlots = bag->items;
            *countPtr = NUM_BAG_ITEMS;
            break;
        case POCKET_BERRIES:
            *itemSlots = bag->berries;
            *countPtr = NUM_BAG_BERRIES;
            break;
        case POCKET_MEDICINE:
            *itemSlots = bag->medicine;
            *countPtr = NUM_BAG_MEDICINE;
            break;
        case POCKET_BALLS:
            *itemSlots = bag->balls;
            *countPtr = NUM_BAG_BALLS;
            break;
        case POCKET_BATTLE_ITEMS:
            *itemSlots = bag->battleItems;
            *countPtr = NUM_BAG_BATTLE_ITEMS;
            break;
        case POCKET_MAIL:
            *itemSlots = bag->mail;
            *countPtr = NUM_BAG_MAIL;
            break;
        case POCKET_TMHMS:
            *itemSlots = bag->TMsHMs;
            *countPtr = NUM_BAG_TMS_HMS;
            break;
    }
    return pocket;
}
static ItemSlot *Pocket_GetItemSlotForAdd(ItemSlot *slots, u32 count, u16 itemId, u16 quantity, u16 maxQuantity) {
    s32 i;
    s32 found = -1;
    for (i = 0; i < count; i++) {
        if (slots[i].id == itemId) {
            // Only one stack allowed per item.
            // If the resulting stack would be too large,
            // pretend there's no room for it.
            if (quantity + slots[i].quantity > maxQuantity) {
                return NULL;
            }
            return &slots[i];
        }
        if (found == -1 && slots[i].id == ITEM_NONE && slots[i].quantity == 0) {
            found = i;
        }
    }
    if (found == -1) {
        return NULL;
    }
    return &slots[found];
}

static ItemSlot *Bag_GetItemSlotForAdd(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    ItemSlot *slots;
    u32 count;
    u32 pocket = Bag_GetItemPocket(bag, itemId, &slots, &count, heapId);
    if (pocket == POCKET_TMHMS) {
        return Pocket_GetItemSlotForAdd(slots, count, itemId, quantity, BAG_TMHM_QUANTITY_MAX);
    } else {
        return Pocket_GetItemSlotForAdd(slots, count, itemId, quantity, BAG_SLOT_QUANTITY_MAX);
    }
}

BOOL Bag_HasSpaceForItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    return Bag_GetItemSlotForAdd(bag, itemId, quantity, heapId) != NULL;
}

BOOL Bag_AddItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    ItemSlot *slot = Bag_GetItemSlotForAdd(bag, itemId, quantity, heapId);
    if (slot == NULL) {
        return FALSE;
    }
    slot->id = itemId;
    slot->quantity += quantity;
    u32 count;
    u32 pocket_id = Bag_GetItemPocket(bag, itemId, &slot, &count, heapId);
    if (pocket_id == POCKET_TMHMS || pocket_id == POCKET_BERRIES) {
        SortPocket(slot, count);
    }
    return TRUE;
}

static ItemSlot *Pocket_GetItemSlotForRemove(ItemSlot *slots, u32 count, u16 itemId, u16 quantity) {
    for (s32 i = 0; i < count; i++) {
        if (slots[i].id == itemId) {
            if (slots[i].quantity < quantity) {
                return NULL;
            }
            return &slots[i];
        }
    }
    return NULL;
}

static ItemSlot *Bag_GetItemSlotForRemove(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    ItemSlot *slots;
    u32 count;
    Bag_GetItemPocket(bag, itemId, &slots, &count, heapId);
    return Pocket_GetItemSlotForRemove(slots, count, itemId, quantity);
}

BOOL Bag_TakeItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    ItemSlot *slot = Bag_GetItemSlotForRemove(bag, itemId, quantity, heapId);
    if (slot == NULL) {
        return FALSE;
    }
    slot->quantity -= quantity;
    if (slot->quantity == 0) {
        slot->id = ITEM_NONE;
    }
    u32 count;
    Bag_GetItemPocket(bag, itemId, &slot, &count, heapId);
    PocketCompaction(slot, count);
    return TRUE;
}

BOOL Pocket_TakeItem(ItemSlot *slots, u32 count, u16 itemId, u16 quantity) {
    ItemSlot *slot = Pocket_GetItemSlotForRemove(slots, count, itemId, quantity);
    if (slot == NULL) {
        return FALSE;
    }
    slot->quantity -= quantity;
    if (slot->quantity == 0) {
        slot->id = ITEM_NONE;
    }
    PocketCompaction(slots, count);
    return TRUE;
}

BOOL Bag_HasItem(Bag *bag, u16 itemId, u16 quantity, HeapID heapId) {
    return Bag_GetItemSlotForRemove(bag, itemId, quantity, heapId) != NULL;
}

BOOL Bag_PocketNotEmpty(Bag *bag, u32 pocket) {
    ItemSlot *slots;
    u32 count;
    switch (pocket) {
        case POCKET_KEY_ITEMS:
            slots = bag->keyItems;
            count = NUM_BAG_KEY_ITEMS;
            break;
        case POCKET_ITEMS:
            slots = bag->items;
            count = NUM_BAG_ITEMS;
            break;
        case POCKET_BERRIES:
            slots = bag->berries;
            count = NUM_BAG_BERRIES;
            break;
        case POCKET_MEDICINE:
            slots = bag->medicine;
            count = NUM_BAG_MEDICINE;
            break;
        case POCKET_BALLS:
            slots = bag->balls;
            count = NUM_BAG_BALLS;
            break;
        case POCKET_BATTLE_ITEMS:
            slots = bag->battleItems;
            count = NUM_BAG_BATTLE_ITEMS;
            break;
        case POCKET_MAIL:
            slots = bag->mail;
            count = NUM_BAG_MAIL;
            break;
        case POCKET_TMHMS:
            slots = bag->TMsHMs;
            count = NUM_BAG_TMS_HMS;
            break;
        default:
            return FALSE;
    }

    for (s32 i = 0; i < count; i++) {
        if (slots[i].id != ITEM_NONE) {
            return TRUE;
        }
    }
    return FALSE;
}

u16 Bag_GetQuantity(Bag *bag, u16 itemId, HeapID heapId) {
    ItemSlot *slot = Bag_GetItemSlotForRemove(bag, itemId, 1, heapId);
    if (slot == NULL) {
        return 0;
    }
    return slot->quantity;
}

u16 Pocket_GetQuantity(ItemSlot *slots, u32 count, u16 itemId) {
    ItemSlot *slot = Pocket_GetItemSlotForRemove(slots, count, itemId, 1);
    if (slot == NULL) {
        return 0;
    }
    return slot->quantity;
}

static void SwapItemSlots(ItemSlot *a, ItemSlot *b) {
    ItemSlot c = *a;
    *a = *b;
    *b = c;
}

static void PocketCompaction(ItemSlot *slots, u32 count) {
    for (s32 i = 0; i < count - 1; i++) {
        for (s32 j = i + 1; j < count; j++) {
            if (slots[i].quantity == 0) {
                SwapItemSlots(&slots[i], &slots[j]);
            }
        }
    }
}

static void SortPocket(ItemSlot *slots, u32 count) {
    for (s32 i = 0; i < count - 1; i++) {
        for (s32 j = i + 1; j < count; j++) {
            if (slots[i].quantity == 0 || (slots[j].quantity != 0 && slots[i].id > slots[j].id)) {
                SwapItemSlots(&slots[i], &slots[j]);
            }
        }
    }
}

BagView *Bag_CreateView(Bag *bag, const u8 *pockets, HeapID heapId) {
    BagView *ret = BagView_New(heapId);
    for (u32 i = 0; pockets[i] != POCKET_BAG_VIEW_END; i++) {
        switch (pockets[i]) {
            case POCKET_KEY_ITEMS:
                BagView_SetItem(ret, bag->keyItems, POCKET_KEY_ITEMS, i);
                break;
            case POCKET_ITEMS:
                BagView_SetItem(ret, bag->items, POCKET_ITEMS, i);
                break;
            case POCKET_BERRIES:
                BagView_SetItem(ret, bag->berries, POCKET_BERRIES, i);
                break;
            case POCKET_MEDICINE:
                BagView_SetItem(ret, bag->medicine, POCKET_MEDICINE, i);
                break;
            case POCKET_BALLS:
                BagView_SetItem(ret, bag->balls, POCKET_BALLS, i);
                break;
            case POCKET_BATTLE_ITEMS:
                BagView_SetItem(ret, bag->battleItems, POCKET_BATTLE_ITEMS, i);
                break;
            case POCKET_MAIL:
                BagView_SetItem(ret, bag->mail, POCKET_MAIL, i);
                break;
            case POCKET_TMHMS:
                BagView_SetItem(ret, bag->TMsHMs, POCKET_TMHMS, i);
                break;
        }
    }
    return ret;
}

ItemSlot *Bag_GetPocketSlotN(Bag *bag, u8 pocket, u32 slot) {
    ItemSlot *slots;
    u32 count;

    switch (pocket) {
        case POCKET_KEY_ITEMS:
            slots = bag->keyItems;
            count = NUM_BAG_KEY_ITEMS;
            break;
        case POCKET_ITEMS:
            slots = bag->items;
            count = NUM_BAG_ITEMS;
            break;
        case POCKET_BERRIES:
            slots = bag->berries;
            count = NUM_BAG_BERRIES;
            break;
        case POCKET_MEDICINE:
            slots = bag->medicine;
            count = NUM_BAG_MEDICINE;
            break;
        case POCKET_BALLS:
            slots = bag->balls;
            count = NUM_BAG_BALLS;
            break;
        case POCKET_BATTLE_ITEMS:
            slots = bag->battleItems;
            count = NUM_BAG_BATTLE_ITEMS;
            break;
        case POCKET_MAIL:
            slots = bag->mail;
            count = NUM_BAG_MAIL;
            break;
        case POCKET_TMHMS:
            slots = bag->TMsHMs;
            count = NUM_BAG_TMS_HMS;
            break;
    }
    // UB: If pocket invalid, count and slot are uninitialized
    if (slot >= count) {
        return NULL;
    }
    return &slots[slot];
}

Bag *Save_Bag_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_BAG);
}

BagCursor *BagCursor_New(HeapID heapId) {
    BagCursor *ret = AllocFromHeap(heapId, sizeof(BagCursor));
    MI_CpuClear16(ret, sizeof(BagCursor));
    return ret;
}

void BagCursor_Field_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll) {
    *position = cursor->field.position[pocket];
    *scroll = cursor->field.scroll[pocket];
}

u16 BagCursor_Field_GetPocket(BagCursor *cursor) {
    return cursor->field.pocket;
}

void BagCursor_Field_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll) {
    cursor->field.position[pocket] = position;
    cursor->field.scroll[pocket] = scroll;
}

void BagCursor_Field_SetPocket(BagCursor *cursor, u16 pocket) {
    cursor->field.pocket = pocket;
}

void BagCursor_Battle_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll) {
    *position = cursor->battle.position[pocket];
    *scroll = cursor->battle.scroll[pocket];
}

u16 BagCursor_Battle_GetLastUsedItem(BagCursor *cursor) {
    return cursor->battle.lastUsedItem;
}

u16 BagCursor_Battle_GetLastUsedPocket(BagCursor *cursor) {
    return cursor->battle.lastUsedPocket;
}

u16 BagCursor_Battle_GetPocket(BagCursor *cursor) {
    return cursor->battle.pocket;
}

void BagCursor_Battle_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll) {
    cursor->battle.position[pocket] = position;
    cursor->battle.scroll[pocket] = scroll;
}

void BagCursor_Battle_Init(BagCursor *cursor) {
    for (u32 i = 0; i < 5; i++) {
        BagCursor_Battle_PocketSetPosition(cursor, i, 0, 0);
    }
    BagCursor_Battle_SetPocket(cursor, 0);
}

void BagCursor_Battle_SetLastUsedItem(BagCursor *cursor, u16 itemId, u16 pocket) {
    cursor->battle.lastUsedItem = itemId;
    cursor->battle.lastUsedPocket = pocket;
}

void BagCursor_Battle_SetPocket(BagCursor *cursor, u16 pocket) {
    cursor->battle.pocket = pocket;
}
