#include "global.h"
#include "list_menu_items.h"

void ListMenuItems_DestroyMenuStrings(LISTMENUITEM *items);
LISTMENUITEM *ListMenuItems_SeekEnd(LISTMENUITEM *items, HeapID *heapId_p);

LISTMENUITEM *ListMenuItems_New(u32 n, HeapID heapId) {
    int i;
    LISTMENUITEM *ret = AllocFromHeap(heapId, (n + 1) * sizeof(LISTMENUITEM));
    if (ret != NULL) {
        for (i = 0; i < n; i++) {
            ret[i].text = NULL;
            ret[i].value = 0;
        }
        ret[i].text = (String*)-1;
        ret[i].value = heapId;
    }
    return ret;
}

void ListMenuItems_Delete(LISTMENUITEM *items) {
    ListMenuItems_DestroyMenuStrings(items);
    FreeToHeap(items);
}

void ListMenuItems_AppendFromMsgData(LISTMENUITEM *items, MsgData *msgData, int msgId, int value) {
    HeapID dummy;

    items = ListMenuItems_SeekEnd(items, &dummy);
    if (items != NULL) {
        items->text = NewString_ReadMsgData(msgData, msgId);
        items->value = value;
    }
}

void ListMenuItems_AddItem(LISTMENUITEM *items, String *string, int value) {
    HeapID heapId;

    items = ListMenuItems_SeekEnd(items, &heapId);
    if (items != NULL) {
        items->text = String_Dup(string, heapId);
        items->value = value;
    }
}

LISTMENUITEM *ListMenuItems_SeekEnd(LISTMENUITEM *items, HeapID *heapId_p) {
    LISTMENUITEM *out;

    for (; items->text != NULL; items++) {
        if (items->text == (String *)-1) {
            GF_ASSERT(0);
            return NULL;
        }
    }
    out = items;
    for (; items->text != (String *)-1; items++) {}
    *heapId_p = (HeapID)items->value;
    return out;
}

void ListMenuItems_DestroyMenuStrings(LISTMENUITEM *items) {
    int i;
    for (i = 0; items[i].text != (String *)-1; i++) {
        if (items[i].text == NULL) {
            break;
        }
        String_Delete(items[i].text);
        items[i].text = NULL;
    }
}
