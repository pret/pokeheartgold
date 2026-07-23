/*
 * nitroarc - an archiving utility for Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#ifndef TOOL_EXTENSIONS_H
#define TOOL_EXTENSIONS_H

#include <stddef.h>

typedef struct extension extension_t;
struct extension {
    const char *magic;
    const char *ext;
    size_t      size;
};

extern const extension_t extensions[];

const extension_t* guess_extension(const void *data);

#endif // TOOL_EXTENSIONS_H
