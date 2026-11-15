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

#ifndef NITROBTX_NS_RESOURCE_NAME_H
#define NITROBTX_NS_RESOURCE_NAME_H

#include <stdint.h>

#define RES_NAME_LENGTH 16

struct ResourceName {
    uint8_t asChars[RES_NAME_LENGTH];
};

void CopyToResName(struct ResourceName *name, const char str[RES_NAME_LENGTH]);
int CompareResNamesSmart(const struct ResourceName *first, const struct ResourceName *second);
int CompareResNamesLexico(const struct ResourceName *first, const struct ResourceName *second);
int LevenshteinDist(const struct ResourceName *first, const struct ResourceName *second);

#endif // NITROBTX_NS_RESOURCE_NAME_H
