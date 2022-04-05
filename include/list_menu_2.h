#ifndef POKEHEARTGOLD_LIST_MENU_2_H
#define POKEHEARTGOLD_LIST_MENU_2_H

#include "list_menu_items.h"
#include "list_menu_cursor.h"

struct ListMenu2Template {
    LISTMENUITEM *items;
    WINDOW *window;
    u8 fontId;
    u8 itemsWide;
    u8 itemsHigh;
    u8 yTop:4;
    u8 cursorType:2;
    u8 enableWrap:2;
};

struct ListMenu2 {
    struct ListMenu2Template template;
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

struct ListMenu2 *Create2dMenu(const struct ListMenu2Template *template, u8 initialSelection, u8 heapId);
void Delete2dMenu(struct ListMenu2 *menu, u8 *ret_p);
int Handle2dMenuInput(struct ListMenu2 *menu);
u8 Get2dMenuSelection(struct ListMenu2 *menu);
struct ListMenu2 *CreateYesNoMenu(BGCONFIG *bgConfig, const WINDOWTEMPLATE *windowTemplate, u16 tileNum, u8 paletteNum, u8 initialSelection, HeapID heapId);
struct ListMenu2 *Std_CreateYesNoMenu(BGCONFIG *bgConfig, const WINDOWTEMPLATE *windowTemplate, u16 tileNum, u8 paletteNum, HeapID heapId);
int Handle2dMenuInput_DeleteOnFinish(struct ListMenu2 *menu, HeapID heapId);
void Clear2dMenuWindowAndDelete(struct ListMenu2 *menu, HeapID heapId);

#endif //POKEHEARTGOLD_LIST_MENU_2_H
