#ifndef POKEHEARTGOLD_BAG_H
#define POKEHEARTGOLD_BAG_H

#include "constants/items.h"
#include "item.h"
#include "save.h"
#include "bag_view.h"

typedef enum RegisterItemResult {
    REG_ITEM_FAIL,
    REG_ITEM_SLOT1,
    REG_ITEM_SLOT2,
} RegisterItemResult;

typedef struct BagData {
    ITEM_SLOT items[NUM_BAG_ITEMS];
    ITEM_SLOT keyItems[NUM_BAG_KEY_ITEMS];
    ITEM_SLOT TMsHMs[NUM_BAG_TMS_HMS];
    ITEM_SLOT mail[NUM_BAG_MAIL];
    ITEM_SLOT medicine[NUM_BAG_MEDICINE];
    ITEM_SLOT berries[NUM_BAG_BERRIES];
    ITEM_SLOT balls[NUM_BAG_BALLS];
    ITEM_SLOT battleItems[NUM_BAG_BATTLE_ITEMS];
    u16 registeredItems[2];
} BAG_DATA;

typedef struct BAG_CURSOR_FIELD {
    u8 scroll[8];
    u8 position[8];
    u16 pocket;
    u16 padding;
} BAG_CURSOR_FIELD;

typedef struct BAG_CURSOR_BATTLE {
    u8 scroll[5];
    u8 position[5];
    u16 lastUsedItem;
    u16 lastUsedPocket;
    u16 pocket;
} BAG_CURSOR_BATTLE;

struct BAG_CURSOR {
    BAG_CURSOR_FIELD field;
    BAG_CURSOR_BATTLE battle;
};

u32 Sav2_Bag_sizeof(void);
void Sav2_Bag_init(BAG_DATA *);
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
