#ifndef SPL_LIST_H
#define SPL_LIST_H

typedef struct SPLNode {
    struct SPLNode *next;
    struct SPLNode *prev;
} SPLNode;

typedef struct SPLList {
    SPLNode *first;
    int nodeCount;
    SPLNode *last;
} SPLList;

SPLNode *SPLList_PopFront(SPLList *list);
SPLNode *SPLList_PopBack(SPLList *list);
void SPLList_PushFront(SPLList *list, SPLNode *node);
void SPLList_PushBack(SPLList *list, SPLNode *node);
SPLNode *SPLList_Erase(SPLList *list, SPLNode *node);

#endif // SPL_LIST_H
