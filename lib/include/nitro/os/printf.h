#ifndef NITRO_OS_PRINTF_H_
#define NITRO_OS_PRINTF_H_

#include <stdarg.h>
#include <nitro/std/string.h>

int OS_SPrintf(char * dest, const char * format, ...);
int OS_SNPrintf(char * dest, u32 len, const char * format, ...);
int OS_VSPrintf(char * dest, const char * format, va_list va);
int OS_VSNPrintf(char * dest, u32 len, const char * format, va_list va);

void OS_Terminate();

#define OS_Panic(...) OS_Terminate()
#define OS_Printf(...)

#endif //NITRO_OS_PRINTF_H_
