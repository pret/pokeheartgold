#ifndef POKEHEARTGOLD_LIST_MENU_CURSOR_H
#define POKEHEARTGOLD_LIST_MENU_CURSOR_H

#include "bg_window.h"
#include "pm_string.h"

typedef struct ListMenuCursor {
    u32 color;
    String *string;
} ListMenuCursor;

struct ListMenuCursor *ListMenuCursorNew(enum HeapID heapID);
void ListMenuCursorSetColor(ListMenuCursor *cursor, u32 color);
void DestroyListMenuCursorObj(ListMenuCursor *cursor);
void ListMenuUpdateCursorObj(const ListMenuCursor *cursor, Window *window, u32 x, u32 y);

#endif // POKEHEARTGOLD_LIST_MENU_CURSOR_H
