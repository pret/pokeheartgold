// Copyright (c) 2015 YamaArashi

#ifndef UTIL_H
#define UTIL_H

#include <stdbool.h>
#include <stdint.h>

bool ParseNumber(char *s, char **end, int radix, int *intValue);
char *GetFileExtension(char *path);
unsigned char *ReadWholeFile(char *path, int *size);
unsigned char *ReadWholeFileZeroPadded(char *path, int *size, int padAmount);
void WriteWholeStringToFile(char *path, char *string);
void WriteWholeFile(char *path, void *buffer, int bufferSize);
void WriteGenericNtrHeader(FILE* fp, const char* magicNumber, uint32_t size, bool byteorder, bool version101, uint16_t sectionCount);

// Unaligned IO
static inline uint8_t ReadU8(const unsigned char *ptr, const size_t offset) {
    return ptr[offset];
}

static inline uint16_t ReadU16(const unsigned char *ptr, const size_t offset) {
    return ptr[offset] | (ptr[offset + 1] << 8);
}

static inline uint32_t ReadU32(const unsigned char *ptr, const size_t offset) {
    return ptr[offset] | (ptr[offset + 1] << 8) | (ptr[offset + 2] << 16) | (ptr[offset + 3] << 24);
}

static inline int8_t ReadS8(const unsigned char *ptr, const size_t offset) {
    return ptr[offset];
}

static inline int16_t ReadS16(const unsigned char *ptr, const size_t offset) {
    return ptr[offset] | (ptr[offset + 1] << 8);
}

static inline int32_t ReadS32(const unsigned char *ptr, const size_t offset) {
    return ptr[offset] | (ptr[offset + 1] << 8) | (ptr[offset + 2] << 16) | (ptr[offset + 3] << 24);
}

static inline void WriteU8(unsigned char *ptr, const size_t offset, uint8_t value) {
    ptr[offset] = value;
}

static inline void WriteU16(unsigned char *ptr, const size_t offset, uint16_t value) {
    ptr[offset] = value;
    ptr[offset + 1] = value >> 8;
}

static inline void WriteU32(unsigned char *ptr, const size_t offset, uint32_t value) {
    ptr[offset] = value;
    ptr[offset + 1] = value >> 8;
    ptr[offset + 2] = value >> 16;
    ptr[offset + 3] = value >> 24;
}

#endif // UTIL_H
