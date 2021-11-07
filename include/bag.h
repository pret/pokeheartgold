#ifndef POKEHEARTGOLD_BAG_H
#define POKEHEARTGOLD_BAG_H

#include "constants/items.h"
#include "item.h"
#include "save.h"

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

u32 Sav2_Bag_sizeof(void);
void Sav2_Bag_init(BAG_DATA *);

#endif //POKEHEARTGOLD_BAG_H
