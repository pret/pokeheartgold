#ifndef POKEHEARTGOLD_BAG_VIEW_H
#define POKEHEARTGOLD_BAG_VIEW_H

#include "item.h"
#include "save.h"

typedef struct BAG_VIEW_POCKET {
    ITEM_SLOT *slots;
    u8 padding[4];
    u8 pocketId;
    u8 padding2[3];
} BAG_VIEW_POCKET;

typedef struct BAG_VIEW {
    SAVEDATA *saveData;
    BAG_VIEW_POCKET pockets[8];
    u8 padding_64[0x18];
} BAG_VIEW; // size: 0x7C

BAG_VIEW *BagView_New(u8 heap_id);
void BagView_SetItem(BAG_VIEW *bagView, ITEM_SLOT *slots, u8 pocketId, u8 position);

#endif //POKEHEARTGOLD_BAG_VIEW_H
