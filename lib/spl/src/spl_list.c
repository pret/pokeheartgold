#include "spl_list.h"

#include <null.h>

void SPLList_PushFront(SPLList *list, SPLNode *node)
{
    if (list->first == NULL) { // list is empty
        list->first = node;
        list->last = node;
        node->next = NULL;
        node->prev = node->next;
    } else {
        node->next = list->first;
        node->prev = NULL;
        list->first->prev = node;
        list->first = node;
    }

    list->nodeCount += 1;
}

void SPLList_PushBack(SPLList *list, SPLNode *node)
{
    return;
}

SPLNode *SPLList_PopFront(SPLList *list)
{
    SPLNode *node = NULL;
    SPLNode *begin = list->first;

    if (begin != NULL) { // list is not empty
        node = begin;
        list->first = begin->next;

        if (list->first != NULL) { // list has more than one node
            begin->next->prev = NULL;
        } else {
            list->first = NULL;
            list->last = NULL;
        }

        list->nodeCount -= 1;
    }

    return node;
}

SPLNode *SPLList_PopBack(SPLList *list)
{
    return NULL;
}

SPLNode *SPLList_Erase(SPLList *list, SPLNode *node)
{
    SPLNode *next = node->next;
    if (next == NULL) { // node is the last node
        if (list->first == node) { // node is the only node
            list->first = NULL;
            list->last = NULL;
        } else {
            node->prev->next = NULL;
            list->last = list->last->prev;
        }
    } else if (list->first == node) { // node is the first node
        list->first = next;
        list->first->prev = NULL;
    } else { // node is in the middle
        next->prev = node->prev;
        node->prev->next = node->next;
    }

    list->nodeCount -= 1;
    return node;
}
