#include <stdarg.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "print.h"
#include "str.h"

char *StrCat(int count, ...) {
    char *dest;
    char *word;
    int length;

    va_list args;
    va_start(args, count);
    va_list argsCpy;
    va_copy(argsCpy, args);

    int totalLength = 0;
    for (int i = 0; i < count; i++) {
        word = va_arg(args, char *);
        length = strlen(word);
        totalLength += length;
    }
    va_end(args);
    dest = malloc(totalLength + 1);
    if (dest == NULL) {
        ErrorPrintf("Cannot allocate memory\n");
        exit(1);
    }

    dest[0] = '\0';
    for (int i = 0; i < count; i++) {
        word = va_arg(argsCpy, char *);
        length = strlen(word);
        strcat(dest, word);
    }
    va_end(argsCpy);
    return dest;
}

char *StrDup(char *prevDest, char *src) {
    if (prevDest != NULL) {
        free(prevDest);
    }
    if (src != NULL) {
        src = strdup(src);
        if (src == NULL) {
            ErrorPrintf("Cannot allocate memory\n");
            exit(1);
        }
    }
    return src;
}
