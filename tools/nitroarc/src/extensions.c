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

#include "extensions.h"

#include <assert.h>
#include <string.h>

const extension_t extensions[] = {
    { "RGCN", "NCGR", 4 },
    { "RLCN", "NCLR", 4 },
    { "RECN", "NCER", 4 },
    { "RNAN", "NANR", 4 },
    { "RCSN", "NSCR", 4 },
    { "BMD0", "BMD0", 4 },
    { "BCA0", "BCA0", 4 },
    { "BTA0", "BTA0", 4 },
    { "BTP0", "BTP0", 4 },
    { "BTX0", "BTX0", 4 },
    { "BMA0", "BMA0", 4 },
    { "BVA0", "BVA0", 4 },
    { " APS", "spa",  4 },

    { NULL,   "bin",  0 }, // fallback; must ALWAYS be last!
};

const extension_t* guess_extension(const void *_data) {
    assert(_data);
    const unsigned char *data = _data;

    if (data[0] == 0x10 && data[4] == 0x00) {
        // This should be an LZ77-encoded file; the first block of such an
        // encoding is always stored in full, which means we should see the
        // extension starting at index 5.
        return guess_extension(data + 5);
    }

    const extension_t *c = &extensions[0];
    while (c->magic != NULL && memcmp(data, c->magic, c->size) != 0) c++;
    return c;
}
