#ifndef POKEHEARTGOLD_BAG_CURSOR_H
#define POKEHEARTGOLD_BAG_CURSOR_H

/*
 * Remembers the cursor position in the field bag view
 */
typedef struct BAG_CURSOR_FIELD {
    u8 scroll[8];        // How many items are off-screen above
    u8 position[8];      // Cursor position within the screen
    u16 pocket;          // Which pocket was last viewed
    u16 padding;         // Silence warnings
} BAG_CURSOR_FIELD;

/*
 * Remembers the cursor position in the battle bag view
 */
typedef struct BAG_CURSOR_BATTLE {
    u8 scroll[5];         // How many items are off-screen above
    u8 position[5];       // Cursor position within the screen
    u16 lastUsedItem;     // ID of last used item
    u16 lastUsedPocket;   // ID of pocket containing last used item
    u16 pocket;           // Which pocket was last viewed
} BAG_CURSOR_BATTLE;

/*
 * Concatenation of the above two
 */
typedef struct BAG_CURSOR {
    BAG_CURSOR_FIELD field;
    BAG_CURSOR_BATTLE battle;
} BAG_CURSOR;

/*
 * BAG_CURSOR *BagCursor_new(u32 heap_id)
 *
 * Allocates a new BAG_CURSOR
 *
 * @param heap_id:     Heap to allocate from
 *
 * @returns: Pointer to newly-allocated BAG_CURSOR
 */
BAG_CURSOR *BagCursor_new(u32 heap_id);

/*
 * void BagCursor_Field_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p)
 *
 * Gets the cursor position for the indicated pocket in the field.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      Which pocket to inspect
 * @param position_p:  Where the cursor position is returned
 * @param scroll_p:    Where the screen scroll is returned
 */
void BagCursor_Field_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p);

/*
 * u16 BagCursor_Field_GetPocket(BAG_CURSOR *cursor)
 *
 * Gets the last viewed pocket in the field
 *
 * @param cursor:      Pointer to BAG_CURSOR
 *
 * @returns: ID of last viewed pocket
 */
u16 BagCursor_Field_GetPocket(BAG_CURSOR *cursor);

/*
 * void BagCursor_Field_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll)
 *
 * Sets the cursor position for the indicated pocket in the field.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      Which pocket to inspect
 * @param position:    The cursor position to set
 * @param scroll:      The screen scroll to set
 */
void BagCursor_Field_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll);

/*
 * void BagCursor_Field_SetPocket(BAG_CURSOR *cursor, u16 pocket)
 *
 * Sets the last viewed pocket in the field.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      ID of last viewed pocket
 */
void BagCursor_Field_SetPocket(BAG_CURSOR *cursor, u16 pocket);

/*
 * void BagCursor_Battle_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p)
 *
 * Gets the cursor position for the indicated pocket in battle.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      Which pocket to inspect
 * @param position_p:  Where the cursor position is returned
 * @param scroll_p:    Where the screen scroll is returned
 */
void BagCursor_Battle_PocketGetPosition(BAG_CURSOR *cursor, int pocket, u8 *position_p, u8 *scroll_p);

/*
 * u16 BagCursor_Battle_GetLastUsedItem(BAG_CURSOR *cursor)
 *
 * Gets the last used item in battle
 *
 * @param cursor:      Pointer to BAG_CURSOR
 *
 * @returns: ID of last used item
 */
u16 BagCursor_Battle_GetLastUsedItem(BAG_CURSOR *cursor);

/*
 * u16 BagCursor_Battle_GetLastUsedPocket(BAG_CURSOR *cursor)
 *
 * Gets the pocket containing the last used item in battle
 *
 * @param cursor:      Pointer to BAG_CURSOR
 *
 * @returns: ID of pocket containing last used item
 */
u16 BagCursor_Battle_GetLastUsedPocket(BAG_CURSOR *cursor);


/*
 * u16 BagCursor_Battle_GetPocket(BAG_CURSOR *cursor)
 *
 * Gets the last viewed pocket in battle
 *
 * @param cursor:      Pointer to BAG_CURSOR
 *
 * @returns: ID of last viewed pocket
 */
u16 BagCursor_Battle_GetPocket(BAG_CURSOR *cursor);

/*
 * void BagCursor_Battle_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll)
 *
 * Sets the cursor position for the indicated pocket in battle.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      Which pocket to inspect
 * @param position:    The cursor position to set
 * @param scroll:      The screen scroll to set
 */
void BagCursor_Battle_PocketSetPosition(BAG_CURSOR *cursor, int pocket, u8 position, u8 scroll);

/*
 * void BagCursor_Battle_Init(BAG_CURSOR *cursor)
 *
 * Initializes the battle cursor data
 *
 * @param cursor:      Pointer to BAG_CURSOR
 */
void BagCursor_Battle_Init(BAG_CURSOR *cursor);

/*
 * void BagCursor_Battle_SetLastUsedItem(BAG_CURSOR *cursor, u16 itemId, u16 pocket)
 *
 * Sets the last used item and pocket in battle.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param itemId:      Last used item
 * @param pocket:      Pocket containing the item
 */
void BagCursor_Battle_SetLastUsedItem(BAG_CURSOR *cursor, u16 itemId, u16 pocket);

/*
 * void BagCursor_Battle_SetPocket(BAG_CURSOR *cursor, u16 pocket)
 *
 * Sets the last viewed pocket in battle.
 *
 * @param cursor:      Pointer to BAG_CURSOR
 * @param pocket:      ID of last viewed pocket
 */
void BagCursor_Battle_SetPocket(BAG_CURSOR *cursor, u16 pocket);

#endif //POKEHEARTGOLD_BAG_CURSOR_H
