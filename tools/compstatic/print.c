#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "print.h"

int DebugPrintf(const char *format, ...) {
    if (!gDebugMode) return 0;

    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}

int ErrorPrintf(const char *format, ...) {
    printf("Error: ");

    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
