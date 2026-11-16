#ifndef POKEHEARTGOLD_MENU_CURSOR_H
#define POKEHEARTGOLD_MENU_CURSOR_H

#include "bg_window.h"
#include "pm_string.h"

typedef struct MenuCursor {
    u32 color;
    String *string;
} MenuCursor;

MenuCursor *MenuCursor_New(enum HeapID heapID);
void MenuCursor_Free(MenuCursor *cursor);
void MenuCursor_SetColor(MenuCursor *cursor, u32 color);
void MenuCursor_Print(const MenuCursor *cursor, Window *window, u32 xOffset, u32 yOffset);

#endif // POKEHEARTGOLD_MENU_CURSOR_H
