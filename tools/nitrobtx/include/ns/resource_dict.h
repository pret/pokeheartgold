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

#ifndef NITROBTX_RESOURCE_DICT_H
#define NITROBTX_RESOURCE_DICT_H

#include <stdint.h>
#include <stdio.h>

#include "errors.h"
#include "ns/resource_name.h"

struct NSResourceDict {
    uint16_t entryCount;
    uint16_t dataEntrySize;
    void *data;
    struct ResourceName *names;
};

int CalcNSResourceDictSize(struct NSResourceDict *dict);
enum ErrorCode ReadNSResourceDict(FILE *file, struct NSResourceDict *dict);
enum ErrorCode WriteNSResourceDict(FILE *file, struct NSResourceDict *dict);
struct ResourceName GetResourceNamesPrefix(struct NSResourceDict *dict);
void FreeResourceDict(struct NSResourceDict *dict);

#endif // NITROBTX_RESOURCE_DICT_H
