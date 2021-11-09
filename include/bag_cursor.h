#ifndef POKEHEARTGOLD_BAG_CURSOR_H
#define POKEHEARTGOLD_BAG_CURSOR_H

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

typedef struct BAG_CURSOR {
    BAG_CURSOR_FIELD field;
    BAG_CURSOR_BATTLE battle;
} BAG_CURSOR;

#endif //POKEHEARTGOLD_BAG_CURSOR_H
