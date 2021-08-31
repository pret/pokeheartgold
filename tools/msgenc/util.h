#ifndef GUARD_UTIL_H
#define GUARD_UTIL_H

#include <cstdio>
#include <cstdarg>

static inline __attribute__((format(printf, 1, 2))) void debug_printf(const char * fmt, ...) {
#ifndef NDEBUG
    fputs("DEBUG: ", stderr);
    va_list va_args;
    va_start(va_args, fmt);
    vfprintf(stderr, fmt, va_args);
    va_end(va_args);
#endif //NDEBUG
}

#endif //GUARD_UTIL_H
