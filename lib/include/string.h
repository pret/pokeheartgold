#ifndef MSL_STRING_H_
#define MSL_STRING_H_

#include <ansi_params.h>
#include <size_t.h>

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

#ifndef __MWERKS__
void *__memcpy(void *dest, const void *src, size_t size);
void *__builtin__clear(void *data, size_t size);
#endif
void *memset(void *data, int value, size_t size);
void *memmove(void *dest, const void *src, unsigned size);
#define memcpy(dest, src, size) __memcpy(dest, src, size)
void *memchr(const void *arr, int value, unsigned size);
int memcmp(const void *a, const void *b, unsigned size);
char *strcpy(char *dest, const char *src);
unsigned strlen(const char *str);
char *strncpy(char *dest, const char *src, unsigned n);
int strcmp(const char *a, const char *b);
char *strcat(char *dest, const char *src);
char *strncat(char *dest, const char *src, unsigned n);
unsigned strspn(const char *a, const char *b);
char *strtok(char *str, const char *sep);
char *strstr(const char *haystack, const char *needle);

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif //MSL_STRING_H_
