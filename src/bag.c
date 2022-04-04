#include "constants/items.h"
#include "save.h"
#include "bag.h"
#include "heap.h"

void SortPocket(ITEM_SLOT *slots, u32 count);
void PocketCompaction(ITEM_SLOT *slots, u32 count);

u32 Sav2_Bag_sizeof(void) {
    return sizeof(BAG_DATA);
}

BAG_DATA *Sav2_Bag_new(HeapID heap_id) {
    BAG_DATA *bag = (BAG_DATA *) AllocFromHeap(heap_id, sizeof(BAG_DATA));
    Sav2_Bag_init(bag);
    return bag;
}

void Sav2_Bag_init(BAG_DATA *bag) {
    MI_CpuClear16(bag, sizeof(BAG_DATA));
}

void Sav2_Bag_copy(const BAG_DATA *src, BAG_DATA *dst) {
    MI_CpuCopy8(src, dst, sizeof(BAG_DATA));
}

u16 Bag_GetRegisteredItemSlot1(BAG_DATA *bag) {
    return bag->registeredItems[0];
}

u16 Bag_GetRegisteredItemSlot2(BAG_DATA *bag) {
    return bag->registeredItems[1];
}

RegisterItemResult Bag_TryRegisterItem(BAG_DATA *bag, u16 itemId) {
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

void Bag_UnregisterItem(BAG_DATA *bag, u16 itemId) {
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

static u32 Bag_GetItemPocket(BAG_DATA *bag, u16 itemId, ITEM_SLOT **ppSlots, u32 *pCount, HeapID heap_id) {
    u32 pocket = GetItemAttr(itemId, ITEMATTR_FIELD_POCKET, heap_id);
    switch (pocket) {
    case POCKET_KEY_ITEMS:
        *ppSlots = bag->keyItems;
        *pCount = NUM_BAG_KEY_ITEMS;
        break;
    case POCKET_ITEMS:
        *ppSlots = bag->items;
        *pCount = NUM_BAG_ITEMS;
        break;
    case POCKET_BERRIES:
        *ppSlots = bag->berries;
        *pCount = NUM_BAG_BERRIES;
        break;
    case POCKET_MEDICINE:
        *ppSlots = bag->medicine;
        *pCount = NUM_BAG_MEDICINE;
        break;
    case POCKET_BALLS:
        *ppSlots = bag->balls;
        *pCount = NUM_BAG_BALLS;
        break;
    case POCKET_BATTLE_ITEMS:
        *ppSlots = bag->battleItems;
        *pCount = NUM_BAG_BATTLE_ITEMS;
        break;
    case POCKET_MAIL:
        *ppSlots = bag->mail;
        *pCount = NUM_BAG_MAIL;
        break;
    case POCKET_TMHMS:
        *ppSlots = bag->TMsHMs;
        *pCount = NUM_BAG_TMS_HMS;
        break;
    }
    return pocket;
}

static ITEM_SLOT *Pocket_GetItemSlotForAdd(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity, u16 maxQuantity) {
    int i;
    int found = -1;

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

static ITEM_SLOT *Bag_GetItemSlotForAdd(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    ITEM_SLOT *slots;
    u32 count;
    u32 pocket_id;

    pocket_id = Bag_GetItemPocket(bag, itemId, &slots, &count, heap_id);
    if (pocket_id == POCKET_TMHMS) {
        return Pocket_GetItemSlotForAdd(slots, count, itemId, quantity, BAG_TMHM_QUANTITY_MAX);
    } else {
        return Pocket_GetItemSlotForAdd(slots, count, itemId, quantity, BAG_SLOT_QUANTITY_MAX);
    }
}

BOOL Bag_HasSpaceForItem(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    return Bag_GetItemSlotForAdd(bag, itemId, quantity, heap_id) != NULL;
}

BOOL Bag_AddItem(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    ITEM_SLOT *slot = Bag_GetItemSlotForAdd(bag, itemId, quantity, heap_id);
    if (slot == NULL) {
        return FALSE;
    }
    slot->id = itemId;
    slot->quantity += quantity;
    {
        u32 count;
        u32 pocket_id;

        pocket_id = Bag_GetItemPocket(bag, itemId, &slot, &count, heap_id);
        if (pocket_id == POCKET_TMHMS || pocket_id == POCKET_BERRIES) {
            SortPocket(slot, count);
        }
    }
    return TRUE;
}

static ITEM_SLOT *Pocket_GetItemSlotForRemove(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity) {
    int i;

    for (i = 0; i < count; i++) {
        if (slots[i].id == itemId) {
            if (slots[i].quantity < quantity) {
                return NULL;
            }
            return &slots[i];
        }
    }
    return NULL;
}

static ITEM_SLOT *Bag_GetItemSlotForRemove(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    ITEM_SLOT *slots;
    u32 count;
    u32 pocket_id;

    pocket_id = Bag_GetItemPocket(bag, itemId, &slots, &count, heap_id);
    return Pocket_GetItemSlotForRemove(slots, count, itemId, quantity);
}

BOOL Bag_TakeItem(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    ITEM_SLOT *slot = Bag_GetItemSlotForRemove(bag, itemId, quantity, heap_id);
    if (slot == NULL) {
        return FALSE;
    }
    slot->quantity -= quantity;
    if (slot->quantity == 0) {
        slot->id = ITEM_NONE;
    }
    {
        u32 count;
        u32 pocket_id;

        pocket_id = Bag_GetItemPocket(bag, itemId, &slot, &count, heap_id);
        PocketCompaction(slot, count);
    }
    return TRUE;
}

BOOL Pocket_TakeItem(ITEM_SLOT *slots, u32 count, u16 itemId, u16 quantity) {
    ITEM_SLOT *slot = Pocket_GetItemSlotForRemove(slots, count, itemId, quantity);
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

BOOL Bag_HasItem(BAG_DATA *bag, u16 itemId, u16 quantity, HeapID heap_id) {
    return Bag_GetItemSlotForRemove(bag, itemId, quantity, heap_id) != NULL;
}

BOOL Bag_PocketNotEmpty(BAG_DATA *bag, int pocket) {
    ITEM_SLOT *slots;
    u32 count;
    int i;

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

    for (i = 0; i < count; i++) {
        if (slots[i].id != ITEM_NONE) {
            return TRUE;
        }
    }
    return FALSE;
}

u16 Bag_GetQuantity(BAG_DATA *bag, u16 itemId, HeapID heap_id) {
    ITEM_SLOT *slot = Bag_GetItemSlotForRemove(bag, itemId, 1, heap_id);
    if (slot == NULL) {
        return 0;
    }
    return slot->quantity;
}

u16 Pocket_GetQuantity(ITEM_SLOT *slots, u32 count, u16 itemId) {
    ITEM_SLOT *slot = Pocket_GetItemSlotForRemove(slots, count, itemId, 1);
    if (slot == NULL) {
        return 0;
    }
    return slot->quantity;
}

static void SwapItemSlots(ITEM_SLOT *a, ITEM_SLOT *b) {
    ITEM_SLOT c = *a;
    *a = *b;
    *b = c;
}

static void PocketCompaction(ITEM_SLOT *slots, u32 count) {
    int i, j;
    for (i = 0; i < count - 1; i++) {
        for (j = i + 1; j < count; j++) {
            if (slots[i].quantity == 0) {
                SwapItemSlots(&slots[i], &slots[j]);
            }
        }
    }
}

static void SortPocket(ITEM_SLOT *slots, u32 count) {
    int i, j;
    for (i = 0; i < count - 1; i++) {
        for (j = i + 1; j < count; j++) {
            if (slots[i].quantity == 0 || (slots[j].quantity != 0 && slots[i].id > slots[j].id)) {
                SwapItemSlots(&slots[i], &slots[j]);
            }
        }
    }
}

BAG_VIEW *CreateBagView(BAG_DATA *bag, const u8 *pockets, HeapID heap_id) {
    int i;
    BAG_VIEW *ret = BagView_New(heap_id);
    for (i = 0; pockets[i] != POCKET_BAG_VIEW_END; i++) {
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

ITEM_SLOT *Bag_GetPocketSlotN(BAG_DATA *bag, u8 pocket, int n) {
    ITEM_SLOT *slots;
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
    if (n >= count) {
        return NULL;
    }
    return &slots[n];
}

BAG_DATA *Sav2_Bag_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_BAG);
}

BAG_CURSOR *BagCursor_new(HeapID heap_id) {
    BAG_CURSOR *ret = AllocFromHeap(heap_id, sizeof(BAG_CURSOR));
    MI_CpuClear16(ret, sizeof(BAG_CURSOR));
    return ret;
}

void BagCursor_Field_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p) {
    *position_p = cursor->field.position[pocket];
    *scroll_p = cursor->field.scroll[pocket];
}

u16 BagCursor_Field_GetPocket(BAG_CURSOR *cursor) {
    return cursor->field.pocket;
}

void BagCursor_Field_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll) {
    cursor->field.position[pocket] = position;
    cursor->field.scroll[pocket] = scroll;
}

void BagCursor_Field_SetPocket(BAG_CURSOR *cursor, u16 pocket) {
    cursor->field.pocket = pocket;
}

void BagCursor_Battle_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p) {
    *position_p = cursor->battle.position[pocket];
    *scroll_p = cursor->battle.scroll[pocket];
}

u16 BagCursor_Battle_GetLastUsedItem(BAG_CURSOR *cursor) {
    return cursor->battle.lastUsedItem;
}

u16 BagCursor_Battle_GetLastUsedPocket(BAG_CURSOR *cursor) {
    return cursor->battle.lastUsedPocket;
}

u16 BagCursor_Battle_GetPocket(BAG_CURSOR *cursor) {
    return cursor->battle.pocket;
}

void BagCursor_Battle_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll) {
    cursor->battle.position[pocket] = position;
    cursor->battle.scroll[pocket] = scroll;
}

void BagCursor_Battle_Init(BAG_CURSOR *cursor) {
    int i;

    for (i = 0; i < 5u; i++) {
        BagCursor_Battle_PocketSetPosition(cursor, i, 0, 0);
    }
    BagCursor_Battle_SetPocket(cursor, 0);
}

void BagCursor_Battle_SetLastUsedItem(BAG_CURSOR *cursor, u16 itemId, u16 pocket) {
    cursor->battle.lastUsedItem = itemId;
    cursor->battle.lastUsedPocket = pocket;
}

void BagCursor_Battle_SetPocket(BAG_CURSOR *cursor, u16 pocket) {
    cursor->battle.pocket = pocket;
}
