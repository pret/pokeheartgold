// SPDX-License-Identifier: MIT

/*
 * litend - Macros for setting little-endian values to a byte buffer.
 * Copyright (C) 2025  <lhearachel@proton.me>
 */

#ifndef LITEND_H
#define LITEND_H

#include <stdint.h>
#define putleword(__dest, __word)              \
    {                                          \
        (__dest)[0] = (__word) & 0xFF;         \
        (__dest)[1] = ((__word) >> 8) & 0xFF;  \
        (__dest)[2] = ((__word) >> 16) & 0xFF; \
        (__dest)[3] = ((__word) >> 24) & 0xFF; \
    }

#define putlehalf(__dest, __half)             \
    {                                         \
        (__dest)[0] = (__half) & 0xFF;        \
        (__dest)[1] = ((__half) >> 8) & 0xFF; \
    }

#define lehalf(__src) ((__src)[0] | ((__src)[1] << 8))

static inline uint32_t leword(unsigned char buf[])
{
    uint32_t highest   = buf[3]; // have to do it this way to avoid undefined behavior
    highest          <<= 24;
    return buf[0] | buf[1] << 8 | buf[2] << 16 | highest;
}

#endif // LITEND_H
