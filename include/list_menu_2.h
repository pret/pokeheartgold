#ifndef POKEHEARTGOLD_LIST_MENU_2_H
#define POKEHEARTGOLD_LIST_MENU_2_H

#include "list_menu_items.h"
#include "list_menu_cursor.h"

struct ListMenu2Template {
    LISTMENUITEM *items;
    WINDOW *window;
    u8 fontId;
    u8 unk9;
    u8 unkA;
    u8 unkB_0:4;
    u8 unkB_4:2;
    u8 unkB_6:2;
};

struct ListMenu2 {
    struct ListMenu2Template template;
    struct ListMenuCursor *cursor;
    int unk10;
    u8 unk14;
    u8 selectedIndex;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 maxGlyphWidth;
    u8 maxGlyphHeight;
    u8 scheduledScroll;
    u8 heapId;
    u8 pad_1D[3];
}; // size=0x20

#endif //POKEHEARTGOLD_LIST_MENU_2_H
