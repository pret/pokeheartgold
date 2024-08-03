#ifndef POKEHEARTGOLD_LIST_MENU_ITEMS_H
#define POKEHEARTGOLD_LIST_MENU_ITEMS_H

#include "heap.h"
#include "msgdata.h"
#include "pm_string.h"

#define LIST_HEADER         -3
#define LIST_CANCEL         -2
#define LIST_NOTHING_CHOSEN -1

#define LIST_NO_MULTIPLE_SCROLL   0
#define LIST_MULTIPLE_SCROLL_DPAD 1
#define LIST_MULTIPLE_SCROLL_L_R  2

typedef struct LISTMENUITEM {
    String *text;
    s32 value;
} LISTMENUITEM;

LISTMENUITEM *ListMenuItems_New(u32 n, HeapID heapId);
void ListMenuItems_Delete(LISTMENUITEM *items);
void ListMenuItems_AppendFromMsgData(LISTMENUITEM *items, MsgData *msgData, int msgId, int value);
void ListMenuItems_AddItem(LISTMENUITEM *items, String *string, int value);
void ListMenuItems_DestroyMenuStrings(LISTMENUITEM *items);

#endif // POKEHEARTGOLD_LIST_MENU_ITEMS_H
