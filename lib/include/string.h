#ifndef MSL_STRING_H_
#define MSL_STRING_H_

#ifdef __cplusplus
extern "C" {
#endif

void *memset(void *data, int value, unsigned size);
void *memmove(void *dest, const void *src, unsigned size);
void *memcpy(void *dest, const void *src, unsigned size);
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

#ifdef __cplusplus
};
#endif

#endif //MSL_STRING_H_
