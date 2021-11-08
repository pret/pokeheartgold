#ifndef POKEHEARTGOLD_BAG_VIEW_H
#define POKEHEARTGOLD_BAG_VIEW_H

#include "item.h"
#include "save.h"

// for GetItemUseErrorMessage
enum ItemUseError {
    ITEMUSEERROR_OAKSWORDS  = 0,
    ITEMUSEERROR_NODISMOUNT = 1,
    ITEMUSEERROR_NOFOLLOWER = 2,
    ITEMUSEERROR_NOTNOW     = 3,
};

typedef struct BAG_CURSOR BAG_CURSOR;

typedef struct BAG_VIEW_POCKET {
    ITEM_SLOT *slots;
    u8 padding[4];
    u8 pocketId;
    u8 padding2[3];
} BAG_VIEW_POCKET;

typedef struct BAG_VIEW {
    SAVEDATA *saveData;
    BAG_VIEW_POCKET pockets[8];
    u8 unk_64;
    u8 unk_65;
    u16 unk_66;
    u16 unk_68;
    u8 filler_6A[2];
    BAG_CURSOR *unk_6C;
    void *unk_70;
    u8 unk_74;
    u8 unk_75;
    u16 unk_76_0:1;
    u16 unk_76_1:15;
    u32 unk_78;
} BAG_VIEW; // size: 0x7C

BAG_VIEW *BagView_New(u8 heap_id);
void BagView_SetItem(BAG_VIEW *bagView, ITEM_SLOT *slots, u8 pocketId, u8 position);

#endif //POKEHEARTGOLD_BAG_VIEW_H
