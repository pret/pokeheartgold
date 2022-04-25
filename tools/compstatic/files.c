#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include "files.h"
#include "global.h"
#include "print.h"
#include "str.h"

char *GetDirName(char *filename) {
    char *dirName;

    int i = strlen(filename);
    while (true) {
        i--;
        if (i < 0) {
            dirName = strdup(".");
            return dirName;
        }
        if (filename[i] == '/' || filename[i] == '\\') break;
        if (filename[i] == ':') {
            dirName = malloc(i + 3);
            if (dirName != NULL) {
                strncpy(dirName, filename, i);
                strcpy(dirName + i, ":.");
            }
            return dirName;
        }
    }

    // Same size as filename, but has null-character after directory name.
    dirName = strdup(filename);
    if (dirName == NULL) {
        return NULL;
    }
    dirName[i] = '\0';
    return dirName;
}

bool GetFiles(char *responseFile, SourceFiles *sourceFiles) {
    char *filename;
    bool success;
    int numWords;
    int wordStart;
    char *content;

    char *dirName = GetDirName(responseFile);
    int bytesRead = ReadFile(responseFile, &content);
    if (bytesRead < 0) {
        success = false;
    } else {
        numWords = 0;
        wordStart = 0;
        for (int i = 0; i < bytesRead; i++) {
            if (content[i] == '\0') {
                filename = StrCat(3, dirName, "/", &content[wordStart]);
                sourceFiles->filenames[numWords] = filename;

                wordStart = i + 1;
                numWords++;
                if (numWords == NUM_SOURCE_FILES) break;
            }
        }
        free(content);
        free(dirName);
        if (numWords == NUM_SOURCE_FILES) {
            success = true;
        } else {
            while (numWords > 0) {
                numWords--;
                free(sourceFiles->filenames[numWords]);
            }
            ErrorPrintf("%s wrong format", responseFile);
            success = false;
        }
    }
    return success;
}

// Returns size of file.
int ReadFile(char *filename, char **content) {
    int bytesRead;
    struct stat fileInfo;
    FILE *fp = NULL;
    *content = NULL;

    if (filename == NULL) {
        ErrorPrintf("Not specified filename\n");
    } else {
        int error = stat(filename, &fileInfo);
        if ((error == 0) && (fp = fopen(filename, "rb"), fp != NULL)) {
            *content = malloc(fileInfo.st_size);
            if (*content == NULL) {
                ErrorPrintf("Cannot allocate memory size=%d\n", fileInfo.st_size);
            } else {
                bytesRead = fread(*content, 1, fileInfo.st_size, fp);
                if (bytesRead == fileInfo.st_size) {
                    DebugPrintf("%p %8d bytes  ReadFile \'%s\'\n", *content, fileInfo.st_size, filename);
                    fclose(fp);
                    return fileInfo.st_size;
                }
                ErrorPrintf("Cannot read file \'%s\'\n", filename);
            }
        }
        ErrorPrintf("Cannot read file \'%s\'\n", filename);
    }

    if (*content != NULL) {
        free(content);
    }
    if (fp != NULL) {
        fclose(fp);
    }
    return -1;
}

// Returns number of bytes written.
int WriteFile(char *filename, char *content, int size) {
    FILE *fp = NULL;
    int ret;

    DebugPrintf("%p %8d bytes WriteFile \'%s\'\n", content, size, filename);
    fp = fopen(filename, "wb");
    if (fp == NULL) {
        ErrorPrintf("Cannot open file \'%s\'\n", filename);
        ret = -1;
    } else {
        int sizeWritten = fwrite(content, 1, size, fp);
        if (size == sizeWritten) {
            int closeResult = fclose(fp);
            if (closeResult < 0) {
                ErrorPrintf("Cannot close file \'%s\'\n", filename);
                unlink(filename);
                ret = -1;
            } else {
                ret = sizeWritten;
            }
        } else {
            ErrorPrintf("Cannot write file \'%s\'\n", filename);
            fclose(fp);
            unlink(filename);
            ret = -1;
        }
    }
    return ret;
}
