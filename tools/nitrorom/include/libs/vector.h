// SPDX-License-Identifier: MIT

/*
 * vector - An implementation of a generic dynamic array.
 * Copyright (C) 2025  <lhearachel@proton.me>
 */

#ifndef VECTOR_H
#define VECTOR_H

typedef struct vector {
    void *data;
    int   cap;
    int   len;
} vector;

// clang-format off
#define newvec(__T, __cap) (vector){ .data = calloc(__cap, sizeof(__T)), .cap = (__cap), .len = 0 }

#define grow(__v, __T) (                           \
    (__v)->cap *= 2,                               \
    realloc((__v)->data, sizeof(__T) * (__v)->cap) \
)

#define push(__v, __T) (                       \
    (__v)->len >= (__v)->cap                   \
        ? (__v)->data = grow(__v, __T),        \
          ((__T *)(__v)->data) + (__v)->len++  \
        : ((__T *)(__v)->data) + (__v)->len++  \
)

#define get(__v, __T, __i) (&((__T *)(__v)->data)[__i])
// clang-format on

#endif // VECTOR_H
