#ifndef GUARD_UTIL_H
#define GUARD_UTIL_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

static inline __attribute__((format(printf, 1, 2))) void debug_printf(const char *fmt, ...) {
#ifndef NDEBUG
    fputs("DEBUG: ", stderr);
    va_list va_args;
    va_start(va_args, fmt);
    vfprintf(stderr, fmt, va_args);
    va_end(va_args);
#endif //NDEBUG
}

static inline __attribute__((format(printf, 1, 2))) void error_printf(const char *fmt, ...) {
    fputs("ERROR: ", stderr);
    va_list va_args;
    va_start(va_args, fmt);
    vfprintf(stderr, fmt, va_args);
    va_end(va_args);
    exit(1);
}

#ifdef __cplusplus
}
#endif

#endif //GUARD_UTIL_H
