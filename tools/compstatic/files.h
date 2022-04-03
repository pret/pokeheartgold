#ifndef FILES_H
#define FILES_H

#include <stdbool.h>
#include "global.h"

char *GetDirName(char *filename);
bool GetFiles(char *responseFile, SourceFiles *sourceFiles);
int ReadFile(char *filename, char **content); // TODO: Double-check: it passes a bunch of stack variables..
int WriteFile(char *filename, char *content, int size);

#endif // FILES_H
