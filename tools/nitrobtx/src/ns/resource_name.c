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

#include "ns/resource_name.h"

#include <stdbool.h>
#include <stdlib.h>

#include "common.h"

static inline bool isDigit(char c)
{
    return '0' <= c && c <= '9';
}

static inline int Min3(int a, int b, int c)
{
    if (a < b && a < c) {
        return a;
    } else if (b < c) {
        return b;
    } else {
        return c;
    }
}

void CopyToResName(struct ResourceName *name, const char str[RES_NAME_LENGTH])
{
    for (int i = 0; i < RES_NAME_LENGTH && str[i] != '\0'; i++) {
        name->asChars[i] = str[i];
    }
}

int CompareResNamesSmart(const struct ResourceName *first, const struct ResourceName *second)
{
    int prefixLength;
    for (prefixLength = 0; prefixLength < RES_NAME_LENGTH && first->asChars[prefixLength] == second->asChars[prefixLength]; prefixLength++) {}
    if (prefixLength == RES_NAME_LENGTH) {
        return 0;
    }

    bool firstEndsNum = true, secondEndsNum = true;
    int firstNum = 0, secondNum = 0;

    for (int i = prefixLength; i < RES_NAME_LENGTH; i++) {
        if (firstEndsNum) {
            if (isDigit(first->asChars[i])) {
                firstNum *= 10;
                firstNum += (first->asChars[i] - '0');
            } else if (first->asChars[i] != 0) {
                firstEndsNum = false;
            } else {
                break;
            }
        }
    }

    for (int i = prefixLength; i < RES_NAME_LENGTH; i++) {
        if (secondEndsNum) {
            if (isDigit(second->asChars[i])) {
                secondNum *= 10;
                secondNum += (second->asChars[i] - '0');
            } else if (second->asChars[i] != 0) {
                secondEndsNum = false;
            } else {
                break;
            }
        }
    }

    if (firstEndsNum && secondEndsNum) {
        return CompareInts(&firstNum, &secondNum);
    } else if (first->asChars[prefixLength] > second->asChars[prefixLength]) {
        return 1;
    } else {
        return -1;
    }
}

int CompareResNamesLexico(const struct ResourceName *first, const struct ResourceName *second)
{
    for (int i = 0; i < RES_NAME_LENGTH; i++) {
        if (first->asChars[i] > second->asChars[i]) {
            return 1;
        }
        if (first->asChars[i] < second->asChars[i]) {
            return -1;
        }
    }

    return 0;
}

int LevenshteinDist(const struct ResourceName *first, const struct ResourceName *second)
{
    size_t lenFst, lenSnd;
    for (lenFst = 0; lenFst < RES_NAME_LENGTH; lenFst++) {
        if (first->asChars[lenFst] == 0) {
            break;
        }
    }
    for (lenSnd = 0; lenSnd < RES_NAME_LENGTH; lenSnd++) {
        if (second->asChars[lenSnd] == 0) {
            break;
        }
    }

    int *dists = calloc((lenFst + 1) * (lenSnd + 1), sizeof(*dists));

    for (int col = 1; col <= lenSnd; col++) {
        dists[col] = col;
    }

    for (int row = 1; row <= lenFst; row++) {
        dists[row * (lenSnd + 1)] = row;
    }

    for (int row = 1; row <= lenFst; row++) {
        for (int col = 1; col <= lenSnd; col++) {
            int subCost = (first->asChars[row - 1] == second->asChars[col - 1]) ? 0 : 1;
            dists[col + row * (lenSnd + 1)] = Min3(
                dists[col + (row - 1) * (lenSnd + 1)] + 1,
                dists[(col - 1) + row * (lenSnd + 1)] + 1,
                dists[(col - 1) + (row - 1) * (lenSnd + 1)] + subCost);
        }
    }

    int distance = dists[lenSnd + lenFst * (lenSnd + 1)];

    free(dists);

    return distance;
}
