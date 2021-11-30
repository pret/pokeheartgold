#ifndef MSL_STRING_H_
#define MSL_STRING_H_

#include <ansi_params.h>
#include <size_t.h>

_MSL_BEGIN_NAMESPACE_STD
_MSL_BEGIN_EXTERN_C

void *memset(void *data, int value, size_t size);
void *memmove(void *dest, const void *src, size_t size);
void *memcpy(void *dest, const void *src, size_t size);
void *memchr(const void *arr, int value, size_t size);
int memcmp(const void *a, const void *b, size_t size);
char *strcpy(char *dest, const char *src);
unsigned strlen(const char *str);
char *strncpy(char *dest, const char *src, size_t n);
int strcmp(const char *a, const char *b);
char *strcat(char *dest, const char *src);
char *strncat(char *dest, const char *src, size_t n);
unsigned strspn(const char *a, const char *b);
char *strtok(char *str, const char *sep);
char *strstr(const char *haystack, const char *needle);

_MSL_END_EXTERN_C
_MSL_END_NAMESPACE_STD

#endif //MSL_STRING_H_
