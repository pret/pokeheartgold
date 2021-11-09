#ifndef POKEHEARTGOLD_BAG_CURSOR_H
#define POKEHEARTGOLD_BAG_CURSOR_H

/*
 * Remembers the cursor position in the field bag view
 */
typedef struct BAG_CURSOR_FIELD {
    u8 scroll[8];
    u8 position[8];
    u16 pocket;
    u16 padding;
} BAG_CURSOR_FIELD;

/*
 * Remembers the cursor position in the battle bag view
 */
typedef struct BAG_CURSOR_BATTLE {
    u8 scroll[5];
    u8 position[5];
    u16 lastUsedItem;
    u16 lastUsedPocket;
    u16 pocket;
} BAG_CURSOR_BATTLE;

/*
 * Concatenation of the above two
 */
typedef struct BAG_CURSOR {
    BAG_CURSOR_FIELD field;
    BAG_CURSOR_BATTLE battle;
} BAG_CURSOR;

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

#endif //POKEHEARTGOLD_BAG_CURSOR_H
