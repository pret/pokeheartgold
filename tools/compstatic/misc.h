#ifndef MISC_H
#define MISC_H

#include "global.h"

void CopyBuffer(char *src, char *dest, int size);
void FreeBuffer(FileInfo *fileInfo);
bool AddSuffixBuffer(FileInfo *fileInfo, char *suffix);

#endif // MISC_H
