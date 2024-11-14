// Copyright (c) 2015 YamaArashi

#ifndef LZ_H
#define LZ_H

#include "stdbool.h"

unsigned char *LZDecompress(unsigned char *src, int srcSize, int *uncompressedSize);
unsigned char *LZCompress(unsigned char *src, int srcSize, int *compressedSize, const int minDistance, bool forwardIteration);

#endif // LZ_H
