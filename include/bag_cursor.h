#ifndef POKEHEARTGOLD_BAG_CURSOR_H
#define POKEHEARTGOLD_BAG_CURSOR_H

#include "heap.h"

/*
 * Remembers the cursor position in the field bag view
 */
typedef struct BagCursorField {
    u8 scroll[8];   // How many items are off-screen above
    u8 position[8]; // Cursor position within the screen
    u16 pocket;     // Which pocket was last viewed
    u16 padding;    // Silence warnings
} BagCursorField;

/*
 * Remembers the cursor position in the battle bag view
 */
typedef struct BagCursorBattle {
    u8 scroll[5];       // How many items are off-screen above
    u8 position[5];     // Cursor position within the screen
    u16 lastUsedItem;   // ID of last used item
    u16 lastUsedPocket; // ID of pocket containing last used item
    u16 pocket;         // Which pocket was last viewed
} BagCursorBattle;

/*
 * Concatenation of the above two
 */
typedef struct BagCursor {
    BagCursorField field;
    BagCursorBattle battle;
} BagCursor;

/*
 * BagCursor *BagCursor_New(HeapID heapId)
 *
 * Allocates a new BagCursor
 *
 * @param heapId:     Heap to allocate from
 *
 * @returns: Pointer to newly-allocated BagCursor
 */
BagCursor *BagCursor_New(HeapID heapId);

/*
 * void BagCursor_Field_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll)
 *
 * Gets the cursor position for the indicated pocket in the field.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      Which pocket to inspect
 * @param position:  Where the cursor position is returned
 * @param scroll:    Where the screen scroll is returned
 */
void BagCursor_Field_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll);

/*
 * u16 BagCursor_Field_GetPocket(BagCursor *cursor)
 *
 * Gets the last viewed pocket in the field
 *
 * @param cursor:      Pointer to BagCursor
 *
 * @returns: ID of last viewed pocket
 */
u16 BagCursor_Field_GetPocket(BagCursor *cursor);

/*
 * void BagCursor_Field_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll)
 *
 * Sets the cursor position for the indicated pocket in the field.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      Which pocket to inspect
 * @param position:    The cursor position to set
 * @param scroll:      The screen scroll to set
 */
void BagCursor_Field_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll);

/*
 * void BagCursor_Field_SetPocket(BagCursor *cursor, u16 pocket)
 *
 * Sets the last viewed pocket in the field.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      ID of last viewed pocket
 */
void BagCursor_Field_SetPocket(BagCursor *cursor, u16 pocket);

/*
 * void BagCursor_Battle_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll)
 *
 * Gets the cursor position for the indicated pocket in battle.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      Which pocket to inspect
 * @param position:  Where the cursor position is returned
 * @param scroll:    Where the screen scroll is returned
 */
void BagCursor_Battle_PocketGetPosition(BagCursor *cursor, u32 pocket, u8 *position, u8 *scroll);

/*
 * u16 BagCursor_Battle_GetLastUsedItem(BagCursor *cursor)
 *
 * Gets the last used item in battle
 *
 * @param cursor:      Pointer to BagCursor
 *
 * @returns: ID of last used item
 */
u16 BagCursor_Battle_GetLastUsedItem(BagCursor *cursor);

/*
 * u16 BagCursor_Battle_GetLastUsedPocket(BagCursor *cursor)
 *
 * Gets the pocket containing the last used item in battle
 *
 * @param cursor:      Pointer to BagCursor
 *
 * @returns: ID of pocket containing last used item
 */
u16 BagCursor_Battle_GetLastUsedPocket(BagCursor *cursor);

/*
 * u16 BagCursor_Battle_GetPocket(BagCursor *cursor)
 *
 * Gets the last viewed pocket in battle
 *
 * @param cursor:      Pointer to BagCursor
 *
 * @returns: ID of last viewed pocket
 */
u16 BagCursor_Battle_GetPocket(BagCursor *cursor);

/*
 * void BagCursor_Battle_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll)
 *
 * Sets the cursor position for the indicated pocket in battle.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      Which pocket to inspect
 * @param position:    The cursor position to set
 * @param scroll:      The screen scroll to set
 */
void BagCursor_Battle_PocketSetPosition(BagCursor *cursor, u32 pocket, u8 position, u8 scroll);

/*
 * void BagCursor_Battle_Init(BagCursor *cursor)
 *
 * Initializes the battle cursor data
 *
 * @param cursor:      Pointer to BagCursor
 */
void BagCursor_Battle_Init(BagCursor *cursor);

/*
 * void BagCursor_Battle_SetLastUsedItem(BagCursor *cursor, u16 itemId, u16 pocket)
 *
 * Sets the last used item and pocket in battle.
 *
 * @param cursor:      Pointer to BagCursor
 * @param itemId:      Last used item
 * @param pocket:      Pocket containing the item
 */
void BagCursor_Battle_SetLastUsedItem(BagCursor *cursor, u16 itemId, u16 pocket);

/*
 * void BagCursor_Battle_SetPocket(BagCursor *cursor, u16 pocket)
 *
 * Sets the last viewed pocket in battle.
 *
 * @param cursor:      Pointer to BagCursor
 * @param pocket:      ID of last viewed pocket
 */
void BagCursor_Battle_SetPocket(BagCursor *cursor, u16 pocket);

#endif // POKEHEARTGOLD_BAG_CURSOR_H
