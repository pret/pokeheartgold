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

#include "ns/resource_dict.h"

#include <stdio.h>
#include <stdlib.h>

#include "common.h"
#include "errors.h"
#include "ns/resource_tree.h"

struct NSResourceDictHeader {
    uint8_t padding00;
    uint8_t entryCount;
    uint16_t size;
    uint16_t treeOffset;
    uint16_t dataOffset;
};

enum ErrorCode ReadNSResourceDict(FILE *file, struct NSResourceDict *dict)
{
    long dictStart = ftell(file);
    struct NSResourceDictHeader header;
    int nRead = fread(&header, sizeof(header), 1, file);

    dict->entryCount = header.entryCount;

    if (nRead == 0) {
        return ERR_CODE_INPUT_INVALID;
    }

    // dict->tree = calloc(dict->header.entryCount + 1, sizeof(struct NSDictTreeNode));
    // fseek(file, dictStart + dict->header.treeOffset, SEEK_SET);
    // nRead = fread(dict->tree, sizeof(struct NSDictTreeNode), dict->header.entryCount + 1, file);
    //
    // if (nRead != dict->header.entryCount + 1) {
    //     FreeResourceDict(dict);
    //     return 1;
    // }

    fseek(file, dictStart + header.dataOffset, SEEK_SET);
    nRead = fread(&dict->dataEntrySize, sizeof(uint16_t), 1, file);
    if (nRead != 1) {
        return ERR_CODE_INPUT_INVALID;
    }

    uint16_t namesOffset;
    nRead = fread(&namesOffset, sizeof(uint16_t), 1, file);
    if (nRead != 1) {
        return ERR_CODE_INPUT_INVALID;
    }

    dict->data = calloc(dict->entryCount, dict->dataEntrySize);
    nRead = fread(dict->data, dict->dataEntrySize, dict->entryCount, file);

    if (nRead != dict->entryCount) {
        FreeResourceDict(dict);
        return ERR_CODE_INPUT_INVALID;
    }

    dict->names = calloc(dict->entryCount, sizeof(struct ResourceName));
    fseek(file, dictStart + header.dataOffset + namesOffset, SEEK_SET);
    nRead = fread(dict->names, sizeof(struct ResourceName), dict->entryCount, file);

    if (nRead != dict->entryCount) {
        FreeResourceDict(dict);
        return ERR_CODE_INPUT_INVALID;
    }

    return ERR_CODE_OK;
}

enum ErrorCode WriteNSResourceDict(FILE *file, struct NSResourceDict *dict)
{

    struct NSResourceDictHeader header = {
        .entryCount = dict->entryCount,
        .size = CalcNSResourceDictSize(dict),
        .treeOffset = sizeof(header),
        .dataOffset = sizeof(header) + (dict->entryCount + 1) * sizeof(struct NSDictTreeNode),
    };

    fwrite(&header, sizeof(header), 1, file);

    struct NSDictTreeNode *tree;
    size_t treeSize;

    MakeTreeFromResNames(dict->names, dict->entryCount, &tree, &treeSize);
    fwrite(tree, treeSize, 1, file);
    free(tree);

    fwrite(&dict->dataEntrySize, sizeof(dict->dataEntrySize), 1, file);
    uint16_t namesOffset = 4 + dict->dataEntrySize * dict->entryCount;
    fwrite(&namesOffset, sizeof(namesOffset), 1, file);
    fwrite(dict->data, dict->dataEntrySize, dict->entryCount, file);
    fwrite(dict->names, sizeof(struct ResourceName), dict->entryCount, file);

    return ERR_CODE_OK;
}

int CalcNSResourceDictSize(struct NSResourceDict *dict)
{
    return sizeof(struct NSResourceDictHeader)
        + dict->entryCount * (sizeof(struct NSDictTreeNode) + dict->dataEntrySize + sizeof(struct ResourceName))
        + sizeof(struct NSDictTreeNode) // extra node for the root of the tree
        + sizeof(uint16_t) // data entry size
        + sizeof(uint16_t); // names offset
}

struct ResourceName GetResourceNamesPrefix(struct NSResourceDict *dict)
{
    struct ResourceName prefix = { 0 };

    if (dict->entryCount == 0) {
        return prefix;
    }

    prefix = dict->names[0];
    int prefixLength = RES_NAME_LENGTH;

    for (int i = 1; i < dict->entryCount; i++) {
        for (int j = 0; j < prefixLength; j++) {
            if (dict->names[0].asChars[j] != dict->names[i].asChars[j]) {
                prefixLength = j;
                break;
            }
        }
    }

    for (int i = prefixLength - 1; i > 0; i--) {
        if (prefix.asChars[i] != 0) {
            prefixLength = i + 1;
            break;
        }
    }

    if (prefixLength != RES_NAME_LENGTH) {
        prefix.asChars[prefixLength] = 0;
    }

    return prefix;
}

void FreeResourceDict(struct NSResourceDict *dict)
{
    if (dict == NULL) {
        return;
    }
    free(dict->data);
    dict->data = NULL;
    free(dict->names);
    dict->names = NULL;
}
