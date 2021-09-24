#include <stdarg.h>
#include <nitro.h>

int OS_SPrintf(char * dest, const char * format, ...) {
    int ret;
    va_list va;
    va_start(va, format);
    ret = OS_VSPrintf(dest, format, va);
    va_end(va);
    return ret;
}

int OS_VSPrintf(char * dest, const char * format, va_list va) {
    return OS_VSNPrintf(dest, 0x7FFFFFFF, format, va);
}

int OS_SNPrintf(char * dest, u32 len, const char * format, ...) {
    int ret;
    va_list va;
    va_start(va, format);
    ret = OS_VSNPrintf(dest, len, format, va);
    va_end(va);
    return ret;
}

int OS_VSNPrintf(char * dest, u32 len, const char * format, va_list va) {
    return STD_TVSNPrintf(dest, len, format, va);
}
