// Copyright (c) 2015 YamaArashi

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <errno.h>
#include <limits.h>
#include "global.h"
#include "util.h"

bool ParseNumber(char *s, char **end, int radix, int *intValue)
{
    char *localEnd;

    if (end == NULL) {
        end = &localEnd;
    }

    errno = 0;

    const long longValue = strtol(s, end, radix);

    if (*end == s) {
        return false; // not a number
    }

    if ((longValue == LONG_MIN || longValue == LONG_MAX) && errno == ERANGE) {
        return false;
    }

    if (longValue > INT_MAX) {
        return false;
    }

    if (longValue < INT_MIN) {
        return false;
    }

    *intValue = (int)longValue;

    return true;
}

char *GetFileExtension(char *path)
{
    char *extension = path;

    while (*extension != 0) {
        extension++;
    }

    while (extension > path && *extension != '.') {
        extension--;
    }

    if (extension == path) {
        return NULL;
    }

    extension++;

    if (*extension == 0) {
        return NULL;
    }

    return extension;
}

unsigned char *ReadWholeFile(char *path, int *size)
{
    FILE *fp = fopen(path, "rb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", path);
    }

    fseek(fp, 0, SEEK_END);

    *size = ftell(fp);

    unsigned char *buffer = malloc(*size);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for reading \"%s\".\n", path);
    }

    rewind(fp);

    if (fread(buffer, *size, 1, fp) != 1) {
        FATAL_ERROR("Failed to read \"%s\".\n", path);
    }

    fclose(fp);

    return buffer;
}

unsigned char *ReadWholeFileZeroPadded(char *path, int *size, int padAmount)
{
    FILE *fp = fopen(path, "rb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", path);
    }

    fseek(fp, 0, SEEK_END);

    *size = ftell(fp);

    unsigned char *buffer = calloc(*size + padAmount, 1);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for reading \"%s\".\n", path);
    }

    rewind(fp);

    if (fread(buffer, *size, 1, fp) != 1) {
        FATAL_ERROR("Failed to read \"%s\".\n", path);
    }

    fclose(fp);

    return buffer;
}

void WriteWholeStringToFile(char *path, char *string)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    if (fputs(string, fp) == EOF) {
        FATAL_ERROR("Failed to write to \"%s\".\n", path);
    }

    fclose(fp);
}

void WriteWholeFile(char *path, void *buffer, int bufferSize)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    if (fwrite(buffer, bufferSize, 1, fp) != 1) {
        FATAL_ERROR("Failed to write to \"%s\".\n", path);
    }

    fclose(fp);
}

void WriteGenericNtrHeader(FILE* fp, const char* magicNumber, uint32_t size, bool byteorder, bool version101, uint16_t sectionCount)
{
    unsigned char header[0x10] =
            { 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFE, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x01, 0x00 };
    //magic number
    memcpy(header, magicNumber, 4);

    if (version101)
    {
        header[6] = 0x01;
    }

    //byte order
    if (!byteorder)
    {
        memset(header + 4, 0, 2);
    }

    //size
    size += 0x10; //add header size
    header[8] = size & 0xFF;
    header[9] = (size >> 8) & 0xFF;
    header[10] = (size >> 16) & 0xFF;
    header[11] = (size >> 24) & 0xFF;

    //section count
    header[14] = sectionCount & 0xFF;
    header[15] = (sectionCount >> 8) & 0xFF;

    fwrite(header, 1, 0x10, fp);
}
