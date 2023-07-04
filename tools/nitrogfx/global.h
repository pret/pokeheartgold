// Copyright (c) 2015 YamaArashi

#ifndef GLOBAL_H
#define GLOBAL_H

#include <stdio.h>
#include <stdlib.h>

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)          \
do {                                      \
    fprintf(stderr, format, __VA_ARGS__); \
    exit(1);                              \
} while (0)

#define UNUSED

#else

#define FATAL_ERROR(format, ...)            \
do {                                        \
    fprintf(stderr, format, ##__VA_ARGS__); \
    exit(1);                                \
} while (0)

#define UNUSED __attribute__((__unused__))

#endif // _MSC_VER

#define PTR_ADD(ptr, value) ((void*)((uintptr_t)(ptr) + (value)))
#define PTR_SUB(ptr, value) ((void*)((uintptr_t)(ptr) - (value)))
#define PTR_IADD(ptr, value) do { (ptr) = PTR_ADD(ptr, value); } while (0)
#define PTR_ISUB(ptr, value) do { (ptr) = PTR_SUB(ptr, value); } while (0)
#define PTR_DIFF(right, left) ((uintptr_t)(right) - (uintptr_t)(left))

#endif // GLOBAL_H
