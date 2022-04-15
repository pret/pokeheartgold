#ifndef POKEHEARTGOLD_LIST_MENU_CURSOR_H
#define POKEHEARTGOLD_LIST_MENU_CURSOR_H

#include "window.h"

struct ListMenuCursor;

struct ListMenuCursor *ListMenuCursorNew(HeapID heapId);
void ListMenuCursorSetColor(struct ListMenuCursor *cursor, u32 color);
void DestroyListMenuCursorObj(struct ListMenuCursor *cursor);
void ListMenuUpdateCursorObj(struct ListMenuCursor *cursor, WINDOW *window, u8 x, u8 y);

#endif //POKEHEARTGOLD_LIST_MENU_CURSOR_H
