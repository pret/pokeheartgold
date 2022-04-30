#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "print.h"

void DebugPrintf(const char *format, ...) {
    if (!gDebugMode) return;

    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}

void ErrorPrintf(const char *format, ...) {
    printf("Error: ");

    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
