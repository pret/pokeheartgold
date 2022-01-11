#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include <stdio.h>
#include <stdnoreturn.h>
#include <stdarg.h>
#include <stdlib.h>

#define len(a) ((sizeof(a))/(sizeof(*(a))))

static inline noreturn __attribute__((format(printf, 1, 2))) void fatal_error(const char *fmt, ...) {
    va_list va_args;
    va_start(va_args, fmt);
    vfprintf(stderr, fmt, va_args);
    va_end(va_args);
    fputc('\n', stderr);
    exit(1);
}

#ifndef __clang__
#undef strlcat
#define strlcat(d,s,n) strncat(d,s,(n)-strlen(d)-1)
#undef strlcpy
#define strlcpy(d,s,n) strncpy(d,s,(n)-1)
#endif //__clang__

#endif //GUARD_GLOBAL_H
