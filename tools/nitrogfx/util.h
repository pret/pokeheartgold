// Copyright (c) 2015 YamaArashi

#ifndef UTIL_H
#define UTIL_H

#include <stdbool.h>
#include <stdint.h>

bool ParseNumber(char *s, char **end, int radix, int *intValue);
char *GetFileExtension(char *path);
unsigned char *ReadWholeFile(char *path, int *size);
unsigned char *ReadWholeFileZeroPadded(char *path, int *size, int padAmount);
void WriteWholeFile(char *path, void *buffer, int bufferSize);
void WriteGenericNtrHeader(FILE* fp, const char* magicNumber, uint32_t size, bool byteorder, bool version101, uint16_t sectionCount);

#endif // UTIL_H
