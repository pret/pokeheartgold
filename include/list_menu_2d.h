#ifndef POKEHEARTGOLD_LIST_MENU_2D_H
#define POKEHEARTGOLD_LIST_MENU_2D_H

#include "list_menu_cursor.h"
#include "list_menu_items.h"

struct ListMenu2DTemplate {
    LISTMENUITEM *items;
    Window *window;
    u8 fontId;
    u8 itemsWide;
    u8 itemsHigh;
    u8 yTop : 4;
    u8 cursorType : 2;
    u8 enableWrap : 2;
};

struct ListMenu2D {
    struct ListMenu2DTemplate template;
    struct ListMenuCursor *cursor;
    int cancelKey;
    u8 unk14;
    u8 selectedIndex;
    u8 maxItemWidth;
    u8 x;
    u8 y;
    u8 maxGlyphWidth;
    u8 maxGlyphHeight;
    u8 scheduledScroll;
    u8 heapId;
    u8 pad_1D[3];
}; // size=0x20

struct ListMenu2D *Create2dMenu(const struct ListMenu2DTemplate *template, u8 initialSelection, u8 heapId);
void Delete2dMenu(struct ListMenu2D *menu, u8 *ret_p);
int Handle2dMenuInput(struct ListMenu2D *menu);
u8 Get2dMenuSelection(struct ListMenu2D *menu);
struct ListMenu2D *CreateYesNoMenu(BgConfig *bgConfig, const WindowTemplate *windowTemplate, u16 tileNum, u8 paletteNum, u8 initialSelection, HeapID heapId);
struct ListMenu2D *Std_CreateYesNoMenu(BgConfig *bgConfig, const WindowTemplate *windowTemplate, u16 tileNum, u8 paletteNum, HeapID heapId);
int Handle2dMenuInput_DeleteOnFinish(struct ListMenu2D *menu, HeapID heapId);
void Clear2dMenuWindowAndDelete(struct ListMenu2D *menu, HeapID heapId);

#endif // POKEHEARTGOLD_LIST_MENU_2D_H
