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

#ifndef NITROBTX_NS_RESOURCE_TREE_H
#define NITROBTX_NS_RESOURCE_TREE_H

#include <stdint.h>
#include <stdlib.h>

#include "ns/resource_name.h"

struct NSDictTreeNode {
    uint8_t bitIndex;
    uint8_t leftChild;
    uint8_t rightChild;
    uint8_t entryIndex;
};

int MakeTreeFromResNames(const struct ResourceName entries[], uint8_t numEntries, struct NSDictTreeNode **out, size_t *outSize);

#endif // NITROBTX_NS_RESOURCE_TREE_H
