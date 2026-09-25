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

typedef struct ListMenuItem {
    String *text;
    s32 value;
} ListMenuItem;

ListMenuItem *ListMenuItems_New(u32 n, enum HeapID heapID);
void ListMenuItems_Delete(ListMenuItem *items);
void ListMenuItems_AppendFromMsgData(ListMenuItem *items, MsgData *msgData, int msgId, int value);
void ListMenuItems_AddItem(ListMenuItem *items, String *string, int value);
void ListMenuItems_DestroyMenuStrings(ListMenuItem *items);

#endif // POKEHEARTGOLD_LIST_MENU_ITEMS_H
