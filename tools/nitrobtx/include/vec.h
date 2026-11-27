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

#ifndef NITROBTX_VEC_H
#define NITROBTX_VEC_H

#include <stdlib.h>

#define MakeVecType(__vec_type_name, __element_type) \
    struct __vec_type_name {                         \
        size_t size;                                 \
        size_t n;                                    \
        __element_type *data;                        \
    }

#define VecInit(__vec, __size)                                  \
    do {                                                        \
        (__vec).size = __size;                                  \
        (__vec).n = 0;                                          \
        (__vec).data = calloc(__size, sizeof((__vec).data[0])); \
    } while (0)

#define VecAppend(__vec, __elem)                                                          \
    do {                                                                                  \
        if ((__vec).n >= (__vec).size) {                                                  \
            (__vec).size = (__vec).size == 0 ? 1 : (__vec).size * 2;                      \
            (__vec).data = realloc((__vec).data, (__vec).size * sizeof((__vec).data[0])); \
        }                                                                                 \
        (__vec).data[(__vec).n++] = (__elem);                                             \
    } while (0)

#define VecGet(__vec, __n) ((__vec).data[(__n)])

#define VecLast(__vec) (VecGet(__vec, (__vec).n - 1))

#define VecFree(__vec)                \
    do {                              \
        (__vec).size = (__vec).n = 0; \
        free((__vec).data);           \
        (__vec).data = NULL;          \
    } while (0)

#define VecSort(__vec, __compare)                                         \
    do {                                                                  \
        qsort((__vec).data, (__vec).n, sizeof(*(__vec).data), __compare); \
    } while (0)

#define VecForEach(__var_name, __vec) \
    for (typeof((__vec).data[0]) *__var_name = &(__vec).data[0]; (uintptr_t)__var_name < (uintptr_t)((__vec).data + (__vec).n); __var_name++)

#endif // NITROBTX_VEC_H
