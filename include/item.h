#ifndef POKEHEARTGOLD_ITEM_H
#define POKEHEARTGOLD_ITEM_H

typedef struct ItemSlot {
    u16 id;
    u16 quantity;
} ITEM_SLOT;

s32 GetItemAttr(u16 itemId, s32 attrno, u32 heap_id);

#endif //POKEHEARTGOLD_ITEM_H
