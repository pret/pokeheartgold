#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "global.h"
#include "misc.h"
#include "print.h"

void CopyBuffer(char *src, char *dest, int size) {
    if (dest < src) {
        for (int i = 0; i < size; i++) {
            dest[i] = src[i];
        }
    } else {
        for (int i = size - 1; i >= 0; i--) {
            dest[i] = src[i];
        }
    }
}

void FreeBuffer(FileInfo *fileInfo) {
    if (fileInfo->content != NULL) {
        free(fileInfo->content);
        fileInfo->content = NULL;
    }
    if (fileInfo->filename != NULL) {
        free(fileInfo->filename);
        fileInfo->filename = NULL;
    }
    fileInfo->compressedSize = 0;
    fileInfo->fileSize = 0;
    fileInfo->rewrite = false;
}

bool AddSuffixBuffer(FileInfo *fileInfo, char *suffix) {
    bool success;

    if (fileInfo->fileSize == 0 || fileInfo->filename == NULL || suffix == NULL || *suffix == '\0') {
        success = true;
    } else {
        int filenameLength = strlen(fileInfo->filename);
        int suffixLength = strlen(suffix);
        char *dest = malloc(filenameLength + suffixLength + 1);
        if (dest == NULL) {
            ErrorPrintf("Cannot allocate memory.\n");
            success = false;
        } else {
            sprintf(dest, "%s%s", fileInfo->filename, suffix);
            free(fileInfo->filename);
            fileInfo->filename = dest;
            fileInfo->rewrite = true;
            success = true;
        }
    }
    return success;
}
