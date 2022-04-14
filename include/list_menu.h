#ifndef POKEHEARTGOLD_LIST_MENU_H
#define POKEHEARTGOLD_LIST_MENU_H

#include "list_menu_cursor.h"
#include "list_menu_items.h"
#include "window.h"

struct ListMenu;

enum ListMenuAttr {
    LISTMENUATTR_MOVECURSORFUNC,
    LISTMENUATTR_ITEMPRINTFUNC,
    LISTMENUATTR_TOTALITEMS,
    LISTMENUATTR_MAXSHOWED,
    LISTMENUATTR_UNUSED_4,
    LISTMENUATTR_HEADERX,
    LISTMENUATTR_ITEMX,
    LISTMENUATTR_CURSORX,
    LISTMENUATTR_UPTEXTY,
    LISTMENUATTR_TEXTHEIGHT,
    LISTMENUATTR_CURSORPAL,
    LISTMENUATTR_FILLVALUE,
    LISTMENUATTR_CURSORSHADOWPAL,
    LISTMENUATTR_LETTERSSPACING,
    LISTMENUATTR_ITEMVERTICALPADDING,
    LISTMENUATTR_SCROLLMULTIPLE,
    LISTMENUATTR_FONTID,
    LISTMENUATTR_CURSORKIND,
    LISTMENUATTR_WINDOW,
    LISTMENUATTR_UNK_1C,
};

typedef void (*LM_MoveCursorFunc_t)(struct ListMenu *list, s32 index, u8 onInit);
typedef void (*LM_ItemPrintFunc_t)(struct ListMenu *list, s32 index, u8 y);

struct ListMenuTemplate {
    /*0x00*/ LISTMENUITEM *items;
    /*0x04*/ LM_MoveCursorFunc_t moveCursorFunc;
    /*0x08*/ LM_ItemPrintFunc_t itemPrintFunc;
    /*0x0C*/ WINDOW *window;
    /*0x10*/ u16 totalItems;
    /*0x12*/ u16 maxShowed;
    /*0x14*/ u8 header_X;
    /*0x15*/ u8 item_X;
    /*0x16*/ u8 cursor_X;
    /*0x17*/ u8 upText_Y:4;
             u8 cursorPal:4;
    /*0x18*/ u8 fillValue:4;
             u8 cursorShadowPal:4;
    /*0x1A*/ u16 lettersSpacing:3;
             u16 itemVerticalPadding:4;
             u16 scrollMultiple:2;
             u16 fontId:6;
             u16 cursorKind:1;
    /*0x1C*/ u32 unk_1C;
};

struct ListMenu
{
    /*0x00*/ struct ListMenuTemplate template;
    // ListMenuOverride from gen 3
    /*0x20*/ u8 cursorPal:4;
    u8 fillValue:4;
    /*0x21*/ u8 cursorShadowPal:4;
    u8 unk_21_4:4;
    /*0x22*/ u8 lettersSpacing:6;
    /*0x23*/ u8 unk_23;
    /*0x24*/ u8 fontId:7;
    u8 overrideEnabled:1;
    /*0x28*/ struct ListMenuCursor *cursor;
    /*0x2c*/ u16 cursorPos;
    /*0x2e*/ u16 itemsAbove;
    /*0x30*/ u8 unk_30;
    /*0x31*/ u8 unk_31;
    /*0x32*/ u8 taskId;
    /*0x33*/ u8 unk_33;
    /*0x34*/ u8 heap_id;
};

#endif //POKEHEARTGOLD_LIST_MENU_H
