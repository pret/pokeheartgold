#include "list_menu_items.h"

#include "global.h"

void ListMenuItems_DestroyMenuStrings(LISTMENUITEM *items);
LISTMENUITEM *ListMenuItems_SeekEnd(LISTMENUITEM *items, enum HeapID *heapId_p);

LISTMENUITEM *ListMenuItems_New(u32 n, enum HeapID heapID) {
    int i;
    LISTMENUITEM *ret = Heap_Alloc(heapID, (n + 1) * sizeof(LISTMENUITEM));
    if (ret != NULL) {
        for (i = 0; i < n; i++) {
            ret[i].text = NULL;
            ret[i].value = 0;
        }
        ret[i].text = (String *)-1;
        ret[i].value = heapID;
    }
    return ret;
}

void ListMenuItems_Delete(LISTMENUITEM *items) {
    ListMenuItems_DestroyMenuStrings(items);
    Heap_Free(items);
}

void ListMenuItems_AppendFromMsgData(LISTMENUITEM *items, MsgData *msgData, int msgId, int value) {
    enum HeapID dummy;

    items = ListMenuItems_SeekEnd(items, &dummy);
    if (items != NULL) {
        items->text = NewString_ReadMsgData(msgData, msgId);
        items->value = value;
    }
}

void ListMenuItems_AddItem(LISTMENUITEM *items, String *string, int value) {
    enum HeapID heapID;

    items = ListMenuItems_SeekEnd(items, &heapID);
    if (items != NULL) {
        items->text = String_Dup(string, heapID);
        items->value = value;
    }
}

LISTMENUITEM *ListMenuItems_SeekEnd(LISTMENUITEM *items, enum HeapID *heapId_p) {
    LISTMENUITEM *out;

    for (; items->text != NULL; items++) {
        if (items->text == (String *)-1) {
            GF_ASSERT(FALSE);
            return NULL;
        }
    }
    out = items;
    for (; items->text != (String *)-1; items++) {}
    *heapId_p = (enum HeapID)items->value;
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
