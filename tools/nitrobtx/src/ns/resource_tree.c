/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "ns/resource_tree.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "common.h"
#include "errors.h"

#define ALL_ZEROES_ENTRY    0xFF
#define NO_DIFFERENCE_FOUND -1

#define RESULT_INSERT_SUCCESS   0
#define RESULT_ALREADY_INSERTED 1
#define RESULT_DUPLICATE_ENTRY  2
#define RESULT_ARENA_FULL       3

struct Node {
    bool isLeaf;
    uint8_t index;
    uint8_t bitIdx;
    uint8_t entryIdx;
    struct Node *leftChild;
    struct Node *rightChild;
};

struct NodeStack {
    int size;
    int currentIdx;
    struct Node **buffer;
};

struct NodeArena {
    int nextIndex;
    int size;
    struct Node *buffer;
};

static inline struct NodeStack NodeStack_New(int size);
static inline void NodeStack_Free(struct NodeStack *s);
static inline bool NodeStack_Push(struct NodeStack *s, struct Node *n);
static inline struct Node *NodeStack_Pop(struct NodeStack *s);
static inline bool NodeStack_IsEmpty(struct NodeStack *s);
static inline struct NodeArena NodeArena_New(int maxNodes);
static inline void NodeArena_Free(struct NodeArena *arena);
static inline struct Node *NodeArena_Alloc(struct NodeArena *arena);
static struct Node *Node_NewLeaf(unsigned char entryIdx, struct NodeArena *arena);
static struct Node *Node_New(unsigned char bitIdx, unsigned char entryIdx, struct Node *leftChild, struct Node *rightChild, struct NodeArena *arena);

static int Tree_Insert(struct Node **tree, const uint8_t entryIdx, const struct ResourceName entries[], struct NodeArena *arena);

static int FindDiffBit(size_t entryIdx1, size_t entryIdx2, int startBitIdx, int stopBitIdx, const struct ResourceName entries[]);
static inline bool LookupBit(int bitIdx, struct ResourceName entry);

int MakeTreeFromResNames(const struct ResourceName entries[], uint8_t numEntries, struct NSDictTreeNode **out, size_t *outSize)
{
    *out = NULL;

    struct NodeArena arena = NodeArena_New(numEntries * 2 + 1); // 1 root node, and each insertion adds 1 non-leaf and 1 leaf.
    struct Node *root = Node_NewLeaf(ALL_ZEROES_ENTRY, &arena);

    for (int i = 0; i < numEntries; i++) {
        int res;
        if ((res = Tree_Insert(&root, i, entries, &arena)) != RESULT_INSERT_SUCCESS) {
            NodeArena_Free(&arena);
            return ERR_CODE_RES_TREE_BUILD_FAIL;
        }
    }

    struct Node **nonLeaves = calloc(numEntries, sizeof(*nonLeaves));
    uint8_t *entryToNonLeafIdx = calloc(numEntries, sizeof(*entryToNonLeafIdx));

    struct NodeStack toVisit = NodeStack_New(numEntries);
    NodeStack_Push(&toVisit, root);

    size_t nodeIndex = 0;

    while (!NodeStack_IsEmpty(&toVisit)) {
        struct Node *node = NodeStack_Pop(&toVisit);

        nonLeaves[nodeIndex] = node; // Store non-leaves in depth-first order for faster second pass
        node->index = ++nodeIndex; // Pre-increment to account for node 0, which is hardcoded
        entryToNonLeafIdx[node->entryIdx] = nodeIndex;

        if (!node->rightChild->isLeaf) {
            NodeStack_Push(&toVisit, node->rightChild);
        }

        if (!node->leftChild->isLeaf) {
            NodeStack_Push(&toVisit, node->leftChild);
        }
    }

    *out = calloc(numEntries + 1, sizeof(struct NSDictTreeNode));
    *outSize = (numEntries + 1) * sizeof(struct NSDictTreeNode);

    (*out)[0] = (struct NSDictTreeNode) {
        .bitIndex = 127,
        .leftChild = 1,
        .rightChild = 0,
        .entryIndex = 0,
    };

    for (size_t i = 0; i < numEntries; i++) {
        struct Node *node = nonLeaves[i];
        uint8_t leftChild, rightChild;

        if (node->leftChild->isLeaf) {
            if (node->leftChild->entryIdx != ALL_ZEROES_ENTRY) {
                leftChild = entryToNonLeafIdx[node->leftChild->entryIdx];
            } else {
                leftChild = 0;
            }
        } else {
            leftChild = node->leftChild->index;
        }

        if (node->rightChild->isLeaf) {
            if (node->rightChild->entryIdx != ALL_ZEROES_ENTRY) {
                rightChild = entryToNonLeafIdx[node->rightChild->entryIdx];
            } else {
                rightChild = 0;
            }
        } else {
            rightChild = node->rightChild->index;
        }

        (*out)[i + 1] = (struct NSDictTreeNode) {
            .bitIndex = node->bitIdx,
            .leftChild = leftChild,
            .rightChild = rightChild,
            .entryIndex = node->entryIdx,
        };
    }

    NodeStack_Free(&toVisit);
    NodeArena_Free(&arena);
    free(entryToNonLeafIdx);
    free(nonLeaves);

    return ERR_CODE_OK;
}

static int Tree_Insert(struct Node **tree, const uint8_t entryIdx, const struct ResourceName entries[], struct NodeArena *arena)
{
    struct Node **currentNode = tree;
    unsigned int currentBitIdx = 127;

    while (true) {

        if ((*currentNode)->isLeaf) {
            if ((*currentNode)->entryIdx == entryIdx) {
                return RESULT_ALREADY_INSERTED;
            }

            int diffBitIdx = FindDiffBit(entryIdx, (*currentNode)->entryIdx, currentBitIdx, 0, entries);

            if (diffBitIdx == NO_DIFFERENCE_FOUND) {
                return RESULT_DUPLICATE_ENTRY;
            }

            struct Node *newLeaf = Node_NewLeaf(entryIdx, arena);
            struct Node *newNode;

            if (LookupBit(diffBitIdx, entries[entryIdx])) {
                newNode = Node_New(diffBitIdx, entryIdx, *currentNode, newLeaf, arena);
            } else {
                newNode = Node_New(diffBitIdx, entryIdx, newLeaf, *currentNode, arena);
            }

            if (newLeaf == NULL || newNode == NULL) {
                return RESULT_ARENA_FULL;
            }

            *currentNode = newNode;
            return RESULT_INSERT_SUCCESS;
        } else {
            int diffBitIdx = FindDiffBit(entryIdx, (*currentNode)->entryIdx, currentBitIdx, (*currentNode)->bitIdx + 1, entries);

            if (diffBitIdx == NO_DIFFERENCE_FOUND) {
                currentBitIdx = (*currentNode)->bitIdx;
                if (LookupBit((*currentNode)->bitIdx, entries[entryIdx])) {
                    currentNode = &((*currentNode)->rightChild);
                } else {
                    currentNode = &((*currentNode)->leftChild);
                }
            } else {
                struct Node *newLeaf = Node_NewLeaf(entryIdx, arena);
                struct Node *newNode;

                if (LookupBit(diffBitIdx, entries[entryIdx])) {
                    newNode = Node_New(diffBitIdx, entryIdx, *currentNode, newLeaf, arena);
                } else {
                    newNode = Node_New(diffBitIdx, entryIdx, newLeaf, *currentNode, arena);
                }

                if (newLeaf == NULL || newNode == NULL) {
                    return RESULT_ARENA_FULL;
                }

                *currentNode = newNode;
                return RESULT_INSERT_SUCCESS;
            }
        }
    }
}

static int FindDiffBit(size_t entryIdx1, size_t entryIdx2, int startBitIdx, int stopBitIdx, const struct ResourceName entries[])
{
    if (entryIdx1 == ALL_ZEROES_ENTRY) {
        if (entryIdx2 == ALL_ZEROES_ENTRY) {
            return NO_DIFFERENCE_FOUND;
        } else {
            int tmp = entryIdx1;
            entryIdx1 = entryIdx2;
            entryIdx2 = tmp;
        }
    }

    int diffBitIdx = NO_DIFFERENCE_FOUND;
    if (entryIdx2 == ALL_ZEROES_ENTRY) {
        for (int i = startBitIdx; i >= stopBitIdx; i--) {
            if (LookupBit(i, entries[entryIdx1]) != 0) {
                diffBitIdx = i;
                break;
            }
        }
    } else {
        for (int i = startBitIdx; i >= stopBitIdx; i--) {
            if (LookupBit(i, entries[entryIdx1]) != LookupBit(i, entries[entryIdx2])) {
                diffBitIdx = i;
                break;
            }
        }
    }

    return diffBitIdx;
}

static inline bool LookupBit(int bitIdx, struct ResourceName entry)
{
    return entry.asChars[bitIdx / 8] & (1 << bitIdx % 8);
}

static struct Node *Node_NewLeaf(unsigned char entryIdx, struct NodeArena *arena)
{
    struct Node *newLeaf = NodeArena_Alloc(arena);

    if (newLeaf == NULL) {
        return newLeaf;
    }

    newLeaf->isLeaf = true;
    newLeaf->entryIdx = entryIdx;

    return newLeaf;
}

static struct Node *Node_New(unsigned char bitIdx, unsigned char entryIdx, struct Node *leftChild, struct Node *rightChild, struct NodeArena *arena)
{
    struct Node *newNode = NodeArena_Alloc(arena);

    if (newNode == NULL) {
        return newNode;
    }

    newNode->isLeaf = false;
    newNode->bitIdx = bitIdx;
    newNode->entryIdx = entryIdx;
    newNode->leftChild = leftChild;
    newNode->rightChild = rightChild;

    return newNode;
}

static inline struct NodeStack NodeStack_New(int size)
{
    return (struct NodeStack) {
        .size = size,
        .currentIdx = 0,
        .buffer = calloc(size, sizeof(struct Node *)),
    };
}

static inline void NodeStack_Free(struct NodeStack *stack)
{
    stack->size = stack->currentIdx = 0;
    free(stack->buffer);
    stack->buffer = NULL;
}

static inline bool NodeStack_Push(struct NodeStack *stack, struct Node *elem)
{
    if (stack->size <= stack->currentIdx) {
        return false;
    }
    stack->buffer[stack->currentIdx++] = elem;
    return true;
}

static inline struct Node *NodeStack_Pop(struct NodeStack *stack)
{
    if (stack->currentIdx == 0) {
        return NULL;
    }
    return stack->buffer[--stack->currentIdx];
}

static bool NodeStack_IsEmpty(struct NodeStack *stack)
{
    return stack->currentIdx == 0;
}

static inline struct NodeArena NodeArena_New(int maxNodes)
{
    struct NodeArena arena = {
        .size = maxNodes,
        .buffer = calloc(maxNodes, sizeof(struct Node)),
    };

    return arena;
}

static inline void NodeArena_Free(struct NodeArena *arena)
{
    free(arena->buffer);
    arena->buffer = NULL;
    arena->nextIndex = arena->size = 0;
}

static inline struct Node *NodeArena_Alloc(struct NodeArena *arena)
{
    if (arena->size <= arena->nextIndex) {
        return NULL;
    } else {
        return &arena->buffer[arena->nextIndex++];
    }
}
