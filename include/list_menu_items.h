#ifndef POKEHEARTGOLD_LIST_MENU_ITEMS_H
#define POKEHEARTGOLD_LIST_MENU_ITEMS_H

#include "pm_string.h"
#include "heap.h"
#include "msgdata.h"

#define LIST_HEADER          -3
#define LIST_CANCEL          -2
#define LIST_NOTHING_CHOSEN  -1

#define LIST_NO_MULTIPLE_SCROLL    0
#define LIST_MULTIPLE_SCROLL_DPAD  1
#define LIST_MULTIPLE_SCROLL_L_R   2

typedef struct LISTMENUITEM {
    STRING *text;
    s32 value;
} LISTMENUITEM;

LISTMENUITEM *ListMenuItems_ctor(u32 n, HeapID heapId);
void ListMenuItems_dtor(LISTMENUITEM *items);
void ListMenuItems_AppendFromMsgData(LISTMENUITEM *items, MSGDATA *msgData, int msgId, int value);
void ListMenuItems_AddItem(LISTMENUITEM *items, STRING *string, int value);
void ListMenuItems_DestroyMenuStrings(LISTMENUITEM *items);

#endif //POKEHEARTGOLD_LIST_MENU_ITEMS_H
